unit uFrame_TextCaseConverterInspector;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Generics.Collections,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Memo.Types,
  FMX.Layouts,
  FMX.Objects,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.Controls.Presentation;

type
  TFrame_TextCaseConverterInspector = class(TFrame)
    layTextCaseConverterInspectorBottom: TLayout;
    layTextCaseConverterInspectorInput: TLayout;
    lblTextCaseConverterInspectorInput: TLabel;
    memTextCaseConverterInspectorInput: TMemo;
    layTextCaseConverterInspectorInspect: TLayout;
    lblTextCaseConverterInspectorInspect: TLabel;
    Rectangle4: TRectangle;
    lblTextCaseConverterInspectorInspectSelectionTitle: TLabel;
    layTextCaseConverterInspectorInspectLine: TLayout;
    lblTextCaseConverterInspectorInspectLineTitle: TLabel;
    lblTextCaseConverterInspectorInspectLine: TLabel;
    layTextCaseConverterInspectorInspectPosition: TLayout;
    lblTextCaseConverterInspectorInspectPositionTitle: TLabel;
    lblTextCaseConverterInspectorInspectPosition: TLabel;
    layTextCaseConverterInspectorInspectColumn: TLayout;
    lblTextCaseConverterInspectorInspectColumnTitle: TLabel;
    lblTextCaseConverterInspectorInspectColumn: TLabel;
    lblTextCaseConverterInspectorInspectStatisticsTitle: TLabel;
    layTextCaseConverterInspectorInspectCharacters: TLayout;
    lblTextCaseConverterInspectorInspectCharactersTitle: TLabel;
    lblTextCaseConverterInspectorInspectCharacters: TLabel;
    layTextCaseConverterInspectorInspectLines: TLayout;
    lblTextCaseConverterInspectorInspectLinesTitle: TLabel;
    lblTextCaseConverterInspectorInspectLines: TLabel;
    layTextCaseConverterInspectorInspectParagraphs: TLayout;
    lblTextCaseConverterInspectorInspectParagraphsTitle: TLabel;
    lblTextCaseConverterInspectorInspectParagraphs: TLabel;
    layTextCaseConverterInspectorInspectWords: TLayout;
    lblTextCaseConverterInspectorInspectWordsTitle: TLabel;
    lblTextCaseConverterInspectorInspectWords: TLabel;
    layTextCaseConverterInspectorInspectSentences: TLayout;
    lblTextCaseConverterInspectorInspectSentencesTitle: TLabel;
    lblTextCaseConverterInspectorInspectSentences: TLabel;
    layTextCaseConverterInspectorInspectBytes: TLayout;
    lblTextCaseConverterInspectorInspectBytesTitle: TLabel;
    lblTextCaseConverterInspectorInspectBytes: TLabel;
    layTextCaseConverterInspectorInspectWordDistribution: TLayout;
    memTextCaseConverterInspectorInspectWordDistribution: TMemo;
    lblTextCaseConverterInspectorInspectWordDistributionTitle: TLabel;
    layTextCaseConverterInspectorInspectCharacterDistribution: TLayout;
    memTextCaseConverterInspectorInspectCharacterDistribution: TMemo;
    lblTextCaseConverterInspectorInspectCharacterDistributionTitle: TLabel;
    layTextCaseConverterInspectorInspectSpaces: TLayout;
    lblTextCaseConverterInspectorInspectSpacesTitle: TLabel;
    lblTextCaseConverterInspectorInspectSpaces: TLabel;
    SplitterTextCaseConverterInspector: TSplitter;
    layTextCaseConverterInspectorTop: TLayout;
    lblTextCaseConverterInspectorConvert: TLabel;
    layTextCaseConverterInspectorConvert: TRectangle;
    layTextCaseConverterInspectorConvertButtons: THorzScrollBox;
    btnTextCaseConverterInspectorConvertOriginalText: TButton;
    btnTextCaseConverterInspectorConvertKebabCase: TButton;
    btnTextCaseConverterInspectorConvertAlternatingCase: TButton;
    btnTextCaseConverterInspectorConvertConstantCase: TButton;
    btnTextCaseConverterInspectorConvertTrainCase: TButton;
    btnTextCaseConverterInspectorConvertInverseCase: TButton;
    btnTextCaseConverterInspectorConvertLowerCase: TButton;
    btnTextCaseConverterInspectorConvertCobolCase: TButton;
    btnTextCaseConverterInspectorConvertSnakeCase: TButton;
    btnTextCaseConverterInspectorConvertSentenceCase: TButton;
    btnTextCaseConverterInspectorConvertUpperCase: TButton;
    btnTextCaseConverterInspectorConvertCamelCase: TButton;
    btnTextCaseConverterInspectorConvertPascalCase: TButton;
    btnTextCaseConverterInspectorConvertTitleCase: TButton;
    imgConversion: TImage;
    procedure TextCaseConverterButtonsClick(Sender: TObject);
    procedure memTextCaseConverterInspectorInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { Private declarations }
    TextCaseConverterInspectorInput: String;

    procedure TextCaseInspector();
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_TextCaseConverterInspector.memTextCaseConverterInspectorInputKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  TextCaseConverterInspectorInput := memTextCaseConverterInspectorInput.Text;
  TextCaseInspector();
