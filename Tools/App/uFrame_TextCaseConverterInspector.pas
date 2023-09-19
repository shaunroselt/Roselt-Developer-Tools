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
  FMX.Platform,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.Controls.Presentation,
  System.Skia,
  FMX.Skia;

type
  TFrame_TextCaseConverterInspector = class(TFrame)
    layTextCaseConverterInspectorBottom: TLayout;
    layTextCaseConverterInspectorInput: TLayout;
    lblTextCaseConverterInspectorInput: TLabel;
    memTextCaseConverterInspectorInput: TMemo;
    layTextCaseConverterInspectorInspect: TLayout;
    lblTextCaseConverterInspectorInspect: TLabel;
    layTextCaseConverterInspectorInspectOutput: TRectangle;
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
    imgConversion: TSkSvg;
    btnInputPasteFromClipboard: TButton;
    imgInputPasteFromClipboard: TSkSvg;
    lblInputPasteFromClipboard: TLabel;
    btnInputCopyToClipboard: TButton;
    imgInputCopyToClipboard: TSkSvg;
    lblInputCopyToClipboard: TLabel;
    OpenDialog: TOpenDialog;
    btnInputLoad: TButton;
    imgInputLoad: TSkSvg;
    lblInputLoad: TLabel;
    btnInputClear: TButton;
    imgInputClear: TSkSvg;
    lblInputClear: TLabel;
    btnTextCaseConverterInspectorConvertUpperSnakeCase: TButton;
    btnTextCaseConverterInspectorConvertDotCase: TButton;
    procedure TextCaseConverterButtonsClick(Sender: TObject);
    procedure memTextCaseConverterInspectorInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnInputCopyToClipboardClick(Sender: TObject);
    procedure btnInputPasteFromClipboardClick(Sender: TObject);
    procedure memTextCaseConverterInspectorInputChange(Sender: TObject);
    procedure memTextCaseConverterInspectorInputClick(Sender: TObject);
    procedure btnInputClearClick(Sender: TObject);
    procedure btnInputLoadClick(Sender: TObject);
    procedure FrameResized(Sender: TObject);
  private
    { Private declarations }
    TextCaseConverterInspectorInput: String;

    procedure TextCaseInspector();
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_TextCaseConverterInspector.btnInputClearClick(Sender: TObject);
begin
  memTextCaseConverterInspectorInput.Text := '';
end;

procedure TFrame_TextCaseConverterInspector.btnInputCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memTextCaseConverterInspectorInput.Text);
end;

procedure TFrame_TextCaseConverterInspector.btnInputLoadClick(Sender: TObject);
begin
  if (OpenDialog.Execute) then
  begin
    memTextCaseConverterInspectorInput.Lines.LoadFromFile(OpenDialog.FileName);
    TextCaseInspector();
  end;
end;

procedure TFrame_TextCaseConverterInspector.btnInputPasteFromClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    memTextCaseConverterInspectorInput.Text := ClipboardService.GetClipboard.ToString;
end;

procedure TFrame_TextCaseConverterInspector.FrameResized(Sender: TObject);
begin
  layTextCaseConverterInspectorInspectCharacterDistribution.Height :=
    (
      layTextCaseConverterInspectorInspectOutput.Height -
      (
        layTextCaseConverterInspectorInspectOutput.Padding.Bottom +
        layTextCaseConverterInspectorInspectOutput.Padding.Top +
        lblTextCaseConverterInspectorInspectSelectionTitle.Height +
        layTextCaseConverterInspectorInspectLine.Height +
        layTextCaseConverterInspectorInspectColumn.Height +
        layTextCaseConverterInspectorInspectPosition.Height +
        lblTextCaseConverterInspectorInspectStatisticsTitle.Height +
        lblTextCaseConverterInspectorInspectStatisticsTitle.Margins.Top +
        layTextCaseConverterInspectorInspectCharacters.Height +
        layTextCaseConverterInspectorInspectWords.Height +
        layTextCaseConverterInspectorInspectLines.Height +
        layTextCaseConverterInspectorInspectSentences.Height +
        layTextCaseConverterInspectorInspectParagraphs.Height +
        layTextCaseConverterInspectorInspectSpaces.Height +
        layTextCaseConverterInspectorInspectBytes.Height +
        layTextCaseConverterInspectorInspectWordDistribution.Margins.Top +
        layTextCaseConverterInspectorInspectCharacterDistribution.Margins.Top
      )
    ) / 2;
