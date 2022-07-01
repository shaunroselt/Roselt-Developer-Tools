unit uFrame_XMLFormatter;

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
  FMX.Layouts;

type
  TFrame_XMLFormatter = class(TFrame)
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
    layCompressDecompress: TRectangle;
    imgCompressDecompress: TImage;
    layCompressDecompressTitleDescription: TLayout;
    lblCompressDecompressTitle: TLabel;
    lblCompressDecompressDescription: TLabel;
    SwitchCompressDecompress: TSwitch;
    lblSwitchCompressDecompress: TLabel;
    imgIndentation: TImage;
    procedure FrameResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_XMLFormatter.FrameResize(Sender: TObject);
begin
  layInput.Width := (layBottom.Width - layBottom.Padding.Left - layBottom.Padding.Right - SplitterInputOutput.Width) / 2;
end;

end.
