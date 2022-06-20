// These styles were downloaded from GetIt Package Manager
unit uStyles;

interface

uses
  System.SysUtils,
  System.Classes,
  FMX.Types,
  FMX.Controls;

type
  TdmStyles = class(TDataModule)
    StyleCopperDark: TStyleBook;
    StyleCopper: TStyleBook;
    StyleCoralCrystal: TStyleBook;
    StyleCoralDark: TStyleBook;
    StyleDiamond: TStyleBook;
    StyleEmeraldCrystal: TStyleBook;
    StyleEmeraldDark: TStyleBook;
    StyleCalypso: TStyleBook;
    StyleCalypsoSE: TStyleBook;
    StyleMaterialOxfordBlue: TStyleBook;
    StyleMaterialOxfordBlueSE: TStyleBook;
    StyleMaterialPatternsBlue: TStyleBook;
    StylePuertoRico: TStyleBook;
    StyleStellar: TStyleBook;
    StyleUbuntuClearFantasy: TStyleBook;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmStyles: TdmStyles;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
