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
  System.Skia,
  FMX.Skia;

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
    procedure btnOutputCopyToClipboardClick(Sender: TObject);
    procedure btnOutputRefreshClick(Sender: TObject);
  private
    { Private declarations }
    procedure GenerateRandomLoremIpsum();
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

procedure TFrame_LoremIpsumGenerator.btnOutputRefreshClick(Sender: TObject);
begin
  GenerateRandomLoremIpsum;
end;

procedure TFrame_LoremIpsumGenerator.GenerateRandomLoremIpsum;
var
  LoremIpsumType: TLoremIpsumType;
  LoremIpsumCase: TLoremIpsumCase;
begin
  if (cbType.Selected.Text = 'Paragraphs') then LoremIpsumType := TLoremIpsumType.Paragraphs;
  if (cbType.Selected.Text = 'Sentences') then LoremIpsumType := TLoremIpsumType.Sentences;
  if (cbType.Selected.Text = 'Words') then LoremIpsumType := TLoremIpsumType.Words;
  if (cbType.Selected.Text = 'Lists') then LoremIpsumType := TLoremIpsumType.Lists;

  if (cbLetterCase.Selected.Text = 'Regular') then LoremIpsumCase := TLoremIpsumCase.Regular;
  if (cbLetterCase.Selected.Text = 'lower') then LoremIpsumCase := TLoremIpsumCase.Lower;
  if (cbLetterCase.Selected.Text = 'UPPER') then LoremIpsumCase := TLoremIpsumCase.Upper;
  if (cbLetterCase.Selected.Text = 'Title') then LoremIpsumCase := TLoremIpsumCase.Title;

  memOutput.Text := GenerateLoremIpsum(LoremIpsumType, LoremIpsumCase, Round(sbAmount.Value));
end;

end.
