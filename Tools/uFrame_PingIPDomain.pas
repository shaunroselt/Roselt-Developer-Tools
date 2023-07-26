unit uFrame_PingIPDomain;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.DateUtils,
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

  Ping,

  System.Skia,
  FMX.Skia;

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
    edtIPDomainButton: TEditButton;
    edtIPDomainButtonLabel: TLabel;
    edtIPDomainButtonImage: TSkSvg;
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
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memOutput.Text);
end;

procedure TFrame_PingIPDomain.btnRefreshClick(Sender: TObject);
begin
  PingIPDomain();
end;

procedure TFrame_PingIPDomain.PingIPDomain;
var
  PingResult: TPingStatistics;
begin
  memOutput.Lines.Clear;
  if (edtIPDomain.Text.IndexOf('.') > -1) then
  begin
    PingResult := Ping.PingHost(AnsiString(edtIPDomain.Text),Round(sbTimeout.Value));
    if PingResult.Status = 0 then
    begin
      memOutput.Lines.Add('Statistics:');
      memOutput.Lines.Add('======================================');
      memOutput.Lines.Add('Address: ' + String(PingResult.Address));
      memOutput.Lines.Add('Round Trip Time: ' + PingResult.RoundTripTime.ToString + 'ms');
      memOutput.Lines.Add('Replies Received: ' + PingResult.RepliesReceived.ToString);
      memOutput.Lines.Add('Data Size: '+ PingResult.DataSize.ToString +' bytes');
    end else
      memOutput.Lines.Add('Ping request failed');
  end else
    memOutput.Lines.Add('Ping request failed');
end;

end.
