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
    layNavChecksumGenerator: TLayout;
    btnChecksumGenerator: TRectangle;
    imgChecksumGenerator: TImage;
    lblChecksumGenerator: TLabel;
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
    Layout2: TLayout;
    Rectangle5: TRectangle;
    Image4: TImage;
    Label38: TLabel;
    Layout9: TLayout;
    Rectangle6: TRectangle;
    Image7: TImage;
    Label39: TLabel;
    Layout27: TLayout;
    Rectangle7: TRectangle;
    Image8: TImage;
    Label40: TLabel;
    Layout28: TLayout;
    Rectangle8: TRectangle;
    Image21: TImage;
    Label42: TLabel;
    layNavSettings: TLayout;
    btnSettings: TRectangle;
    imgSettings: TImage;
    lblSettings: TLabel;
    laySettings: TLayout;
    Label13: TLabel;
    imgAboutLogo: TImage;
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
    layBase64EncoderDecoder: TFrame_Base64TextEncoderDecoder;
    layJsonYamlConverter: TFrame_JsonYamlConverter;
    layHashGenerator: TFrame_HashGenerator;
    layHTMLEncoderDecoder: TFrame_HTMLEncoderDecoder;
    layJsonFormatter: TFrame_JsonFormatter;
    layLoremIpsumGenerator: TFrame_LoremIpsumGenerator;
    layTextCaseConverterInspector: TFrame_TextCaseConverterInspector;
    layColorPicker: TFrame_ColorPicker;
    SplitterNavContent: TSplitter;
    btnToolHelp: TButton;
    layTimestampConverter: TFrame_TimestampConverter;
    layNumberBaseConverter: TFrame_NumberBaseConverter;
    layURLEncoderDecoder: TFrame_URLEncoderDecoder;
    layGZipCompressDecompress: TFrame_GZipCompressDecompress;
    layJWTDecoder: TFrame_JWTDecoder;
    layBase64ImageEncoderDecoder: TFrame_Base64ImageEncoderDecoder;
    laySQLFormatter: TFrame_SQLFormatter;
    layHTMLFormatter: TFrame_HTMLFormatter;
    layCSSFormatter: TFrame_CSSFormatter;
    layPHPFormatter: TFrame_PHPFormatter;
    layXMLFormatter: TFrame_XMLFormatter;
    layJavaScriptFormatter: TFrame_JavaScriptFormatter;
    layUUIDGenerator: TFrame_UUIDGenerator;
    layNameGenerator: TFrame_NameGenerator;
    layTheme: TRectangle;
    cbTheme: TComboBox;
    imgTheme: TImage;
    layThemeTitleDescription: TLayout;
    lblThemeTitle: TLabel;
    lblThemeDescription: TLabel;
    ImageList1: TImageList;
    procedure btnAllToolsMouseEnter(Sender: TObject);
    procedure btnAllToolsMouseLeave(Sender: TObject);
    procedure btnAllToolsClick(Sender: TObject);
    procedure btnHamburgerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExpandCollapseNavItem(Sender: TObject);
    procedure btnToolHelpClick(Sender: TObject);
    procedure cbThemeChange(Sender: TObject);
  private
    { Private declarations }
    HamburgerMenuWidth: Single;
    procedure SelectTool(ToolLayoutName: String);
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
begin
  btnAllTools.OnClick(btnAllTools);
  HamburgerMenuWidth := 400; // Default Hamburger Menu Width

  // Collapse Nav Items
  ExpandCollapseNavItem(btnConvertersExpandCollapse);
  ExpandCollapseNavItem(btnEncodersDecodersExpandCollapse);
  ExpandCollapseNavItem(btnFormattersExpandCollapse);
  ExpandCollapseNavItem(btnTextExpandCollapse);
  ExpandCollapseNavItem(btnGeneratorsExpandCollapse);
  ExpandCollapseNavItem(btnGraphicsExpandCollapse);

  cbTheme.Items.Clear;
  for var c in dmStyles do
    if c is TStyleBook then
    begin
      var Index := cbTheme.Items.Add(TStyleBook(c).StyleName);
      cbTheme.ListItems[Index].Data := TStyleBook(c);
    end;
end;

procedure TfrmMain.SelectTool(ToolLayoutName: String);
begin
  for var I := 0 to LayoutContainer.Children.Count-1 do
    TControl(LayoutContainer.Children.Items[I]).Visible := False;

  TControl(FindComponent(ToolLayoutName)).Visible := True;
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
