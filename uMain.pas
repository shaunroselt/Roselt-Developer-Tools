{ TODO: Finish everything 😂 }
unit uMain;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.IOUtils,
  System.Variants,
  System.ImageList,
  System.DateUtils,

  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.MultiView,
  FMX.Objects,
  FMX.ImgList,
  FMX.Ani, 
  FMX.Memo.Types,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.ListBox,
  FMX.Edit,
  FMX.SearchBox,
  FMX.TabControl,
  FMX.Printer,

  uStyles,
  uBootstrapIcons,

  uFrame_Base64TextEncoderDecoder,
  uFrame_JsonYamlConverter,
  uFrame_HashGenerator,
  uFrame_HTMLEncoderDecoder,
  uFrame_JsonFormatter,
  uFrame_LoremIpsumGenerator,
  uFrame_TextCaseConverterInspector,
  uFrame_ColorPicker,
  uFrame_TimestampConverter,
  uFrame_NumberBaseConverter,
  uFrame_URLEncoderDecoder,
  uFrame_GZipCompressDecompress,
  uFrame_JWTDecoder,
  uFrame_Base64ImageEncoderDecoder,
  uFrame_SQLFormatter,
  uFrame_HTMLFormatter,
  uFrame_CSSFormatter,
  uFrame_PHPFormatter,
  uFrame_XMLFormatter,
  uFrame_JavaScriptFormatter,
  uFrame_UUIDGenerator,
  uFrame_TextEscapeUnescape,
  uFrame_MarkdownPreview,
  uFrame_RegexTester,
  uFrame_NameGenerator,

  Skia,
  Skia.FMX;

