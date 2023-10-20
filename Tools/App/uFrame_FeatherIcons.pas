unit uFrame_FeatherIcons;

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

  System.Skia,
  FMX.Skia,

  Roselt.Utility,

  uFeatherIcons
  ;

type
  TFrame_FeatherIcons = class(TFrame)
    layIcons: TVertScrollBox;
    layIconsGrid: TGridLayout;
    layDetailsLeft: TLayout;
    layTop: TLayout;
    lblTitle: TLabel;
    btnBack: TButton;
    imgBack: TSkSvg;
    layIcon: TRectangle;
    svgIcon: TSkSvg;
    layDetails: TGridPanelLayout;
    layDetailsRight: TLayout;
    Layout2: TLayout;
    Label1: TLabel;
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
    procedure FrameResized(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure IconButtonClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnCopyToClipboardSVGCodeClick(Sender: TObject);
    procedure btnCopyToClipboardHTMLIconFontClick(Sender: TObject);
    procedure lblTitleClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_FeatherIcons.btnBackClick(Sender: TObject);
begin
  lblTitle.Text := 'https://icons.getFeather.com/';
  btnBack.Visible := False;
  layIcons.Visible := True;
  layDetails.Visible := False;
end;

procedure TFrame_FeatherIcons.btnCopyToClipboardSVGCodeClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memSVGCode.Text);
end;

procedure TFrame_FeatherIcons.btnCopyToClipboardHTMLIconFontClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memHTMLIconFont.Text);
end;

procedure TFrame_FeatherIcons.FrameResize(Sender: TObject);
begin
  layIconsGrid.Height := Round(Length(FeatherIconsArray) / Round(layIconsGrid.Width / layIconsGrid.ItemWidth)) * layIconsGrid.ItemHeight;
end;

procedure TFrame_FeatherIcons.FrameResized(Sender: TObject);
  procedure CreateIconButton(IconName, IconSVG: String);
  begin
    var btn := TButton.Create(Application);
    btn.name := IconName.Replace('-','_',[rfReplaceAll]).Trim(['0','1','2','3','4','5','6','7','8','9',' ','-','_', #9, #10, #13]) + '_' + Random(High(Integer)).ToString;
    btn.Text := '';
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
  if (layIconsGrid.ControlsCount = 0) then
    for var bIcon in FeatherIconsArray do
      CreateIconButton(bIcon.name, bIcon.svg);

  layIconsGrid.Height := Round(Length(FeatherIconsArray) / Round(layIconsGrid.Width / layIconsGrid.ItemWidth)) * layIconsGrid.ItemHeight;
end;

procedure TFrame_FeatherIcons.IconButtonClick(Sender: TObject);
begin
  var SVGCode := GetFeatherIcon(TButton(Sender).Hint);
  svgIcon.Svg.Source := SVGCode;
  svgExamplesHeading.Svg.Source := SVGCode;
  svgExamplesSmallerHeading.Svg.Source := SVGCode;
  svgExamplesInlineText.Svg.Source := SVGCode;
  svgExamplesInlineLinkText.Svg.Source := SVGCode;
  svgExamplesButton.Svg.Source := SVGCode;
  lblIconName.Text := TButton(Sender).Hint.Replace('-', ' ', [rfReplaceAll]);
  memSVGCode.Text := SVGCode;
  memHTMLIconFont.Text := '<i data-feather="' + TButton(Sender).Hint + '"></i>';
  lblTitle.Text := TButton(Sender).Hint;
  btnBack.Visible := True;
  layIcons.Visible := False;
  layDetails.Visible := True;
end;

procedure TFrame_FeatherIcons.lblTitleClick(Sender: TObject);
begin
  OpenURL(TLabel(Sender).Text);
end;

end.
