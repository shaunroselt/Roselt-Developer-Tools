unit uFrame_JsonFormatter;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.JSON,
  REST.Json,
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
  FMX.Layouts;

type
  TFrame_JsonFormatter = class(TFrame)
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
    layIndentation: TRectangle;
    cbIndentation: TComboBox;
    layIndentationTitleDescription: TLayout;
    lblIndentationTitle: TLabel;
    lblIndentationDescription: TLabel;
    imgIndentation: TImage;
    procedure memInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FrameResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_JsonFormatter.FrameResize(Sender: TObject);
begin
  layInput.Width := (layBottom.Width - layBottom.Padding.Left - layBottom.Padding.Right - SplitterInputOutput.Width) / 2;
end;

procedure TFrame_JsonFormatter.memInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  try
    memOutput.Text := TJSON.Format(TJSONObject.ParseJSONValue(memInput.Text));
  except on E: Exception do

  end;
end;

end.
