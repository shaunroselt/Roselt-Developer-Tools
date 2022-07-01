unit Roselt.JsonYamlConverter;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
  System.JSON,
  System.JSON.Types;

type
  TJsonYaml = record
  public type
    TIndentationType = (Spaces, Tabs);
    TYamlIdentationCount = 1..8;
    TJsonIdentationCount = 0..8;
  private
    // Token utility
    class function InternalGetNextToken(var S: String; Delimiters: String): String; static;
    // JSON to YAML
    class procedure InternalJsonObjToYaml(AJSON: TJSONObject; AOutStrings: TStrings; IndentationType: TIndentationType; IndentationCount: TYamlIdentationCount; var AIndent: Integer; AFromArray: boolean = False); static;
    class procedure InternalJsonArrToYaml(AJSON: TJSONArray; AOutStrings: TStrings; IndentationType: TIndentationType; IndentationCount: TYamlIdentationCount; var AIndent: Integer; AFromArray: boolean = False); static;
    class function InternalJsonValueToYaml(AJSON: TJSONValue): String; static;
    // YAML to JSON
    class procedure InternalYamlObjToJson(AYAML, AOutStrings: TStrings; IndentationType: TIndentationType; IndentationCount: TJsonIdentationCount; AIndent: Integer; var ASrcLine: Integer; AYamlIndent: Integer; AFromArray: boolean = False); static;
    class procedure InternalYamlArrToJson(AYAML, AOutStrings: TStrings; IndentationType: TIndentationType; IndentationCount: TJsonIdentationCount; AIndent: Integer; var ASrcLine: Integer; AYamlIndent: Integer); static;
    class procedure InternalYamlValueToJson(const AYAML: String; var AName, AValue: String); static;
    class function InternalYamlNextText(AYAML: TStrings; var ACurrentLine, AIndentValue: Integer; var AIsArrayElement: boolean): String; static;
    class procedure InternalYamlNextProps(AYAML: TStrings; const ACurrentLine, ACurrentIndent: Integer; var AIsArray, AIsObject: boolean; var ALevel: Integer); static;
    class function InternalYamlPrevLine(AYAML: TStrings; ACurrentLine: Integer): Integer; static;
    class function InternalYamlHasMoreText(AYAML: TStrings; ACurrentLine: Integer): boolean; static;
  public
    // JSON to YAML
    class function JsonToYaml(AJSON: String; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: TYamlIdentationCount = 2): String; overload; static;
    class function JsonToYaml(AJSON: TJSONValue; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: TYamlIdentationCount = 2): String; overload; static;
    class procedure JsonToYaml(AJSON: TJSONValue; AOutStrings: TStrings; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: TYamlIdentationCount = 2); overload; static;
    // YAML to JSON
    class function YamlToJson(AYAML: String; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: TJsonIdentationCount = 0): String; overload; static;
    class function YamlToJson(AYAML: TStrings; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: TJsonIdentationCount = 0): String; overload; static;
    class procedure YamlToJson(AYAML: TStrings; AOutStrings: TStrings; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: TJsonIdentationCount = 0); overload; static;
    class function YamlToJsonValue(AYAML: String; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: TJsonIdentationCount = 0): TJSONValue; overload; static;
    class function YamlToJsonValue(AYAML: TStrings; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: TJsonIdentationCount = 0): TJSONValue; overload; static;
  end;

implementation

class function TJsonYaml.JsonToYaml(AJSON: String; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: TYamlIdentationCount = 2): String;
begin
  var LJSONObject := TJSONObject.ParseJSONValue(AJSON, False, True) as TJSONObject;
  try
    Result := JsonToYaml(LJSONObject, IndentationType, IndentationCount);
  finally
    LJSONObject.Free;
  end;
end;

class function TJsonYaml.JsonToYaml(AJSON: TJSONValue; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: TYamlIdentationCount = 2): String;
begin
  var LStrings := TStringList.Create;
  try
    JsonToYaml(AJSON, LStrings, IndentationType, IndentationCount);
    Result := LStrings.Text;
  finally
    LStrings.Free;
  end;
