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

  System.Skia,
  FMX.Skia,

  uBootstrapIcons
  ;

type
  TFrame_BootstrapIcons = class(TFrame)
    layIcons: TVertScrollBox;
    layIconsGrid: TGridLayout;
    layDetails: TLayout;
    layTop: TLayout;
    lblTitle: TLabel;
    btnBack: TButton;
    imgBack: TSkSvg;
    layIcon: TRectangle;
    imgIcon: TSkSvg;
    layOutput: TLayout;
    memTitleOutput: TLabel;
    btnOutputCopyToClipboard: TButton;
    imgOutputCopyToClipboard: TSkSvg;
    lblOutputCopyToClipboard: TLabel;
    memOutput: TMemo;
    procedure FrameResized(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure IconButtonClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnOutputCopyToClipboardClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_BootstrapIcons.btnBackClick(Sender: TObject);
begin
  lblTitle.Text := 'https://icons.getbootstrap.com/';
  btnBack.Visible := False;
  layIcons.Visible := True;
  layDetails.Visible := False;
end;

procedure TFrame_BootstrapIcons.btnOutputCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memOutput.Text);
end;

procedure TFrame_BootstrapIcons.FrameResize(Sender: TObject);
begin
  layIconsGrid.Height := Round(Length(BootstrapIconsArray) / Round(layIconsGrid.Width / layIconsGrid.ItemWidth)) * layIconsGrid.ItemHeight;
end;

procedure TFrame_BootstrapIcons.FrameResized(Sender: TObject);
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
    for var bIcon in BootstrapIconsArray do
      CreateIconButton(bIcon.name, bIcon.svg);

  layIconsGrid.Height := Round(Length(BootstrapIconsArray) / Round(layIconsGrid.Width / layIconsGrid.ItemWidth)) * layIconsGrid.ItemHeight;
end;

procedure TFrame_BootstrapIcons.IconButtonClick(Sender: TObject);
begin
  var SVGCode := GetBootstrapIcon(TButton(Sender).Hint);
  imgIcon.Svg.Source := SVGCode;
  memOutput.Text := SVGCode;
  lblTitle.Text := TButton(Sender).Hint;
  btnBack.Visible := True;
  layIcons.Visible := False;
  layDetails.Visible := True;
end;

end.
