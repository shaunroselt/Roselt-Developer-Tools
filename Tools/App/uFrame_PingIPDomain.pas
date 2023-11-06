unit uFrame_PingIPDomain;

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
  FMX.Skia,

  Roselt.Clipboard;

type
  TFrame_PingIPDomain = class(TFrame)
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
    IdIcmpClient: TIdIcmpClient;
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
    procedure btnOutputCopyToClipboardClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
  private
    { Private declarations }
    procedure PingIPDomain();
  public
    { Public declarations }
  end;


implementation


{$R *.fmx}

procedure TFrame_PingIPDomain.btnOutputCopyToClipboardClick(Sender: TObject);
begin
  CopyToClipboard(memOutput.Text);
end;

procedure TFrame_PingIPDomain.btnRefreshClick(Sender: TObject);
begin
  PingIPDomain();
end;

procedure TFrame_PingIPDomain.PingIPDomain;
begin
  memOutput.Lines.Clear;

  IdIcmpClient.ReceiveTimeout := Round(sbTimeout.Value);
  IdIcmpClient.PacketSize := Round(sbPacketSize.Value);
  IdIcmpClient.Host := edtIPDomain.Text;

  memOutput.Lines.Add('Pings:');
  memOutput.Lines.Add('======================================');

  var AvgTime: Double := 0.0;
  var PingTimes := TList<Double>.Create;

  for var I := 1 to Round(sbPingCount.Value) do
  begin
    IdIcmpClient.Ping();
    if IdIcmpClient.ReplyStatus.ReplyStatusType = rsEcho then
    begin
      var RoundTripTime := IdIcmpClient.ReplyStatus.MsRoundTripTime;
      PingTimes.Add(RoundTripTime);
      memOutput.Lines.Add('Reply from ' + IdIcmpClient.ReplyStatus.FromIpAddress + ': time=' + RoundTripTime.ToString + 'ms');
    end
    else if IdIcmpClient.ReplyStatus.ReplyStatusType = rsTimeout then
      memOutput.Lines.Add('Ping request timed out')
    else
      memOutput.Lines.Add('Ping request failed');
  end;


  PingTimes.Sort;
  for var I := 1 to PingTimes.Count-1 do
    AvgTime := AvgTime + PingTimes.Items[I];
  AvgTime := AvgTime / PingTimes.Count;


  memOutput.Lines.Add('======================================');
  memOutput.Lines.Add('Statistics:');
  memOutput.Lines.Add('======================================');
  memOutput.Lines.Add('Min Time: ' + PingTimes.First.ToString + 'ms');
  memOutput.Lines.Add('Max Time: ' + PingTimes.Last.ToString + 'ms');
  memOutput.Lines.Add('Avg Time: ' + AvgTime.ToString + 'ms');

end;

end.
