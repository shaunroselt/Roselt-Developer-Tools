{ TODO: Finish everything 😂 }
unit uMain;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.UIConsts,
  System.Classes,
  System.Variants,
  System.Generics.Collections,
  System.NetEncoding,
  System.Math,
  System.ImageList,
  System.Hash,
  System.JSON,

  REST.Json,

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
  FMX.Colors,
  FMX.SearchBox,
  FMX.TabControl,
  FMX.EditBox,
  FMX.SpinBox,

  uStyles,
  Roselt.ColorConversion,
  Roselt.LoremIpsum,
  Roselt.NameGenerator;

type
  TfrmMain = class(TForm)
    MultiView: TMultiView;
    TopBar: TRectangle;
    lblNavTitle: TLabel;
    btnHamburger: TButton;
    layAllTools: TLayout;
    ImageList1: TImageList;
    layNavAllTools: TLayout;
    Image1: TImage;
    lblAllTools: TLabel;
    btnAllTools: TRectangle;
    FloatAnimation1: TFloatAnimation;
    layBase64EncoderDecoder: TLayout;
    layHashGenerator: TLayout;
    layHTMLEncoderDecoder: TLayout;
    LayoutContainer: TLayout;
    layJWTDecoder: TLayout;
    Label4: TLabel;
    layJsonFormatter: TLayout;
    layJsonYamlConverter: TLayout;
    Label9: TLabel;
    layTextCaseConverterInspector: TLayout;
    layBase64EncoderDecoderTop: TLayout;
    lblBase64EncoderDecoderConfiguration: TLabel;
    layBase64EncoderDecoderInputOutput: TLayout;
    Rectangle1: TRectangle;
    Image9: TImage;
    Layout3: TLayout;
    Label6: TLabel;
    Label8: TLabel;
    Rectangle2: TRectangle;
    Image10: TImage;
    cbEncodingType: TComboBox;
    Layout4: TLayout;
    Label11: TLabel;
    Label12: TLabel;
    layBase64EncoderDecoderInput: TLayout;
    memTitleBase64EncoderDecoderInput: TLabel;
    layBase64EncoderDecoderOutput: TLayout;
    memTitleBase64EncoderDecoderOutput: TLabel;
    memBase64EncoderDecoderOutput: TMemo;
    SwitchBase64EncoderDecoder: TSwitch;
    lblSwitchBase64EncoderDecoder: TLabel;
    memBase64EncoderDecoderInput: TMemo;
    layHasGeneratorOutput: TLayout;
    lblHashGeneratorInput: TLabel;
    memHashGeneratorInput: TMemo;
    Layout5: TLayout;
    layHashGeneratorTop: TLayout;
    lblHashGeneratorConfiguration: TLabel;
    layHashGeneratorLetterCase: TRectangle;
    Image11: TImage;
    Layout7: TLayout;
    Label16: TLabel;
    Label17: TLabel;
    SwitchHashGeneratorLetterCase: TSwitch;
    lblSwitchHashGeneratorLetterCase: TLabel;
    layHashGeneratorOutputType: TRectangle;
    Image12: TImage;
    cbHashGeneratorOutputType: TComboBox;
    Layout8: TLayout;
    Label19: TLabel;
    Label20: TLabel;
    layHashGeneratorOutputMD5: TLayout;
    lblHashGeneratorOutputMD5: TLabel;
    edtHashGeneratorOutputMD5: TEdit;
    edtHashGeneratorOutputMD5CopyToClipboard: TEditButton;
    layHashGeneratorOutputSHA1: TLayout;
    lblHashGeneratorOutputSHA1: TLabel;
    edtHashGeneratorOutputSHA1: TEdit;
    edtHashGeneratorOutputSHA1CopyToClipboard: TEditButton;
    layHashGeneratorOutputSHA256: TLayout;
    lblHashGeneratorOutputSHA256: TLabel;
    edtHashGeneratorOutputSHA256: TEdit;
    edtHashGeneratorOutputSHA256CopyToClipboard: TEditButton;
    layHashGeneratorOutputSHA512: TLayout;
    lblHashGeneratorOutputSHA512: TLabel;
    edtHashGeneratorOutputSHA512: TEdit;
    edtHashGeneratorOutputSHA512CopyToClipboard: TEditButton;
    layHTMLEncoderDecoderInputOutput: TLayout;
    layHTMLEncoderDecoderInput: TLayout;
    memTitleHTMLEncoderDecoderInput: TLabel;
    memHTMLEncoderDecoderInput: TMemo;
    layHTMLEncoderDecoderOutput: TLayout;
    memTitleHTMLEncoderDecoderOutput: TLabel;
    memHTMLEncoderDecoderOutput: TMemo;
    layHTMLEncoderDecoderTop: TLayout;
    lblHTMLEncoderDecoderConfiguration: TLabel;
    layHTMLEncoderDecoderConversion: TRectangle;
    Image13: TImage;
    Layout16: TLayout;
    Label26: TLabel;
    Label27: TLabel;
    SwitchHTMLEncoderDecoder: TSwitch;
    lblSwitchHTMLEncoderDecoder: TLabel;
    layHashGeneratorOutputSHA384: TLayout;
    lblHashGeneratorOutputSHA384: TLabel;
    edtHashGeneratorOutputSHA384: TEdit;
    edtHashGeneratorOutputSHA384CopyToClipboard: TEditButton;
    layHashGeneratorOutputSHA224: TLayout;
    lblHashGeneratorOutputSHA224: TLabel;
    edtHashGeneratorOutputSHA224: TEdit;
    edtHashGeneratorOutputSHA224CopyToClipboard: TEditButton;
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
    layTextCaseConverterInspectorBottom: TLayout;
    layTextCaseConverterInspectorInput: TLayout;
    lblTextCaseConverterInspectorInput: TLabel;
    memTextCaseConverterInspectorInput: TMemo;
    layTextCaseConverterInspectorTop: TLayout;
    lblTextCaseConverterInspectorConvert: TLabel;
    layTextCaseConverterInspectorConvert: TRectangle;
    Image14: TImage;
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
    btnTextCaseConverterInspectorConvertTitleCase: TButton;
    layTextCaseConverterInspectorInspectSpaces: TLayout;
    lblTextCaseConverterInspectorInspectSpacesTitle: TLabel;
    lblTextCaseConverterInspectorInspectSpaces: TLabel;
    SplitterTextCaseConverterInspector: TSplitter;
    layJsonFormatterBottom: TLayout;
    layJsonFormatterInput: TLayout;
    lblJsonFormatterInput: TLabel;
    memJsonFormatterInput: TMemo;
    layJsonFormatterOutput: TLayout;
    lblJsonFormatterOutput: TLabel;
    memJsonFormatterOutput: TMemo;
    layJsonFormatterTop: TLayout;
    lblJsonFormatterConfiguration: TLabel;
    layJsonFormatterIndentation: TRectangle;
    Image19: TImage;
    cbJsonFormatterIndentation: TComboBox;
    Layout11: TLayout;
    Label15: TLabel;
    Label18: TLabel;
    SplitterJsonFormatterInputOutput: TSplitter;
    layUUIDGenerator: TLayout;
    Label5: TLabel;
    layLoremIpsumGenerator: TLayout;
    layColorPicker: TLayout;
    DesktopView: TLayout;
    Splitter2: TSplitter;
    LeftPanel: TLayout;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    ColorListBox1: TColorListBox;
    SearchBox1: TSearchBox;
    TabItem2: TTabItem;
    lstboxSavedColorsRGBA: TListBox;
    lstboxSavedColors: TListBox;
    SearchBox2: TSearchBox;
    ColorTabControl: TTabControl;
    tabColorPanel: TTabItem;
    ColorPanel: TColorPanel;
    tabColorRange: TTabItem;
    ColorRange1: TRectangle;
    ColorRange2: TRectangle;
    ColorRange3: TRectangle;
    ColorRange4: TRectangle;
    ColorRange5: TRectangle;
    ColorRange6: TRectangle;
    ColorRange7: TRectangle;
    ColorRange8: TRectangle;
    ColorRange9: TRectangle;
    ColorRange10: TRectangle;
    ColorRange11: TRectangle;
    ColorRange12: TRectangle;
    ColorRange13: TRectangle;
    ColorRange14: TRectangle;
    ColorRange15: TRectangle;
    ColorRange16: TRectangle;
    ColorRange17: TRectangle;
    ColorRange18: TRectangle;
    ColorRange19: TRectangle;
    ColorRange20: TRectangle;
    ColorRange21: TRectangle;
    ColorRange22: TRectangle;
    ColorRange23: TRectangle;
    ColorRange39: TRectangle;
    ColorRange24: TRectangle;
    ColorRange25: TRectangle;
    ColorRange26: TRectangle;
    ColorRange27: TRectangle;
    ColorRange28: TRectangle;
    ColorRange29: TRectangle;
    ColorRange30: TRectangle;
    ColorRange31: TRectangle;
    ColorRange32: TRectangle;
    ColorRange33: TRectangle;
    ColorRange34: TRectangle;
    ColorRange35: TRectangle;
    ColorRange36: TRectangle;
    ColorRange37: TRectangle;
    ColorRange38: TRectangle;
    ColorRange40: TRectangle;
    ColorRange75: TRectangle;
    ColorRange74: TRectangle;
    ColorRange73: TRectangle;
    ColorRange72: TRectangle;
    ColorRange71: TRectangle;
    ColorRange70: TRectangle;
    ColorRange69: TRectangle;
    ColorRange68: TRectangle;
    ColorRange67: TRectangle;
    ColorRange76: TRectangle;
    ColorRange66: TRectangle;
    ColorRange65: TRectangle;
    ColorRange64: TRectangle;
    ColorRange63: TRectangle;
    ColorRange62: TRectangle;
    ColorRange61: TRectangle;
    ColorRange60: TRectangle;
    ColorRange59: TRectangle;
    ColorRange58: TRectangle;
    ColorRange57: TRectangle;
    ColorRange77: TRectangle;
    ColorRange56: TRectangle;
    ColorRange55: TRectangle;
    ColorRange54: TRectangle;
    ColorRange53: TRectangle;
    ColorRange52: TRectangle;
    ColorRange51: TRectangle;
    ColorRange50: TRectangle;
    ColorRange49: TRectangle;
    ColorRange48: TRectangle;
    ColorRange47: TRectangle;
    ColorRange46: TRectangle;
    ColorRange45: TRectangle;
    ColorRange44: TRectangle;
    ColorRange43: TRectangle;
    ColorRange42: TRectangle;
    ColorRange41: TRectangle;
    ColorRange87: TRectangle;
    ColorRange78: TRectangle;
    ColorRange79: TRectangle;
    ColorRange88: TRectangle;
    ColorRange89: TRectangle;
    ColorRange90: TRectangle;
    ColorRange91: TRectangle;
    ColorRange92: TRectangle;
    ColorRange93: TRectangle;
    ColorRange94: TRectangle;
    ColorRange95: TRectangle;
    ColorRange96: TRectangle;
    ColorRange97: TRectangle;
    ColorRange98: TRectangle;
    ColorRange99: TRectangle;
    ColorRange100: TRectangle;
    ColorRange101: TRectangle;
    ColorRange86: TRectangle;
    ColorRange85: TRectangle;
    ColorRange84: TRectangle;
    ColorRange83: TRectangle;
    ColorRange82: TRectangle;
    ColorRange81: TRectangle;
    ColorRange80: TRectangle;
    Splitter3: TSplitter;
    ContentScrollBox: TVertScrollBox;
    ColorBox: TColorBox;
    Layout_ColorCodes: TRectangle;
    lblColorCodes: TLabel;
    Layout10: TLayout;
    Label58: TLabel;
    Layout12: TLayout;
    CSColorCodeTitle: TLabel;
    CSColorCode: TEdit;
    EditButton7: TEditButton;
    Layout13: TLayout;
    PhotoshopColorCodeTitle: TLabel;
    PhotoshopColorCode: TEdit;
    EditButton5: TEditButton;
    Layout14: TLayout;
    VBColorCodeTitle: TLabel;
    VBColorCode: TEdit;
    EditButton2: TEditButton;
    Layout15: TLayout;
    VBHexColorCodeTitle: TLabel;
    VBHexColorCode: TEdit;
    EditButton10: TEditButton;
    Layout17: TLayout;
    JavaColorPickerTitle: TLabel;
    JavaColorPicker: TEdit;
    EditButton4: TEditButton;
    Layout18: TLayout;
    CPPColorCodeTitle: TLabel;
    CPPColorCode: TEdit;
    EditButton6: TEditButton;
    Line15: TLine;
    Line20: TLine;
    Line25: TLine;
    Line26: TLine;
    Line5: TLine;
    Line27: TLine;
    Layout19: TLayout;
    DelphiVCLColorCodeTitle: TLabel;
    DelphiVCLColorCode: TEdit;
    EditButton1: TEditButton;
    Layout20: TLayout;
    UnityColorCodeTitle: TLabel;
    UnityColorCode: TEdit;
    EditButton11: TEditButton;
    Layout21: TLayout;
    HTMLColorCodeTitle: TLabel;
    HTMLColorCode: TEdit;
    EditButton3: TEditButton;
    Layout22: TLayout;
    ClarionColorCodeTitle: TLabel;
    ClarionColorCode: TEdit;
    EditButton9: TEditButton;
    Layout23: TLayout;
    DelphiFMXColorCodeTitle: TLabel;
    DelphiFMXColorCode: TEdit;
    EditButton8: TEditButton;
    Line14: TLine;
    Line19: TLine;
    Line21: TLine;
    Line22: TLine;
    Line23: TLine;
    Line24: TLine;
    Layout_ColorInformation: TRectangle;
    Label24: TLabel;
    Line28: TLine;
    Layout24: TLayout;
    Label25: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label57: TLabel;
    Label59: TLabel;
    Image23: TImage;
    Label60: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label68: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Image24: TImage;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Image25: TImage;
    Label80: TLabel;
    Label81: TLabel;
    Image26: TImage;
    Label82: TLabel;
    Label83: TLabel;
    Image27: TImage;
    Layout_BaseNumbers: TRectangle;
    Label69: TLabel;
    Layout_bn_title: TLayout;
    bn_base: TLabel;
    bn_red: TLabel;
    bn_blue: TLabel;
    bn_green: TLabel;
    Layout_bn_binary: TLayout;
    bn_binary: TLabel;
    bn_binary_red: TLabel;
    bn_binary_blue: TLabel;
    bn_binary_green: TLabel;
    Layout_bn_octal: TLayout;
    bn_octal: TLabel;
    bn_octal_red: TLabel;
    bn_octal_blue: TLabel;
    bn_octal_green: TLabel;
    Layout_bn_decimal: TLayout;
    bn_decimal: TLabel;
    bn_decimal_red: TLabel;
    bn_decimal_blue: TLabel;
    bn_decimal_green: TLabel;
    Layout_bn_hex: TLayout;
    bn_hex: TLabel;
    bn_hex_red: TLabel;
    bn_hex_blue: TLabel;
    bn_hex_green: TLabel;
    Line11: TLine;
    Line12: TLine;
    Line13: TLine;
    Line16: TLine;
    Line17: TLine;
    Line18: TLine;
    Layout_ColorSpace: TRectangle;
    lblColorSpaces: TLabel;
    Line1: TLine;
    Line10: TLine;
    Line2: TLine;
    Line3: TLine;
    Line4: TLine;
    Line6: TLine;
    Line7: TLine;
    Line8: TLine;
    Line9: TLine;
    Layout_cs_rgba_main: TLayout;
    Layout_cs_rgba: TLayout;
    cs_rgba: TLabel;
    ImageRGBA: TImage;
    cs_rgba_red: TLabel;
    cs_rgba_blue: TLabel;
    cs_rgba_green: TLabel;
    cs_rgba_alpha: TLabel;
    cPanel_RGBA_Selector: TCalloutPanel;
    rgbAlpha: TRectangle;
    tbAlpha: TAlphaTrackBar;
    lblpAlpha: TEdit;
    rgbBlue: TRectangle;
    tbBlue: TTrackBar;
    lblpBlue: TEdit;
    rgbGreen: TRectangle;
    tbGreen: TTrackBar;
    lblpGreen: TEdit;
    rgbRed: TRectangle;
    tbRed: TTrackBar;
    lblpRed: TEdit;
    Layout_cs_hsl_main: TLayout;
    Layout_cs_hsl: TLayout;
    cs_hsl: TLabel;
    ImageHSL: TImage;
    cs_hsl_hue: TLabel;
    cs_hsl_lightness: TLabel;
    cs_hsl_saturation: TLabel;
    cPanel_HSL_Selector: TCalloutPanel;
    HSLHue: TRectangle;
    tbHue_hsl: THueTrackBar;
    edtHue_hsl: TEdit;
    HSLSaturation: TRectangle;
    tbSaturation_hsl: TTrackBar;
    edtSaturation_hsl: TEdit;
    HSLLightness: TRectangle;
    tbLightness_hsl: TTrackBar;
    edtLightness_hsl: TEdit;
    Layout_cs_hsv_main: TLayout;
    cPanel_HSV_Selector: TCalloutPanel;
    HSVHue: TRectangle;
    tbHue_hsv: THueTrackBar;
    edtHue_hsv: TEdit;
    HSVSaturation: TRectangle;
    tbSaturation_hsv: TTrackBar;
    edtSaturation_hsv: TEdit;
    HSVValue: TRectangle;
    tbValue_hsv: TTrackBar;
    edtValue_hsv: TEdit;
    Layout_cs_hsv: TLayout;
    cs_hsv: TLabel;
    ImageHSV: TImage;
    cs_hsv_hue: TLabel;
    cs_hsv_value: TLabel;
    cs_hsv_saturation: TLabel;
    Layout_cs_cmyk_main: TLayout;
    cPanel_CMYK_Selector: TCalloutPanel;
    cmykYellow: TRectangle;
    tbYellow_cmyk: TTrackBar;
    edtYellow_cmyk: TEdit;
    cmykMagenta: TRectangle;
    tbMagenta_cmyk: TTrackBar;
    edtMagenta_cmyk: TEdit;
    cmykCyan: TRectangle;
    tbCyan_cmyk: TTrackBar;
    edtCyan_cmyk: TEdit;
    cmykBlack: TRectangle;
    tbBlack_cmyk: TTrackBar;
    edtBlack_cmyk: TEdit;
    Layout_cs_cmyk: TLayout;
    cs_cmyk: TLabel;
    ImageCMYK: TImage;
    cs_cmyk_cyan: TLabel;
    cs_cmyk_yellow: TLabel;
    cs_cmyk_magenta: TLabel;
    cs_cmyk_key: TLabel;
    Layout_cs_xyz_main: TLayout;
    cPanel_xyz_Selector: TCalloutPanel;
    xyzX: TPanel;
    tbX_xzy: TTrackBar;
    edtX_xyz: TEdit;
    xyzY: TPanel;
    tbY_xzy: TTrackBar;
    edtY_xyz: TEdit;
    xyzZ: TPanel;
    tbZ_xzy: TTrackBar;
    edtZ_xyz: TEdit;
    Label10: TLabel;
    Layout_cs_xyz: TLayout;
    cs_xyz: TLabel;
    ImageXYZ: TImage;
    cs_xyz_x: TLabel;
    cs_xyz_z: TLabel;
    cs_xyz_y: TLabel;
    Layout_cs_yxy_main: TLayout;
    cPanel_yxy_Selector: TCalloutPanel;
    yxyY: TPanel;
    edtY_yxy: TEdit;
    tbY_yxy: TTrackBar;
    yxyX: TPanel;
    tbX_yxy: TTrackBar;
    edtX_yxy: TEdit;
    yxyY2: TPanel;
    tbY2_yxy: TTrackBar;
    edtY2_yxy: TEdit;
    Label21: TLabel;
    Layout_cs_yxy: TLayout;
    cs_yxy: TLabel;
    ImageYxy: TImage;
    cs_yxy_y: TLabel;
    cs_yxy_y2: TLabel;
    cs_yxy_x: TLabel;
    Layout_cs_HunterLab_main: TLayout;
    cPanel_HunterLab_Selector: TCalloutPanel;
    HunterLabL: TPanel;
    edtL_HunterLab: TEdit;
    tbL_HunterLab: TTrackBar;
    HunterLabA: TPanel;
    tbA_HunterLab: TTrackBar;
    edtA_HunterLab: TEdit;
    HunterLabB: TPanel;
    tbB_HunterLab: TTrackBar;
    edtB_HunterLab: TEdit;
    Label22: TLabel;
    Layout_cs_hunterlab: TLayout;
    cs_hunterlab: TLabel;
    ImageHunterLab: TImage;
    cs_hunterlab_l: TLabel;
    cs_hunterlab_b: TLabel;
    cs_hunterlab_a: TLabel;
    Layout_cs_CIELab_main: TLayout;
    cPanel_CIELab_Selector: TCalloutPanel;
    CIIELabL: TPanel;
    edtL_CIELab: TEdit;
    tbL_CIELab: TTrackBar;
    CIIELabA: TPanel;
    tbA_CIELab: TTrackBar;
    edtA_CIELab: TEdit;
    CIIELabB: TPanel;
    tbB_CIELab: TTrackBar;
    edtB_CIELab: TEdit;
    Label23: TLabel;
    Layout_cs_cielab: TLayout;
    cs_cielab: TLabel;
    ImageCIELab: TImage;
    cs_cielab_l: TLabel;
    cs_cielab_b: TLabel;
    cs_cielab_a: TLabel;
    btnAddCustomColor: TButton;
    layLoremIpsumGeneratorOutput: TLayout;
    memTitleLoremIpsumGeneratorOutput: TLabel;
    memLoremIpsumGeneratorOutput: TMemo;
    layLoremIpsumGeneratorTop: TLayout;
    lblLoremIpsumGeneratorConfiguration: TLabel;
    layLoremIpsumGeneratorType: TRectangle;
    Image28: TImage;
    Layout25: TLayout;
    Label7: TLabel;
    Label34: TLabel;
    layLoremIpsumGeneratorAmount: TRectangle;
    Image29: TImage;
    Layout26: TLayout;
    Label36: TLabel;
    Label37: TLabel;
    cbLoremIpsumGeneratorType: TComboBox;
    sbLoremIpsumGeneratorAmount: TSpinBox;
    layLoremIpsumGeneratorLetterCase: TRectangle;
    Image30: TImage;
    Layout1: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    cbLoremIpsumGeneratorLetterCase: TComboBox;
    MultiViewScrollBox: TVertScrollBox;
    Button13: TButton;
    layNameGenerator: TLayout;
    Label3: TLabel;
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
    layNavURLEncodingDecoding: TLayout;
    btnURLEncodingDecoding: TRectangle;
    imgURLEncodingDecoding: TImage;
    lblURLEncodingDecoding: TLabel;
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
    layNavNumberBase: TLayout;
    btnNavNumberBase: TRectangle;
    imgNavNumberBase: TImage;
    lblNavNumberBase: TLabel;
    layNavTimestamp: TLayout;
    btnTimestamp: TRectangle;
    imgTimestamp: TImage;
    lblTimestamp: TLabel;
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
    laySQLFormatter: TLayout;
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
    procedure btnAllToolsMouseEnter(Sender: TObject);
    procedure btnAllToolsMouseLeave(Sender: TObject);
    procedure btnAllToolsClick(Sender: TObject);
    procedure btnHamburgerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SwitchBase64EncoderDecoderSwitch(Sender: TObject);
    procedure memBase64EncoderDecoderInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure cbEncodingTypeChange(Sender: TObject);
    procedure memHTMLEncoderDecoderInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure SwitchHTMLEncoderDecoderSwitch(Sender: TObject);
    procedure memHashGeneratorInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure SwitchHashGeneratorLetterCaseSwitch(Sender: TObject);
    procedure cbHashGeneratorOutputTypeChange(Sender: TObject);
    procedure memTextCaseConverterInspectorInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure TextCaseConverterButtonsClick(Sender: TObject);
    procedure ColorPanelChange(Sender: TObject);
    procedure Layout_cs_cmykClick(Sender: TObject);
    procedure Layout_cs_rgbaClick(Sender: TObject);
    procedure Layout_cs_hsvClick(Sender: TObject);
    procedure Layout_cs_hslClick(Sender: TObject);
    procedure Layout_cs_xyzClick(Sender: TObject);
    procedure Layout_cs_yxyClick(Sender: TObject);
    procedure Layout_cs_hunterlabClick(Sender: TObject);
    procedure Layout_cs_cielabClick(Sender: TObject);
    procedure ColorRangeClick(Sender: TObject);
    procedure ColorListBox1ItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
    procedure tbRedChange(Sender: TObject);
    procedure tbCyan_cmykChange(Sender: TObject);
    procedure tbHue_hsvChange(Sender: TObject);
    procedure tbSaturation_hslChange(Sender: TObject);
    procedure lstboxSavedColorsItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
    procedure btnAddCustomColorClick(Sender: TObject);
    procedure tbX_xzyChange(Sender: TObject);
    procedure memJsonFormatterInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure sbLoremIpsumGeneratorAmountChange(Sender: TObject);
    procedure ExpandCollapseNavItem(Sender: TObject);
  private
    { Private declarations }
    TextCaseConverterInspectorInput: String;

    procedure Nothing(Sender: TObject);     // Just an empty procedure. Probably not required.

    procedure SelectTool(ToolLayoutName: String);
    procedure Base64EncodeDecode();
    procedure HashGenerator();
    procedure TextCaseInspector();


    procedure PopulateColorPickerColorRange;
    procedure UpdateColorPickerSelectors;
    procedure WriteColorPickerCodes;
    procedure ColorSpacesExpand(Sender: TObject; MainLayout: TLayout; SelectorLayout: TCalloutPanel; ExpandImage: TImage; SelectorCount: Byte);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.btnHamburgerClick(Sender: TObject);
