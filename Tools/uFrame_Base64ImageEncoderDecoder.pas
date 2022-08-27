unit uFrame_Base64ImageEncoderDecoder;

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
  FMX.ExtCtrls,
  FMX.Memo.Types,
  FMX.Objects,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.Controls.Presentation,
  FMX.Platform,
  FMX.Layouts,
  Skia,
  Skia.FMX;

type
  TFrame_Base64ImageEncoderDecoder = class(TFrame)
    layContainer: TLayout;
    layBase64: TLayout;
    memTitleBase64: TLabel;
    memBase64: TMemo;
    layImage: TLayout;
    lblImage: TLabel;
    Splitter: TSplitter;
    DropImage: TDropTarget;
    imgImage: TSkSvg;
    btnDropImage: TButton;
    btnPasteFromClipboard: TButton;
    imgPasteFromClipboard: TSkSvg;
    lblPasteFromClipboard: TLabel;
    btnCopyToClipboard: TButton;
    imgCopyToClipboard: TSkSvg;
    lblCopyToClipboard: TLabel;
    OpenDialog: TOpenDialog;
    btnLoad: TButton;
    imgLoad: TSkSvg;
    lblLoad: TLabel;
    btnClear: TButton;
    imgClear: TSkSvg;
    lblClear: TLabel;
    procedure FrameResize(Sender: TObject);
    procedure btnCopyToClipboardClick(Sender: TObject);
    procedure btnPasteFromClipboardClick(Sender: TObject);
    procedure btnDropImageClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_Base64ImageEncoderDecoder.btnCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memBase64.Text);
end;

procedure TFrame_Base64ImageEncoderDecoder.btnDropImageClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    // TOpenDialog doesn't work on all platforms
  end;
end;

procedure TFrame_Base64ImageEncoderDecoder.btnPasteFromClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    memBase64.Text := ClipboardService.GetClipboard.ToString;
end;

procedure TFrame_Base64ImageEncoderDecoder.FrameResize(Sender: TObject);
begin
  layBase64.Width := (layContainer.Width - layContainer.Padding.Left - layContainer.Padding.Right - Splitter.Width) / 2;
end;

end.