end;

class procedure TJsonYaml.JsonToYaml(AJSON: TJSONValue; AOutStrings: TStrings; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: TYamlIdentationCount = 2);
begin
  var LIndent := -1;
  AOutStrings.BeginUpdate;
  try
    AOutStrings.Clear;
    if (AJSON is TJSONObject) then
      InternalJsonObjToYaml(AJSON as TJSONObject, AOutStrings, IndentationType, IndentationCount, LIndent)
    else if (AJSON is TJSONArray) then
      InternalJsonArrToYaml(AJSON as TJSONArray, AOutStrings, IndentationType, IndentationCount, LIndent)
    else
      AOutStrings.Add(InternalJsonValueToYaml(AJSON));
  finally
    AOutStrings.EndUpdate;
  end;
end;

class function TJsonYaml.InternalJsonValueToYaml(AJSON: TJSONValue): String;
begin
  Result := AJSON.Value;
  if (AJSON is TJSONFalse) then
    Result := 'false'
  else if (AJSON is TJSONTrue) then
    Result := 'true'
  else if (AJSON is TJSONNull) then
    Result := ''
  else if (AJSON is TJSONString) and not(AJSON is TJSONNumber) then
  begin
    if Result.Trim.IsEmpty then
      Result := '''''';
  end;
end;

class procedure TJsonYaml.InternalJsonObjToYaml(AJSON: TJSONObject; AOutStrings: TStrings; IndentationType: TIndentationType; IndentationCount: TYamlIdentationCount; var AIndent: Integer; AFromArray: boolean = False);
var
  LElement: TJSONPair;
  LName: String;
  LValue: TJSONValue;
  LIndentations: String;
  IndentationValue: Char;
begin
  if (IndentationType = TIndentationType.Spaces) then
    IndentationValue := ' '
  else if (IndentationType = TIndentationType.Tabs) then
    IndentationValue := #9
  else IndentationValue := ' '; // Default to space

  Inc(AIndent);
  try
    for var I := 0 to AJSON.Count - 1 do
    begin
      if (AFromArray) and (I = 0) then
        LIndentations := String.Create(IndentationValue, (AIndent - 1) * IndentationCount) + '- '
      else
        LIndentations := String.Create(IndentationValue, AIndent * IndentationCount);
      LElement := AJSON.Pairs[I];
      LName := LElement.JsonString.Value;
      LValue := LElement.JsonValue;
      // Check for object type
      if (LValue is TJSONObject) then
      begin
        AOutStrings.Add(LIndentations + LName + ':');
        InternalJsonObjToYaml(LValue as TJSONObject, AOutStrings, IndentationType, IndentationCount, AIndent);
      end
      else if (LValue is TJSONArray) then
      begin
        AOutStrings.Add(LIndentations + LName + ':');
        InternalJsonArrToYaml(LValue as TJSONArray, AOutStrings, IndentationType, IndentationCount, AIndent);
      end
      else
        AOutStrings.Add(LIndentations + LName + ': ' + InternalJsonValueToYaml(LValue));
    end;
  finally
    Dec(AIndent);
  end;
end;

class procedure TJsonYaml.InternalJsonArrToYaml(AJSON: TJSONArray; AOutStrings: TStrings; IndentationType: TIndentationType; IndentationCount: TYamlIdentationCount; var AIndent: Integer; AFromArray: boolean = False);
var
  LValue: TJSONValue;
  LIndentations: String;
  IndentationValue: Char;