type
  TfrmMain = class(TForm)
    MultiView: TMultiView;
    TopBar: TRectangle;
    lblNavTitle: TLabel;
    btnHamburger: TButton;
    layAllTools: TScrollBox;
    layNavAllTools: TLayout;
    imgAllTools: TSkSvg;
    lblAllTools: TLabel;
    btnAllTools: TRectangle;
    LayoutContainer: TLayout;
    layAllToolsGrid: TGridLayout;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    MultiViewScrollBox: TVertScrollBox;
    Button13: TButton;
    layNavTesting: TLayout;
    btnTesting: TRectangle;
    imgTesting: TSkSvg;
    lblTesting: TLabel;
    layTesting: TLayout;
    Label41: TLabel;
    memTesting: TMemo;
    layNavGenerators: TLayout;
    layNavGeneratorsExpandCollapse: TLayout;
    btnGeneratorsExpandCollapse: TRectangle;
    imgGeneratorsExpandCollapse: TSkSvg;
    lblGeneratorsExpandCollapse: TLabel;
    imgGeneratorsExpandCollapseIcon: TSkSvg;
    layNavUUIDGenerator: TLayout;
    btnUUIDGenerator: TRectangle;
    imgUUIDGenerator: TSkSvg;
    lblUUIDGenerator: TLabel;
    layNavHashGenerator: TLayout;
    btnHashGenerator: TRectangle;
    imgHashGenerator: TSkSvg;
    lblHashGenerator: TLabel;
    layNavLoremIpsumGenerator: TLayout;
    btnLoremIpsumGenerator: TRectangle;
    imgLoremIpsumGenerator: TSkSvg;
    lblLoremIpsumGenerator: TLabel;
    layNavNameGenerator: TLayout;
    btnNameGenerator: TRectangle;
    imgNameGenerator: TSkSvg;
    lblNameGenerator: TLabel;
    layNavEncodersDecoders: TLayout;
    layNavEncodersDecodersExpandCollapse: TLayout;
    btnEncodersDecodersExpandCollapse: TRectangle;
    imgEncodersDecodersExpandCollapse: TSkSvg;
    lblEncodersDecodersExpandCollapse: TLabel;
    imgEncodersDecodersExpandCollapseIcon: TSkSvg;
    layNavBase64EncoderDecoder: TLayout;
    btnBase64EncoderDecoder: TRectangle;
    imgBase64EncoderDecoder: TSkSvg;
    lblBase64EncoderDecoder: TLabel;
    layNavHTMLEncoderDecoder: TLayout;
    btnHTMLEncoderDecoder: TRectangle;
    imgHTMLEncoderDecoder: TSkSvg;
    lblHTMLEncoderDecoder: TLabel;
    layNavJWTDecoder: TLayout;
    btnJWTDecoder: TRectangle;
    imgJWTDecoder: TSkSvg;
    lblJWTDecoder: TLabel;
    layNavBase64ImageEncoderDecoder: TLayout;
    btnBase64ImageEncoderDecoder: TRectangle;
    imgBase64ImageEncoderDecoder: TSkSvg;
    lblBase64ImageEncoderDecoder: TLabel;
    layNavURLEncoderDecoder: TLayout;
    btnURLEncoderDecoder: TRectangle;
    imgURLEncoderDecoder: TSkSvg;
    lblURLEncoderDecoder: TLabel;
    layNavGZipCompressDecompress: TLayout;
    btnGZipCompressDecompress: TRectangle;
    imgGZipCompressDecompress: TSkSvg;
    lblGZipCompressDecompress: TLabel;
    layNavGraphics: TLayout;
    layNavGraphicsExpandCollapse: TLayout;
    btnGraphicsExpandCollapse: TRectangle;
    imgGraphicsExpandCollapse: TSkSvg;
    lblGraphicsExpandCollapse: TLabel;
    imgGraphicsExpandCollapseIcon: TSkSvg;
    layNavColorPicker: TLayout;
    btnColorPicker: TRectangle;
    imgColorPicker: TSkSvg;
    lblColorPicker: TLabel;
    layNavColorBlindnessSimulator: TLayout;
    btnColorBlindnessSimulator: TRectangle;
    imgColorBlindnessSimulator: TSkSvg;
    lblColorBlindnessSimulator: TLabel;
    layNavImageConverter: TLayout;
    btnImageConverter: TRectangle;
    imgImageConverter: TSkSvg;
    lblImageConverter: TLabel;
    layNavPNGJPEGCompressor: TLayout;
    btnPNGJPEGCompressor: TRectangle;
    imgPNGJPEGCompressor: TSkSvg;
    lblPNGJPEGCompressor: TLabel;
    layNavText: TLayout;
    layNavTextExpandCollapse: TLayout;
    btnTextExpandCollapse: TRectangle;
    imgTextExpandCollapse: TSkSvg;
    lblTextExpandCollapse: TLabel;
    imgTextExpandCollapseIcon: TSkSvg;
    layNavTextCaseConverterInspector: TLayout;
    btnTextCaseConverterInspector: TRectangle;
    imgTextCaseConverterInspector: TSkSvg;
    lblTextCaseConverterInspector: TLabel;
    layNavTextEscapeUnescape: TLayout;
    btnTextEscapeUnescape: TRectangle;
    imgTextEscapeUnescape: TSkSvg;
    lblTextEscapeUnescape: TLabel;
    layNavMarkdownPreview: TLayout;
    btnMarkdownPreview: TRectangle;
    imgMarkdownPreview: TSkSvg;
    lblMarkdownPreview: TLabel;
    layNavTextDifference: TLayout;
    btnTextDifference: TRectangle;
    imgTextDifference: TSkSvg;
    lblTextDifference: TLabel;
    layNavRegexTester: TLayout;
    btnRegexTester: TRectangle;
    imgRegexTester: TSkSvg;
    lblRegexTester: TLabel;
    layNavSettings: TLayout;
    btnSettings: TRectangle;
    imgSettings: TSkSvg;
    lblSettings: TLabel;
    layNavConverters: TLayout;
    layNavConvertersExpandCollapse: TLayout;
    btnConvertersExpandCollapse: TRectangle;
    imgConvertersExpandCollapse: TSkSvg;
    lblConvertersExpandCollapse: TLabel;
    imgConvertersExpandCollapseIcon: TSkSvg;
    layNavJsonYamlConverter: TLayout;
    btnJsonYamlConverter: TRectangle;
    imgJsonYamlConverter: TSkSvg;
    lblJsonYamlConverter: TLabel;
    layNavNumberBaseConverter: TLayout;
    btnNumberBaseConverter: TRectangle;
    imgNumberBaseConverter: TSkSvg;
    lblNumberBaseConverter: TLabel;
    layNavTimestampConverter: TLayout;
    btnTimestampConverter: TRectangle;
    imgTimestampConverter: TSkSvg;
    lblTimestampConverter: TLabel;
    layNavFormatters: TLayout;
    layNavFormattersExpandCollapse: TLayout;
    btnFormattersExpandCollapse: TRectangle;
    imgFormattersExpandCollapse: TSkSvg;
    Formatters: TLabel;
    imgFormattersExpandCollapseIcon: TSkSvg;
    layNavXMLFormatter: TLayout;
    btnXMLFormatter: TRectangle;
    imgXMLFormatter: TSkSvg;
    lblXMLFormatter: TLabel;
    layNavHTMLFormatter: TLayout;
    btnHTMLFormatter: TRectangle;
    imgHTMLFormatter: TSkSvg;
    lblHTMLFormatter: TLabel;
    layNavCSSFormatter: TLayout;
    btnCSSFormatter: TRectangle;
    imgCSSFormatter: TSkSvg;
    lblCSSFormatter: TLabel;
    layNavJavaScriptFormatter: TLayout;
    btnJavaScriptFormatter: TRectangle;
    imgJavaScriptFormatter: TSkSvg;
    lblJavaScriptFormatter: TLabel;
    layNavSQLFormatter: TLayout;
    btnSQLFormatter: TRectangle;
    imgSQLFormatter: TSkSvg;
    lblSQLFormatter: TLabel;
    layNavPHPFormatter: TLayout;
    btnPHPFormatter: TRectangle;
    imgPHPFormatter: TSkSvg;
    lblPHPFormatter: TLabel;
    layNavJsonFormatter: TLayout;
    btnJsonFormatter: TRectangle;
    imgJsonFormatter: TSkSvg;
    lblJsonFormatter: TLabel;
    SplitterNavContent: TSplitter;
    btnToolHelp: TButton;
    laySettings: TScrollBox;
    layFontFamily: TRectangle;
    cbFontFamily: TComboBox;
    imgFontFamily: TSkSvg;
    layFontFamilyTitleDescription: TLayout;
    lblFontFamilyTitle: TLabel;
    lblFontFamilyDescription: TLabel;
    layLanguage: TRectangle;
    cbLanguage: TComboBox;
    imgLanguage: TSkSvg;
    layLanguageTitleDescription: TLayout;
    lblLanguageTitle: TLabel;
    lblLanguageDescription: TLabel;
    layLineNumbers: TRectangle;
    imgLineNumbers: TSkSvg;
    layLineNumbersTitleDescription: TLayout;
    lblLineNumbersTitle: TLabel;
    lblLineNumbersDescription: TLabel;
    SwitchLineNumbers: TSwitch;
    lblSwitchLineNumbers: TLabel;
    layTheme: TRectangle;
    cbTheme: TComboBox;
    imgTheme: TSkSvg;
    layThemeTitleDescription: TLayout;
    lblThemeTitle: TLabel;
    lblThemeDescription: TLabel;
    layWordWrap: TRectangle;
    imgWordWrap: TSkSvg;
    layWordWrapTitleDescription: TLayout;
    lblWordWrapTitle: TLabel;
    lblWordWrapDescription: TLabel;
    SwitchWordWrap: TSwitch;
    lblSwitchWordWrap: TLabel;
    lblTopSettings: TLabel;
    layAppInfo: TRectangle;
    imgAppInfo: TImage;
    layAppInfoTitleDescription: TLayout;
    lblAppInfoTitle: TLabel;
    lblAppInfoDescription: TLabel;
    btnAppInfoCopyToClipboard: TButton;
    imgAppInfoCopyToClipboard: TSkSvg;
    Rectangle1: TRectangle;
    Layout3: TLayout;
    Image1: TSkSvg;
    Label1: TLabel;
    Layout1: TLayout;
    Label2: TLabel;
    Image2: TSkSvg;
    Layout4: TLayout;
    Label3: TLabel;
    Image3: TSkSvg;
    Layout5: TLayout;
    Label4: TLabel;
    Image5: TSkSvg;
    Button14: TButton;
    imgToolHelp: TSkSvg;
    layAllToolsHidden: TLayout;
    procedure btnAllToolsMouseEnter(Sender: TObject);
    procedure btnAllToolsMouseLeave(Sender: TObject);
    procedure btnAllToolsClick(Sender: TObject);
    procedure btnHamburgerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExpandCollapseNavItem(Sender: TObject);
    procedure btnToolHelpClick(Sender: TObject);
    procedure cbThemeChange(Sender: TObject);
    procedure SwitchWordWrapSwitch(Sender: TObject);
    procedure SwitchLineNumbersSwitch(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    HamburgerMenuWidth: Single;
    procedure SelectTool(ToolLayoutName: String);
    function GetAppInfo(): String;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.btnHamburgerClick(Sender: TObject);
begin
  if (MultiView.Width <> 50) then HamburgerMenuWidth := MultiView.Width;
  if (MultiView.Width = 50) then MultiView.Width := HamburgerMenuWidth else MultiView.Width := 50;
end;

procedure TfrmMain.btnToolHelpClick(Sender: TObject);
begin
  var ToolName := TButton(Sender).ParentControl.Name;

  if ToolName = 'Home' then
    ShowMessage('Roselt Developer Tools Boi 😎😎😎');

  if ToolName = 'JSON <> YAML' then
    ShowMessage('Convert JSON to YAML and vice versa');

  if ToolName = 'Color Picker' then
    ShowMessage('Select a Color and get the Color Code');
end;

procedure TfrmMain.cbThemeChange(Sender: TObject);
begin
  if cbTheme.ItemIndex > -1 then
    StyleBook := TStyleBook(cbTheme.ListItems[cbTheme.ItemIndex].Data);
end;

procedure TfrmMain.ExpandCollapseNavItem(Sender: TObject);
begin
  var Button := TRectangle(Sender);
  var ButtonLayout := Button.ParentControl;
  var ExpandCollapseLayout := ButtonLayout.ParentControl;
  var ExpandCollapseImage := TSkSvg(Button.Children.Items[2]);

  if (ExpandCollapseLayout.Height = ButtonLayout.Height) then
  begin
    ExpandCollapseLayout.Height := ButtonLayout.Height * ExpandCollapseLayout.ChildrenCount;
    ExpandCollapseImage.Svg.Source := GetBootstrapIcon('chevron-up');

    for var I := 0 to ExpandCollapseLayout.ChildrenCount-1 do
      if ExpandCollapseLayout.Children.Items[I].Name <> ButtonLayout.Name then
        TControl(ExpandCollapseLayout.Children.Items[I]).Visible := True;
  end else
  begin
    ExpandCollapseLayout.Height := ButtonLayout.Height;
    ExpandCollapseImage.Svg.Source := GetBootstrapIcon('chevron-down');

    for var I := 0 to ExpandCollapseLayout.ChildrenCount-1 do
      if ExpandCollapseLayout.Children.Items[I].Name <> ButtonLayout.Name then
        TControl(ExpandCollapseLayout.Children.Items[I]).Visible := False;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
  procedure CreateToolFrame(ToolFrame: TFrame; FrameName: String);
  begin
    ToolFrame.Name := FrameName;
    ToolFrame.Visible := False;
    ToolFrame.Parent := LayoutContainer;
    ToolFrame.Align := TAlignLayout.Client;
  end;
begin
  btnAllTools.OnClick(btnAllTools);
  HamburgerMenuWidth := 400; // Default Hamburger Menu Width
  SplitterNavContent.Position.X := HamburgerMenuWidth * 2; // Make sure Splitter is in the correct place
  lblAppInfoDescription.Text := GetAppInfo;


  // Set Which Tool Frames to Create
  var Tool_PHPFormatter := True;
  var Tool_CSSFormatter := True;
  var Tool_HTMLFormatter := True;
  var Tool_JsonFormatter := True;
  var Tool_SQLFormatter := True;
  var Tool_XMLFormatter := True;
  var Tool_JavaScriptFormatter := True;
  var Tool_NumberBaseConverter := True;
  var Tool_NameGenerator := True;
  var Tool_UUIDGenerator := True;
  var Tool_HashGenerator := True;
  var Tool_TimestampConverter := False;
  var Tool_Base64EncoderDecoder := True;
  var Tool_Base64ImageEncoderDecoder := True;
  var Tool_ColorPicker := True;
  var Tool_GZipCompressDecompress := True;
  var Tool_HTMLEncoderDecoder := True;
  var Tool_JsonYamlConverter := True;
  var Tool_JWTDecoder := True;
  var Tool_LoremIpsumGenerator := True;
  var Tool_TextCaseConverterInspector := True;
  var Tool_URLEncoderDecoder := True;
  var Tool_TextEscapeUnescape := True;
  var Tool_MarkdownPreview := True;
  var Tool_RegexTester := True;


  // Dynamically create Tool Frames
  if (Tool_PHPFormatter) then CreateToolFrame(TFrame_PHPFormatter.Create(Self),'layPHPFormatter');
  if (Tool_CSSFormatter) then CreateToolFrame(TFrame_CSSFormatter.Create(Self),'layCSSFormatter');
  if (Tool_HTMLFormatter) then CreateToolFrame(TFrame_HTMLFormatter.Create(Self),'layHTMLFormatter');
  if (Tool_JsonFormatter) then CreateToolFrame(TFrame_JsonFormatter.Create(Self),'layJsonFormatter');
  if (Tool_SQLFormatter) then CreateToolFrame(TFrame_SQLFormatter.Create(Self),'laySQLFormatter');
  if (Tool_XMLFormatter) then CreateToolFrame(TFrame_XMLFormatter.Create(Self),'layXMLFormatter');
  if (Tool_JavaScriptFormatter) then CreateToolFrame(TFrame_JavaScriptFormatter.Create(Self),'layJavaScriptFormatter');
  if (Tool_NumberBaseConverter) then CreateToolFrame(TFrame_NumberBaseConverter.Create(Self),'layNumberBaseConverter');
  if (Tool_NameGenerator) then CreateToolFrame(TFrame_NameGenerator.Create(Self),'layNameGenerator');
  if (Tool_UUIDGenerator) then CreateToolFrame(TFrame_UUIDGenerator.Create(Self),'layUUIDGenerator');
  if (Tool_HashGenerator) then CreateToolFrame(TFrame_HashGenerator.Create(Self),'layHashGenerator');
  if (Tool_TimestampConverter) then CreateToolFrame(TFrame_TimestampConverter.Create(Self),'layTimestampConverter');
  if (Tool_Base64EncoderDecoder) then CreateToolFrame(TFrame_Base64TextEncoderDecoder.Create(Self),'layBase64EncoderDecoder');
  if (Tool_Base64ImageEncoderDecoder) then CreateToolFrame(TFrame_Base64ImageEncoderDecoder.Create(Self),'layBase64ImageEncoderDecoder');
  if (Tool_ColorPicker) then CreateToolFrame(TFrame_ColorPicker.Create(Self),'layColorPicker');
  if (Tool_GZipCompressDecompress) then CreateToolFrame(TFrame_GZipCompressDecompress.Create(Self),'layGZipCompressDecompress');
  if (Tool_HTMLEncoderDecoder) then CreateToolFrame(TFrame_HTMLEncoderDecoder.Create(Self),'layHTMLEncoderDecoder');
  if (Tool_JsonYamlConverter) then CreateToolFrame(TFrame_JsonYamlConverter.Create(Self),'layJsonYamlConverter');
  if (Tool_JWTDecoder) then CreateToolFrame(TFrame_JWTDecoder.Create(Self),'layJWTDecoder');
  if (Tool_LoremIpsumGenerator) then CreateToolFrame(TFrame_LoremIpsumGenerator.Create(Self),'layLoremIpsumGenerator');
  if (Tool_TextCaseConverterInspector) then CreateToolFrame(TFrame_TextCaseConverterInspector.Create(Self),'layTextCaseConverterInspector');
  if (Tool_URLEncoderDecoder) then CreateToolFrame(TFrame_URLEncoderDecoder.Create(Self),'layURLEncoderDecoder');
  if (Tool_TextEscapeUnescape) then CreateToolFrame(TFrame_TextEscapeUnescape.Create(Self),'layTextEscapeUnescape');
  if (Tool_MarkdownPreview) then CreateToolFrame(TFrame_MarkdownPreview.Create(Self),'layMarkdownPreview');
  if (Tool_RegexTester) then CreateToolFrame(TFrame_RegexTester.Create(Self),'layRegexTester');


  // Collapse Nav Items
  ExpandCollapseNavItem(btnConvertersExpandCollapse);
  ExpandCollapseNavItem(btnEncodersDecodersExpandCollapse);
  ExpandCollapseNavItem(btnFormattersExpandCollapse);
  ExpandCollapseNavItem(btnTextExpandCollapse);
  ExpandCollapseNavItem(btnGeneratorsExpandCollapse);
  ExpandCollapseNavItem(btnGraphicsExpandCollapse);


  // Load Themes (Settings)
  cbTheme.Items.Clear;
  for var c in dmStyles do
    if c is TStyleBook then
    begin
      var Index := cbTheme.Items.Add(TStyleBook(c).StyleName);
      cbTheme.ListItems[Index].Data := TStyleBook(c);
    end;
  cbTheme.ItemIndex := 0;


  // Load Font Family (Settings)
  // Might not work if there isn't a printer. Need to test.
  // Probably isn't cross-platform either. Need to test.
  Printer.ActivePrinter;
  cbFontFamily.Items := Printer.Fonts;
  cbFontFamily.ItemIndex := 0;
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  layAllToolsGrid.Height := Round(layAllToolsGrid.ChildrenCount / (layAllToolsGrid.Width / layAllToolsGrid.ItemWidth)+1) * layAllToolsGrid.ItemHeight;  // Need to improve/change this in the future
end;

function TfrmMain.GetAppInfo: String;
// Need to get all of the App Info dynamically in the future
begin
  var Version := 'Version 1.0.0.0';
  var Architecture := 'X64';
  var BuildType := 'RELEASE';
  {$IFDEF DEBUG}
    BuildType := 'DEBUG';
  {$ENDIF}
  var CompiledDate := Date.ToString;

  Result := Version + ' | ' + Architecture + ' | ' + BuildType + ' | ' + CompiledDate;
end;

procedure TfrmMain.SelectTool(ToolLayoutName: String);
begin
  for var I := 0 to LayoutContainer.Children.Count-1 do // Loop through all tools and hide them
    TControl(LayoutContainer.Children.Items[I]).Visible := False;

  var cmpToolLayoutName := FindComponent(ToolLayoutName); // Find the selected tool
  if (cmpToolLayoutName <> nil) then
  begin
    TControl(cmpToolLayoutName).Visible := True; // Show the selected tool
    if (cmpToolLayoutName is TFrame) then // Check if the tool is a Frame
    begin
      var OnResizeEvent := TNotifyEvent(TFrame(cmpToolLayoutName).OnResize);
      var NilEvent := TNotifyEvent(nil);
      if (TMethod(OnResizeEvent) <> TMethod(NilEvent)) then
        TFrame(cmpToolLayoutName).OnResize(nil); // Call onResize Event if it's a Frame
    end;
  end else ShowMessage('This tool is not available');
end;

procedure TfrmMain.SwitchLineNumbersSwitch(Sender: TObject);
begin
  if (lblSwitchLineNumbers.Text = 'On') then
  begin
    lblSwitchLineNumbers.Text := 'Off';
    SwitchLineNumbers.IsChecked := True;
  end else
  begin
    lblSwitchLineNumbers.Text := 'On';
    SwitchLineNumbers.IsChecked := False;
  end;
end;

procedure TfrmMain.SwitchWordWrapSwitch(Sender: TObject);
begin
  if (lblSwitchWordWrap.Text = 'On') then
  begin
    lblSwitchWordWrap.Text := 'Off';
    SwitchWordWrap.IsChecked := True;
  end else
  begin
    lblSwitchWordWrap.Text := 'On';
    SwitchWordWrap.IsChecked := False;
  end;
end;

procedure TfrmMain.btnAllToolsClick(Sender: TObject);
begin
  var ToolNavItem := TLabel(TRectangle(Sender).Children.Items[1]);
  lblNavTitle.Text := ToolNavItem.Text;
  SelectTool('lay'+String(ToolNavItem.Name).Replace('lbl',''));
end;

procedure TfrmMain.btnAllToolsMouseEnter(Sender: TObject);
begin
  TRectangle(Sender).Fill.Kind := TBrushKind.Solid;
  TRectangle(Sender).Fill.Color := $FF2B2B2B;
end;

procedure TfrmMain.btnAllToolsMouseLeave(Sender: TObject);
begin
  TRectangle(Sender).Fill.Kind := TBrushKind.None;
end;


end.
