unit uFrame_URLEncoderDecoder;

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
  FMX.Platform,
  FMX.Memo,
  FMX.Controls.Presentation,
  FMX.Layouts,
  System.Skia,
  FMX.Skia;

type
  TFrame_URLEncoderDecoder = class(TFrame)
    layTop: TLayout;
    lblConfiguration: TLabel;
    layConversion: TRectangle;
    layConversionTitleDescription: TLayout;
    lblConversionTitle: TLabel;
    lblConversionDescription: TLabel;
    SwitchConversion: TSwitch;
    lblSwitchConversion: TLabel;
    imgConversion: TSkSvg;
    layBottom: TLayout;
    layInput: TLayout;
    memTitleInput: TLabel;
    btnInputCopyToClipboard: TButton;
    imgInputCopyToClipboard: TSkSvg;
    lblInputCopyToClipboard: TLabel;
    btnInputPasteFromClipboard: TButton;
    imgInputPasteFromClipboard: TSkSvg;
    lblInputPasteFromClipboard: TLabel;
    memInput: TMemo;
    layOutput: TLayout;
    memTitleOutput: TLabel;
    btnOutputCopyToClipboard: TButton;
    imgOutputCopyToClipboard: TSkSvg;
    lblOutputCopyToClipboard: TLabel;
    memOutput: TMemo;
    OpenDialog: TOpenDialog;
    btnInputLoad: TButton;
    imgInputLoad: TSkSvg;
    lblInputLoad: TLabel;
    btnInputClear: TButton;
    imgInputClear: TSkSvg;
    lblInputClear: TLabel;
    procedure FrameResize(Sender: TObject);
    procedure SwitchConversionSwitch(Sender: TObject);
    procedure memInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure btnOutputCopyToClipboardClick(Sender: TObject);
    procedure btnInputCopyToClipboardClick(Sender: TObject);
    procedure btnInputPasteFromClipboardClick(Sender: TObject);
    procedure memInputChange(Sender: TObject);
    procedure btnInputLoadClick(Sender: TObject);
    procedure btnInputClearClick(Sender: TObject);
  private
    { Private declarations }
    procedure URLEncoderDecoder();
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_URLEncoderDecoder.btnInputClearClick(Sender: TObject);
begin
  memInput.Text := '';
  URLEncoderDecoder();
end;

procedure TFrame_URLEncoderDecoder.btnInputCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memInput.Text);
end;

procedure TFrame_URLEncoderDecoder.btnInputLoadClick(Sender: TObject);
begin
  if (OpenDialog.Execute) then
  begin
    memInput.Lines.LoadFromFile(OpenDialog.FileName);
    URLEncoderDecoder();
  end;
end;

procedure TFrame_URLEncoderDecoder.btnInputPasteFromClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    memInput.Text := ClipboardService.GetClipboard.ToString;
end;

procedure TFrame_URLEncoderDecoder.btnOutputCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memOutput.Text);
end;

procedure TFrame_URLEncoderDecoder.FrameResize(Sender: TObject);
begin
  layInput.Height := (layBottom.Height - layBottom.Padding.Top - layBottom.Padding.Bottom) / 2;
end;

procedure TFrame_URLEncoderDecoder.memInputChange(Sender: TObject);
begin
  URLEncoderDecoder();
end;

procedure TFrame_URLEncoderDecoder.memInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  URLEncoderDecoder();
end;

procedure TFrame_URLEncoderDecoder.SwitchConversionSwitch(Sender: TObject);
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

procedure TFrame_URLEncoderDecoder.URLEncoderDecoder;
begin
  try
    var URLToEncode := memInput.Text;
    if (SwitchConversion.IsChecked) then
      memOutput.Text := TNetEncoding.URL.Encode(URLToEncode)
    else
      memOutput.Text := TNetEncoding.URL.Decode(URLToEncode);
  except on E: Exception do

  end;
end;

end.
