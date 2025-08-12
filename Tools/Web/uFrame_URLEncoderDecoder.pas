unit uFrame_URLEncoderDecoder;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.StdCtrls, WEBLib.StdCtrls, Vcl.Controls,
  WEBLib.Buttons;

type
  TFrame_URLEncoderDecoder = class(TWebFrame)
    memOutput: TWebMemo;
    memInput: TWebMemo;
    WebButton1: TWebButton;
    SwitchConversion: TWebToggleButton;
    procedure WebButton1Click(Sender: TObject);
  private
    procedure URLEncoderDecoder;
    { Private declarations }
  public
    { Public declarations }
    function EncodeURL(s: String): String;
    function DecodeURL(s: String): String;
  end;

var
  Frame_URLEncoderDecoder: TFrame_URLEncoderDecoder;

implementation

{$R *.dfm}



function TFrame_URLEncoderDecoder.DecodeURL(s: String): String;
begin
  asm
    Result = decodeURIComponent(s);
  end;
end;

function TFrame_URLEncoderDecoder.EncodeURL(s: String): String;
begin
  asm
    Result = encodeURIComponent(s);
  end;
end;

procedure TFrame_URLEncoderDecoder.URLEncoderDecoder;
var
  URLToEncode: String;
begin
  URLToEncode := memInput.Text;
  try
    if (SwitchConversion.Checked) then
      memOutput.Text := EncodeURL(URLToEncode)
    else
      memOutput.Text := DecodeURL(URLToEncode);
  except on E: Exception do

  end;
end;

procedure TFrame_URLEncoderDecoder.WebButton1Click(Sender: TObject);
begin
  URLEncoderDecoder();
end;

end.