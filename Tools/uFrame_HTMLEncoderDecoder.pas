unit uFrame_HTMLEncoderDecoder;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.NetEncoding,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Memo.Types,
  FMX.Objects,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.Controls.Presentation,
  FMX.Layouts;

type
  TFrame_HTMLEncoderDecoder = class(TFrame)
    layBottom: TLayout;
    layInput: TLayout;
    memTitleInput: TLabel;
    memInput: TMemo;
    layOutput: TLayout;
    memTitleOutput: TLabel;
    memOutput: TMemo;
    layTop: TLayout;
    lblConfiguration: TLabel;
    layConversion: TRectangle;
    layConversionTitleDescription: TLayout;
    lblConversionTitle: TLabel;
    lblConversionDescription: TLabel;
    SwitchConversion: TSwitch;
    lblSwitchConversion: TLabel;
    imgConversion: TImage;
    procedure memInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FrameResize(Sender: TObject);
    procedure SwitchConversionSwitch(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_HTMLEncoderDecoder.FrameResize(Sender: TObject);
begin
  layInput.Height := (layBottom.Height - layBottom.Padding.Top - layBottom.Padding.Bottom) / 2;
end;

procedure TFrame_HTMLEncoderDecoder.memInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  try
    var TextToEncode := memInput.Text;
    if (SwitchConversion.IsChecked) then
      memOutput.Text := TNetEncoding.HTML.Encode(TextToEncode)
    else
      memOutput.Text := TNetEncoding.HTML.Decode(TextToEncode);
  except on E: Exception do

  end;
end;

procedure TFrame_HTMLEncoderDecoder.SwitchConversionSwitch(Sender: TObject);
begin
  if (lblSwitchConversion.Text = 'Encode') then
  begin
    lblSwitchConversion.Text := 'Decode';
    SwitchConversion.IsChecked := False;
  end else
  begin
    lblSwitchConversion.Text := 'Encode';
    SwitchConversion.IsChecked := True;
  end;

  var TempText := memOutput.Text;
  memOutput.Text := memInput.Text;
  memInput.Text := TempText;
end;

end.
