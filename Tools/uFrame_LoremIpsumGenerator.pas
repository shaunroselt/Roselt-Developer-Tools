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
  FMX.Platform,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.Controls.Presentation,
  FMX.Layouts,
  Roselt.LoremIpsum,
  Skia,
  Skia.FMX;

type
  TFrame_LoremIpsumGenerator = class(TFrame)
    layBottom: TLayout;
    memTitleOutput: TLabel;
    memOutput: TMemo;
    layTop: TLayout;
    lblConfiguration: TLabel;
    layType: TRectangle;
    imgType: TSkSvg;
    layTypeTitleDescription: TLayout;
    lblTypeTitle: TLabel;
    lblTypeDescription: TLabel;
    cbType: TComboBox;
    layAmount: TRectangle;
    imgAmount: TSkSvg;
    layAmountTitleDescription: TLayout;
    lblAmountTitle: TLabel;
    lblAmountDescription: TLabel;
    sbAmount: TSpinBox;
    layLetterCase: TRectangle;
    cbLetterCase: TComboBox;
    layLetterCaseTitleDescription: TLayout;
    lblLetterCaseTitle: TLabel;
    lblLetterCaseDescription: TLabel;
    imgLetterCase: TSkSvg;
    btnOutputCopyToClipboard: TButton;
    imgOutputCopyToClipboard: TSkSvg;
    lblOutputCopyToClipboard: TLabel;
    btnOutputRefresh: TButton;
    imgOutputRefresh: TSkSvg;
    lblOutputRefresh: TLabel;
    procedure sbAmountChange(Sender: TObject);
    procedure btnOutputCopyToClipboardClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_LoremIpsumGenerator.btnOutputCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memOutput.Text);
end;

procedure TFrame_LoremIpsumGenerator.sbAmountChange(Sender: TObject);
begin
  memOutput.Text := GenerateLoremIpsum(TLoremIpsumType.Paragraphs, 1);
end;

end.
