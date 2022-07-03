{ TODO: Finish everything 😂 }
unit uMain;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
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
  uAssets,

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
  uFrame_NameGenerator;

type
  TfrmMain = class(TForm)
    MultiView: TMultiView;
    TopBar: TRectangle;
    lblNavTitle: TLabel;
    btnHamburger: TButton;
    layAllTools: TLayout;
    layNavAllTools: TLayout;
    imgAllTools: TImage;
    lblAllTools: TLabel;
    btnAllTools: TRectangle;
    FloatAnimation1: TFloatAnimation;
    LayoutContainer: TLayout;
    GridLayout1: TGridLayout;
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
    Image36: TImage;
    lblTesting: TLabel;
    layTesting: TLayout;
    Label41: TLabel;
    memTesting: TMemo;
    layNavGenerators: TLayout;
    layNavGeneratorsExpandCollapse: TLayout;
    btnGeneratorsExpandCollapse: TRectangle;
    imgGeneratorsExpandCollapse: TImage;
    lblGeneratorsExpandCollapse: TLabel;
    imgGeneratorsExpandCollapseIcon: TImage;
    layNavUUIDGenerator: TLayout;
    btnUUIDGenerator: TRectangle;
    imgUUIDGenerator: TImage;
    lblUUIDGenerator: TLabel;
    layNavHashGenerator: TLayout;
    btnHashGenerator: TRectangle;
    imgHashGenerator: TImage;
    lblHashGenerator: TLabel;
    layNavLoremIpsumGenerator: TLayout;
    btnLoremIpsumGenerator: TRectangle;
    imgLoremIpsumGenerator: TImage;
    lblLoremIpsumGenerator: TLabel;
    layNavNameGenerator: TLayout;
    btnNameGenerator: TRectangle;
    imgNameGenerator: TImage;
    lblNameGenerator: TLabel;
    layNavEncodersDecoders: TLayout;
    layNavEncodersDecodersExpandCollapse: TLayout;
    btnEncodersDecodersExpandCollapse: TRectangle;
    imgEncodersDecodersExpandCollapse: TImage;
    lblEncodersDecodersExpandCollapse: TLabel;
    imgEncodersDecodersExpandCollapseIcon: TImage;
    layNavBase64EncoderDecoder: TLayout;
    btnBase64EncoderDecoder: TRectangle;
    imgBase64EncoderDecoder: TImage;
    lblBase64EncoderDecoder: TLabel;
    layNavHTMLEncoderDecoder: TLayout;
    btnHTMLEncoderDecoder: TRectangle;
    imgHTMLEncoderDecoder: TImage;
    lblHTMLEncoderDecoder: TLabel;
    layNavJWTDecoder: TLayout;
    btnJWTDecoder: TRectangle;
    imgJWTDecoder: TImage;
    lblJWTDecoder: TLabel;
    layNavBase64ImageEncoderDecoder: TLayout;
    btnBase64ImageEncoderDecoder: TRectangle;
    imgBase64ImageEncoderDecoder: TImage;
    lblBase64ImageEncoderDecoder: TLabel;
    layNavURLEncoderDecoder: TLayout;
    btnURLEncoderDecoder: TRectangle;
    imgURLEncoderDecoder: TImage;
    lblURLEncoderDecoder: TLabel;
    layNavGZipCompressDecompress: TLayout;
    btnGZipCompressDecompress: TRectangle;
    imgGZipCompressDecompress: TImage;
    lblGZipCompressDecompress: TLabel;
    layNavGraphics: TLayout;
    layNavGraphicsExpandCollapse: TLayout;
    btnGraphicsExpandCollapse: TRectangle;
    imgGraphicsExpandCollapse: TImage;
    lblGraphicsExpandCollapse: TLabel;
    imgGraphicsExpandCollapseIcon: TImage;
    layNavColorPicker: TLayout;
    btnColorPicker: TRectangle;
    Image16: TImage;
    lblColorPicker: TLabel;
    layNavColorBlindnessSimulator: TLayout;
    btnColorBlindnessSimulator: TRectangle;
    imgColorBlindnessSimulator: TImage;
    lblColorBlindnessSimulator: TLabel;
    layNavImageConverter: TLayout;
    btnImageConverter: TRectangle;
    imgImageConverter: TImage;
    lblImageConverter: TLabel;
    layNavPNGJPEGCompressor: TLayout;
    btnPNGJPEGCompressor: TRectangle;
    imgPNGJPEGCompressor: TImage;
    lblPNGJPEGCompressor: TLabel;
    layNavText: TLayout;
    layNavTextExpandCollapse: TLayout;
    btnTextExpandCollapse: TRectangle;
    imgTextExpandCollapse: TImage;
    lblTextExpandCollapse: TLabel;
    imgTextExpandCollapseIcon: TImage;
    layNavTextCaseConverterInspector: TLayout;
    btnTextCaseConverterInspector: TRectangle;
    imgTextCaseConverterInspector: TImage;
    lblTextCaseConverterInspector: TLabel;
    layNavTextEscapeUnescape: TLayout;
    btnTextEscapeUnescape: TRectangle;
    imgTextEscapeUnescape: TImage;
    lblTextEscapeUnescape: TLabel;
    layNavMarkdownPreview: TLayout;
    btnMarkdownPreview: TRectangle;
    imgMarkdownPreview: TImage;
    lblMarkdownPreview: TLabel;
    layNavTextDifference: TLayout;
    btnTextDifference: TRectangle;
    imgTextDifference: TImage;
    lblTextDifference: TLabel;
    layNavRegexTester: TLayout;
    btnRegexTester: TRectangle;
    imgRegexTester: TImage;
    lblRegexTester: TLabel;
    layNavSettings: TLayout;
    btnSettings: TRectangle;
    imgSettings: TImage;
    lblSettings: TLabel;
    layNavConverters: TLayout;
    layNavConvertersExpandCollapse: TLayout;
    btnConvertersExpandCollapse: TRectangle;
    imgConvertersExpandCollapse: TImage;
    lblConvertersExpandCollapse: TLabel;
    imgConvertersExpandCollapseIcon: TImage;
    layNavJsonYamlConverter: TLayout;
    btnJsonYamlConverter: TRectangle;
    imgJsonYamlConverter: TImage;
    lblJsonYamlConverter: TLabel;
    layNavNumberBaseConverter: TLayout;
    btnNumberBaseConverter: TRectangle;
    imgNumberBaseConverter: TImage;
    lblNumberBaseConverter: TLabel;
    layNavTimestampConverter: TLayout;
    btnTimestampConverter: TRectangle;
    imgTimestampConverter: TImage;
    lblTimestampConverter: TLabel;
    layNavFormatters: TLayout;
    layNavFormattersExpandCollapse: TLayout;
    btnFormattersExpandCollapse: TRectangle;
    imgFormattersExpandCollapse: TImage;
    Formatters: TLabel;
    imgFormattersExpandCollapseIcon: TImage;
    layNavXMLFormatter: TLayout;
    btnXMLFormatter: TRectangle;
    imgXMLFormatter: TImage;
    lblXMLFormatter: TLabel;
    layNavHTMLFormatter: TLayout;
    btnHTMLFormatter: TRectangle;
    imgHTMLFormatter: TImage;
    lblHTMLFormatter: TLabel;
    layNavCSSFormatter: TLayout;
    btnCSSFormatter: TRectangle;
    imgCSSFormatter: TImage;
    lblCSSFormatter: TLabel;
    layNavJavaScriptFormatter: TLayout;
    btnJavaScriptFormatter: TRectangle;
    imgJavaScriptFormatter: TImage;
    lblJavaScriptFormatter: TLabel;
    layNavSQLFormatter: TLayout;
    btnSQLFormatter: TRectangle;
    imgSQLFormatter: TImage;
    lblSQLFormatter: TLabel;
    layNavPHPFormatter: TLayout;
    btnPHPFormatter: TRectangle;
    imgPHPFormatter: TImage;
    lblPHPFormatter: TLabel;
    layNavJsonFormatter: TLayout;
    btnJsonFormatter: TRectangle;
    imgJsonFormatter: TImage;
    lblJsonFormatter: TLabel;
    SplitterNavContent: TSplitter;
    btnToolHelp: TButton;
    ImageList1: TImageList;
    laySettings: TScrollBox;
    layFontFamily: TRectangle;
    cbFontFamily: TComboBox;
    imgFontFamily: TImage;
    layFontFamilyTitleDescription: TLayout;
    lblFontFamilyTitle: TLabel;
    lblFontFamilyDescription: TLabel;
    layLanguage: TRectangle;
    cbLanguage: TComboBox;
    imgLanguage: TImage;
    layLanguageTitleDescription: TLayout;
    lblLanguageTitle: TLabel;
    lblLanguageDescription: TLabel;
    layLineNumbers: TRectangle;
    imgLineNumbers: TImage;
    layLineNumbersTitleDescription: TLayout;
    lblLineNumbersTitle: TLabel;
    lblLineNumbersDescription: TLabel;
    SwitchLineNumbers: TSwitch;
    lblSwitchLineNumbers: TLabel;
    layTheme: TRectangle;
    cbTheme: TComboBox;
    imgTheme: TImage;
    layThemeTitleDescription: TLayout;
    lblThemeTitle: TLabel;
    lblThemeDescription: TLabel;
    layWordWrap: TRectangle;
    imgWordWrap: TImage;
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
    imgAppInfoCopyToClipboard: TImage;
    Rectangle1: TRectangle;
    Layout3: TLayout;
    Image1: TImage;
    Label1: TLabel;
    Layout1: TLayout;
    Label2: TLabel;
    Image2: TImage;
    Layout4: TLayout;
    Label3: TLabel;
    Image3: TImage;
    Layout5: TLayout;
    Label4: TLabel;
    Image5: TImage;
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
  var ExpandCollapseImage := TImage(Button.Children.Items[2]);

  if (ExpandCollapseLayout.Height = ButtonLayout.Height) then
  begin
    ExpandCollapseLayout.Height := ButtonLayout.Height * ExpandCollapseLayout.ChildrenCount;
    ExpandCollapseImage.Bitmap := ImageList1.Source[1].MultiResBitmap[0].Bitmap;

    for var I := 0 to ExpandCollapseLayout.ChildrenCount-1 do
      if ExpandCollapseLayout.Children.Items[I].Name <> ButtonLayout.Name then
        TControl(ExpandCollapseLayout.Children.Items[I]).Visible := True;
  end else
  begin
    ExpandCollapseLayout.Height := ButtonLayout.Height;
    ExpandCollapseImage.Bitmap := ImageList1.Source[0].MultiResBitmap[0].Bitmap;

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
  lblAppInfoDescription.Text := GetAppInfo;


  // Dynamically create Tool Frames
  CreateToolFrame(TFrame_PHPFormatter.Create(Self),'layPHPFormatter');
  CreateToolFrame(TFrame_CSSFormatter.Create(Self),'layCSSFormatter');
  CreateToolFrame(TFrame_HTMLFormatter.Create(Self),'layHTMLFormatter');
  CreateToolFrame(TFrame_JsonFormatter.Create(Self),'layJsonFormatter');
  CreateToolFrame(TFrame_SQLFormatter.Create(Self),'laySQLFormatter');
  CreateToolFrame(TFrame_XMLFormatter.Create(Self),'layXMLFormatter');
  CreateToolFrame(TFrame_JavaScriptFormatter.Create(Self),'layJavaScriptFormatter');
  CreateToolFrame(TFrame_NumberBaseConverter.Create(Self),'layNumberBaseConverter');
  CreateToolFrame(TFrame_NameGenerator.Create(Self),'layNameGenerator');
  CreateToolFrame(TFrame_UUIDGenerator.Create(Self),'layUUIDGenerator');
  CreateToolFrame(TFrame_HashGenerator.Create(Self),'layHashGenerator');
  CreateToolFrame(TFrame_TimestampConverter.Create(Self),'layTimestampConverter');
  CreateToolFrame(TFrame_Base64TextEncoderDecoder.Create(Self),'layBase64EncoderDecoder');
  CreateToolFrame(TFrame_Base64ImageEncoderDecoder.Create(Self),'layBase64ImageEncoderDecoder');
  CreateToolFrame(TFrame_ColorPicker.Create(Self),'layColorPicker');
  CreateToolFrame(TFrame_GZipCompressDecompress.Create(Self),'layGZipCompressDecompress');
  CreateToolFrame(TFrame_HTMLEncoderDecoder.Create(Self),'layHTMLEncoderDecoder');
  CreateToolFrame(TFrame_JsonYamlConverter.Create(Self),'layJsonYamlConverter');
  CreateToolFrame(TFrame_JWTDecoder.Create(Self),'layJWTDecoder');
  CreateToolFrame(TFrame_LoremIpsumGenerator.Create(Self),'layLoremIpsumGenerator');
  CreateToolFrame(TFrame_TextCaseConverterInspector.Create(Self),'layTextCaseConverterInspector');
  CreateToolFrame(TFrame_URLEncoderDecoder.Create(Self),'layURLEncoderDecoder');
  CreateToolFrame(TFrame_TextEscapeUnescape.Create(Self),'layTextEscapeUnescape');
  CreateToolFrame(TFrame_MarkdownPreview.Create(Self),'layMarkdownPreview');
  CreateToolFrame(TFrame_RegexTester.Create(Self),'layRegexTester');


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
  for var I := 0 to LayoutContainer.Children.Count-1 do
    TControl(LayoutContainer.Children.Items[I]).Visible := False;

  TControl(FindComponent(ToolLayoutName)).Visible := True;
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
