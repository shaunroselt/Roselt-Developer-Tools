{ TODO : Redesign the UI to feel more like the other Tool frames }
unit uFrame_ColorPicker;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.UIConsts,
  System.ImageList,
  System.IOUtils,
  System.Math,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Colors,
  FMX.ListBox,
  FMX.SearchBox,
  FMX.Layouts,
  FMX.TabControl,
  FMX.Objects,
  FMX.ImgList,
  FMX.Edit,
  FMX.Controls.Presentation,

  Roselt.Screenshot,
  Roselt.ColorConversion,
  Roselt.NumberBaseConversion,

  Skia,
  Skia.FMX;

type
  TFrame_ColorPicker = class(TFrame)
    ContentScrollBox: TVertScrollBox;
    ColorBox: TColorBox;
    Layout_ColorCodes: TRectangle;
    lblColorCodes: TLabel;
    Layout10: TLayout;
    Label58: TLabel;
    Layout12: TLayout;
    CSColorCodeTitle: TLabel;
    CSColorCode: TEdit;
    CSColorCodeCopyToClipboard: TEditButton;
    Layout13: TLayout;
    PhotoshopColorCodeTitle: TLabel;
    PhotoshopColorCode: TEdit;
    PhotoshopColorCodeCopyToClipboard: TEditButton;
    Layout14: TLayout;
    VBColorCodeTitle: TLabel;
    VBColorCode: TEdit;
    VBColorCodeCopyToClipboard: TEditButton;
    Layout15: TLayout;
    VBHexColorCodeTitle: TLabel;
    VBHexColorCode: TEdit;
    VBHexColorCodeCopyToClipboard: TEditButton;
    Layout17: TLayout;
    JavaColorPickerTitle: TLabel;
    JavaColorPicker: TEdit;
    JavaColorPickerCopyToClipboard: TEditButton;
    Layout18: TLayout;
    CPPColorCodeTitle: TLabel;
    CPPColorCode: TEdit;
    CPPColorCodeCopyToClipboard: TEditButton;
    Line15: TLine;
    Line20: TLine;
    Line25: TLine;
    Line26: TLine;
    Line5: TLine;
    Line27: TLine;
    Layout19: TLayout;
    DelphiVCLColorCodeTitle: TLabel;
    DelphiVCLColorCode: TEdit;
    DelphiVCLColorCodeCopyToClipboard: TEditButton;
    Layout20: TLayout;
    UnityColorCodeTitle: TLabel;
    UnityColorCode: TEdit;
    UnityColorCodeCopyToClipboard: TEditButton;
    Layout21: TLayout;
    HTMLColorCodeTitle: TLabel;
    HTMLColorCode: TEdit;
    HTMLColorCodeCopyToClipboard: TEditButton;
    Layout22: TLayout;
    ClarionColorCodeTitle: TLabel;
    ClarionColorCode: TEdit;
    ClarionColorCodeCopyToClipboard: TEditButton;
    Layout23: TLayout;
    DelphiFMXColorCodeTitle: TLabel;
    DelphiFMXColorCode: TEdit;
    DelphiFMXColorCodeCopyToClipboard: TEditButton;
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
    LeftPanel: TLayout;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    ColorListBox1: TColorListBox;
    SearchBox1: TSearchBox;
    TabItem2: TTabItem;
    lstboxSavedColorsRGBA: TListBox;
    lstboxSavedColors: TListBox;
    SearchBox2: TSearchBox;
    btnAddCustomColor: TButton;
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
    Splitter2: TSplitter;
    ImageList1: TImageList;
    btnEyeDropper: TButton;
    imgEyeDropper: TSkSvg;
    procedure ColorPanelChange(Sender: TObject);
    procedure ColorRangeClick(Sender: TObject);
    procedure ColorListBox1ItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
    procedure lstboxSavedColorsItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
    procedure btnAddCustomColorClick(Sender: TObject);
    procedure Layout_cs_rgbaClick(Sender: TObject);
    procedure Layout_cs_cmykClick(Sender: TObject);
    procedure Layout_cs_hsvClick(Sender: TObject);
    procedure Layout_cs_hslClick(Sender: TObject);
    procedure Layout_cs_cielabClick(Sender: TObject);
    procedure Layout_cs_xyzClick(Sender: TObject);
    procedure Layout_cs_yxyClick(Sender: TObject);
    procedure Layout_cs_hunterlabClick(Sender: TObject);
    procedure tbRedChange(Sender: TObject);
    procedure tbCyan_cmykChange(Sender: TObject);
    procedure tbHue_hsvChange(Sender: TObject);
    procedure tbSaturation_hslChange(Sender: TObject);
    procedure tbX_xzyChange(Sender: TObject);
    procedure CopyColorCodeToClipboard(Sender: TObject);
    procedure FrameResized(Sender: TObject);
    procedure btnEyeDropperClick(Sender: TObject);
  private
    cLastEyeDropperColor: TAlphaColor;

    procedure LoadSavedColorsClick(Sender: TObject);
    procedure CopyColorCode(Sender: TObject);
    procedure frmImageClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure frmImageMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure PopulateColorPickerColorRange;
    procedure UpdateColorPickerSelectors;
    procedure WriteColorPickerCodes;
    procedure ColorSpacesExpand(Sender: TObject; MainLayout: TLayout; SelectorLayout: TCalloutPanel; ExpandImage: TImage; SelectorCount: Byte);

    property LastEyeDropperColor: TAlphaColor read cLastEyeDropperColor write cLastEyeDropperColor;
  end;

