// Look at https://github.com/paolo-rossi/delphi-jose-jwt
unit uFrame_JWTDecoder;

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
  FMX.ScrollBox,
  FMX.Memo,
  FMX.Platform,
  FMX.Controls.Presentation,
  FMX.Layouts,
  FMX.Objects,
  FMX.Clipboard,

  IdGlobal,
  IdHMAC,
  IdCoderMIME,
  
  System.Skia,
  FMX.Skia;


type
  TFrame_JWTDecoder = class(TFrame)
    layBottom: TLayout;
    layHeader: TLayout;
    memTitleHeader: TLabel;
    btnHeaderCopyToClipboard: TButton;
    imgHeaderCopyToClipboard: TSkSvg;
    lblHeaderCopyToClipboard: TLabel;
    memHeader: TMemo;
    OpenDialog: TOpenDialog;
    layPayload: TLayout;
    memTitlePayload: TLabel;
    btnPayloadCopyToClipboard: TButton;
    imgPayloadCopyToClipboard: TSkSvg;
    lblPayloadCopyToClipboard: TLabel;
    memPayload: TMemo;
    layTop: TLayout;
    layJWTToken: TLayout;
    lblJWTToken: TLabel;
    btnInputPasteFromClipboard: TButton;
    imgInputPasteFromClipboard: TSkSvg;
    lblInputPasteFromClipboard: TLabel;
    btnInputCopyToClipboard: TButton;
    imgInputCopyToClipboard: TSkSvg;
    lblInputCopyToClipboard: TLabel;
    btnInputLoad: TButton;
    imgInputLoad: TSkSvg;
    lblInputLoad: TLabel;
    btnInputClear: TButton;
    imgInputClear: TSkSvg;
    lblInputClear: TLabel;
    memJWTToken: TMemo;

    function DecodeJWT(const JWT : string) : TStringList;
    procedure btnInputClearClick(Sender: TObject);
    procedure btnInputCopyToClipboardClick(Sender: TObject);
    procedure btnInputLoadClick(Sender: TObject);
    procedure btnInputPasteFromClipboardClick(Sender: TObject);
    procedure btnHeaderCopyToClipboardClick(Sender: TObject);
    procedure btnPayloadCopyToClipboardClick(Sender: TObject);
    procedure memJWTTokenChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

function TFrame_JWTDecoder.DecodeJWT(const JWT: string): TStringList;
var
  Header, Payload, Signature: string;
  SplitPos: Integer;
  JWTTemp: string;
begin
  Result := TStringList.Create;
  JWTTemp := JWT;
  SplitPos := Pos('.', JWTTemp);
  Header := JWTTemp.Substring(0, SplitPos - 1);
  Delete(JWTTemp, 1, SplitPos);
  SplitPos := Pos('.', JWTTemp);
  Payload := JWTTemp.Substring(0, SplitPos - 1);
  Signature := JWTTemp.Substring(SplitPos, Length(JWTTemp));
  Result.AddPair('header', TIdDecoderMIME.DecodeString(Header));
  Result.AddPair('payload', TIdDecoderMIME.DecodeString(Payload));
  Result.AddPair('signature', TIdDecoderMIME.DecodeString(Signature));
end;

procedure TFrame_JWTDecoder.memJWTTokenChange(Sender: TObject);
begin
  var JWT := memJWTToken.Text;
  var JWTResult:= DecodeJWT(JWT);
  memHeader.Text := JWTResult.Values['header'];
  memPayload.Text := JWTResult.Values['payload'];
end;

procedure TFrame_JWTDecoder.btnHeaderCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, IInterface(ClipboardService)) then
  begin
    ClipboardService.SetClipboard(memHeader.Lines.Text);
  end;
end;

procedure TFrame_JWTDecoder.btnInputClearClick(Sender: TObject);
begin
  memJWTToken.Text := '';
end;
procedure TFrame_JWTDecoder.btnInputCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, IInterface(ClipboardService)) then
  begin
    ClipboardService.SetClipboard(memJWTToken.Lines.Text);
  end;
end;

procedure TFrame_JWTDecoder.btnInputLoadClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    memJWTToken.Lines.LoadFromFile(OpenDialog.FileName);
  end;
end;

procedure TFrame_JWTDecoder.btnInputPasteFromClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, IInterface(ClipboardService)) then
  begin
    memJWTToken.Lines.Text := ClipboardService.GetClipboard.AsString;
  end;
end;

procedure TFrame_JWTDecoder.btnPayloadCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, IInterface(ClipboardService)) then
  begin
    ClipboardService.SetClipboard(memPayload.Lines.Text);
  end;
end;

end.