begin
  if (IndentationType = TIndentationType.Spaces) then
    IndentationValue := ' '
  else if (IndentationType = TIndentationType.Tabs) then
    IndentationValue := #9
  else IndentationValue := ' '; // Default to space

  Inc(AIndent);
  try
    for var I := 0 to AJSON.Count - 1 do
    begin
      if (AFromArray) and (I = 0) then
        LIndentations := String.Create(IndentationValue, (AIndent - 1) * IndentationCount) + '- '
      else
        LIndentations := String.Create(IndentationValue, AIndent * IndentationCount);
      LValue := AJSON.Items[I];
      // Check for object type
      if (LValue is TJSONObject) then
        InternalJsonObjToYaml(LValue as TJSONObject, AOutStrings, IndentationType, IndentationCount, AIndent, True)
        // Check for array type
      else if (LValue is TJSONArray) then
        InternalJsonArrToYaml(LValue as TJSONArray, AOutStrings, IndentationType, IndentationCount, AIndent, True)
      else
        AOutStrings.Add(LIndentations + '- ' + InternalJsonValueToYaml(LValue));
    end;
  finally
    Dec(AIndent);
  end;
end;

class function TJsonYaml.YamlToJson(AYAML: String; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: TJsonIdentationCount = 0): String;
begin
  var LStrings := TStringList.Create;
  try
    LStrings.Text := AYAML;
    Result := YamlToJson(LStrings, IndentationType, IndentationCount);
  finally
    LStrings.Free;
  end;
end;

class function TJsonYaml.YamlToJson(AYAML: TStrings; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: TJsonIdentationCount = 0): String;
begin
  var LStrings := TStringList.Create;
  try
    YamlToJson(AYAML, LStrings, IndentationType, IndentationCount);
    Result := LStrings.Text;
  finally
    LStrings.Free;
  end;
end;

class function TJsonYaml.YamlToJsonValue(AYAML: String; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: TJsonIdentationCount = 0): TJSONValue;
begin
  var LStrings := TStringList.Create;
  try
    Result := YamlToJsonValue(LStrings, IndentationType, IndentationCount);
  finally
    LStrings.Free;
  end;
end;

class function TJsonYaml.YamlToJsonValue(AYAML: TStrings; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: TJsonIdentationCount = 0): TJSONValue;
begin
  var LJSON := YamlToJson(AYAML, IndentationType, IndentationCount);
  Result := TJSONObject.ParseJSONValue(LJSON, False, True);
end;

class procedure TJsonYaml.YamlToJson(AYAML: TStrings; AOutStrings: TStrings; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: TJsonIdentationCount = 0);
begin
  var LLine := -1;
  AOutStrings.BeginUpdate;
  try
    AOutStrings.Clear;
    // Get the first line and check what it is ...
    var LCurrentLine := -1;
    var LIndentValue := 0;
    var LIsArrayElement := False;
    if InternalYamlNextText(AYAML, LCurrentLine, LIndentValue, LIsArrayElement) = '' then
      AOutStrings.Add('{}')
    else
    begin
      if LIsArrayElement then
        InternalYamlArrToJson(AYAML, AOutStrings, IndentationType, IndentationCount, 0, LLine, LIndentValue)
      else
        InternalYamlObjToJson(AYAML, AOutStrings, IndentationType, IndentationCount, 0, LLine, LIndentValue);
    end;
  finally
    AOutStrings.EndUpdate;
  end;
end;

class function TJsonYaml.InternalGetNextToken(var S: String; Delimiters: String): String;
begin
  if Delimiters = '' then
  begin
    Result := S;
    S := '';
  end else
  begin
    var idx := FindDelimiter(Delimiters, S, 1);
    if idx = 0 then
    begin
      Result := S;
      S := '';
    end else
    begin
      Result := S.SubString(0, idx - 1);
      S := S.SubString(idx, S.Length - idx);
    end;
  end;
end;

class procedure TJsonYaml.InternalYamlValueToJson(const AYAML: String; var AName, AValue: String);
begin
  var LElement := AYAML.Trim;
  AName := '"' + InternalGetNextToken(LElement, ':').Trim + '"';
  AValue := LElement.Trim;
  if AValue.IsEmpty then
    AValue := 'null'
  else if AValue.ToLower.Equals('true') then
    AValue := 'true'
  else if AValue.ToLower.Equals('false') then
    AValue := 'false'
  else
    AValue := '"' + AValue + '"';