implementation

{$R *.fmx}

{ TFrame_ColorPicker }

procedure TFrame_ColorPicker.btnAddCustomColorClick(Sender: TObject);
begin
//  InputQuery('Save Color', ['Give it a name:'], [''],
//    procedure(const AResult: TModalResult; const AValues: array of string)
//    begin
//      var txtSavedColors := System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath, 'txtSavedColors.txt');
//      var StringList := TStringList.Create;
//      StringList.LoadFromFile(txtSavedColors);
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
//      StringList.Free;
//    end);
end;

procedure TFrame_ColorPicker.frmImageMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
begin
  TForm(TImage(Sender).Parent).Caption := Format('Select Color (X: %n | Y: %n)',[X,Y]);
end;

procedure TFrame_ColorPicker.frmImageClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  BitmapData: TBitmapData;
begin
  TImage(Sender).Bitmap.Map(TMapAccess.Read, BitmapData);
  try
    LastEyeDropperColor := BitmapData.GetPixel(Round(X), Round(Y));
  finally
    TImage(Sender).Bitmap.Unmap(BitmapData);
    TForm(TImage(Sender).Parent).ModalResult := mrOk;
  end;
end;

procedure TFrame_ColorPicker.btnEyeDropperClick(Sender: TObject);
begin
  {$IF DEFINED(ANDROID)}
    ShowMessage('Not supported on Android');
  {$ELSE}
    var bm := TBitmap.Create;
    TakeScreenshot(bm);

    var frmImageColor := TForm.CreateNew(Self);
    frmImageColor.Caption := 'Select Color';
    frmImageColor.BorderStyle := TFMXFormBorderStyle.ToolWindow;
    frmImageColor.WindowState := TWindowState.wsMaximized;

    var frmImage := TImage.Create(frmImageColor);
    frmImage.Parent := frmImageColor;
    frmImage.Align := TAlignLayout.Client;
    frmImage.WrapMode := TImageWrapMode.Original;
    frmImage.Cursor := crCross;
    frmImage.OnMouseDown := frmImageClick;
    frmImage.OnMouseMove := frmImageMouseMove;
    frmImage.Bitmap.Assign(bm);
    bm.Free;
    bm := nil;

    try
      if (frmImageColor.ShowModal = mrOk) then
      begin
        ColorPanel.Color := LastEyeDropperColor;
      end;
    finally
      FreeAndNil(frmImage);
      FreeAndNil(frmImageColor);
    end;
  {$ENDIF}
end;

procedure TFrame_ColorPicker.ColorListBox1ItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
begin
  var sSearch := SearchBox1.Text;
  SearchBox1.Text := '';
  ColorListBox1.ItemIndex := ColorListBox1.Items.IndexOf(Item.Text);
  ColorPanel.Color := ColorListBox1.Color;
  SearchBox1.Text := sSearch;
end;

procedure TFrame_ColorPicker.ColorPanelChange(Sender: TObject);
begin
  Layout_ColorSpace.Stroke.Color := ColorBox.Color;
  Layout_BaseNumbers.Stroke.Color := ColorBox.Color;
  Layout_ColorCodes.Stroke.Color := ColorBox.Color;
  Layout_ColorInformation.Stroke.Color := ColorBox.Color;
  WriteColorPickerCodes();
  UpdateColorPickerSelectors();
  PopulateColorPickerColorRange();
end;

procedure TFrame_ColorPicker.ColorRangeClick(Sender: TObject);
begin
  ColorPanel.Color := (Sender as TRectangle).Fill.Color;
end;