begin
   if (MultiView.Width = 50) then MultiView.Width := 400 else MultiView.Width := 50;
end;

procedure TfrmMain.cbEncodingTypeChange(Sender: TObject);
begin
  Base64EncodeDecode();
end;

procedure TfrmMain.cbHashGeneratorOutputTypeChange(Sender: TObject);
begin
  // Base64 Encoding is not yet implemented
  if (cbHashGeneratorOutputType.Selected.Text = 'Base64') then
    SwitchHashGeneratorLetterCase.Enabled := FALSE
  else
    SwitchHashGeneratorLetterCase.Enabled := TRUE;

  HashGenerator();
end;

procedure TfrmMain.ColorListBox1ItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
begin
  var sSearch := SearchBox1.Text;
  SearchBox1.Text := '';
  ColorListBox1.ItemIndex := ColorListBox1.Items.IndexOf(Item.Text);
  ColorPanel.Color := ColorListBox1.Color;
  SearchBox1.Text := sSearch;
end;

procedure TfrmMain.ColorPanelChange(Sender: TObject);
begin
  Layout_ColorSpace.Stroke.Color := ColorBox.Color;
  Layout_BaseNumbers.Stroke.Color := ColorBox.Color;
  Layout_ColorCodes.Stroke.Color := ColorBox.Color;
  Layout_ColorInformation.Stroke.Color := ColorBox.Color;
  WriteColorPickerCodes();
  UpdateColorPickerSelectors();
  PopulateColorPickerColorRange();