end;

class function TJsonYaml.InternalYamlPrevLine(AYAML: TStrings; ACurrentLine: Integer): Integer;
var
  LText: String;
begin
  Result := ACurrentLine - 1;
  while (Result >= 0) do
  begin
    LText := AYAML[Result].Trim;
    if not(LText.IsEmpty or LText.StartsWith('#')) then
      Exit;
    Dec(Result);
  end;
end;

class function TJsonYaml.InternalYamlNextText(AYAML: TStrings; var ACurrentLine, AIndentValue: Integer; var AIsArrayElement: boolean): String;
var
  LText: String;
begin
  var LLine := ACurrentLine;
  var LFound := False;
  AIndentValue := 0;
  AIsArrayElement := False;
  while (LLine < AYAML.Count - 1) and (not LFound) do
  begin
    Inc(LLine);
    LText := AYAML[LLine].Trim;
    if not(LText.IsEmpty or LText.StartsWith('#')) then
    begin
      LFound := True;
      // Check if it is an array
      AIsArrayElement := LText.StartsWith('- ');
      // Count indent spaces
      LText := AYAML[LLine];
      while (AIndentValue < LText.Length) and
        (LText.SubString(AIndentValue, 1) = ' ') do
        Inc(AIndentValue);
      LText := AYAML[LLine].Trim;
      if AIsArrayElement then
      begin
        LText := LText.SubString(2);
        Inc(AIndentValue, 2);
      end;
    end;
  end;
  if not LFound then
    Exit('');
  ACurrentLine := LLine;
  Result := LText;
end;

class function TJsonYaml.InternalYamlHasMoreText(AYAML: TStrings; ACurrentLine: Integer): boolean;
var
  LIndentValue: Integer;
  LIsArrayElement: boolean;
begin
  var LCurrentLine := ACurrentLine;
  Result := InternalYamlNextText(AYAML, LCurrentLine, LIndentValue, LIsArrayElement) <> '';
end;

class procedure TJsonYaml.InternalYamlNextProps(AYAML: TStrings; const ACurrentLine, ACurrentIndent: Integer; var AIsArray, AIsObject: boolean; var ALevel: Integer);
var
  LIsArrayElement: boolean;
begin
  var LCurrentLine := ACurrentLine;
  var LIndentValue := 0;
  AIsArray := False;
  AIsObject := False;
  ALevel := -1;
  if (InternalYamlNextText(AYAML, LCurrentLine, LIndentValue, LIsArrayElement) <> '') then
  begin
    if (LIndentValue < ACurrentIndent) then
      ALevel := -1
    else if (LIndentValue > ACurrentIndent) then
      ALevel := 1
    else
      ALevel := 0;
    AIsArray := (LIsArrayElement);
    AIsObject := (not LIsArrayElement) and (LIndentValue > ACurrentIndent);
  end;
end;

class procedure TJsonYaml.InternalYamlObjToJson(AYAML, AOutStrings: TStrings; IndentationType: TIndentationType; IndentationCount: TJsonIdentationCount; AIndent: Integer; var ASrcLine: Integer; AYamlIndent: Integer; AFromArray: boolean = False);
var
  LLineText: String;
  LIsArrayElement: boolean;
  LIsArrayStart: boolean;
  LIsObjectStart: boolean;
  LIsSameLevel: Integer;
  LElementName, LElementValue: String;
  IndentationValue: Char;
