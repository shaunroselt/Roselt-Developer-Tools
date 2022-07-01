unit uFrame_JsonYamlConverter;

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
  FMX.Controls.Presentation,
  FMX.Layouts,
  Roselt.JsonYamlConverter;

type
  TFrame_JsonYamlConverter = class(TFrame)
    layBottom: TLayout;
    layInput: TLayout;
    memTitleInput: TLabel;
    memInput: TMemo;
    layOutput: TLayout;
    memTitleOutput: TLabel;
    memOutput: TMemo;
    SplitterInputOutput: TSplitter;
    layTop: TLayout;
    lblConfiguration: TLabel;
    layConversion: TRectangle;
    cbConversion: TComboBox;
    layConversionTitleDescription: TLayout;
    lblConversionTitle: TLabel;
    lblConversionDescription: TLabel;
    layIndentation: TRectangle;
    cbIndentation: TComboBox;
    layIndentationTitleDescription: TLayout;
    lblIndentationTitle: TLabel;
    lblIndentationDescription: TLabel;
    imgIndentation: TImage;
    imgConversion: TImage;
    procedure FrameResize(Sender: TObject);
    procedure memInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure ConfigChange(Sender: TObject);
  private
    { Private declarations }
    procedure ConvertJsonYaml;
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_JsonYamlConverter.ConfigChange(Sender: TObject);
begin
  ConvertJsonYaml();
end;

procedure TFrame_JsonYamlConverter.ConvertJsonYaml;
begin
  if (memInput.Text.IsEmpty) then
  begin
    // If Input is empty, then set output to empty and exit funtion.
    memOutput.Text.Empty;
    Exit;
  end;

  var IndentationType := TJsonYaml.TIndentationType.Spaces; // Default Indentation Type
  var IndentationCount := 2; // Default Indentation Count

  if (cbIndentation.Selected.Text.ToLower.Contains('spaces')) then
    IndentationType := TJsonYaml.TIndentationType.Spaces;
  if (cbIndentation.Selected.Text.ToLower.Contains('tab')) then
    IndentationType := TJsonYaml.TIndentationType.Tabs;

  if (cbIndentation.Selected.Text.ToLower.Contains('1')) then IndentationCount := 1;
  if (cbIndentation.Selected.Text.ToLower.Contains('2')) then IndentationCount := 2;
  if (cbIndentation.Selected.Text.ToLower.Contains('3')) then IndentationCount := 3;
  if (cbIndentation.Selected.Text.ToLower.Contains('4')) then IndentationCount := 4;
  if (cbIndentation.Selected.Text.ToLower.Contains('5')) then IndentationCount := 5;
  if (cbIndentation.Selected.Text.ToLower.Contains('6')) then IndentationCount := 6;
  if (cbIndentation.Selected.Text.ToLower.Contains('7')) then IndentationCount := 7;
  if (cbIndentation.Selected.Text.ToLower.Contains('8')) then IndentationCount := 8;

  try
    if (cbConversion.Selected.Text = 'JSON to YAML') then
      memOutput.Text := TJsonYaml.JsonToYaml(memInput.Text, IndentationType, IndentationCount);
    if (cbConversion.Selected.Text = 'YAML to JSON') then
      memOutput.Text := TJsonYaml.YamlToJson(memInput.Text, IndentationType, IndentationCount);
  except on E: Exception do
    memOutput.Text := E.Message;
  end;
end;

procedure TFrame_JsonYamlConverter.FrameResize(Sender: TObject);
begin
  layInput.Width := (layBottom.Width - layBottom.Padding.Left - layBottom.Padding.Right - SplitterInputOutput.Width) / 2;
end;

procedure TFrame_JsonYamlConverter.memInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  ConvertJsonYaml();
end;

end.
