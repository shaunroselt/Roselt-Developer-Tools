unit Roselt.CodeFormatting;

interface

uses
  Roselt.Utility,

  System.SysUtils,
  System.Classes,
  System.StrUtils,

  System.JSON,

  XML.XMLDoc;

type
  TCodeFormatter = record
  public type
    TIndentationType = (Spaces, Tabs);
  public
    class function FormatDelphi(delphi: String; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: Integer = 2): String; static;
    class function FormatHTML(html: String; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: Integer = 2): String; static;
    class function FormatCSS(css: String; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: Integer = 2): String; static;
    class function FormatSQL(sql: String; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: Integer = 2): String; static;
    class function FormatJavaScript(js: String; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: Integer = 2): String; static;
    class function FormatXML(xml: String; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: Integer = 2): String; static;
    class function FormatPHP(php: String; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: Integer = 2): String; static;
    class function FormatJson(json: String; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: Integer = 2): String; static;

    class function MinifyDelphi(delphi: String; RemoveComments: Boolean = True): String; static;
    class function MinifyHTML(html: String): String; static;
    class function MinifyCSS(css: String): String; static;
    class function MinifySQL(sql: String): String; static;
    class function MinifyJavaScript(js: String): String; static;
    class function MinifyXML(xml: String): String; static;
    class function MinifyPHP(php: String): String; static;
    class function MinifyJson(json: String): String; static;
  end;

implementation

class function TCodeFormatter.FormatDelphi(delphi: String; IndentationType: TIndentationType; IndentationCount: Integer): String;
//  Doesn't work yet. Just testing things out.
begin

end;

class function TCodeFormatter.FormatSQL(sql: String; IndentationType: TIndentationType; IndentationCount: Integer): String;
//  Doesn't work yet. Just testing things out.
begin

end;

class function TCodeFormatter.FormatXML(xml: String; IndentationType: TIndentationType; IndentationCount: Integer): String;
// It works, but Indentation still needs to be implemented
begin
  Result := FormatXMLData(xml);
end;