begin
  if (IndentationType = TIndentationType.Spaces) then
    IndentationValue := ' '
  else if (IndentationType = TIndentationType.Tabs) then
    IndentationValue := #9
  else IndentationValue := ' '; // Default to space

  // Add element start
  Inc(AIndent);
  var LBrackets := String.Create(IndentationValue, (AIndent - 1) * IndentationCount);
  var LIndentations := String.Create(IndentationValue, (AIndent) * IndentationCount);
  AOutStrings.Add(LBrackets + '{');
  try
    // Initialization
    var LLineIndent := AYamlIndent;
    var LNextIsArray := False;
    while (ASrcLine < AYAML.Count - 1) and (LLineIndent = AYamlIndent) do
    begin
      // Get line to process
      LLineText := InternalYamlNextText(AYAML, ASrcLine, LLineIndent, LIsArrayElement);
      // Identify what the next line will be
      InternalYamlNextProps(AYAML, ASrcLine, LLineIndent, LIsArrayStart, LIsObjectStart, LIsSameLevel);
      // Process values
      InternalYamlValueToJson(LLineText, LElementName, LElementValue);

      if LLineIndent < AYamlIndent then
      begin
        ASrcLine := InternalYamlPrevLine(AYAML, ASrcLine);
        Exit;
      end else if (LLineIndent > AYamlIndent) then
      begin
        ASrcLine := InternalYamlPrevLine(AYAML, ASrcLine);
        if LNextIsArray then
          InternalYamlArrToJson(AYAML, AOutStrings, IndentationType, IndentationCount, AIndent, ASrcLine, LLineIndent)
        else
          InternalYamlObjToJson(AYAML, AOutStrings, IndentationType, IndentationCount, AIndent, ASrcLine, LLineIndent);
        LLineIndent := AYamlIndent;
        InternalYamlNextProps(AYAML, ASrcLine, LLineIndent, LIsArrayStart, LIsObjectStart, LIsSameLevel);
      end else
      begin
        LNextIsArray := LIsArrayStart;
        if LIsArrayStart and (not AFromArray) and (LIsSameLevel >= 0) then
          AOutStrings.Add(LIndentations + LElementName + ': ')
        else if LIsObjectStart then
          AOutStrings.Add(LIndentations + LElementName + ': ')
        else if LIsArrayElement and (not AFromArray) then
          AOutStrings.Add(LIndentations + LElementName + ', ')
        else
          AOutStrings.Add(LIndentations + LElementName + ': ' + LElementValue + ', ');
      end;
      if (LIsSameLevel < 0) or (LIsArrayStart and (LIsSameLevel = 0)) then
        Exit;
    end;
  finally
    // Add closure ...
    if AOutStrings[AOutStrings.Count - 1].Equals(LBrackets + '{') then
      AOutStrings[AOutStrings.Count - 1] := LBrackets + '{}'
    else
    begin
      if AOutStrings[AOutStrings.Count - 1].EndsWith(', ') then
        AOutStrings[AOutStrings.Count - 1] := AOutStrings[AOutStrings.Count - 1]
          .Remove(AOutStrings[AOutStrings.Count - 1].Length - 2);
      AOutStrings.Add(LBrackets + '}');
    end;
    if InternalYamlHasMoreText(AYAML, ASrcLine) then
      AOutStrings[AOutStrings.Count - 1] :=
        AOutStrings[AOutStrings.Count - 1] + ', ';
  end;
end;

class procedure TJsonYaml.InternalYamlArrToJson(AYAML, AOutStrings: TStrings; IndentationType: TIndentationType; IndentationCount: TJsonIdentationCount; AIndent: Integer; var ASrcLine: Integer; AYamlIndent: Integer);
var
  LLineText: String;
  LIsArrayStart: Boolean;
  LIsObjectStart: Boolean;
  LIsSameLevel: Integer;
  LElementName, LElementValue: String;
  IndentationValue: Char;
