unit uFrame_HTMLPreview;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.IOUtils,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Memo.Types,
  FMX.Platform,
  FMX.Objects,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.Controls.Presentation,
  FMX.Layouts,
  FMX.WebBrowser,
  Skia,
  Skia.FMX;

type
  TFrame_HTMLPreview = class(TFrame)
    layBottom: TLayout;
    layInput: TLayout;
    memTitleInput: TLabel;
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
    memInput: TMemo;
    OpenDialog: TOpenDialog;
    layOutput: TLayout;
    memTitleOutput: TLabel;
    SplitterInputOutput: TSplitter;
    WebBrowser: TWebBrowser;
    btnRefresh: TButton;
    imgRefresh: TSkSvg;
    lblRefresh: TLabel;
    procedure btnInputClearClick(Sender: TObject);
    procedure btnInputCopyToClipboardClick(Sender: TObject);
    procedure btnInputPasteFromClipboardClick(Sender: TObject);
    procedure btnInputLoadClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure memInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FrameResized(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure HTMLPreview;
  end;

implementation

{$R *.fmx}

{ TFrame_HTMLPreview }

procedure TFrame_HTMLPreview.btnInputClearClick(Sender: TObject);
begin
  memInput.Lines.Clear;
  HTMLPreview();
end;

procedure TFrame_HTMLPreview.btnInputCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memInput.Text);
end;

procedure TFrame_HTMLPreview.btnInputLoadClick(Sender: TObject);
begin
  if (OpenDialog.Execute) then
  begin
    memInput.Lines.LoadFromFile(OpenDialog.FileName);
    HTMLPreview();
  end;
end;

procedure TFrame_HTMLPreview.btnInputPasteFromClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    memInput.Text := ClipboardService.GetClipboard.ToString;
end;

procedure TFrame_HTMLPreview.btnRefreshClick(Sender: TObject);
begin
  HTMLPreview;
end;

procedure TFrame_HTMLPreview.FrameResized(Sender: TObject);
begin
  layInput.Width := (layBottom.Width - layBottom.Padding.Left - layBottom.Padding.Right - SplitterInputOutput.Width) / 2;
end;

procedure TFrame_HTMLPreview.HTMLPreview;
begin
  var HTMLPreviewFileName := System.IOUtils.TPath.GetDocumentsPath + PathDelim + 'HTMLPreview.html';
  memInput.Lines.SaveToFile(HTMLPreviewFileName);
  WebBrowser.Navigate(HTMLPreviewFileName);
end;

procedure TFrame_HTMLPreview.memInputKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  HTMLPreview;
end;

end.
