unit uFrame_TextToArray;

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
  FMX.Memo,
  FMX.Platform,
  FMX.Controls.Presentation,
  FMX.Layouts,
  System.Skia,
  FMX.Skia, FMX.Edit;

type
  TFrame_TextToArray = class(TFrame)
    layBottom: TLayout;
    layInput: TLayout;
    memTitleInput: TLabel;
    btnInputPasteFromClipboard: TButton;
    imgInputPasteFromClipboard: TSkSvg;
    lblInputPasteFromClipboard: TLabel;
    btnInputCopyToClipboard: TButton;
    imgInputCopyToClipboard: TSkSvg;
    lblInputCopyToClipboard: TLabel;
    btnInputClear: TButton;
    imgInputClear: TSkSvg;
    lblInputClear: TLabel;
    btnInputLoad: TButton;
    imgInputLoad: TSkSvg;
    lblInputLoad: TLabel;
    memInput: TMemo;
    layOutput: TLayout;
    memTitleOutput: TLabel;
    btnOutputCopyToClipboard: TButton;
    imgOutputCopyToClipboard: TSkSvg;
    lblOutputCopyToClipboard: TLabel;
    memOutput: TMemo;
    SplitterInputOutput: TSplitter;
    layTop: TLayout;
    lblConfiguration: TLabel;
    layConversion: TRectangle;
    cbConversion: TComboBox;
    layTitleDescriptionConversion: TLayout;
    lblTitleConversion: TLabel;
    lblDescriptionConversion: TLabel;
    imgConversion: TSkSvg;
    layArrayName: TRectangle;
    layTitleDescriptionArrayName: TLayout;
    lblTitleArrayName: TLabel;
    lblDescriptionArrayName: TLabel;
    imgArrayName: TSkSvg;
    OpenDialog: TOpenDialog;
    edtArrayName: TEdit;
    procedure btnInputLoadClick(Sender: TObject);
    procedure btnInputPasteFromClipboardClick(Sender: TObject);
    procedure btnInputCopyToClipboardClick(Sender: TObject);
    procedure btnInputClearClick(Sender: TObject);
    procedure btnOutputCopyToClipboardClick(Sender: TObject);
    procedure memInputChange(Sender: TObject);
    procedure memInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FrameResized(Sender: TObject);
  private
    { Private declarations }
    procedure ConvertTextToArray();
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_TextToArray.btnInputClearClick(Sender: TObject);
begin
  memInput.Lines.Clear;
  ConvertTextToArray();
end;

procedure TFrame_TextToArray.btnInputCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memInput.Text);
end;

procedure TFrame_TextToArray.btnInputLoadClick(Sender: TObject);
begin
  if (OpenDialog.Execute) then
  begin
    memInput.Lines.LoadFromFile(OpenDialog.FileName);
    ConvertTextToArray();
  end;
end;

procedure TFrame_TextToArray.btnInputPasteFromClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    memInput.Text := ClipboardService.GetClipboard.ToString;
end;

procedure TFrame_TextToArray.btnOutputCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memOutput.Text);
end;

procedure TFrame_TextToArray.ConvertTextToArray;
  const MyArray: TArray<String> = ['First','Second','Third'];
begin
  memOutput.Lines.Clear;
  if (memInput.Text.IsEmpty) then
    Exit;

  var ArrayText := '';
  if (cbConversion.Selected.Text = 'C#') then
    ArrayText := ArrayText + 'string[] ' + edtArrayName.Text + ' = {';
  if (cbConversion.Selected.Text = 'C++') then
    ArrayText := ArrayText + 'string['+memInput.Lines.Count.ToString+'] ' + edtArrayName.Text + ' = {';
  if (cbConversion.Selected.Text = 'Delphi') then
    ArrayText := ArrayText + 'const ' + edtArrayName.Text + ': TArray<String> = [';
  if (cbConversion.Selected.Text = 'Kotlin') then
    ArrayText := ArrayText + 'val ' + edtArrayName.Text + ' = arrayOf(';
  if (cbConversion.Selected.Text = 'Java') then
    ArrayText := ArrayText + 'string[] ' + edtArrayName.Text + ' = {';
  if (cbConversion.Selected.Text = 'JavaScript') then
    ArrayText := ArrayText + 'const ' + edtArrayName.Text + ' = [';
  if (cbConversion.Selected.Text = 'Go') then
    ArrayText := ArrayText + 'var ' + edtArrayName.Text + ' = ['+memInput.Lines.Count.ToString+']string{';
  if (cbConversion.Selected.Text = 'PHP') then
    ArrayText := ArrayText + '$' + edtArrayName.Text + ' = array(';
  if (cbConversion.Selected.Text = 'Python') then
    ArrayText := ArrayText + edtArrayName.Text + ' = [';

  for var I := 0 to memInput.Lines.Count - 1 do
  begin
    if (cbConversion.Selected.Text = 'C#') OR
       (cbConversion.Selected.Text = 'C++') OR
       (cbConversion.Selected.Text = 'Kotlin') OR
       (cbConversion.Selected.Text = 'Java') OR
       (cbConversion.Selected.Text = 'Go')
    then
      ArrayText := ArrayText + '"' + memInput.Lines[I] + '"'
    else
      ArrayText := ArrayText + QuotedStr(memInput.Lines[I]);
    if (I < memInput.Lines.Count - 1) then
      ArrayText := ArrayText + ', ';
  end;

  if (cbConversion.Selected.Text = 'C#') then
    ArrayText := ArrayText + '};';
  if (cbConversion.Selected.Text = 'C++') then
    ArrayText := ArrayText + '};';
  if (cbConversion.Selected.Text = 'Delphi') then
    ArrayText := ArrayText + '];';
  if (cbConversion.Selected.Text = 'Kotlin') then
    ArrayText := ArrayText + ')';
  if (cbConversion.Selected.Text = 'Java') then
    ArrayText := ArrayText + '};';
  if (cbConversion.Selected.Text = 'JavaScript') then
    ArrayText := ArrayText + '];';
  if (cbConversion.Selected.Text = 'Go') then
    ArrayText := ArrayText + '}';
  if (cbConversion.Selected.Text = 'PHP') then
    ArrayText := ArrayText + ');';
  if (cbConversion.Selected.Text = 'Python') then
    ArrayText := ArrayText + ']';


  memOutput.Text := ArrayText;
end;

procedure TFrame_TextToArray.FrameResized(Sender: TObject);
begin
  layInput.Width := (layBottom.Width - layBottom.Padding.Left - layBottom.Padding.Right - SplitterInputOutput.Width) / 2;
end;

procedure TFrame_TextToArray.memInputChange(Sender: TObject);
begin
  ConvertTextToArray();
end;

procedure TFrame_TextToArray.memInputKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  ConvertTextToArray();
end;

end.
