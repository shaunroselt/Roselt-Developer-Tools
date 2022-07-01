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
    FisDarkMode: Boolean;
    { Private declarations }
  public
    { Public declarations }
    function isDarkMode(StyleName: String): Boolean;
  end;

var
  dmStyles: TdmStyles;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TdmStyles }

function TdmStyles.isDarkMode(StyleName: String): Boolean;
const
  DarkStyles: array[0..6] of string = ('Copper Dark', 'Coral Crystal','Emerald Crystal','Calypso','Calypso SE',
                                       'Material Oxford Blue','Material Oxford Blue SE');
  LightStyles: array[0..4] of string = ('Copper', 'Coral Dark','Diamond','Emerald Dark','Material Patterns Blue');
begin
  result := false;
  for var I := 0 to Length(DarkStyles) do
    if DarkStyles[I] = StyleName then
    begin
      result := true;
      break;
    end;
end;

end.
