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

  Roselt.NameGenerator;

type
  TFrame_NameGenerator = class(TWebFrame)
    WebLabel1: TWebLabel;
    WebPanel1: TWebPanel;
    imgExpandCollapseTestingMoreStuff: TWebHTMLDiv;
    WebComboBox1: TWebComboBox;
    WebPanel2: TWebPanel;
    WebLabel2: TWebLabel;
    WebLabel3: TWebLabel;
    btnRefresh: TWebButton;
    WebPanel3: TWebPanel;
    WebLabel4: TWebLabel;
    memOutput: TWebMemo;
    procedure btnRefreshClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frame_NameGenerator: TFrame_NameGenerator;

implementation

{$R *.dfm}

procedure TFrame_NameGenerator.btnRefreshClick(Sender: TObject);
begin
  memOutput.Lines.Add(GenerateRandomRealName(true));
end;

end.