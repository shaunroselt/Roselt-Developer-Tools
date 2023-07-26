unit uFrame_Base64ImageEncoderDecoder;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.NetEncoding,
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

  System.Skia,
  FMX.Skia;

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
    svgImage: TSkSvg;
    imgImage: TImage;
    procedure FrameResize(Sender: TObject);
    procedure btnCopyToClipboardClick(Sender: TObject);
    procedure btnPasteFromClipboardClick(Sender: TObject);
    procedure btnDropImageClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure memBase64KeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
  private
    { Private declarations }
    procedure Base64EncodeDecode();
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_Base64ImageEncoderDecoder.Base64EncodeDecode;
begin

end;

procedure TFrame_Base64ImageEncoderDecoder.btnCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memBase64.Text);
end;

procedure TFrame_Base64ImageEncoderDecoder.btnDropImageClick(Sender: TObject);
  function FileToBase64(const AFileName: string): string;
  var
    LStream: TFileStream;
    LBytes: TBytes;
  begin
    LStream := TFileStream.Create(AFileName, fmOpenRead);
    try
      SetLength(LBytes, LStream.Size);
      LStream.Read(LBytes, LStream.Size);
      Result := TNetEncoding.Base64.EncodeBytesToString(LBytes);
    finally
      LStream.Free;
    end;
  end;
begin
  OpenDialog.Filter := 'All Files|*|*.txt|*.txt';
  if (OpenDialog.Execute) then
  begin
//    memBase64.Lines.LoadFromFile(OpenDialog.FileName);
    Base64EncodeDecode();

    memBase64.Text := FileToBase64(OpenDialog.FileName);   // Doesn't seem to work
  end;
end;

procedure TFrame_Base64ImageEncoderDecoder.btnLoadClick(Sender: TObject);
begin
  OpenDialog.Filter := 'All Files|*|*.txt|*.txt';
  if (OpenDialog.Execute) then
  begin
    memBase64.Lines.LoadFromFile(OpenDialog.FileName);
    Base64EncodeDecode();
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

procedure TFrame_Base64ImageEncoderDecoder.memBase64KeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);

  procedure DecodeBase64AndLoadIntoTImage(const Base64String: string; Image: TImage);
  begin
    var Stream := TMemoryStream.Create;
    try
      Stream.Write(TNetEncoding.Base64.DecodeStringToBytes(Base64String), Length(TNetEncoding.Base64.DecodeStringToBytes(Base64String)));
      Stream.Position := 0;
      var Bitmap := TBitmap.Create;
      try
        Bitmap.LoadFromStream(Stream);
        Image.Bitmap.Assign(Bitmap);
      finally
        Bitmap.Free;
      end;
    finally
      Stream.Free;
    end;
  end;
begin
  DecodeBase64AndLoadIntoTImage(membase64.Text, imgImage);  // Doesn't work

end;

end.
