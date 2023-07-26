unit uFrame_UUIDGenerator;

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
  FMX.EditBox,
  FMX.SpinBox,
  FMX.ListBox,
  FMX.Objects,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.Edit,
  FMX.Platform,
  FMX.Controls.Presentation,
  FMX.Layouts,
  System.Skia,
  FMX.Skia;

type
  TFrame_UUIDGenerator = class(TFrame)
    layBottom: TLayout;
    memTitleOutput: TLabel;
    memOutput: TMemo;
    layTop: TLayout;
    lblConfiguration: TLabel;
    layLetterCase: TRectangle;
    layLetterCaseTitleDescription: TLayout;
    lblLetterCaseTitle: TLabel;
    lblLetterCaseDescription: TLabel;
    SwitchLetterCase: TSwitch;
    lblSwitchLetterCase: TLabel;
    layUUIDVersion: TRectangle;
    imgUUIDVersion: TSkSvg;
    cbUUIDVersion: TComboBox;
    layUUIDVersionTitleDescription: TLayout;
    lblUUIDVersionTitle: TLabel;
    lblUUIDVersionDescription: TLabel;
    layHyphens: TRectangle;
    layHyphensTitleDescription: TLayout;
    lblHyphensTitle: TLabel;
    lblHyphensDescription: TLabel;
    SwitchHyphens: TSwitch;
    lblSwitchHyphens: TLabel;
    imgHyphens: TSkSvg;
    imgLetterCase: TSkSvg;
    btnOutputCopyToClipboard: TButton;
    imgOutputCopyToClipboard: TSkSvg;
    lblOutputCopyToClipboard: TLabel;
    btnOutputRefresh: TButton;
    imgOutputRefresh: TSkSvg;
    lblOutputRefresh: TLabel;
    layAmount: TRectangle;
    imgAmount: TSkSvg;
    layAmountTitleDescription: TLayout;
    lblAmountTitle: TLabel;
    lblAmountDescription: TLabel;
    sbAmount: TSpinBox;
    procedure btnOutputCopyToClipboardClick(Sender: TObject);
    procedure btnOutputRefreshClick(Sender: TObject);
    procedure SwitchLetterCaseSwitch(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GenerateRandomUUID();
  end;

implementation

{$R *.fmx}

procedure TFrame_UUIDGenerator.btnOutputCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memOutput.Text);
end;

procedure TFrame_UUIDGenerator.btnOutputRefreshClick(Sender: TObject);
begin
  GenerateRandomUUID;
end;

procedure TFrame_UUIDGenerator.GenerateRandomUUID;
begin
  memOutput.Text := '';
  for var I := 1 to Round(sbAmount.Value) do
  begin
    var RandomUUID := TGUID.NewGuid.ToString;

    if (SwitchLetterCase.IsChecked) then
      RandomUUID := RandomUUID.ToUpper
    else
      RandomUUID := RandomUUID.ToLower;
    if (SwitchHyphens.IsChecked = False) then RandomUUID := RandomUUID.Replace('-','',[rfReplaceAll]);

    RandomUUID := RandomUUID.Replace('{','',[rfReplaceAll]).Replace('}','',[rfReplaceAll]);

    memOutput.Lines.Add(Trim(RandomUUID));
  end;
end;

procedure TFrame_UUIDGenerator.SwitchLetterCaseSwitch(Sender: TObject);
begin
  if (lblSwitchLetterCase.Text = 'Lowercase') then
  begin
    lblSwitchLetterCase.Text := 'Uppercase';
    SwitchLetterCase.IsChecked := True;
  end else
  begin
    lblSwitchLetterCase.Text := 'Lowercase';
    SwitchLetterCase.IsChecked := False;
  end;
  GenerateRandomUUID();
end;

end.
