unit uFrame_Base64TextEncoderDecoder;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.NetEncoding,
  System.Skia,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Memo.Types,
  FMX.ListBox,
  FMX.Objects,
  FMX.ScrollBox,
  FMX.Platform,
  FMX.Memo,
  FMX.Controls.Presentation,
  FMX.Layouts,
  FMX.Skia;

type
  TFrame_Base64TextEncoderDecoder = class(TFrame)
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
    imgConversion: TSkSvg;
    layConversionTitleDescription: TLayout;
    lblConversionTitle: TLabel;
    lblConversionDescription: TLabel;
    SwitchConversion: TSwitch;
    lblSwitchConversion: TLabel;
    layEncoding: TRectangle;
    cbEncoding: TComboBox;
    layEncodingTitleDescription: TLayout;
    lblEncodingTitle: TLabel;
    lblEncodingDescription: TLabel;
    imgEncoding: TSkSvg;
    btnInputCopyToClipboard: TButton;
    imgInputCopyToClipboard: TSkSvg;
    lblInputCopyToClipboard: TLabel;
    btnInputPasteFromClipboard: TButton;
    imgInputPasteFromClipboard: TSkSvg;
    lblInputPasteFromClipboard: TLabel;
    btnOutputCopyToClipboard: TButton;
    imgOutputCopyToClipboard: TSkSvg;
    lblOutputCopyToClipboard: TLabel;
    btnInputLoad: TButton;
    imgInputLoad: TSkSvg;
    lblInputLoad: TLabel;
    btnInputClear: TButton;
    imgInputClear: TSkSvg;
    lblInputClear: TLabel;
    OpenDialog: TOpenDialog;
    procedure SwitchConversionSwitch(Sender: TObject);
    procedure cbEncodingChange(Sender: TObject);
    procedure memInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FrameResized(Sender: TObject);
    procedure btnInputCopyToClipboardClick(Sender: TObject);
    procedure btnOutputCopyToClipboardClick(Sender: TObject);
    procedure btnInputPasteFromClipboardClick(Sender: TObject);
    procedure memInputChange(Sender: TObject);
    procedure btnInputLoadClick(Sender: TObject);
    procedure btnInputClearClick(Sender: TObject);
  private
    { Private declarations }
    procedure Base64EncodeDecode();
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_Base64TextEncoderDecoder.Base64EncodeDecode;
begin
  try
    var UTF8TextToEncode := memInput.Text;
    var ASCIITextToEncode := AnsiString(UTF8TextToEncode);
    if cbEncoding.Selected.Text = 'ASCII' then
    begin
      if (SwitchConversion.IsChecked) then
        memOutput.Text := TNetEncoding.Base64.Encode(ASCIITextToEncode)
      else
        memOutput.Text := TNetEncoding.Base64.Decode(TNetEncoding.Base64.Encode(AnsiString(TNetEncoding.Base64.Decode(ASCIITextToEncode))));
    end else
    begin
      if (SwitchConversion.IsChecked) then
        memOutput.Text := TNetEncoding.Base64.Encode(UTF8TextToEncode)
      else
        memOutput.Text := TNetEncoding.Base64.Decode(UTF8TextToEncode);
    end;
  except on E: Exception do

  end;
end;

procedure TFrame_Base64TextEncoderDecoder.btnInputClearClick(Sender: TObject);
begin
  memInput.Text := '';
end;

procedure TFrame_Base64TextEncoderDecoder.btnInputCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memInput.Text);
end;

procedure TFrame_Base64TextEncoderDecoder.btnInputLoadClick(Sender: TObject);
begin
  if (OpenDialog.Execute) then
  begin
    memInput.Lines.LoadFromFile(OpenDialog.FileName);
    Base64EncodeDecode();
  end;
end;

procedure TFrame_Base64TextEncoderDecoder.btnInputPasteFromClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    memInput.Text := ClipboardService.GetClipboard.ToString;
end;

procedure TFrame_Base64TextEncoderDecoder.btnOutputCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memOutput.Text);
end;

procedure TFrame_Base64TextEncoderDecoder.cbEncodingChange(Sender: TObject);
begin
  Base64EncodeDecode();
end;

procedure TFrame_Base64TextEncoderDecoder.FrameResized(Sender: TObject);
begin
  layInput.Height := (layBottom.Height - layBottom.Padding.Top - layBottom.Padding.Bottom) / 2;
end;

procedure TFrame_Base64TextEncoderDecoder.memInputChange(Sender: TObject);
begin
  Base64EncodeDecode();
end;

procedure TFrame_Base64TextEncoderDecoder.memInputKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  Base64EncodeDecode();
end;

procedure TFrame_Base64TextEncoderDecoder.SwitchConversionSwitch(Sender: TObject);
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