class function TCodeFormatter.MinifyCSS(css: String): String;
//  Doesn't work perfectly yet. Just testing things out.
begin
  for var I in css.Split([sLineBreak]) do
    Result := Result + I.Trim([' ', #9, #10, #13]);
end;

class function TCodeFormatter.MinifyDelphi(delphi: String; RemoveComments: Boolean): String;
  function RemoveCommentsFromLine(MyLine: String): String;
  begin
    var MultiLineComment := '';
    if (MyLine.Contains('//')) then
    begin
      if (MyLine[1] = '/') AND (MyLine[2] = '/') then
      begin
        MyLine := ''; // This whole line is a comment that can't be minified, so remove it.
      end else
      begin
        var StringCharCount := MyLine.CountChar('''');
        var StringCharFirst := MyLine.IndexOf('''');
        var StringCharSecond := MyLine.Substring(StringCharFirst+1).IndexOf('''') + StringCharFirst + 1;
        var CommentChar := MyLine.IndexOf('//');
        if (MyLine.CountChar('{') > 0) AND (MyLine.CountChar('}') > 0) then
            if (MyLine.IndexOf('}') > MyLine.IndexOf('{')) then
            begin
                MultiLineComment := MyLine.Remove(MyLine.IndexOf('}')+1);
                MyLine := MyLine.Substring(MultiLineComment.Length);
                StringCharCount := MyLine.CountChar('''');
                StringCharFirst := MyLine.IndexOf('''');
                StringCharSecond := MyLine.Substring(StringCharFirst+1).IndexOf('''') + StringCharFirst + 1;
                CommentChar := MyLine.IndexOf('//');
            end;

        if (StringCharCount > 1) AND (MyLine.Contains('//')) then
        begin
          if (StringCharFirst > -1) AND (StringCharSecond > -1) AND (StringCharFirst <> StringCharSecond) then
            if (StringCharFirst < CommentChar) AND (StringCharSecond > CommentChar) AND (StringCharCount mod 2 = 0) then
            begin
               // We found //, but it is within a string (quotes ' '), let's leave it.
              var CommentCharAnother := MyLine.LastIndexOf('//');
              if (CommentChar <> CommentCharAnother) then
                MyLine := MyLine.Remove(CommentCharAnother); // Somewhere else is a comment, remove it.
            end else
            begin
              if (StringCharFirst < CommentChar) AND (StringCharSecond > CommentChar) then
                CommentChar := MyLine.Substring(CommentChar+2).IndexOf('//') + CommentChar + 1;
              MyLine := MyLine.Remove(CommentChar); // Somewhere else is a comment, remove it.
            end;
        end else
          MyLine := MyLine.Remove(CommentChar); // There's no strings, remove this comment.
      end;
    end;
    Result := MultiLineComment + MyLine;
  end;
begin
  var sLine := '';
  for var I in delphi.Split([sLineBreak]) do
  begin
    var TrimmedLine := I.Trim([' ', #09, #10, #13]);
    TrimmedLine := RemoveCommentsFromLine(TrimmedLine);

    if ((sLine.Length + TrimmedLine.Length + 1) >= 1023) then
    begin
      Result := Result + sLine + sLineBreak;
      sLine := TrimmedLine + ' ';
    end else
      sLine := sLine + TrimmedLine + ' ';
  end;

  if (sLine.Length > 0) then Result := Result + sLine;
end;

class function TCodeFormatter.MinifyHTML(html: String): String;
//  Doesn't work perfectly yet. Just testing things out.
begin
  for var I in html.Split([sLineBreak]) do
    Result := Result + I.Trim([' ', #9, #10, #13]);
end;

class function TCodeFormatter.MinifyJavaScript(js: String): String;
//  Doesn't work yet. Just testing things out.
begin

end;

class function TCodeFormatter.MinifyJson(json: String): String;
begin
  var JsonObject := TJSONObject.ParseJSONValue(json) as TJSONObject;
  try
    Result := JsonObject.ToString;
  finally
    JsonObject.Free;
  end;


// I could also do something like the following code, it might even be faster:
//  for var I in json.Split([sLineBreak]) do
//    Result := Result + I.Trim([' ', #9, #10, #13]);
end;

class function TCodeFormatter.MinifyPHP(php: String): String;
//  Doesn't work yet. Just testing things out.
begin

end;

class function TCodeFormatter.MinifySQL(sql: String): String;
//  Doesn't work yet. Just testing things out.
begin

end;

class function TCodeFormatter.MinifyXML(xml: String): String;
begin
  var XMLDoc := TXMLDocument.Create(nil);
  try
    XMLDoc.LoadFromXML(xml);
    Result := XMLDoc.XML.Text;
  finally
    XMLDoc.Free;
  end;
end;

class function TCodeFormatter.FormatHTML(html: String; IndentationType: TIndentationType; IndentationCount: Integer): String;
//  Doesn't work yet. Just testing things out.
begin
  html := RemoveEmptyLinesAndWhitespace(html);
  html := html.Replace(#10,'',[rfReplaceAll]).Replace(#13,'',[rfReplaceAll]);


  html := html.Replace('>','>'+sLineBreak);
  html := html.Replace('<',sLineBreak+'<');
  html := RemoveEmptyLinesAndWhitespace(html);


  var SL := TStringList.Create;
  SL.Text := html;


  for var I := 0 to SL.Count-1 do
  begin
    var ElementTagName := '';
    if (SL[I][1] = '<') and (SL[I][SL[I].Length] = '>') then
    begin
      ElementTagName := SL[I].Substring(1,SL[I].Length-2);
      ElementTagName := RemoveEmptyLinesAndWhitespace(ElementTagName);
    end;

    var fsf := '';

  end;

  Result := SL.Text;
  SL.Free;
end;

class function TCodeFormatter.FormatCSS(css: String; IndentationType: TIndentationType; IndentationCount: Integer): String;
//  Doesn't work yet. Just testing things out.
begin

end;

class function TCodeFormatter.FormatJavaScript(js: String; IndentationType: TIndentationType; IndentationCount: Integer): String;
//  Doesn't work yet. Just testing things out.
begin

end;

class function TCodeFormatter.FormatJson(json: String; IndentationType: TIndentationType; IndentationCount: Integer): String;
begin
  var JsonObject := TJSONObject.ParseJSONValue(json) as TJSONObject;
  try
    var JsonResult := JsonObject.Format(IndentationCount);
    if (IndentationType = TIndentationType.Spaces) then
      Result := jsonResult;

    if (IndentationType = TIndentationType.Tabs) then
      for var I in JsonResult.Split([sLineBreak]) do
        Result := Result + DupeString(#9,(I.Length - I.TrimLeft([' ']).Length)) + I.TrimLeft([' ']) + sLineBreak;
  finally
    JsonObject.Free;
  end;
end;

class function TCodeFormatter.FormatPHP(php: String; IndentationType: TIndentationType; IndentationCount: Integer): String;
//  Doesn't work yet. Just testing things out.
begin

end;

end.