end;

procedure TfrmMain.ColorRangeClick(Sender: TObject);
begin
  ColorPanel.Color := (Sender as TRectangle).Fill.Color;
end;

procedure TfrmMain.ColorSpacesExpand(Sender: TObject; MainLayout: TLayout; SelectorLayout: TCalloutPanel;
  ExpandImage: TImage; SelectorCount: Byte);
begin
  var cPanel_Selector := SelectorLayout;
  var Layout_Main := MainLayout;

  cPanel_Selector.Visible := not(cPanel_Selector.Visible);
  if Sender is TLayout then
    if cPanel_Selector.Visible then
      Layout_Main.Height := TLayout(Sender).Height + ((rgbRed.Height * SelectorCount) + 11)
    else
      Layout_Main.Height := TLayout(Sender).Height
  else if cPanel_Selector.Visible then
    Layout_Main.Height := Layout_cs_rgba.Height + ((rgbRed.Height * SelectorCount) + 11)
  else
    Layout_Main.Height := Layout_cs_rgba.Height;

  if cPanel_Selector.Visible then
  begin
    Layout_ColorSpace.Height := Layout_ColorSpace.Height + cPanel_Selector.Height;
    ExpandImage.Bitmap := ImageList1.Source[1].MultiResBitmap[0].Bitmap;
  end
  else
  begin
    Layout_ColorSpace.Height := Layout_ColorSpace.Height - cPanel_Selector.Height;
    ExpandImage.Bitmap := ImageList1.Source[0].MultiResBitmap[0].Bitmap;
  end;

  if Layout_ColorSpace.Height > (lblColorSpaces.Height + Layout_cs_rgba_main.Height +
    Layout_cs_hsv_main.Height + Layout_cs_hsl_main.Height + Layout_cs_cmyk_main.Height +
    Layout_cs_xyz_main.Height + Layout_cs_yxy_main.Height + Layout_cs_HunterLab_main.Height +
    Layout_cs_CIELab_main.Height + 24) then
    Layout_ColorSpace.Height := (lblColorSpaces.Height + Layout_cs_rgba_main.Height +
      Layout_cs_hsv_main.Height + Layout_cs_hsl_main.Height + Layout_cs_cmyk_main.Height +
      Layout_cs_xyz_main.Height + Layout_cs_yxy_main.Height + Layout_cs_HunterLab_main.Height +
      Layout_cs_CIELab_main.Height + 24);

  if Layout_ColorSpace.Height < (lblColorCodes.Height + (DelphiVCLColorCodeTitle.Height * 11) + 24)
  then
    Layout_ColorSpace.Height := (lblColorCodes.Height + (DelphiVCLColorCodeTitle.Height * 11) + 24);
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

