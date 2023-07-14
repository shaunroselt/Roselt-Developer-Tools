// Look at https://github.com/paolo-rossi/delphi-jose-jwt
unit uFrame_JWTDecoder;

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
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Memo.Types,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.Platform,
  FMX.Controls.Presentation,
  FMX.Layouts,
  FMX.Objects,
  System.Skia,
  FMX.Skia;

type
  TFrame_JWTDecoder = class(TFrame)
    layBottom: TLayout;
    layHeader: TLayout;
    memTitleHeader: TLabel;
    memHeader: TMemo;
    layPayload: TLayout;
    memTitlePayload: TLabel;
    memPayload: TMemo;
    layTop: TLayout;
    layJWTToken: TLayout;
    lblJWTToken: TLabel;
    memJWTToken: TMemo;
    btnInputPasteFromClipboard: TButton;
    imgInputPasteFromClipboard: TSkSvg;
    lblInputPasteFromClipboard: TLabel;
    btnInputCopyToClipboard: TButton;
    imgInputCopyToClipboard: TSkSvg;
    lblInputCopyToClipboard: TLabel;
    btnHeaderCopyToClipboard: TButton;
    imgHeaderCopyToClipboard: TSkSvg;
    lblHeaderCopyToClipboard: TLabel;
    btnPayloadCopyToClipboard: TButton;
    imgPayloadCopyToClipboard: TSkSvg;
    lblPayloadCopyToClipboard: TLabel;
    btnInputLoad: TButton;
    imgInputLoad: TSkSvg;
    lblInputLoad: TLabel;
    btnInputClear: TButton;
    imgInputClear: TSkSvg;
    lblInputClear: TLabel;
    OpenDialog: TOpenDialog;
    procedure btnInputPasteFromClipboardClick(Sender: TObject);
    procedure btnInputCopyToClipboardClick(Sender: TObject);
    procedure btnHeaderCopyToClipboardClick(Sender: TObject);
    procedure btnPayloadCopyToClipboardClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_JWTDecoder.btnHeaderCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memHeader.Text);
end;

procedure TFrame_JWTDecoder.btnInputCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memJWTToken.Text);
end;

procedure TFrame_JWTDecoder.btnInputPasteFromClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    memJWTToken.Text := ClipboardService.GetClipboard.ToString;
end;

procedure TFrame_JWTDecoder.btnPayloadCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memPayload.Text);
end;

end.
