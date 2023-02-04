unit uFrame_PingTool;

interface

uses
{$IFDEF MACOS}
Macapi.CoreFoundation,
Macapi.CoreServices,
{$ENDIF}

{$IFDEF MSWINDOWS}
Winapi.Windows,
Winapi.Winsock2,
{$ENDIF}

System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
FMX.Layouts, FMX.Edit, FMX.Controls.Presentation,System.DateUtils, Ping;

type
TFrame_PingTool = class(TFrame)
lblHeading: TLabel;
edtAddress:TEdit;
lblAddress: TLabel;
Layout1: TLayout;
btnPing: TButton;
    procedure btnPingClick(Sender: TObject);

private
{ Private declarations }
public
{ Public declarations }
end;


implementation



{$R *.fmx}

procedure TFrame_PingTool.btnPingClick(Sender: TObject);
begin
  if PingHost(AnsiString(edtAddress.Text)) then
    ShowMessage('WORKED')
  else
    ShowMessage('FAILED');
end;

end.
