program Roselt_Developer_Tools;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {frmMain},
  uStyles in 'uStyles.pas' {dmStyles: TDataModule},
  Roselt.ColorConversion in 'Roselt.ColorConversion.pas',
  Roselt.LoremIpsum in 'Roselt.LoremIpsum.pas',
  Roselt.Screenshot in 'Roselt.Screenshot.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmStyles, dmStyles);
  Application.Run;
end.
