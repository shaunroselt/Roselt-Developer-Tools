unit uFrame_TraceRoute;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.DateUtils,
  System.Generics.Collections,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Platform,
  FMX.Layouts,
  FMX.Edit,
  FMX.Controls.Presentation,
  FMX.Memo.Types,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.ListBox,
  FMX.EditBox,
  FMX.SpinBox,
  FMX.Objects,

  IdBaseComponent,
  IdComponent,
  IdRawBase,
  IdRawClient,
  IdIcmpClient,

  System.Skia,
  FMX.Skia, IdTraceRoute;

type
  TFrame_TraceRoute = class(TFrame)
    layBottom: TLayout;
    memTitleOutput: TLabel;
    btnRefresh: TButton;
    imgRefresh: TSkSvg;
    lblRefresh: TLabel;
    btnOutputCopyToClipboard: TButton;
    imgOutputCopyToClipboard: TSkSvg;
    lblOutputCopyToClipboard: TLabel;
    memOutput: TMemo;
    layTop: TLayout;
    lblConfiguration: TLabel;
    layTimeout: TRectangle;
    imgTimeout: TSkSvg;
    layTitleDescriptionTimeout: TLayout;
    lblTitleTimeout: TLabel;
    lblDescriptionTimeout: TLabel;
    sbTimeout: TSpinBox;
    layIPDomain: TLayout;
    lblIPDomainPing: TLabel;
    edtIPDomain: TEdit;
    layPacketSize: TRectangle;
    imgPacketSize: TSkSvg;
    layTitleDescriptionPacketSize: TLayout;
    lblTitlePacketSize: TLabel;
    lblDescriptionPacketSize: TLabel;
    sbPacketSize: TSpinBox;
    edtIPDomainButton: TEditButton;
    edtIPDomainButtonLabel: TLabel;
    edtIPDomainButtonImage: TSkSvg;
    layPingCount: TRectangle;
    imgPingCount: TSkSvg;
    layTitleDescriptionPingCount: TLayout;
    lblTitlePingCount: TLabel;
    lblDescriptionPingCount: TLabel;
    sbPingCount: TSpinBox;
    IdTraceRoute: TIdTraceRoute;
    procedure btnOutputCopyToClipboardClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure IdTraceRouteReply(ASender: TComponent; const AReplyStatus: TReplyStatus);
  private
    { Private declarations }
    procedure TraceRoute();
  public
    { Public declarations }
  end;


implementation


{$R *.fmx}

procedure TFrame_TraceRoute.btnOutputCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memOutput.Text);
end;

procedure TFrame_TraceRoute.btnRefreshClick(Sender: TObject);
begin
  TraceRoute();
end;

procedure TFrame_TraceRoute.TraceRoute;
begin
  memOutput.Lines.Clear;

  IdTraceRoute.ReceiveTimeout := Round(sbTimeout.Value);
  IdTraceRoute.PacketSize := Round(sbPacketSize.Value);
  IdTraceRoute.Host := edtIPDomain.Text;

  memOutput.Lines.Add('Pings:');
  memOutput.Lines.Add('======================================');

  IdTraceRoute.Trace();
end;

procedure TFrame_TraceRoute.IdTraceRouteReply(ASender: TComponent; const AReplyStatus: TReplyStatus);
begin
  if AReplyStatus.ReplyStatusType = rsEcho then
  begin
    var RoundTripTime := AReplyStatus.MsRoundTripTime;
    memOutput.Lines.Add('Reply from ' + AReplyStatus.FromIpAddress + ': time=' + RoundTripTime.ToString + 'ms');
  end
  else if AReplyStatus.ReplyStatusType = rsTimeout then
    memOutput.Lines.Add('Ping request timed out')
  else
    memOutput.Lines.Add('Ping request failed');
end;

end.
