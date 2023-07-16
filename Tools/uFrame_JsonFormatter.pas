unit uFrame_JsonFormatter;

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
  TFrame_JsonFormatter = class(TFrame)
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
    layInputType: TRectangle;
    imgInputType: TSkSvg;
    cbInputType: TComboBox;
    layInputTypeTitleDescription: TLayout;
    lblInputTypeTitle: TLabel;
    lblInputTypeDescription: TLabel;
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
    procedure JsonFormat();
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_JsonFormatter.btnInputClearClick(Sender: TObject);
begin
  memInput.Lines.Clear;
  JsonFormat();
end;

procedure TFrame_JsonFormatter.btnInputCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memInput.Text);
end;

procedure TFrame_JsonFormatter.btnInputLoadClick(Sender: TObject);
begin
  if (OpenDialog.Execute) then
  begin
    memInput.Lines.LoadFromFile(OpenDialog.FileName);
    JsonFormat();
  end;
end;

procedure TFrame_JsonFormatter.btnInputPasteFromClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    memInput.Text := ClipboardService.GetClipboard.ToString;
end;

procedure TFrame_JsonFormatter.btnOutputCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memOutput.Text);
end;

procedure TFrame_JsonFormatter.cbIndentationChange(Sender: TObject);
begin
  JsonFormat();
end;

procedure TFrame_JsonFormatter.FrameResize(Sender: TObject);
begin
  layInput.Width := (layBottom.Width - layBottom.Padding.Left - layBottom.Padding.Right - SplitterInputOutput.Width) / 2;
end;

procedure TFrame_JsonFormatter.JsonFormat;
begin
  if (Trim(memInput.Text).Length > 0) then
  begin
    if (cbIndentation.Selected.Text = '1 space') then
      memOutput.Text := TCodeFormatter.FormatJson(memInput.Text, TCodeFormatter.TIndentationType.Spaces, 1);
    if (cbIndentation.Selected.Text = '2 spaces') then
      memOutput.Text := TCodeFormatter.FormatJson(memInput.Text, TCodeFormatter.TIndentationType.Spaces, 2);
    if (cbIndentation.Selected.Text = '3 spaces') then
      memOutput.Text := TCodeFormatter.FormatJson(memInput.Text, TCodeFormatter.TIndentationType.Spaces, 3);
    if (cbIndentation.Selected.Text = '4 spaces') then
      memOutput.Text := TCodeFormatter.FormatJson(memInput.Text, TCodeFormatter.TIndentationType.Spaces, 4);
    if (cbIndentation.Selected.Text = '5 spaces') then
      memOutput.Text := TCodeFormatter.FormatJson(memInput.Text, TCodeFormatter.TIndentationType.Spaces, 5);
    if (cbIndentation.Selected.Text = '6 spaces') then
      memOutput.Text := TCodeFormatter.FormatJson(memInput.Text, TCodeFormatter.TIndentationType.Spaces, 6);
    if (cbIndentation.Selected.Text = '7 spaces') then
      memOutput.Text := TCodeFormatter.FormatJson(memInput.Text, TCodeFormatter.TIndentationType.Spaces, 7);
    if (cbIndentation.Selected.Text = '8 spaces') then
      memOutput.Text := TCodeFormatter.FormatJson(memInput.Text, TCodeFormatter.TIndentationType.Spaces, 8);

    if (cbIndentation.Selected.Text = '1 tab') then
      memOutput.Text := TCodeFormatter.FormatJson(memInput.Text, TCodeFormatter.TIndentationType.Tabs, 1);
    if (cbIndentation.Selected.Text = '2 tabs') then
      memOutput.Text := TCodeFormatter.FormatJson(memInput.Text, TCodeFormatter.TIndentationType.Tabs, 2);
    if (cbIndentation.Selected.Text = '3 tabs') then
      memOutput.Text := TCodeFormatter.FormatJson(memInput.Text, TCodeFormatter.TIndentationType.Tabs, 3);
    if (cbIndentation.Selected.Text = '4 tabs') then
      memOutput.Text := TCodeFormatter.FormatJson(memInput.Text, TCodeFormatter.TIndentationType.Tabs, 4);
    if (cbIndentation.Selected.Text = '5 tabs') then
      memOutput.Text := TCodeFormatter.FormatJson(memInput.Text, TCodeFormatter.TIndentationType.Tabs, 5);
    if (cbIndentation.Selected.Text = '6 tabs') then
      memOutput.Text := TCodeFormatter.FormatJson(memInput.Text, TCodeFormatter.TIndentationType.Tabs, 6);
    if (cbIndentation.Selected.Text = '7 tabs') then
      memOutput.Text := TCodeFormatter.FormatJson(memInput.Text, TCodeFormatter.TIndentationType.Tabs, 7);
    if (cbIndentation.Selected.Text = '8 tabs') then
      memOutput.Text := TCodeFormatter.FormatJson(memInput.Text, TCodeFormatter.TIndentationType.Tabs, 8);

    if (cbIndentation.Selected.Text = 'Minified') then
      memOutput.Text := TCodeFormatter.MinifyJson(memInput.Text);
  end else memOutput.Text := '';
end;

procedure TFrame_JsonFormatter.memInputChange(Sender: TObject);
begin
  JsonFormat();
end;

procedure TFrame_JsonFormatter.memInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  JsonFormat();
end;

end.
