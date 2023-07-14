unit uFrame_GZipCompressDecompress;

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
  FMX.Objects,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.Platform,
  FMX.Controls.Presentation,
  FMX.Layouts,
  System.Skia,
  FMX.Skia;

type
  TFrame_GZipCompressDecompress = class(TFrame)
    layBottom: TLayout;
    layInput: TLayout;
    memTitleInput: TLabel;
    memInput: TMemo;
    layOutput: TLayout;
    memTitleOutput: TLabel;
    memOutput: TMemo;
    layTop: TLayout;
    lblConfiguration: TLabel;
    layCompressDecompress: TRectangle;
    imgCompressDecompress: TSkSvg;
    layCompressDecompressTitleDescription: TLayout;
    lblCompressDecompressTitle: TLabel;
    lblCompressDecompressDescription: TLabel;
    SwitchCompressDecompress: TSwitch;
    lblSwitchCompressDecompress: TLabel;
    btnInputPasteFromClipboard: TButton;
    imgInputPasteFromClipboard: TSkSvg;
    lblInputPasteFromClipboard: TLabel;
    btnInputCopyToClipboard: TButton;
    imgInputCopyToClipboard: TSkSvg;
    lblInputCopyToClipboard: TLabel;
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
    procedure SwitchCompressDecompressSwitch(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure memInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure btnInputCopyToClipboardClick(Sender: TObject);
    procedure btnOutputCopyToClipboardClick(Sender: TObject);
    procedure btnInputPasteFromClipboardClick(Sender: TObject);
    procedure btnInputLoadClick(Sender: TObject);
    procedure btnInputClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GZipCompressDecompress();
  end;

implementation

{$R *.fmx}

procedure TFrame_GZipCompressDecompress.btnInputClearClick(Sender: TObject);
begin
  memInput.Text := '';
  GZipCompressDecompress();
end;

procedure TFrame_GZipCompressDecompress.btnInputCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memInput.Text);
end;

procedure TFrame_GZipCompressDecompress.btnInputLoadClick(Sender: TObject);
begin
  if (OpenDialog.Execute) then
  begin
    memInput.Lines.LoadFromFile(OpenDialog.FileName);
    GZipCompressDecompress();
  end;
end;

procedure TFrame_GZipCompressDecompress.btnInputPasteFromClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    memInput.Text := ClipboardService.GetClipboard.ToString;
end;

procedure TFrame_GZipCompressDecompress.btnOutputCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memInput.Text);
end;

procedure TFrame_GZipCompressDecompress.FrameResize(Sender: TObject);
begin
  layInput.Height := (layBottom.Height - layBottom.Padding.Top - layBottom.Padding.Bottom) / 2;
end;

procedure TFrame_GZipCompressDecompress.GZipCompressDecompress;
begin

end;

procedure TFrame_GZipCompressDecompress.memInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  try
    var sInput := memInput.Text;
    if (SwitchCompressDecompress.IsChecked) then
      memOutput.Text := 'My Compressed Text'
    else
      memOutput.Text := 'My Decompressed Text';
  except on E: Exception do

  end;
end;

procedure TFrame_GZipCompressDecompress.SwitchCompressDecompressSwitch(Sender: TObject);
begin
  if (lblSwitchCompressDecompress.Text = 'Compress') then
  begin
    lblSwitchCompressDecompress.Text := 'Decompress';
    SwitchCompressDecompress.IsChecked := False;
  end else
  begin
    lblSwitchCompressDecompress.Text := 'Compress';
    SwitchCompressDecompress.IsChecked := True;
  end;

  var TempText := memOutput.Text;
  memOutput.Text := memInput.Text;
  memInput.Text := TempText;
end;

end.