end;

procedure TFrame_TextCaseConverterInspector.memTextCaseConverterInspectorInputChange(Sender: TObject);
begin
  TextCaseConverterInspectorInput := memTextCaseConverterInspectorInput.Text;
  TextCaseInspector();
end;

procedure TFrame_TextCaseConverterInspector.memTextCaseConverterInspectorInputClick(Sender: TObject);
begin
  TextCaseInspector();
end;

procedure TFrame_TextCaseConverterInspector.memTextCaseConverterInspectorInputKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  TextCaseConverterInspectorInput := memTextCaseConverterInspectorInput.Text;
  TextCaseInspector();
end;

procedure TFrame_TextCaseConverterInspector.TextCaseConverterButtonsClick(Sender: TObject);
begin
  memTextCaseConverterInspectorInput.OnChange := nil;

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

  if (TextCase = 'UPPER_SNAKE_CASE') then
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

  if (TextCase = 'dot.case') then
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
    memTextCaseConverterInspectorInput.Text := strOutput.Replace(' ','.');
  end;

  TextCaseInspector;

  memTextCaseConverterInspectorInput.OnChange := memTextCaseConverterInspectorInputChange;
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
  function CountWords(const S: string): Integer;
  begin
    Result := 0;
    var L := S.Length;
    var I := 1;
    var J := 0;
    while I <= L do
    begin
      while (I <= L) and (S[I] in [' ', #9, #10, #13]) do Inc(I);
      J := I;
      while (J <= L) and not (S[J] in [' ', #9, #10, #13]) do Inc(J);
      if J > I then Inc(Result);
      I := J;
    end;
  end;
  function CountSentences(const MyString: string): integer;
  begin
    var SentenceCount := 0;
    for var i := 1 to MyString.Length do
    begin
      if (MyString[i] = '.') or (MyString[i] = '!') or (MyString[i] = '?') then
        SentenceCount := SentenceCount + 1;
    end;
    Result := SentenceCount;
  end;
  function CountParagraphs(const s: string): Integer;
  begin
    Result := 0;
    var Lines := TStringList.Create;
    try
      Lines.Text := s;
      for var i := 0 to Lines.Count - 1 do
      begin
        if (Lines[i] = '') then
          Inc(Result);
      end;
    finally
      Inc(Result);
      Lines.Free;
    end;
  end;
begin
  var Text := memTextCaseConverterInspectorInput.Text;
  lblTextCaseConverterInspectorInspectLine.Text := (memTextCaseConverterInspectorInput.CaretPosition.Line+1).ToString;
  lblTextCaseConverterInspectorInspectColumn.Text := memTextCaseConverterInspectorInput.CaretPosition.Pos.ToString;
  lblTextCaseConverterInspectorInspectPosition.Text := memTextCaseConverterInspectorInput.CaretPosition.Pos.ToString;  // Doesn't work yet
  lblTextCaseConverterInspectorInspectCharacters.Text := Text.Length.ToString;
  lblTextCaseConverterInspectorInspectWords.Text := CountWords(Text).ToString;
  lblTextCaseConverterInspectorInspectLines.Text := (Text.CountChar(#13)+1).ToString;
  lblTextCaseConverterInspectorInspectSentences.Text := CountSentences(Text).ToString;
  lblTextCaseConverterInspectorInspectParagraphs.Text := CountParagraphs(Text).ToString;
  lblTextCaseConverterInspectorInspectSpaces.Text := Text.CountChar(' ').ToString;
  lblTextCaseConverterInspectorInspectBytes.Text := TEncoding.UTF8.GetByteCount(Text).ToString;

  memTextCaseConverterInspectorInspectCharacterDistribution.Text := GetCharacterDistribution(Text);
  memTextCaseConverterInspectorInspectWordDistribution.Text := GetWordDistribution(Text);

  var PositionCount := 0;
  for var I := 0 to memTextCaseConverterInspectorInput.CaretPosition.Line-1 do
    PositionCount := PositionCount + memTextCaseConverterInspectorInput.Lines[I].Length;
  PositionCount := PositionCount + memTextCaseConverterInspectorInput.CaretPosition.Pos;
  lblTextCaseConverterInspectorInspectPosition.Text := PositionCount.ToString;
end;

end.
