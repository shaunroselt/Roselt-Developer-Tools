unit uFrame_BootstrapIcons;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Platform,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.Memo.Types,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.Colors,
  FMX.Edit,

  System.Skia,
  FMX.Skia,

  Roselt.Utility,

  uBootstrapIcons
  ;

type
  TFrame_BootstrapIcons = class(TFrame)
    layIcons: TVertScrollBox;
    layIconsGrid1: TGridLayout;
    layDetailsLeft: TLayout;
    layTop: TLayout;
    lblTitle: TLabel;
    btnBack: TButton;
    imgBack: TSkSvg;
    layIcon: TRectangle;
    svgIcon: TSkSvg;
    layDetails: TGridPanelLayout;
    layDetailsRight: TLayout;
    layHTMLIconFont: TLayout;
    memTitleHTMLIconFont: TLabel;
    btnCopyToClipboardHTMLIconFont: TButton;
    imgCopyToClipboardHTMLIconFont: TSkSvg;
    lblCopyToClipboardHTMLIconFont: TLabel;
    memHTMLIconFont: TMemo;
    laySVGCode: TLayout;
    memTitleSVGCode: TLabel;
    btnCopyToClipboardSVGCode: TButton;
    imgCopyToClipboardSVGCode: TSkSvg;
    lblCopyToClipboardSVGCode: TLabel;
    memSVGCode: TMemo;
    lblIconName: TLabel;
    lblExamples: TLabel;
    layExamples: TRectangle;
    layExamplesHeading: TLayout;
    svgExamplesHeading: TSkSvg;
    Label4: TLabel;
    layExamplesSmallerHeading: TLayout;
    svgExamplesSmallerHeading: TSkSvg;
    Label5: TLabel;
    layExamplesInlineText: TLayout;
    Label6: TLabel;
    svgExamplesInlineText: TSkSvg;
    layExamplesInlineLinkText: TLayout;
    Label7: TLabel;
    svgExamplesInlineLinkText: TSkSvg;
    layExamplesButton: TLayout;
    Button2: TButton;
    svgExamplesButton: TSkSvg;
    Label8: TLabel;
    layIconColor: TLayout;
    cbTitleIconColor: TLabel;
    btnCopyToClipboardIconColor: TButton;
    imgCopyToClipboardIconColor: TSkSvg;
    lblCopyToClipboardIconColor: TLabel;
    cbIconColor: TComboColorBox;
    edtSearchIcons: TEdit;
    SearchEditButton1: TSearchEditButton;
    layIconsHidden: TLayout;
    layIconsGrid: TFlowLayout;
    SearchDelayTimer: TTimer;
    procedure FrameResized(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure IconButtonClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnCopyToClipboardSVGCodeClick(Sender: TObject);
    procedure btnCopyToClipboardHTMLIconFontClick(Sender: TObject);
    procedure lblTitleClick(Sender: TObject);
    procedure btnCopyToClipboardIconColorClick(Sender: TObject);
    procedure edtSearchIconsChange(Sender: TObject);
    procedure edtSearchIconsKeyUp(Sender: TObject; var Key: Word; var KeyChar: WideChar; Shift: TShiftState);
    procedure SearchDelayTimerTimer(Sender: TObject);
  private
    { Private declarations }
    IconButtonsCreated: Boolean;
    procedure AllIconsSearch();
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_BootstrapIcons.AllIconsSearch;
begin
  for var bIcon in BootstrapIconsArray do
  begin
    var IconBackendName := ReplaceDigitsWithWords(bIcon.name.Replace('-','_',[rfReplaceAll]).Trim([' ','-','_', #9, #10, #13]));
    TButton(layIcons.FindComponent(IconBackendName)).Visible := bIcon.name.ToLower.Contains(edtSearchIcons.Text.ToLower);
  end;
  FrameResize(nil);
end;

procedure TFrame_BootstrapIcons.btnBackClick(Sender: TObject);
begin
  lblTitle.Text := 'https://icons.getbootstrap.com/';
  btnBack.Visible := False;
  layIcons.Visible := True;
  layDetails.Visible := False;
end;

procedure TFrame_BootstrapIcons.btnCopyToClipboardSVGCodeClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memSVGCode.Text);
end;

procedure TFrame_BootstrapIcons.edtSearchIconsChange(Sender: TObject);
begin
  SearchDelayTimer.Enabled := False;
  SearchDelayTimer.Enabled := True;
end;

procedure TFrame_BootstrapIcons.edtSearchIconsKeyUp(Sender: TObject; var Key: Word; var KeyChar: WideChar;
  Shift: TShiftState);
begin
  SearchDelayTimer.Enabled := False;
  SearchDelayTimer.Enabled := True;
end;

procedure TFrame_BootstrapIcons.btnCopyToClipboardHTMLIconFontClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memHTMLIconFont.Text);
end;

procedure TFrame_BootstrapIcons.btnCopyToClipboardIconColorClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(cbIconColor.Color);
end;

procedure TFrame_BootstrapIcons.FrameResize(Sender: TObject);
begin
  layIconsGrid.Height := Round(Length(BootstrapIconsArray) / Round(layIconsGrid.Width / 150)) * 150;
end;

procedure TFrame_BootstrapIcons.FrameResized(Sender: TObject);
  procedure CreateIconButton(IconName, IconSVG: String);
  begin
    var btn := TButton.Create(layIcons);
    btn.name := ReplaceDigitsWithWords(IconName.Replace('-','_',[rfReplaceAll]).Trim([' ','-','_', #9, #10, #13]));
    btn.Text := '';
    btn.Width := 150;
    btn.Height := 150;
    btn.Parent := layIconsGrid;
    btn.Margins.Top := 16;
    btn.Margins.Left := 16;
    btn.Padding.Top := 12;
    btn.Padding.Right := 12;
    btn.Padding.Bottom := 6;
    btn.Padding.Left := 12;
    btn.Cursor := crHandPoint;
    btn.OnClick := IconButtonClick;
    btn.Hint := IconName;

    var btnIcon := TSkSvg.Create(btn);
    btnIcon.Parent := btn;
    btnIcon.Name := btn.name + '_svg';
    btnIcon.Align := TAlignLayout.Top;
    btnIcon.Margins.Top := 6;
    btnIcon.Margins.Right := 6;
    btnIcon.Margins.Bottom := 6;
    btnIcon.Margins.Left := 6;
    btnIcon.Svg.OverrideColor := TAlphaColors.White;
    btnIcon.Svg.Source := IconSVG;

    var btnLabel := TLabel.Create(btn);
    btnLabel.Parent := btn;
    btnLabel.Name := btn.name + '_label';
    btnLabel.Align := TAlignLayout.Client;
    btnLabel.Text := IconName;
    btnLabel.TextSettings.Font.Size := 13;
    btnLabel.TextSettings.WordWrap := True;
    btnLabel.TextSettings.HorzAlign := TTextAlign.Center;
    btnLabel.StyledSettings := [TStyledSetting.Family,TStyledSetting.FontColor];
  end;
begin
  if (IconButtonsCreated = False) then
  begin
    layDetails.Visible := False;
    if (layIconsGrid.ControlsCount = 0) then
      for var bIcon in BootstrapIconsArray do
        CreateIconButton(bIcon.name, bIcon.svg);
    IconButtonsCreated := True;
  end;

  FrameResize(nil);
end;

procedure TFrame_BootstrapIcons.IconButtonClick(Sender: TObject);
begin
  var SVGCode := '';
  if (Sender is TButton) then
  begin
    lblTitle.Text := TButton(Sender).Hint;
    lblIconName.Text := TButton(Sender).Hint.Replace('-', ' ', [rfReplaceAll]);
    btnBack.Visible := True;
    layIcons.Visible := False;
    layDetails.Visible := True;
    cbIconColor.Color := TAlphaColors.White;
    SVGCode := GetBootstrapIcon(lblTitle.Text);
    memHTMLIconFont.Text := GetBootstrapIconHtmlFont(lblTitle.Text);
  end else if (Sender is TComboColorBox) then
  begin
    SVGCode := GetBootstrapIcon(lblTitle.Text,16,'#'+IntToHex(cbIconColor.Color, 8).Substring(2));
    memHTMLIconFont.Text := GetBootstrapIconHtmlFont(lblTitle.Text,16,'#'+IntToHex(cbIconColor.Color, 8).Substring(2));
  end;

  svgIcon.Svg.Source := SVGCode;
  svgExamplesHeading.Svg.Source := SVGCode;
  svgExamplesSmallerHeading.Svg.Source := SVGCode;
  svgExamplesInlineText.Svg.Source := SVGCode;
  svgExamplesInlineLinkText.Svg.Source := SVGCode;
  svgExamplesButton.Svg.Source := SVGCode;
  memSVGCode.Text := SVGCode;
  svgIcon.Svg.OverrideColor := cbIconColor.Color;
  svgExamplesHeading.Svg.OverrideColor := cbIconColor.Color;
  svgExamplesSmallerHeading.Svg.OverrideColor := cbIconColor.Color;
  svgExamplesInlineText.Svg.OverrideColor := cbIconColor.Color;
  svgExamplesButton.Svg.OverrideColor := cbIconColor.Color;
end;

procedure TFrame_BootstrapIcons.lblTitleClick(Sender: TObject);
begin
  OpenURL(TLabel(Sender).Text);
end;

procedure TFrame_BootstrapIcons.SearchDelayTimerTimer(Sender: TObject);
begin
  TTimer(Sender).Enabled := False;
  AllIconsSearch;
end;

end.
