unit uFrame_DelphiFormatter;

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
  FMX.ListBox,
  FMX.Objects,
  FMX.ScrollBox,
  FMX.Platform,
  FMX.Memo,
  FMX.Controls.Presentation,
  FMX.Layouts,

  Roselt.CodeFormatting,

  System.Skia,
  FMX.Skia;

type
  TFrame_DelphiFormatter = class(TFrame)
    layTop: TLayout;
    lblConfiguration: TLabel;
    layIndentation: TRectangle;
    cbIndentation: TComboBox;
    layIndentationTitleDescription: TLayout;
    lblIndentationTitle: TLabel;
    lblIndentationDescription: TLabel;
    imgIndentation: TSkSvg;
    layBottom: TLayout;
    layInput: TLayout;
    memTitleInput: TLabel;
    btnInputPasteFromClipboard: TButton;
    imgInputPasteFromClipboard: TSkSvg;
    lblInputPasteFromClipboard: TLabel;
    btnInputCopyToClipboard: TButton;
    imgInputCopyToClipboard: TSkSvg;
    lblInputCopyToClipboard: TLabel;
    memInput: TMemo;
    layOutput: TLayout;
    memTitleOutput: TLabel;
    btnOutputCopyToClipboard: TButton;
    imgOutputCopyToClipboard: TSkSvg;
    lblOutputCopyToClipboard: TLabel;
    memOutput: TMemo;
    SplitterInputOutput: TSplitter;
    OpenDialog: TOpenDialog;
    btnInputLoad: TButton;
    imgInputLoad: TSkSvg;
    lblInputLoad: TLabel;
    btnInputClear: TButton;
    imgInputClear: TSkSvg;
    lblInputClear: TLabel;
    layNumberCharacters: TRectangle;
    imgNumberCharacters: TSkSvg;
    layTitleDescriptionNumberCharacters: TLayout;
    lblTitleNumberCharacters: TLabel;
    lblDescriptionNumberCharacters: TLabel;
    lblSwitchNumberCharacters: TLabel;
    SwitchNumberCharacters: TSwitch;
    procedure memInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FrameResize(Sender: TObject);
    procedure memInputChange(Sender: TObject);
    procedure btnOutputCopyToClipboardClick(Sender: TObject);
    procedure btnInputPasteFromClipboardClick(Sender: TObject);
    procedure btnInputCopyToClipboardClick(Sender: TObject);
    procedure btnInputClearClick(Sender: TObject);
    procedure btnInputLoadClick(Sender: TObject);
    procedure cbIndentationChange(Sender: TObject);
  private
    { Private declarations }
    procedure DelphiFormat();
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_DelphiFormatter.btnInputClearClick(Sender: TObject);
begin
  memInput.Lines.Clear;
  DelphiFormat();
end;

procedure TFrame_DelphiFormatter.btnInputCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memInput.Text);
end;

procedure TFrame_DelphiFormatter.btnInputLoadClick(Sender: TObject);
begin
  if (OpenDialog.Execute) then
  begin
    memInput.Lines.LoadFromFile(OpenDialog.FileName);
    DelphiFormat();
  end;
end;

procedure TFrame_DelphiFormatter.btnInputPasteFromClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    memInput.Text := ClipboardService.GetClipboard.ToString;
end;

procedure TFrame_DelphiFormatter.btnOutputCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memOutput.Text);
end;

procedure TFrame_DelphiFormatter.cbIndentationChange(Sender: TObject);
begin
  DelphiFormat();
end;

procedure TFrame_DelphiFormatter.FrameResize(Sender: TObject);
begin
  layInput.Width := (layBottom.Width - layBottom.Padding.Left - layBottom.Padding.Right - SplitterInputOutput.Width) / 2;
end;

procedure TFrame_DelphiFormatter.DelphiFormat;
begin
  if (Trim(memInput.Text).Length > 0) then
  begin
    if (cbIndentation.Selected.Text = 'Minified') then
      memOutput.Text := TCodeFormatter.MinifyDelphi(memInput.Text);
  end else memOutput.Text := '';
end;

procedure TFrame_DelphiFormatter.memInputChange(Sender: TObject);
begin
  DelphiFormat();
end;

procedure TFrame_DelphiFormatter.memInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  DelphiFormat();
end;

end.
