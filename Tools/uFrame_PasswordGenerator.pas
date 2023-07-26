unit uFrame_PasswordGenerator;

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
  FMX.Controls.Presentation,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.Edit,
  FMX.EditBox,
  FMX.SpinBox,
  FMX.Platform,
  FMX.ListBox,
  FMX.Layouts,
  FMX.Objects,

  System.Skia,
  FMX.Skia;

type
  TFrame_PasswordGenerator = class(TFrame)
    layBottom: TLayout;
    memTitleOutput: TLabel;
    btnRefresh: TButton;
    imgRefresh: TSkSvg;
    lblRefresh: TLabel;
    btnOutputCopyToClipboard: TButton;
    imgOutputCopyToClipboard: TSkSvg;
    lblOutputCopyToClipboard: TLabel;
    memOutput: TMemo;
    layTop: TLayout;
    lblConfiguration: TLabel;
    laySpecialCharacters: TRectangle;
    imgSpecialCharacters: TSkSvg;
    laySpecialCharactersTitleDescription: TLayout;
    lblSpecialCharactersTitle: TLabel;
    lblSpecialCharactersDescription: TLabel;
    lblSwitchSpecialCharacters: TLabel;
    SpecialCharactersSwitch: TSwitch;
    layAmount: TRectangle;
    imgAmount: TSkSvg;
    layAmountTitleDescription: TLayout;
    lblAmountTitle: TLabel;
    lblAmountDescription: TLabel;
    sbAmount: TSpinBox;
    layLetterCase: TRectangle;
    layLetterCaseTitleDescription: TLayout;
    lblLetterCaseTitle: TLabel;
    lblLetterCaseDescription: TLabel;
    imgLetterCase: TSkSvg;
    cbLetterCase: TComboBox;
    layPasswordLength: TRectangle;
    imgPasswordLength: TSkSvg;
    layPasswordLengthTitleDescription: TLayout;
    lblPasswordLengthTitle: TLabel;
    lblPasswordLengthDescription: TLabel;
    sbPasswordLength: TSpinBox;
    layNumberCharacters: TRectangle;
    imgNumberCharacters: TSkSvg;
    layTitleDescriptionNumberCharacters: TLayout;
    lblTitleNumberCharacters: TLabel;
    lblDescriptionNumberCharacters: TLabel;
    lblSwitchNumberCharacters: TLabel;
    SwitchNumberCharacters: TSwitch;
    procedure btnRefreshClick(Sender: TObject);
    procedure btnOutputCopyToClipboardClick(Sender: TObject);
    procedure SpecialCharactersSwitchSwitch(Sender: TObject);
    procedure SwitchNumberCharactersSwitch(Sender: TObject);
  private
    { Private declarations }
    procedure GenerateRandomPassword();
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_PasswordGenerator.btnOutputCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memOutput.Text);
end;

procedure TFrame_PasswordGenerator.btnRefreshClick(Sender: TObject);
begin
  GenerateRandomPassword();
end;

procedure TFrame_PasswordGenerator.GenerateRandomPassword;
  function GeneratePassword(HowManyPasswords, PasswordLength: UInt64; SpecialChars, NumberChars: Boolean): string;
  begin
    var charSet := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    if (NumberChars) then charSet := charSet + '0123456789';
    if (SpecialChars) then charSet := charSet + '!@#$%^&*()_+-=';

    Result := '';
    for var i := 1 to HowManyPasswords do
    begin
      for var j := 1 to PasswordLength do
        Result := Result + charSet[Random(charSet.Length) + 1];
      Result := Result + sLineBreak;
    end;
  end;
begin
  var RandomPassword := GeneratePassword(
                          Round(sbAmount.Value),
                          Round(sbPasswordLength.Value),
                          SpecialCharactersSwitch.IsChecked,
                          SwitchNumberCharacters.IsChecked
                        );
  if (cbLetterCase.Selected.Text = 'lower') then RandomPassword := RandomPassword.ToLower;
  if (cbLetterCase.Selected.Text = 'UPPER') then RandomPassword := RandomPassword.ToUpper;

  memOutput.Text := RandomPassword;
end;

procedure TFrame_PasswordGenerator.SpecialCharactersSwitchSwitch(Sender: TObject);
begin
  if (lblSwitchSpecialCharacters.Text = 'On') then
  begin
    lblSwitchSpecialCharacters.Text := 'Off';
    SpecialCharactersSwitch.IsChecked := False;
  end else
  begin
    lblSwitchSpecialCharacters.Text := 'On';
    SpecialCharactersSwitch.IsChecked := True;
  end;
  GenerateRandomPassword();
end;

procedure TFrame_PasswordGenerator.SwitchNumberCharactersSwitch(
  Sender: TObject);
begin
  if (lblSwitchNumberCharacters.Text = 'On') then
  begin
    lblSwitchNumberCharacters.Text := 'Off';
    SwitchNumberCharacters.IsChecked := False;
  end else
  begin
    lblSwitchNumberCharacters.Text := 'On';
    SwitchNumberCharacters.IsChecked := True;
  end;
  GenerateRandomPassword();
end;

end.
