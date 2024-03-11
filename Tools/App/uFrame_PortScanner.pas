unit uFrame_PortScanner;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Skia, FMX.Skia, FMX.ListBox, FMX.Edit, FMX.Controls.Presentation;

type
  TFrame_PortScanner = class(TFrame)
    lblPortScanHeading: TLabel;
    lblDomainIP: TLabel;
    edtDomainIP: TEdit;
    lblPortType: TLabel;
    cbPortType: TComboBox;
    lblPorts: TLabel;
    edtPorts: TEdit;
    btnScan: TButton;
    svgPortScan: TSkSvg;
    lblScan: TLabel;
    procedure cbPortTypeChange(Sender: TObject);
  private
    { Private declarations }
    CommonPorts, GamePorts, ServerPorts, ApplicationPorts, P2PPorts: TStringList;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{ TFrame_PortScanner }

constructor TFrame_PortScanner.Create(AOwner: TComponent);
begin
  inherited;
  CommonPorts := TStringList.Create;
  CommonPorts.CommaText := '21,22,23,25,53,80,110,115,135,139,143,194,443,445,1433,3306,3389,5632,5900,25565';

  GamePorts := TStringList.Create;
  GamePorts.CommaText := '666,2302,3453,3724,4000,5154,6112,6113,6114,6115,6116,6117,6118,6119,7777,10093,10094,12203,14567,25565,26000,27015,27910,28000,50000';

  ServerPorts := TStringList.Create;
  ServerPorts.CommaText := '21,22,23,25,53,80,110,137,138,139,143,443,445,548,587,993,995,1433,1701,1723,3306,5432,8008,8443';

  ApplicationPorts := TStringList.Create;
  ApplicationPorts.CommaText := '515,631,3282,3389,5190,5050,4443,1863,6891,1503,5631,5632,5900,6667';

  P2PPorts := TStringList.Create;
  P2PPorts.CommaText := '119,375,425,1214,412,1412,2412,4661,4662,4665,5500,6346,6881,6882,6883,6884,6885,6886,6887,6888,6889';
end;

destructor TFrame_PortScanner.Destroy;
begin
  CommonPorts.Free;
  GamePorts.Free;
  ServerPorts.Free;
  ApplicationPorts.Free;
  P2PPorts.Free;
  inherited;
end;

procedure TFrame_PortScanner.cbPortTypeChange(Sender: TObject);
begin
  case cbPortType.ItemIndex of
    0:
    begin
      edtPorts.Enabled := True;
      edtPorts.Text := CommonPorts.CommaText;
    end;
    else
      edtPorts.Enabled := False;
  end;
end;

end.

