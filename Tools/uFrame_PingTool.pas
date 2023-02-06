unit uFrame_PingTool;

interface

uses
{$IFDEF MACOS}
  Macapi.CoreFoundation,
  Macapi.CoreServices,
{$ENDIF}

{$IFDEF MSWINDOWS}
  Winapi.Windows,
  Winapi.WinSock2,
{$ENDIF}

System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
FMX.Layouts, FMX.Edit, FMX.Controls.Presentation,System.DateUtils, Ping,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo;

type
TFrame_PingTool = class(TFrame)
  lblHeading: TLabel;
  edtAddress:TEdit;
  lblAddress: TLabel;
  Layout1: TLayout;
  btnPing: TButton;
    memStats: TMemo;
  procedure btnPingClick(Sender: TObject);
private
{ Private declarations }
public
{ Public declarations }
end;


implementation



{$R *.fmx}

procedure TFrame_PingTool.btnPingClick(Sender: TObject);
var
  PingResult: TPingStatistics;
begin
  memStats.Lines.Clear;
  PingResult := Ping.PingHost(AnsiString(edtAddress.Text));
  if PingResult.Status = 0 then
  begin
    memStats.Lines.Add('Statistics:');
    memStats.Lines.Add('Address: ' + string(PingResult.Address));
    memStats.Lines.Add('Round Trip Time: ' + IntToStr(PingResult.RoundTripTime) + 'ms');
    memStats.Lines.Add('Replies Received: ' + IntToStr(PingResult.RepliesReceived));
    memStats.Lines.Add('Data Size: '+ IntToStr(PingResult.DataSize) +' bytes');
  end
  else
  begin
    memStats.Lines.Add('Ping request failed');
  end;
end;

end.
