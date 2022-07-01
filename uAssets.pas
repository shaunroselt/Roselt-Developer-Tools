{ https://icons.getbootstrap.com/ }
unit uAssets;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, FMX.ImgList, FMX.Graphics;

type
  TdmAssets = class(TDataModule)
    IconsDark: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetIcon(IconName: String; DarkMode: Boolean): TBitmap;
  end;

var
  dmAssets: TdmAssets;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TdmAssets }

function TdmAssets.GetIcon(IconName: String; DarkMode: Boolean): TBitmap;
begin

end;

end.