begin
  if (IndentationType = TIndentationType.Spaces) then
    IndentationValue := ' '
  else if (IndentationType = TIndentationType.Tabs) then
    IndentationValue := #9
  else IndentationValue := ' '; // Default to space

  // Add element start
  Inc(AIndent);
  var LBrackets := String.Create(IndentationValue, (AIndent - 1) * IndentationCount);
  var LIndentations := String.Create(IndentationValue, (AIndent) * IndentationCount);
  if AOutStrings.Count = 0 then
    AOutStrings.Add(LBrackets + '[ ')
  else if AOutStrings[AOutStrings.Count - 1].Trim.IsEmpty then
    AOutStrings[AOutStrings.Count - 1] := LBrackets + '[ '
  else
    AOutStrings[AOutStrings.Count - 1] :=
      AOutStrings[AOutStrings.Count - 1] + '[ ';

  try
    // Initialization
    var LLineIndent := AYamlIndent;
    var LIsArrayElement := True;
    while (ASrcLine < AYAML.Count - 1) and (LLineIndent = AYamlIndent) do
    begin
      // Get line to process
      LLineText := InternalYamlNextText(AYAML, ASrcLine, LLineIndent, LIsArrayElement);
      // Identify what the next line will be
      InternalYamlNextProps(AYAML, ASrcLine, LLineIndent, LIsArrayStart, LIsObjectStart, LIsSameLevel);
      // Process values
      InternalYamlValueToJson(LLineText, LElementName, LElementValue);

      if (LLineIndent < AYamlIndent) then
      begin
        ASrcLine := InternalYamlPrevLine(AYAML, ASrcLine);
        Exit;
      end else if (LLineIndent > AYamlIndent) then
      begin
        ASrcLine := InternalYamlPrevLine(AYAML, ASrcLine);
        if LIsArrayStart then
          InternalYamlArrToJson(AYAML, AOutStrings, IndentationType, IndentationCount, AIndent, ASrcLine, LLineIndent)
        else
          InternalYamlObjToJson(AYAML, AOutStrings, IndentationType, IndentationCount, AIndent, ASrcLine, LLineIndent);
        LLineIndent := AYamlIndent;
        InternalYamlNextProps(AYAML, ASrcLine, LLineIndent, LIsArrayStart, LIsObjectStart, LIsSameLevel);
      end else
      begin
        if (not LIsArrayStart) and (LIsSameLevel = 0) then
        begin
          ASrcLine := InternalYamlPrevLine(AYAML, ASrcLine);
          InternalYamlObjToJson(AYAML, AOutStrings, IndentationType, IndentationCount, AIndent, ASrcLine, LLineIndent, True);
          LLineIndent := AYamlIndent;
          InternalYamlNextProps(AYAML, ASrcLine, LLineIndent, LIsArrayStart, LIsObjectStart, LIsSameLevel);
        end else
        begin
          if LIsArrayStart or (LIsArrayElement and LElementValue.Equals('null'))
          then
            AOutStrings.Add(LIndentations + LElementName + ', ')
          else if LIsArrayStart then
            AOutStrings.Add(LIndentations + LElementName + ': ')
          else
            AOutStrings.Add(LIndentations + LElementName + ': ' + LElementValue + ', ');
        end;
      end;
      if (LIsSameLevel < 0) then
        Exit;
    end;

  finally
    if AOutStrings[AOutStrings.Count - 1].Equals(LBrackets + '[ ') then
      AOutStrings[AOutStrings.Count - 1] := LBrackets + '[]'
    else
    begin
      if AOutStrings[AOutStrings.Count - 1].EndsWith(', ') then
        AOutStrings[AOutStrings.Count - 1] := AOutStrings[AOutStrings.Count - 1].Remove(AOutStrings[AOutStrings.Count - 1].Length - 2);
      if AOutStrings[AOutStrings.Count - 1].EndsWith('[ ') then
      begin
        AOutStrings[AOutStrings.Count - 1] := AOutStrings[AOutStrings.Count - 1].Remove(AOutStrings[AOutStrings.Count - 1].Length - 2);
        AOutStrings[AOutStrings.Count - 1] := AOutStrings[AOutStrings.Count - 1] + '[]';
      end else
        AOutStrings.Add(LBrackets + ']');
    end;
    if InternalYamlHasMoreText(AYAML, ASrcLine) then
      AOutStrings[AOutStrings.Count - 1] := AOutStrings[AOutStrings.Count - 1] + ', ';
  end;
end;

end.
