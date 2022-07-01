unit uFrame_LoremIpsumGenerator;

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
  FMX.Edit,
  FMX.EditBox,
  FMX.SpinBox,
  FMX.ListBox,
  FMX.Objects,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.Controls.Presentation,
  FMX.Layouts,
  Roselt.LoremIpsum;

type
  TFrame_LoremIpsumGenerator = class(TFrame)
    layBottom: TLayout;
    memTitleOutput: TLabel;
    memOutput: TMemo;
    layTop: TLayout;
    lblConfiguration: TLabel;
    layType: TRectangle;
    imgType: TImage;
    layTypeTitleDescription: TLayout;
    lblTypeTitle: TLabel;
    lblTypeDescription: TLabel;
    cbType: TComboBox;
    layAmount: TRectangle;
    imgAmount: TImage;
    layAmountTitleDescription: TLayout;
    lblAmountTitle: TLabel;
    lblAmountDescription: TLabel;
    sbAmount: TSpinBox;
    layLetterCase: TRectangle;
    cbLetterCase: TComboBox;
    layLetterCaseTitleDescription: TLayout;
    lblLetterCaseTitle: TLabel;
    lblLetterCaseDescription: TLabel;
    imgLetterCase: TImage;
    procedure sbAmountChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_LoremIpsumGenerator.sbAmountChange(Sender: TObject);
begin
  memOutput.Text := GenerateLoremIpsum(TLoremIpsumType.Paragraphs, 1);
end;

end.
