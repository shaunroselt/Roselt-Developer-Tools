// Look at the following for inspiration :
//
// https://randomwordgenerator.com/name.php
// https://www.behindthename.com/random/
// https://www.randomlists.com/random-first-names?dup=false&qty=12
// https://www.name-generator.org.uk/
unit uFrame_NameGenerator;

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
  FMX.Edit,
  FMX.Platform,
  FMX.EditBox,
  FMX.SpinBox,

  Roselt.NameGenerator,

  System.Skia,
  FMX.Skia;

type
  TFrame_NameGenerator = class(TFrame)
    layBottom: TLayout;
    memTitleOutput: TLabel;
    memOutput: TMemo;
    layTop: TLayout;
    lblConfiguration: TLabel;
    layGender: TRectangle;
    imgGender: TSkSvg;
    cbGender: TComboBox;
    layGenderTitleDescription: TLayout;
    lblGender: TLabel;
    lblGenderDescription: TLabel;
    laySurname: TRectangle;
    imgSurname: TSkSvg;
    laySurnameTitleDescription: TLayout;
    lblSurnameTitle: TLabel;
    lblSurnameDescription: TLabel;
    SwitchSurname: TSwitch;
    lblSwitchSurname: TLabel;
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
    btnRefresh: TButton;
    imgRefresh: TSkSvg;
    lblRefresh: TLabel;
    btnOutputCopyToClipboard: TButton;
    imgOutputCopyToClipboard: TSkSvg;
    lblOutputCopyToClipboard: TLabel;
    layMaxLength: TRectangle;
    imgMaxLength: TSkSvg;
    layMaxLengthTitleDescription: TLayout;
    lblMaxLengthTitle: TLabel;
    lblMaxLengthDescription: TLabel;
    sbMaxLength: TSpinBox;
    procedure btnOutputCopyToClipboardClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure SwitchSurnameSwitch(Sender: TObject);
  private
    { Private declarations }
    procedure GenerateRandomNames();
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_NameGenerator.btnOutputCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memOutput.Text);
end;

procedure TFrame_NameGenerator.btnRefreshClick(Sender: TObject);
begin
  GenerateRandomNames();
end;

procedure TFrame_NameGenerator.GenerateRandomNames;
begin
  memOutput.Text := '';
  for var I := 1 to Round(sbAmount.Value) do
  begin
    var RandomName := GenerateRandomName(SwitchSurname.IsChecked);
    while (RandomName.Length > sbMaxLength.Value) do RandomName := GenerateRandomName(SwitchSurname.IsChecked);

    if (cbLetterCase.Selected.Text = 'lower') then RandomName := RandomName.ToLower;
    if (cbLetterCase.Selected.Text = 'UPPER') then RandomName := RandomName.ToUpper;

    memOutput.Lines.Add(RandomName);
  end;
end;

procedure TFrame_NameGenerator.SwitchSurnameSwitch(Sender: TObject);
begin
  if (lblSwitchSurname.Text = 'On') then
  begin
    lblSwitchSurname.Text := 'Off';
    SwitchSurname.IsChecked := False;
  end else
  begin
    lblSwitchSurname.Text := 'On';
    SwitchSurname.IsChecked := True;
  end;
  GenerateRandomNames();
end;

end.