procedure TfrmMain.Layout_cs_hunterlabClick(Sender: TObject);
begin
  ColorSpacesExpand(Sender, Layout_cs_HunterLab_main, cPanel_HunterLab_Selector, ImageHunterLab, 3);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  btnAllTools.OnClick(btnAllTools);


// Color Picker Stuff:
  ColorTabControl.ActiveTab := tabColorPanel;
  Layout_cs_rgbaClick(Sender);
  Layout_cs_hslClick(Sender);
  Layout_cs_hsvClick(Sender);
  Layout_cs_cmykClick(Sender);
  Layout_cs_xyzClick(Sender);
  Layout_cs_yxyClick(Sender);
  Layout_cs_hunterlabClick(Sender);
  Layout_cs_cielabClick(Sender);
  PopulateColorPickerColorRange;

  // Collapse Nav Items
  ExpandCollapseNavItem(btnConvertersExpandCollapse);
  ExpandCollapseNavItem(btnEncodersDecodersExpandCollapse);
  ExpandCollapseNavItem(btnFormattersExpandCollapse);
  ExpandCollapseNavItem(btnTextExpandCollapse);
  ExpandCollapseNavItem(btnGeneratorsExpandCollapse);
  ExpandCollapseNavItem(btnGraphicsExpandCollapse);
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  layBase64EncoderDecoderInput.Height := (layBase64EncoderDecoderInputOutput.Height -
                                         layBase64EncoderDecoderInputOutput.Padding.Top -
                                         layBase64EncoderDecoderInputOutput.Padding.Bottom)
                                         /2;

  layHTMLEncoderDecoderInput.Height := (layHTMLEncoderDecoderInputOutput.Height -
                                       layHTMLEncoderDecoderInputOutput.Padding.Top -
                                       layHTMLEncoderDecoderInputOutput.Padding.Bottom)
                                       /2;

  layJsonFormatterInput.Width := (layJsonFormatterBottom.Width -
                                 layJsonFormatterBottom.Padding.Left -
                                 layJsonFormatterBottom.Padding.Right -
                                 SplitterJsonFormatterInputOutput.Width)
                                 /2;




  ColorRange1.Width := Round(ColorTabControl.Width / 95);
  for var i := 2 to 101 do
    (FindComponent('ColorRange' + i.ToString) as TRectangle).Width := ColorRange1.Width;