procedure TFrame_ColorPicker.ColorSpacesExpand(Sender: TObject; MainLayout: TLayout; SelectorLayout: TCalloutPanel;
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

constructor TFrame_ColorPicker.Create(AOwner: TComponent);
begin
  inherited;

  ColorTabControl.ActiveTab := tabColorPanel;
  TabControl1.ActiveTab := TabItem1;  // Need to rename these controls at some point coz idk wtf TabControl1/TabItem1 is
  Layout_cs_rgbaClick(Self);
  Layout_cs_hslClick(Self);
  Layout_cs_hsvClick(Self);
  Layout_cs_cmykClick(Self);
  Layout_cs_xyzClick(Self);
  Layout_cs_yxyClick(Self);
  Layout_cs_hunterlabClick(Self);
  Layout_cs_cielabClick(Self);
  PopulateColorPickerColorRange;
end;

procedure TFrame_ColorPicker.CopyColorCode(Sender: TObject);
begin

end;

procedure TFrame_ColorPicker.CopyColorCodeToClipboard(Sender: TObject);
begin
  ((Sender as TEditButton).Parent.Parent as TEdit).SelectAll;
  ((Sender as TEditButton).Parent.Parent as TEdit).CopyToClipboard;

  {$IFDEF ANDROID}
    ShowMessage(((Sender as TEditButton).Parent.Parent as TEdit).Text + ' copied to clipboard.');
  {$ENDIF ANDROID}
end;

procedure TFrame_ColorPicker.FrameResized(Sender: TObject);
begin
  {$IF DEFINED(ANDROID)}
    btnEyeDropper.Visible := False;
  {$ENDIF}
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

procedure TFrame_ColorPicker.Layout_cs_cielabClick(Sender: TObject);
begin
  ColorSpacesExpand(Sender, Layout_cs_CIELab_main, cPanel_CIELab_Selector, ImageCIELab, 3);
end;

procedure TFrame_ColorPicker.Layout_cs_cmykClick(Sender: TObject);
begin
  ColorSpacesExpand(Sender, Layout_cs_cmyk_main, cPanel_CMYK_Selector, ImageCMYK, 4);
end;

procedure TFrame_ColorPicker.Layout_cs_hslClick(Sender: TObject);
begin
  ColorSpacesExpand(Sender, Layout_cs_hsl_main, cPanel_HSL_Selector, ImageHSL, 3);
end;

procedure TFrame_ColorPicker.Layout_cs_hsvClick(Sender: TObject);
begin
  ColorSpacesExpand(Sender, Layout_cs_hsv_main, cPanel_HSV_Selector, ImageHSV, 3);
end;

procedure TFrame_ColorPicker.Layout_cs_hunterlabClick(Sender: TObject);
begin
  ColorSpacesExpand(Sender, Layout_cs_HunterLab_main, cPanel_HunterLab_Selector, ImageHunterLab, 3);
end;

procedure TFrame_ColorPicker.Layout_cs_rgbaClick(Sender: TObject);
begin
  ColorSpacesExpand(Sender, Layout_cs_rgba_main, cPanel_RGBA_Selector, ImageRGBA, 4);
end;

procedure TFrame_ColorPicker.Layout_cs_xyzClick(Sender: TObject);
begin
  ColorSpacesExpand(Sender, Layout_cs_xyz_main, cPanel_xyz_Selector, ImageXYZ, 3);
end;

procedure TFrame_ColorPicker.Layout_cs_yxyClick(Sender: TObject);
begin
  ColorSpacesExpand(Sender, Layout_cs_yxy_main, cPanel_yxy_Selector, ImageYxy, 3);
end;

procedure TFrame_ColorPicker.LoadSavedColorsClick(Sender: TObject);
begin
//  TabControl1.ActiveTab := TabItem2;
//  lstboxSavedColors.Clear;
//  lstboxSavedColorsRGBA.Clear;
//
//  AssignFile(txtSavedColorsFile,txtSavedColors);
//  Reset(txtSavedColorsFile);
//
//  while not eof(txtSavedColorsFile) do
//  begin
//    ReadLn(txtSavedColorsFile,DummyStr);
//    lstboxSavedColors.Items.Add(Copy(DummyStr,1,pos('~',DummyStr)-1));
//    lstboxSavedColorsRGBA.Items.Add(Copy(DummyStr,pos('~',DummyStr)+1,DummyStr.Length));
//  end;
//
//  CloseFile(txtSavedColorsFile);
//
//  if (btnPredefinedCustom.Visible) then
//    btnPredefinedCustomClick(Sender)
//  else
//    btnHomeClick(Sender);
end;

procedure TFrame_ColorPicker.lstboxSavedColorsItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
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

procedure TFrame_ColorPicker.PopulateColorPickerColorRange;
var
  col: TAlphaColorRec;
  iColorValue: integer;
  iColorRange, iColorCount: integer;
begin
  // What I'm doing here with the ColorRange Stuff is absolute kak
  // Need to change this in the future 🥲

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

procedure TFrame_ColorPicker.tbCyan_cmykChange(Sender: TObject);
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

procedure TFrame_ColorPicker.tbHue_hsvChange(Sender: TObject);
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

procedure TFrame_ColorPicker.tbRedChange(Sender: TObject);
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

procedure TFrame_ColorPicker.tbSaturation_hslChange(Sender: TObject);
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

procedure TFrame_ColorPicker.tbX_xzyChange(Sender: TObject);
var
  col: TAlphaColor;
  R, G, B: Byte;
begin
  if not(Sender is THueTrackBar) then
    TEdit(TTrackBar(Sender).Parent.Children.Items[1]).Text := TTrackBar(Sender).Value.ToString;
  XYZToRGB(edtX_xyz.Text.ToSingle, edtY_xyz.Text.ToSingle, edtZ_xyz.Text.ToSingle, R, G, B);

//  var NeedToTestThisValueInDebugMode := (R.ToString + '#' + G.ToString + '#' + B.ToString + '#');
  col := MakeColor(R,G,B);
  ColorPanel.Color := col;
end;

procedure TFrame_ColorPicker.UpdateColorPickerSelectors;
var
  H, s, L: Single;
  C, M, Y, K: Single;
begin
  tbRed.OnChange := Nil;
  tbGreen.OnChange := Nil;
  tbBlue.OnChange := Nil;
  tbAlpha.OnChange := Nil;
  tbHue_hsl.OnChange := Nil;
  tbSaturation_hsl.OnChange := Nil;
  tbLightness_hsl.OnChange := Nil;
  tbHue_hsv.OnChange := Nil;
  tbSaturation_hsv.OnChange := Nil;
  tbValue_hsv.OnChange := Nil;
  tbCyan_cmyk.OnChange := Nil;
  tbMagenta_cmyk.OnChange := Nil;
  tbYellow_cmyk.OnChange := Nil;
  tbBlack_cmyk.OnChange := Nil;
  tbX_xzy.OnChange := Nil;
  tbY_xzy.OnChange := Nil;
  tbZ_xzy.OnChange := Nil;
  tbY_yxy.OnChange := Nil;
  tbX_yxy.OnChange := Nil;
  tbY2_yxy.OnChange := Nil;
  tbL_HunterLab.OnChange := Nil;
  tbA_HunterLab.OnChange := Nil;
  tbB_HunterLab.OnChange := Nil;
  tbL_CIELab.OnChange := Nil;
  tbA_CIELab.OnChange := Nil;
  tbB_CIELab.OnChange := Nil;

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

procedure TFrame_ColorPicker.WriteColorPickerCodes;
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
  DelphiVCLColorCode.Text := '$' + IntToHex(TAlphaColorRec.ColorToRGB(ColorBox.Color));
  DelphiFMXColorCode.Text := '$' + IntToHex(A) + HexCode;
  VBColorCode.Text := IntToStr(TAlphaColorRec.ColorToRGB(ColorBox.Color));
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

    DelphiVCLColorCodeCopyToClipboard.Visible := FALSE;
    CPPColorCodeCopyToClipboard.Visible := FALSE;
    JavaColorPickerCopyToClipboard.Visible := FALSE;
    VBColorCodeCopyToClipboard.Visible := FALSE;
    VBHexColorCodeCopyToClipboard.Visible := FALSE;
    PhotoshopColorCodeCopyToClipboard.Visible := FALSE;
    ClarionColorCodeCopyToClipboard.Visible := FALSE;

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

    DelphiVCLColorCodeCopyToClipboard.Visible := TRUE;
    CPPColorCodeCopyToClipboard.Visible := TRUE;
    JavaColorPickerCopyToClipboard.Visible := TRUE;
    VBColorCodeCopyToClipboard.Visible := TRUE;
    VBHexColorCodeCopyToClipboard.Visible := TRUE;
    PhotoshopColorCodeCopyToClipboard.Visible := TRUE;
    ClarionColorCodeCopyToClipboard.Visible := TRUE;

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
  ////////////////////////////////////////////////////////////////////////////////

  ////////////////////////////////////////////////////////////////////////////////
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
  ////////////////////////////////////////////////////////////////////////////////

  ////////////////////////////////////////////////////////////////////////////////
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
  ////////////////////////////////////////////////////////////////////////////////
end;

end.