end;

procedure TFrame_TextCaseConverterInspector.TextCaseConverterButtonsClick(Sender: TObject);
begin
  var TextCase := TButton(Sender).Text;

  if (TextCase = 'Original text') then
    memTextCaseConverterInspectorInput.Text := TextCaseConverterInspectorInput;

  if (TextCase = 'Sentence case') then
  begin
    var strOutput := TextCaseConverterInspectorInput.ToLower;
    var ChangeCaseBool := True;
    for var I := 1 to strOutput.Length do
    begin
      if (strOutput[I] = '.') or (strOutput[I] = '?') or (strOutput[I] = '!') or (strOutput[I] = #13) then
      begin
        ChangeCaseBool := True;
        continue;
      end;
      if (ChangeCaseBool) and (CharInSet(strOutput[I],['a'..'z'])) then
      begin
        strOutput[I] := UpperCase(strOutput[I])[1];
        ChangeCaseBool := False;
      end;
    end;
    memTextCaseConverterInspectorInput.Text := strOutput;
  end;

  if (TextCase = 'lower case') then
    memTextCaseConverterInspectorInput.Text := TextCaseConverterInspectorInput.ToLower;

  if (TextCase = 'UPPER CASE') then
    memTextCaseConverterInspectorInput.Text := TextCaseConverterInspectorInput.ToUpper;

  if (TextCase = 'Title Case') then
  begin
    var strOutput := TextCaseConverterInspectorInput.ToLower;
    var ChangeCaseBool := True;
    for var I := 1 to strOutput.Length do
    begin
      if (strOutput[I] = ' ') or (strOutput[I] = '.') or (strOutput[I] = '?') or (strOutput[I] = '!') or (strOutput[I] = #13) then
      begin
        ChangeCaseBool := True;
        continue;
      end;
      if (ChangeCaseBool) and (CharInSet(strOutput[I],['a'..'z'])) then
      begin
        strOutput[I] := UpperCase(strOutput[I])[1];
        ChangeCaseBool := False;
      end;
    end;
    memTextCaseConverterInspectorInput.Text := strOutput;
  end;

  if (TextCase = 'camelCase') then
  begin
    var strInput := TextCaseConverterInspectorInput.ToLower;
    var strOutput := '';
    var ChangeCaseBool := False;
    for var I := 1 to strInput.Length do
    begin
      if (strInput[I] = ' ') then
      begin
        ChangeCaseBool := True;
        continue;
      end;
      if (strInput[I] = #13) then
      begin
        ChangeCaseBool := False;
        strOutput := strOutput + sLineBreak;
        continue;
      end;
      if (CharInSet(strInput[I],['a'..'z'])) or (CharInSet(strInput[I],['0'..'9'])) then
      begin
        if ChangeCaseBool then
          strOutput := strOutput + UpperCase(strInput[I])[1]
        else
          strOutput := strOutput + strInput[I];

        ChangeCaseBool := False;
      end;
    end;
    memTextCaseConverterInspectorInput.Text := strOutput;
  end;

  if (TextCase = 'PascalCase') then
  begin
    var strInput := TextCaseConverterInspectorInput.ToLower;
    var strOutput := '';
    var ChangeCaseBool := True;
    for var I := 1 to strInput.Length do
    begin
      if (strInput[I] = ' ') then
      begin
        ChangeCaseBool := True;
        continue;
      end;
      if (strInput[I] = #13) then
      begin
        ChangeCaseBool := True;
        strOutput := strOutput + sLineBreak;
        continue;
      end;
      if (CharInSet(strInput[I],['a'..'z'])) or (CharInSet(strInput[I],['0'..'9'])) then
      begin
        if ChangeCaseBool then
          strOutput := strOutput + UpperCase(strInput[I])[1]
        else
          strOutput := strOutput + strInput[I];

        ChangeCaseBool := False;
      end;
    end;
    memTextCaseConverterInspectorInput.Text := strOutput;
  end;

  if (TextCase = 'snake_case') then
  begin
    var strInput := TextCaseConverterInspectorInput.ToLower;
    var strOutput := '';
    for var I := 1 to strInput.Length do
    begin
      if (strInput[I] = #13) then
      begin
        strOutput := strOutput + sLineBreak;
        continue;
      end;
      if (CharInSet(strInput[I],['a'..'z'])) or (CharInSet(strInput[I],['0'..'9'])) or (strInput[I] = ' ') then
        strOutput := strOutput + strInput[I];
    end;
    memTextCaseConverterInspectorInput.Text := strOutput.Replace(' ','_');
  end;

  if (TextCase = 'CONSTANT_CASE') then
  begin
    var strInput := TextCaseConverterInspectorInput.ToUpper;
    var strOutput := '';
    for var I := 1 to strInput.Length do
    begin
      if (strInput[I] = #13) then
      begin
        strOutput := strOutput + sLineBreak;
        continue;
      end;
      if (CharInSet(strInput[I],['A'..'Z'])) or (CharInSet(strInput[I],['0'..'9'])) or (strInput[I] = ' ') then
        strOutput := strOutput + strInput[I];
    end;
    memTextCaseConverterInspectorInput.Text := strOutput.Replace(' ','_');
  end;

  if (TextCase = 'kebab-case') then
  begin
    var strInput := TextCaseConverterInspectorInput.ToLower;
    var strOutput := '';
    for var I := 1 to strInput.Length do
    begin
      if (strInput[I] = #13) then
      begin
        strOutput := strOutput + sLineBreak;
        continue;
      end;
      if (CharInSet(strInput[I],['a'..'z'])) or (CharInSet(strInput[I],['0'..'9'])) or (strInput[I] = ' ') then
        strOutput := strOutput + strInput[I];
    end;
    memTextCaseConverterInspectorInput.Text := strOutput.Replace(' ','-');
  end;

  if (TextCase = 'COBOL-CASE') then
  begin
    var strInput := TextCaseConverterInspectorInput.ToUpper;
    var strOutput := '';
    for var I := 1 to strInput.Length do
    begin
      if (strInput[I] = #13) then
      begin
        strOutput := strOutput + sLineBreak;
        continue;
      end;
      if (CharInSet(strInput[I],['A'..'Z'])) or (CharInSet(strInput[I],['0'..'9'])) or (strInput[I] = ' ') then
        strOutput := strOutput + strInput[I];
    end;
    memTextCaseConverterInspectorInput.Text := strOutput.Replace(' ','-');
  end;

  if (TextCase = 'Train-Case') then
  begin
    var strInput := TextCaseConverterInspectorInput.ToLower;
    var strOutput := '';
    var ChangeCaseBool := True;
    for var I := 1 to strInput.Length do
    begin
      if (strInput[I] = ' ') then
      begin
        strOutput := strOutput + strInput[I];
        ChangeCaseBool := True;
        continue;
      end;
      if (strInput[I] = #13) then
      begin
        ChangeCaseBool := True;
        strOutput := strOutput + sLineBreak;
        continue;
      end;
      if (CharInSet(strInput[I],['a'..'z'])) or (CharInSet(strInput[I],['0'..'9'])) then
      begin
        if ChangeCaseBool then
          strOutput := strOutput + UpperCase(strInput[I])[1]
        else
          strOutput := strOutput + strInput[I];

        ChangeCaseBool := False;
      end;
    end;
    memTextCaseConverterInspectorInput.Text := strOutput.Replace(' ','-');
  end;

  if (TextCase = 'aLtErNaTiNg cAsE') then
  begin
    var strOutput := TextCaseConverterInspectorInput;
    var ChangeCaseBool := False;
    for var I := 1 to strOutput.Length do
    begin
      if (ChangeCaseBool) then
        strOutput[I] := UpperCase(strOutput[I])[1]
      else
        strOutput[I] := LowerCase(strOutput[I])[1];
      ChangeCaseBool := not(ChangeCaseBool);
    end;
    memTextCaseConverterInspectorInput.Text := strOutput;
  end;

  if (TextCase = 'InVeRsE CaSe') then
  begin
    var strOutput := TextCaseConverterInspectorInput;
    var ChangeCaseBool := True;
    for var I := 1 to strOutput.Length do
    begin
      if (ChangeCaseBool) then
        strOutput[I] := UpperCase(strOutput[I])[1]
      else
        strOutput[I] := LowerCase(strOutput[I])[1];
      ChangeCaseBool := not(ChangeCaseBool);
    end;
    memTextCaseConverterInspectorInput.Text := strOutput;
  end;
end;

procedure TFrame_TextCaseConverterInspector.TextCaseInspector;
  function GetCharacterDistribution(s: String): String;
  begin
    result := '';
    var Text := s.Replace(#13#10,' ');
    var CharacterDistribution := TDictionary<String, UInt64>.Create;
    for var I := 1 to Text.Length do
    begin
      var Key := Text[I];
      var Value := UInt64(0);
      if (CharacterDistribution.TryGetValue(Text[I],Value)) then
        CharacterDistribution.AddOrSetValue(Key,Value+1)
      else
        CharacterDistribution.AddOrSetValue(Key,1);
    end;
    var sFinal := TStringList.Create;
    for var I in CharacterDistribution do
      sFinal.Add(I.Key + ': ' + I.Value.ToString);
    result := sFinal.Text;
    sFinal.Free;
    CharacterDistribution.Free;
  end;

  function GetWordDistribution(s: String): String;
  begin
    result := '';
    var Text := s.Replace(#13#10,' ').Replace('.','').Replace('?','').Replace('!','').Replace('(','').Replace(')','');
    var WordDistribution := TDictionary<String, UInt64>.Create;
    var SplittedText := Text.Split([' ']);
    for var I := 0 to Length(SplittedText)-1 do
    begin
      var Key := SplittedText[I];
      var Value := UInt64(0);
      if (WordDistribution.TryGetValue(Key,Value)) then
        WordDistribution.AddOrSetValue(Key,Value+1)
      else
        WordDistribution.AddOrSetValue(Key,1);
    end;
    var sFinal := TStringList.Create;
    for var I in WordDistribution do
      sFinal.Add(I.Key + ': ' + I.Value.ToString);
    result := sFinal.Text;
    sFinal.Free;
    WordDistribution.Free;
  end;
begin
  var Text := memTextCaseConverterInspectorInput.Text;
  lblTextCaseConverterInspectorInspectCharacters.Text := Text.Length.ToString;
  lblTextCaseConverterInspectorInspectLines.Text := Text.CountChar(#13).ToString;
  lblTextCaseConverterInspectorInspectSpaces.Text := Text.CountChar(' ').ToString;
  lblTextCaseConverterInspectorInspectBytes.Text := TEncoding.UTF8.GetByteCount(Text).ToString;

  memTextCaseConverterInspectorInspectCharacterDistribution.Text := GetCharacterDistribution(Text);
  memTextCaseConverterInspectorInspectWordDistribution.Text := GetWordDistribution(Text);
end;

end.