//    (LeftPanel.FindComponent('ColorRange' + i.ToString) as TRectangle).Width := ColorRange1.Width;   // Might be much faster


  var WidthCalculated := Layout_cs_hsl.Width / 4;

  cs_hsl.Width := WidthCalculated;
  cs_hsl_hue.Width := WidthCalculated;
  cs_hsl_saturation.Width := WidthCalculated;
  cs_hsl_lightness.Width := WidthCalculated;

  cs_hsv.Width := WidthCalculated;
  cs_hsv_hue.Width := WidthCalculated;
  cs_hsv_saturation.Width := WidthCalculated;
  cs_hsv_value.Width := WidthCalculated;

  cs_xyz.Width := WidthCalculated;
  cs_xyz_x.Width := WidthCalculated;
  cs_xyz_y.Width := WidthCalculated;
  cs_xyz_z.Width := WidthCalculated;

  cs_yxy.Width := WidthCalculated;
  cs_yxy_y.Width := WidthCalculated;
  cs_yxy_x.Width := WidthCalculated;
  cs_yxy_y2.Width := WidthCalculated;

  cs_hunterlab.Width := WidthCalculated;
  cs_hunterlab_l.Width := WidthCalculated;
  cs_hunterlab_a.Width := WidthCalculated;
  cs_hunterlab_b.Width := WidthCalculated;

  cs_cielab.Width := WidthCalculated;
  cs_cielab_l.Width := WidthCalculated;
  cs_cielab_a.Width := WidthCalculated;
  cs_cielab_b.Width := WidthCalculated;

  cs_rgba.Width := WidthCalculated;
  cs_cmyk.Width := WidthCalculated;

  cs_rgba_red.Width := (Layout_cs_rgba.Width - WidthCalculated) / 4;
  cs_rgba_green.Width := cs_rgba_red.Width;
  cs_rgba_blue.Width := cs_rgba_red.Width;
  cs_rgba_alpha.Width := cs_rgba_red.Width;

  cs_cmyk_cyan.Width := cs_rgba_red.Width;
  cs_cmyk_magenta.Width := cs_rgba_red.Width;
  cs_cmyk_yellow.Width := cs_rgba_red.Width;
  cs_cmyk_key.Width := cs_rgba_red.Width;

  WidthCalculated := Layout_bn_title.Width / 4;

  bn_base.Width := WidthCalculated;
  bn_red.Width := WidthCalculated;
  bn_green.Width := WidthCalculated;
  bn_blue.Width := WidthCalculated;

  bn_hex.Width := WidthCalculated;
  bn_hex_red.Width := WidthCalculated;
  bn_hex_green.Width := WidthCalculated;
  bn_hex_blue.Width := WidthCalculated;

  bn_decimal.Width := WidthCalculated;
  bn_decimal_red.Width := WidthCalculated;
  bn_decimal_green.Width := WidthCalculated;
  bn_decimal_blue.Width := WidthCalculated;

  bn_octal.Width := WidthCalculated;
  bn_octal_red.Width := WidthCalculated;
  bn_octal_green.Width := WidthCalculated;
  bn_octal_blue.Width := WidthCalculated;

  bn_binary.Width := WidthCalculated;
  bn_binary_red.Width := WidthCalculated;
  bn_binary_green.Width := WidthCalculated;
  bn_binary_blue.Width := WidthCalculated;
end;

procedure TfrmMain.HashGenerator;
begin
  var TextToHash := memHashGeneratorInput.Text;
  edtHashGeneratorOutputMD5.Text := THashMD5.GetHashString(TextToHash);
  edtHashGeneratorOutputSHA1.Text := THashSHA1.GetHashString(TextToHash);
  edtHashGeneratorOutputSHA224.Text := THashSHA2.GetHashString(TextToHash,THashSHA2.TSHA2Version.SHA224);
  edtHashGeneratorOutputSHA256.Text := THashSHA2.GetHashString(TextToHash,THashSHA2.TSHA2Version.SHA256);
  edtHashGeneratorOutputSHA384.Text := THashSHA2.GetHashString(TextToHash,THashSHA2.TSHA2Version.SHA384);
  edtHashGeneratorOutputSHA512.Text := THashSHA2.GetHashString(TextToHash,THashSHA2.TSHA2Version.SHA512);
  // Need to add THashSHA2.TSHA2Version.SHA512_224 and THashSHA2.TSHA2Version.SHA512_256



  if (SwitchHashGeneratorLetterCase.IsChecked) then
  begin
    edtHashGeneratorOutputMD5.Text := edtHashGeneratorOutputMD5.Text.ToUpper;
    edtHashGeneratorOutputSHA1.Text := edtHashGeneratorOutputSHA1.Text.ToUpper;
    edtHashGeneratorOutputSHA224.Text := edtHashGeneratorOutputSHA224.Text.ToUpper;
    edtHashGeneratorOutputSHA256.Text := edtHashGeneratorOutputSHA256.Text.ToUpper;
    edtHashGeneratorOutputSHA384.Text := edtHashGeneratorOutputSHA384.Text.ToUpper;
    edtHashGeneratorOutputSHA512.Text := edtHashGeneratorOutputSHA512.Text.ToUpper;
  end;


  // Need to implement Base64 Encoding instead of Hex

end;

procedure TfrmMain.Layout_cs_cielabClick(Sender: TObject);
begin
  ColorSpacesExpand(Sender, Layout_cs_CIELab_main, cPanel_CIELab_Selector, ImageCIELab, 3);
end;

procedure TfrmMain.Layout_cs_cmykClick(Sender: TObject);
begin
  ColorSpacesExpand(Sender, Layout_cs_cmyk_main, cPanel_CMYK_Selector, ImageCMYK, 4);
end;

procedure TfrmMain.Layout_cs_hslClick(Sender: TObject);
begin
  ColorSpacesExpand(Sender, Layout_cs_hsl_main, cPanel_HSL_Selector, ImageHSL, 3);
end;

procedure TfrmMain.Layout_cs_hsvClick(Sender: TObject);
begin
  ColorSpacesExpand(Sender, Layout_cs_hsv_main, cPanel_HSV_Selector, ImageHSV, 3);
end;

procedure TfrmMain.Layout_cs_rgbaClick(Sender: TObject);
begin
  ColorSpacesExpand(Sender, Layout_cs_rgba_main, cPanel_RGBA_Selector, ImageRGBA, 4);
end;

procedure TfrmMain.Layout_cs_xyzClick(Sender: TObject);
begin
  ColorSpacesExpand(Sender, Layout_cs_xyz_main, cPanel_xyz_Selector, ImageXYZ, 3);
end;

procedure TfrmMain.Layout_cs_yxyClick(Sender: TObject);
begin
  ColorSpacesExpand(Sender, Layout_cs_yxy_main, cPanel_yxy_Selector, ImageYxy, 3);
end;

procedure TfrmMain.lstboxSavedColorsItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
var
  col: TAlphaColorRec;
begin
  var sSearch := SearchBox2.Text;
  SearchBox2.Text := '';
  lstboxSavedColors.ItemIndex := lstboxSavedColors.Items.IndexOf(Item.Text);

  var DummyStr := lstboxSavedColorsRGBA.Items[lstboxSavedColors.ItemIndex];

  var s := Copy(DummyStr, 1, pos('-', DummyStr) - 1);
  col.R := s.ToInteger;
  Delete(DummyStr, 1, pos('-', DummyStr));

  s := Copy(DummyStr, 1, pos('-', DummyStr) - 1);
  col.G := s.ToInteger;
  Delete(DummyStr, 1, pos('-', DummyStr));

  s := Copy(DummyStr, 1, pos('-', DummyStr) - 1);
  col.B := s.ToInteger;
  Delete(DummyStr, 1, pos('-', DummyStr));

  col.A := DummyStr.ToInteger;

  ColorPanel.Color := TAlphaColor(col);

  SearchBox2.Text := sSearch;
end;

