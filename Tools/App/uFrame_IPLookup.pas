unit uFrame_IPLookup;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Skia, FMX.Skia, FMX.Edit, FMX.Controls.Presentation, IdBaseComponent,
  IdComponent, IdRawBase, IdRawClient, IdIcmpClient, winsock;

type
  TFrame_IPLookup = class(TFrame)
    lblHeading: TLabel;
    edtIP: TEdit;
    lblSubHeading: TLabel;
    btnLookup: TButton;
    svgBtnIPLookup: TSkSvg;
    lblBtnIPLookupLabel: TLabel;
    pnlDeatails: TPanel;
    lblDetailsHeading: TLabel;
    pnlDetailsContainer: TPanel;
    lblIP: TLabel;
    lblState: TLabel;
    lblCountry: TLabel;
    lblCity: TLabel;
    lblLatitude: TLabel;
    lblLongitude: TLabel;
    lblISP: TLabel;
    IdIcmpClient: TIdIcmpClient;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
