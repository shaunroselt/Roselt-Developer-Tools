unit uFrame_NameGenerator;

interface

uses
  System.SysUtils,
  System.Classes,

  JS,
  Web,

  Vcl.Controls,
  Vcl.StdCtrls,

  WEBLib.Graphics,
  WEBLib.Controls,
  WEBLib.Forms,
  WEBLib.Dialogs,
  WEBLib.ExtCtrls,
  WEBLib.StdCtrls,
  WEBLib.WebCtrls,
  WEBLib.Buttons,

  Roselt.NameGenerator;

type
  TFrame_NameGenerator = class(TWebFrame)
    WebLabel1: TWebLabel;
    layLetterCase: TWebPanel;
    imgLetterCase: TWebHTMLDiv;
    cbLetterCase: TWebComboBox;
    layTitleDescriptionLetterCase: TWebPanel;
    lblDescriptionLetterCase: TWebLabel;
    lblTitleLetterCase: TWebLabel;
    btnRefresh: TWebButton;
    layMemTitleOutput: TWebPanel;
    memTitleOutput: TWebLabel;
    memOutput: TWebMemo;
    layAmount: TWebPanel;
    imgAmount: TWebHTMLDiv;
    layTitleDescriptionAmount: TWebPanel;
    lblDescriptionAmount: TWebLabel;
    lblTitleAmount: TWebLabel;
    sbAmount: TWebSpinEdit;
    layNameList: TWebPanel;
    imgNameList: TWebHTMLDiv;
    cbNameList: TWebComboBox;
    layTitleDescriptionNameList: TWebPanel;
    lblDescriptionNameList: TWebLabel;
    lblTitleNameList: TWebLabel;
    layMaxLength: TWebPanel;
    WebHTMLDiv2: TWebHTMLDiv;
    WebPanel5: TWebPanel;
    WebLabel5: TWebLabel;
    WebLabel6: TWebLabel;
    sbMaxLength: TWebSpinEdit;
    laySurname: TWebPanel;
    WebHTMLDiv3: TWebHTMLDiv;
    WebPanel7: TWebPanel;
    WebLabel7: TWebLabel;
    WebLabel8: TWebLabel;
    SwitchSurname: TWebToggleButton;
    layBottom: TWebPanel;
    btnCopy: TWebButton;
    procedure btnRefreshClick(Sender: TObject);
  private
    { Private declarations }
    procedure GenerateRandomNames();
  public
    { Public declarations }
  end;

var
  Frame_NameGenerator: TFrame_NameGenerator;

implementation

{$R *.dfm}

procedure TFrame_NameGenerator.btnRefreshClick(Sender: TObject);
begin
  GenerateRandomNames();
end;

procedure TFrame_NameGenerator.GenerateRandomNames;
var
  I: UInt64;
  RandomName: String;
begin
  memOutput.Lines.Clear;
  for I := 1 to Round(sbAmount.Value) do
  begin
    RandomName := '';
    if (cbNameList.Text = 'Real Life') then
    begin
      RandomName := GenerateRandomRealName(SwitchSurname.Checked);
      while (RandomName.Length > sbMaxLength.Value) do
        RandomName := GenerateRandomRealName(SwitchSurname.Checked);
    end;
    if (cbNameList.Text = 'GTA Vice City') then
    begin
      RandomName := GenerateRandomGTAViceCityName(SwitchSurname.Checked);
      while (RandomName.Length > sbMaxLength.Value) do
        RandomName := GenerateRandomGTAViceCityName(SwitchSurname.Checked);
    end;
    if (cbNameList.Text = 'GTA San Andreas') then
    begin
      RandomName := GenerateRandomGTASanAndreasName(SwitchSurname.Checked);
      while (RandomName.Length > sbMaxLength.Value) do
        RandomName := GenerateRandomGTASanAndreasName(SwitchSurname.Checked);
    end;


    if (cbLetterCase.Text = 'lower') then RandomName := RandomName.ToLower;
    if (cbLetterCase.Text = 'UPPER') then RandomName := RandomName.ToUpper;

    memOutput.Lines.Add(RandomName);
  end;
end;

end.