procedure TfrmMain.memBase64EncoderDecoderInputKeyUp(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  Base64EncodeDecode();
end;

procedure TfrmMain.memHashGeneratorInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  HashGenerator();
end;

procedure TfrmMain.memHTMLEncoderDecoderInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  try
    var TextToEncode := memHTMLEncoderDecoderInput.Text;
    if (SwitchHTMLEncoderDecoder.IsChecked) then
      memHTMLEncoderDecoderOutput.Text := TNetEncoding.HTML.Encode(TextToEncode)
    else
      memHTMLEncoderDecoderOutput.Text := TNetEncoding.HTML.Decode(TextToEncode);
  except on E: Exception do

  end;
end;

procedure TfrmMain.memJsonFormatterInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  try
    memJsonFormatterOutput.Text := TJSON.Format(TJSONObject.ParseJSONValue(memJsonFormatterInput.Text));
  except on E: Exception do

  end;
end;

procedure TfrmMain.memTextCaseConverterInspectorInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  TextCaseConverterInspectorInput := memTextCaseConverterInspectorInput.Text;
  TextCaseInspector();
end;

procedure TfrmMain.Nothing(Sender: TObject);
begin
  // 😁
end;

procedure TfrmMain.PopulateColorPickerColorRange;
var
  col: TAlphaColorRec;
  iColorValue: integer;
  iColorRange, iColorCount: integer;
begin
  ColorRange51.Fill.Color := ColorBox.Color; // The middle color
  iColorRange := 0;
  for iColorCount := 50 downto 1 do
  begin
    iColorRange := iColorRange + 2;
    iColorValue := TAlphaColorRec(ColorBox.Color).R.ToString.ToInteger - iColorRange; // Get Red Color
    if (iColorValue > 255) then iColorValue := 255;
    if (iColorValue < 0) then iColorValue := 0;
    col.R := iColorValue; // Set Red Color
    iColorValue := TAlphaColorRec(ColorBox.Color).G.ToString.ToInteger - iColorRange; // Get Green Color
    if (iColorValue > 255) then iColorValue := 255;
    if (iColorValue < 0) then iColorValue := 0;
    col.G := iColorValue; // Set Green Color
    iColorValue := TAlphaColorRec(ColorBox.Color).B.ToString.ToInteger - iColorRange; // Get Blue Color
    if (iColorValue > 255) then iColorValue := 255;
    if (iColorValue < 0) then iColorValue := 0;
    col.B := iColorValue; // Set Blue Color
    col.A := TAlphaColorRec(ColorBox.Color).A.ToString.ToInteger; // Get/Set Alpha Color
    (FindComponent('ColorRange' + IntToStr(iColorCount)) as TRectangle).Fill.Color := TAlphaColor(col);
  end;
  iColorRange := 0;
  for iColorCount := 52 to 101 do
  begin
    iColorRange := iColorRange + 2;
    iColorValue := TAlphaColorRec(ColorBox.Color).R.ToString.ToInteger + iColorRange; // Get Red Color
    if (iColorValue > 255) then iColorValue := 255;
    if (iColorValue < 0) then iColorValue := 0;
    col.R := iColorValue; // Set Red Color
    iColorValue := TAlphaColorRec(ColorBox.Color).G.ToString.ToInteger + iColorRange; // Get Green Color
    if (iColorValue > 255) then iColorValue := 255;
    if (iColorValue < 0) then iColorValue := 0;
    col.G := iColorValue; // Set Green Color
    iColorValue := TAlphaColorRec(ColorBox.Color).B.ToString.ToInteger + iColorRange; // Get Blue Color
    if (iColorValue > 255) then iColorValue := 255;
    if (iColorValue < 0) then iColorValue := 0;
    col.B := iColorValue; // Set Blue Color
    col.A := TAlphaColorRec(ColorBox.Color).A.ToString.ToInteger; // Get/Set Alpha Color
    (FindComponent('ColorRange' + IntToStr(iColorCount)) as TRectangle).Fill.Color := TAlphaColor(col);
  end;
end;

procedure TfrmMain.SelectTool(ToolLayoutName: String);
begin
  for var I := 0 to LayoutContainer.Children.Count-1 do
    TLayout(LayoutContainer.Children.Items[I]).Visible := False;

  TLayout(FindComponent(ToolLayoutName)).Visible := True;
end;

procedure TfrmMain.sbLoremIpsumGeneratorAmountChange(Sender: TObject);
begin
  memLoremIpsumGeneratorOutput.Text := GenerateLoremIpsum(TLoremIpsumType.Paragraphs, 1);
end;

procedure TfrmMain.SwitchBase64EncoderDecoderSwitch(Sender: TObject);
begin
  if (lblSwitchBase64EncoderDecoder.Text = 'Encode') then
  begin
    lblSwitchBase64EncoderDecoder.Text := 'Decode';
    SwitchBase64EncoderDecoder.IsChecked := False;
  end else
  begin
    lblSwitchBase64EncoderDecoder.Text := 'Encode';
    SwitchBase64EncoderDecoder.IsChecked := True;
  end;

  var TempText := memBase64EncoderDecoderOutput.Text;
  memBase64EncoderDecoderOutput.Text := memBase64EncoderDecoderInput.Text;
  memBase64EncoderDecoderInput.Text := TempText;
end;

procedure TfrmMain.SwitchHashGeneratorLetterCaseSwitch(Sender: TObject);
begin
  if (lblSwitchHTMLEncoderDecoder.Text = 'Lowercase') then
  begin
    lblSwitchHTMLEncoderDecoder.Text := 'Uppercase';
    SwitchHTMLEncoderDecoder.IsChecked := True;
  end else
  begin
    lblSwitchHTMLEncoderDecoder.Text := 'Lowercase';
    SwitchHTMLEncoderDecoder.IsChecked := False;
  end;
  HashGenerator();
end;

procedure TfrmMain.SwitchHTMLEncoderDecoderSwitch(Sender: TObject);
begin
  if (lblSwitchHTMLEncoderDecoder.Text = 'Encode') then
  begin
    lblSwitchHTMLEncoderDecoder.Text := 'Decode';
    SwitchHTMLEncoderDecoder.IsChecked := False;
  end else
  begin
    lblSwitchHTMLEncoderDecoder.Text := 'Encode';
    SwitchHTMLEncoderDecoder.IsChecked := True;
  end;

  var TempText := memHTMLEncoderDecoderOutput.Text;
  memHTMLEncoderDecoderOutput.Text := memHTMLEncoderDecoderInput.Text;
  memHTMLEncoderDecoderInput.Text := TempText;
end;

procedure TfrmMain.tbCyan_cmykChange(Sender: TObject);
var
  col: TAlphaColorRec;
  R, G, B: Byte;
begin
  TEdit(TTrackBar(Sender).Parent.Children.Items[1]).Text := TTrackBar(Sender).Value.ToString + '%';
  CMYKToRGB((edtCyan_cmyk.Text.Replace('%', '').ToSingle / 100),
    (edtMagenta_cmyk.Text.Replace('%', '').ToSingle / 100),
    (edtYellow_cmyk.Text.Replace('%', '').ToSingle / 100),
    (edtBlack_cmyk.Text.Replace('%', '').ToSingle / 100), R, G, B);

  col.R := R;
  col.G := G;
  col.B := B;
  col.A := tbAlpha.Value.ToString.ToInteger;
  ColorPanel.Color := TAlphaColor(col);
end;

procedure TfrmMain.tbHue_hsvChange(Sender: TObject);
var
  col: TAlphaColorRec;
  R, G, B: Byte;
begin
  if not(Sender is THueTrackBar) then
    TEdit(TTrackBar(Sender).Parent.Children.Items[1]).Text := TTrackBar(Sender).Value.ToString + '%';

  HSVToRGB(tbHue_hsv.Value, (edtSaturation_hsv.Text.Replace('%', '').ToSingle / 100),
    (edtValue_hsv.Text.Replace('%', '').ToSingle / 100), R, G, B);

  col.R := R;
  col.G := G;
  col.B := B;
  col.A := tbAlpha.Value.ToString.ToInteger;
  ColorPanel.Color := TAlphaColor(col);
end;

procedure TfrmMain.tbRedChange(Sender: TObject);
var
  col: TAlphaColorRec;
begin
  TEdit(TTrackBar(Sender).Parent.Children.Items[1]).Text := TTrackBar(Sender).Value.ToString;
  col.R := tbRed.Value.ToString.ToInteger;
  col.G := tbGreen.Value.ToString.ToInteger;
  col.B := tbBlue.Value.ToString.ToInteger;
  col.A := tbAlpha.Value.ToString.ToInteger;
  ColorPanel.Color := TAlphaColor(col);
end;

procedure TfrmMain.tbSaturation_hslChange(Sender: TObject);
var
  col: TAlphaColor;
begin
  if not(Sender is THueTrackBar) then
    TEdit(TTrackBar(Sender).Parent.Children.Items[1]).Text := TTrackBar(Sender)
      .Value.ToString + '%';
  HSLtoRGB(tbHue_hsl.Value, (edtSaturation_hsl.Text.Replace('%', '').ToSingle / 100),
    (edtLightness_hsl.Text.Replace('%', '').ToSingle / 100), col);

  ColorPanel.Color := col;
end;

procedure TfrmMain.tbX_xzyChange(Sender: TObject);
var
  col: TAlphaColor;
  R, G, B: Byte;
begin
  if not(Sender is THueTrackBar) then
    TEdit(TTrackBar(Sender).Parent.Children.Items[1]).Text := TTrackBar(Sender).Value.ToString;
  XYZToRGB(edtX_xyz.Text.ToSingle, edtY_xyz.Text.ToSingle, edtZ_xyz.Text.ToSingle, R, G, B);

  Caption := (R.ToString + '#' + G.ToString + '#' + B.ToString + '#');
  col := MakeColor(R,G,B);
  ColorPanel.Color := col;
end;

procedure TfrmMain.TextCaseConverterButtonsClick(Sender: TObject);
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

procedure TfrmMain.TextCaseInspector;
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

procedure TfrmMain.UpdateColorPickerSelectors;
var
  H, s, L: Single;
  C, M, Y, K: Single;
begin
  tbRed.OnChange := Nothing;
  tbGreen.OnChange := Nothing;
  tbBlue.OnChange := Nothing;
  tbAlpha.OnChange := Nothing;
  tbHue_hsl.OnChange := Nothing;
  tbSaturation_hsl.OnChange := Nothing;
  tbLightness_hsl.OnChange := Nothing;
  tbHue_hsv.OnChange := Nothing;
  tbSaturation_hsv.OnChange := Nothing;
  tbValue_hsv.OnChange := Nothing;
  tbCyan_cmyk.OnChange := Nothing;
  tbMagenta_cmyk.OnChange := Nothing;
  tbYellow_cmyk.OnChange := Nothing;
  tbBlack_cmyk.OnChange := Nothing;
  tbX_xzy.OnChange := Nothing;
  tbY_xzy.OnChange := Nothing;
  tbZ_xzy.OnChange := Nothing;
  tbY_yxy.OnChange := Nothing;
  tbX_yxy.OnChange := Nothing;
  tbY2_yxy.OnChange := Nothing;
  tbL_HunterLab.OnChange := Nothing;
  tbA_HunterLab.OnChange := Nothing;
  tbB_HunterLab.OnChange := Nothing;
  tbL_CIELab.OnChange := Nothing;
  tbA_CIELab.OnChange := Nothing;
  tbB_CIELab.OnChange := Nothing;

  tbRed.Value := cs_rgba_red.Text.ToSingle;
  lblpRed.Text := cs_rgba_red.Text;
  tbGreen.Value := cs_rgba_green.Text.ToSingle;
  lblpGreen.Text := cs_rgba_green.Text;
  tbBlue.Value := cs_rgba_blue.Text.ToSingle;
  lblpBlue.Text := cs_rgba_blue.Text;
  tbAlpha.Value := cs_rgba_alpha.Text.ToSingle;
  lblpAlpha.Text := cs_rgba_alpha.Text;

  RGBtoHSL(ColorPanel.Color, H, s, L);
  tbHue_hsl.Value := H;
  edtHue_hsl.Text := cs_hsl_hue.Text;
  tbSaturation_hsl.Value := Round(s * 100);
  edtSaturation_hsl.Text := cs_hsl_saturation.Text;
  tbLightness_hsl.Value := Round(L * 100);
  edtLightness_hsl.Text := cs_hsl_lightness.Text;

  tbHue_hsv.Value := H;
  edtHue_hsv.Text := cs_hsv_hue.Text;
  tbSaturation_hsv.Value := cs_hsv_saturation.Text.Replace('%', '').ToInteger;
  edtSaturation_hsv.Text := cs_hsv_saturation.Text;
  tbValue_hsv.Value := cs_hsv_value.Text.Replace('%', '').ToInteger;
  edtValue_hsv.Text := cs_hsv_value.Text;

  RGBtoCMYK(TAlphaColorRec(ColorPanel.Color).R, TAlphaColorRec(ColorPanel.Color).G, TAlphaColorRec(ColorPanel.Color).B, C, M, Y, K);
  tbCyan_cmyk.Value := Round(C * 100);
  edtCyan_cmyk.Text := tbCyan_cmyk.Value.ToString + '%';
  tbMagenta_cmyk.Value := Round(M * 100);
  edtMagenta_cmyk.Text := tbMagenta_cmyk.Value.ToString + '%';
  tbYellow_cmyk.Value := Round(Y * 100);
  edtYellow_cmyk.Text := tbYellow_cmyk.Value.ToString + '%';
  tbBlack_cmyk.Value := Round(K * 100);
  edtBlack_cmyk.Text := tbBlack_cmyk.Value.ToString + '%';

  tbRed.OnChange := tbRedChange;
  tbGreen.OnChange := tbRedChange;
  tbBlue.OnChange := tbRedChange;
  tbAlpha.OnChange := tbRedChange;
  tbHue_hsl.OnChange := tbSaturation_hslChange;
  tbSaturation_hsl.OnChange := tbSaturation_hslChange;
  tbLightness_hsl.OnChange := tbSaturation_hslChange;
  tbHue_hsv.OnChange := tbHue_hsvChange;
  tbSaturation_hsv.OnChange := tbHue_hsvChange;
  tbValue_hsv.OnChange := tbHue_hsvChange;
  tbCyan_cmyk.OnChange := tbCyan_cmykChange;
  tbMagenta_cmyk.OnChange := tbCyan_cmykChange;
  tbYellow_cmyk.OnChange := tbCyan_cmykChange;
  tbBlack_cmyk.OnChange := tbCyan_cmykChange;
  tbX_xzy.OnChange := tbX_xzyChange;
  tbY_xzy.OnChange := tbX_xzyChange;
  tbZ_xzy.OnChange := tbX_xzyChange;
end;

procedure TfrmMain.WriteColorPickerCodes;
var
  HexCode, HexCodeReverse: String;
  R, G, B, A: Byte;
  H, s, V: Single;
  C, M, Y, K: Single;
  labL, labA, labB: Single;
  xyzX, xyzY, xyzZ: Single;
begin
  R := TAlphaColorRec(ColorBox.Color).R;
  G := TAlphaColorRec(ColorBox.Color).G;
  B := TAlphaColorRec(ColorBox.Color).B;
  A := TAlphaColorRec(ColorBox.Color).A;
  HexCode := IntToHex(R) + IntToHex(G) + IntToHex(B);
  HexCodeReverse := IntToHex(B) + IntToHex(G) + IntToHex(R);

  /// /////////////////////////////////////////////////////////////////////////////
  /// Color Codes
  DelphiVCLColorCode.Text := '$' + TAlphaColorRec.ColorToRGB(ColorBox.Color).ToHexString;
  DelphiFMXColorCode.Text := '$' + A.ToHexString + HexCode;
  VBColorCode.Text := TAlphaColorRec.ColorToRGB(ColorBox.Color).ToString;
  JavaColorPicker.Text := '0x' + HexCode;
  PhotoshopColorCode.Text := HexCode;
  CPPColorCode.Text := '0x' + Copy(DelphiVCLColorCode.Text, 2, DelphiVCLColorCode.Text.Length);
  CSColorCode.Text := '#' + A.ToHexString + HexCode;
  ClarionColorCode.Text := '0' + HexCodeReverse + 'H';
  VBHexColorCode.Text := '&H' + HexCodeReverse;
  UnityColorCode.Text := '#' + HexCode + A.ToHexString;
  if (A < 255) then
  begin
    HTMLColorCodeTitle.Text := 'Code for HTML:';
    HTMLColorCode.Text := 'RGBA(' + R.ToString + ',' + G.ToString + ',' + B.ToString + ',' +
      RoundTo((A / 255), -2).ToString.Replace(',', '.') + ')';

    EditButton1.Visible := FALSE;
    EditButton6.Visible := FALSE;
    EditButton4.Visible := FALSE;
    EditButton10.Visible := FALSE;
    EditButton2.Visible := FALSE;
    EditButton5.Visible := FALSE;
    EditButton9.Visible := FALSE;

    DelphiVCLColorCode.Text := 'DOES NOT SUPPORT "ALPHA" COLOR';
    CPPColorCode.Text := 'DOES NOT SUPPORT "ALPHA" COLOR';
    JavaColorPicker.Text := 'DOES NOT SUPPORT "ALPHA" COLOR';
    VBColorCode.Text := 'DOES NOT SUPPORT "ALPHA" COLOR';
    VBHexColorCode.Text := 'DOES NOT SUPPORT "ALPHA" COLOR';
    PhotoshopColorCode.Text := 'DOES NOT SUPPORT "ALPHA" COLOR';
    ClarionColorCode.Text := 'DOES NOT SUPPORT "ALPHA" COLOR';

    DelphiVCLColorCode.Font.Size := 10;
    CPPColorCode.Font.Size := 10;
    JavaColorPicker.Font.Size := 10;
    VBColorCode.Font.Size := 10;
    VBHexColorCode.Font.Size := 10;
    PhotoshopColorCode.Font.Size := 10;
    ClarionColorCode.Font.Size := 10;
  end
  else
  begin
    // if (TabControl4.ActiveTab = TabItem7) then
    // begin
    // Label3.Text := 'HSL code for HTML:';
    // HTMLColorCode.Text := 'HSL('+lblpHue_hsl.Text.Remove(lblpHue_hsl.Text.Length-1).Substring(3)+','+lblpSaturation_hsl.Text.Substring(3)+','+lblpLightness_hsl.Text.Substring(3)+')';
    // end else
    // begin
    // Label3.Text := 'Hex code for HTML:';
    HTMLColorCode.Text := '#' + HexCode;
    // end;

    EditButton1.Visible := TRUE;
    EditButton6.Visible := TRUE;
    EditButton4.Visible := TRUE;
    EditButton10.Visible := TRUE;
    EditButton2.Visible := TRUE;
    EditButton5.Visible := TRUE;
    EditButton9.Visible := TRUE;

    DelphiVCLColorCode.Font.Size := 16;
    CPPColorCode.Font.Size := 16;
    JavaColorPicker.Font.Size := 16;
    VBColorCode.Font.Size := 16;
    VBHexColorCode.Font.Size := 16;
    PhotoshopColorCode.Font.Size := 16;
    ClarionColorCode.Font.Size := 16;
  end;

  // if ColorCase = 'Lowercase' then
  // begin
  // DelphiVCLColorCode.Text := Lowercase(DelphiVCLColorCode.Text);
  // DelphiFMXColorCode.Text := Lowercase(DelphiFMXColorCode.Text);
  // VBColorCode.Text := Lowercase(VBColorCode.Text);
  // HTMLColorCode.Text := Lowercase(HTMLColorCode.Text);
  // JavaColorPicker.Text := Lowercase(JavaColorPicker.Text);
  // CPPColorCode.Text := Lowercase(CPPColorCode.Text);
  // CSColorCode.Text := Lowercase(CSColorCode.Text);
  // ClarionColorCode.Text := Lowercase(ClarionColorCode.Text);
  // VBHexColorCode.Text := Lowercase(VBHexColorCode.Text);
  // PhotoshopColorCode.Text := Lowercase(PhotoshopColorCode.Text);
  // UnityColorCode.Text := Lowercase(UnityColorCode.Text);
  // end;
  /// /////////////////////////////////////////////////////////////////////////////

  /// /////////////////////////////////////////////////////////////////////////////
  /// Color Spaces
  cs_rgba_red.Text := R.ToString;
  cs_rgba_green.Text := G.ToString;
  cs_rgba_blue.Text := B.ToString;
  cs_rgba_alpha.Text := A.ToString;

  RGBToHSV(R, G, B, H, s, V);
  cs_hsv_hue.Text := H.ToString + '°';
  cs_hsv_saturation.Text := s.ToString + '%';
  cs_hsv_value.Text := V.ToString + '%';

  cs_hsl_hue.Text := H.ToString + '°';
  RGBtoHSL(ColorBox.Color, H, s, V);
  cs_hsl_saturation.Text := Round(s * 100).ToString + '%';
  cs_hsl_lightness.Text := Round(V * 100).ToString + '%';

  RGBtoCMYK(R, G, B, C, M, Y, K);
  cs_cmyk_cyan.Text := Round(C * 100).ToString + '%';
  cs_cmyk_magenta.Text := Round(M * 100).ToString + '%';
  cs_cmyk_yellow.Text := Round(Y * 100).ToString + '%';
  cs_cmyk_key.Text := Round(K * 100).ToString + '%';

  RGBToXYZ(R, G, B, xyzX, xyzY, xyzZ);
  cs_xyz_x.Text := RoundTo(xyzX, -2).ToString;
  cs_xyz_y.Text := RoundTo(xyzY, -2).ToString;
  cs_xyz_z.Text := RoundTo(xyzZ, -2).ToString;

  RGBToYxy(R, G, B, xyzX, xyzY, xyzZ);
  cs_yxy_y.Text := RoundTo(xyzX, -2).ToString;
  cs_yxy_x.Text := RoundTo(xyzY, -2).ToString;
  cs_yxy_y2.Text := RoundTo(xyzZ, -2).ToString;

  RGBToHunterLab(R, G, B, labL, labA, labB);
  cs_hunterlab_l.Text := RoundTo(labL, -2).ToString;
  cs_hunterlab_a.Text := RoundTo(labA, -2).ToString;
  cs_hunterlab_b.Text := RoundTo(labB, -2).ToString;

  RGBToCIELab(R, G, B, labL, labA, labB);
  cs_cielab_l.Text := RoundTo(labL, -2).ToString;
  cs_cielab_a.Text := RoundTo(labA, -2).ToString;
  cs_cielab_b.Text := RoundTo(labB, -2).ToString;
  /// /////////////////////////////////////////////////////////////////////////////

  /// /////////////////////////////////////////////////////////////////////////////
  /// Color Spaces
  bn_hex_red.Text := R.ToHexString;
  bn_hex_green.Text := G.ToHexString;
  bn_hex_blue.Text := B.ToHexString;

  bn_decimal_red.Text := R.ToString;
  bn_decimal_green.Text := G.ToString;
  bn_decimal_blue.Text := B.ToString;

  bn_octal_red.Text := IntToOct(R);
  bn_octal_green.Text := IntToOct(G);
  bn_octal_blue.Text := IntToOct(B);

  bn_binary_red.Text := IntToBin(R, 8);
  bn_binary_green.Text := IntToBin(G, 8);
  bn_binary_blue.Text := IntToBin(B, 8);
  /// /////////////////////////////////////////////////////////////////////////////
end;

procedure TfrmMain.Base64EncodeDecode;
begin
  try
    var UTF8TextToEncode := memBase64EncoderDecoderInput.Text;
    var ASCIITextToEncode := AnsiString(UTF8TextToEncode);
    if cbEncodingType.Selected.Text = 'ASCII' then
    begin
      if (switchBase64EncoderDecoder.IsChecked) then
        memBase64EncoderDecoderOutput.Text := TNetEncoding.Base64.Encode(ASCIITextToEncode)
      else
        memBase64EncoderDecoderOutput.Text := TNetEncoding.Base64.Decode(ASCIITextToEncode);
    end else
    begin
      if (switchBase64EncoderDecoder.IsChecked) then
        memBase64EncoderDecoderOutput.Text := TNetEncoding.Base64.Encode(UTF8TextToEncode)
      else
        memBase64EncoderDecoderOutput.Text := TNetEncoding.Base64.Decode(UTF8TextToEncode);
    end;
  except on E: Exception do

  end;
end;

procedure TfrmMain.btnAddCustomColorClick(Sender: TObject);
begin
//  var StringList := TStringList.Create; // Need to free somewhere
//  StringList.LoadFromFile(txtSavedColors);
//
//  InputQuery('Save Color', ['Give it a name:'], [''],
//    procedure(const AResult: TModalResult; const AValues: array of string)
//    begin
//      if AValues[0] <> '' then
//      begin
//        var DummyStr := AValues[0] + '~' + TAlphaColorRec(ColorBox.Color).R.ToString + '-' +
//          TAlphaColorRec(ColorBox.Color).G.ToString + '-' + TAlphaColorRec(ColorBox.Color)
//          .B.ToString + '-' + TAlphaColorRec(ColorBox.Color).A.ToString;
//
//        StringList.Append(DummyStr);
//        StringList.SaveToFile(txtSavedColors);
//        ShowMessage('Color Successfully Saved!');
//        LoadSavedColorsClick;
//      end;
//    end);
end;

procedure TfrmMain.btnAllToolsClick(Sender: TObject);
begin
  var ToolNavItem := TLabel(TRectangle(Sender).Children.Items[1]);
  lblNavTitle.Text := ToolNavItem.Text;
  SelectTool('lay'+String(ToolNavItem.Name).Replace('lbl',''));

  FormResize(nil);
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
