program Roselt_Developer_Tools_Web;

{$R *.dres}

uses
  Vcl.Forms,
  WEBLib.Forms,
  uMain_web in 'uMain_web.pas' {frmMain: TWebForm} {*.html},
  Roselt.Tools in 'Roselt.Tools.pas',
  uBootstrapIcons in 'Lib\uBootstrapIcons.pas',
  Roselt.AppInfo in 'Roselt.AppInfo.pas',
  uFrame_NameGenerator in 'Tools\Web\uFrame_NameGenerator.pas' {Frame_NameGenerator: TWebFrame} {*.html},
  uFontAwesomeIcons in 'Lib\uFontAwesomeIcons.pas',
  Roselt.NameGenerator in 'Lib\Roselt.NameGenerator.pas',
  Roselt.Utility in 'Lib\Roselt.Utility.pas',
  Roselt.NumberBaseConversion in 'Lib\Roselt.NumberBaseConversion.pas',
  uFeatherIcons in 'Lib\uFeatherIcons.pas',
  Roselt.SystemInformation in 'Lib\Roselt.SystemInformation.pas',
  Roselt.Clipboard in 'Lib\Roselt.Clipboard.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
