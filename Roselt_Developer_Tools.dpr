program Roselt_Developer_Tools;



{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  uMain in 'uMain.pas' {frmMain},
  uStyles in 'uStyles.pas' {dmStyles: TDataModule},
  Roselt.Tools in 'Roselt.Tools.pas',
  uFrame_Base64ImageEncoderDecoder in 'Tools\App\uFrame_Base64ImageEncoderDecoder.pas' {Frame_Base64ImageEncoderDecoder: TFrame},
  uFrame_Base64TextEncoderDecoder in 'Tools\App\uFrame_Base64TextEncoderDecoder.pas' {Frame_Base64TextEncoderDecoder: TFrame},
  uFrame_BootstrapIcons in 'Tools\App\uFrame_BootstrapIcons.pas' {Frame_BootstrapIcons: TFrame},
  uFrame_ColorPicker in 'Tools\App\uFrame_ColorPicker.pas' {Frame_ColorPicker: TFrame},
  uFrame_CSSFormatter in 'Tools\App\uFrame_CSSFormatter.pas' {Frame_CSSFormatter: TFrame},
  uFrame_DelphiFormatter in 'Tools\App\uFrame_DelphiFormatter.pas' {Frame_DelphiFormatter: TFrame},
  uFrame_GZipCompressDecompress in 'Tools\App\uFrame_GZipCompressDecompress.pas' {Frame_GZipCompressDecompress: TFrame},
  uFrame_HashGenerator in 'Tools\App\uFrame_HashGenerator.pas' {Frame_HashGenerator: TFrame},
  uFrame_HTMLEncoderDecoder in 'Tools\App\uFrame_HTMLEncoderDecoder.pas' {Frame_HTMLEncoderDecoder: TFrame},
  uFrame_HTMLFormatter in 'Tools\App\uFrame_HTMLFormatter.pas' {Frame_HTMLFormatter: TFrame},
  uFrame_HTMLPreview in 'Tools\App\uFrame_HTMLPreview.pas' {Frame_HTMLPreview: TFrame},
  uFrame_ImageEffects in 'Tools\App\uFrame_ImageEffects.pas' {Frame_ImageEffects: TFrame},
  uFrame_JavaScriptFormatter in 'Tools\App\uFrame_JavaScriptFormatter.pas' {Frame_JavaScriptFormatter: TFrame},
  uFrame_JsonFormatter in 'Tools\App\uFrame_JsonFormatter.pas' {Frame_JsonFormatter: TFrame},
  uFrame_JsonYamlConverter in 'Tools\App\uFrame_JsonYamlConverter.pas' {Frame_JsonYamlConverter: TFrame},
  uFrame_JWTDecoder in 'Tools\App\uFrame_JWTDecoder.pas' {Frame_JWTDecoder: TFrame},
  uFrame_JWTTokenGenerator in 'Tools\App\uFrame_JWTTokenGenerator.pas' {Frame_JWTTokenGenerator: TFrame},
  uFrame_LoremIpsumGenerator in 'Tools\App\uFrame_LoremIpsumGenerator.pas' {Frame_LoremIpsumGenerator: TFrame},
  uFrame_MarkdownPreview in 'Tools\App\uFrame_MarkdownPreview.pas' {Frame_MarkdownPreview: TFrame},
  uFrame_NameGenerator in 'Tools\App\uFrame_NameGenerator.pas' {Frame_NameGenerator: TFrame},
  uFrame_NumberBaseConverter in 'Tools\App\uFrame_NumberBaseConverter.pas' {Frame_NumberBaseConverter: TFrame},
  uFrame_PasswordGenerator in 'Tools\App\uFrame_PasswordGenerator.pas' {Frame_PasswordGenerator: TFrame},
  uFrame_PHPFormatter in 'Tools\App\uFrame_PHPFormatter.pas' {Frame_PHPFormatter: TFrame},
  uFrame_PingIPDomain in 'Tools\App\uFrame_PingIPDomain.pas' {Frame_PingIPDomain: TFrame},
  uFrame_RegexTester in 'Tools\App\uFrame_RegexTester.pas' {Frame_RegexTester: TFrame},
  uFrame_SQLFormatter in 'Tools\App\uFrame_SQLFormatter.pas' {Frame_SQLFormatter: TFrame},
  uFrame_TextCaseConverterInspector in 'Tools\App\uFrame_TextCaseConverterInspector.pas' {Frame_TextCaseConverterInspector: TFrame},
  uFrame_TextEscapeUnescape in 'Tools\App\uFrame_TextEscapeUnescape.pas' {Frame_TextEscapeUnescape: TFrame},
  uFrame_TextToArray in 'Tools\App\uFrame_TextToArray.pas' {Frame_TextToArray: TFrame},
  uFrame_TimestampConverter in 'Tools\App\uFrame_TimestampConverter.pas' {Frame_TimestampConverter: TFrame},
  uFrame_URLEncoderDecoder in 'Tools\App\uFrame_URLEncoderDecoder.pas' {Frame_URLEncoderDecoder: TFrame},
  uFrame_UUIDGenerator in 'Tools\App\uFrame_UUIDGenerator.pas' {Frame_UUIDGenerator: TFrame},
  uFrame_XMLFormatter in 'Tools\App\uFrame_XMLFormatter.pas' {Frame_XMLFormatter: TFrame},
  Roselt.CodeFormatting in 'Lib\Roselt.CodeFormatting.pas',
  Roselt.ColorConversion in 'Lib\Roselt.ColorConversion.pas',
  Roselt.JsonYamlConverter in 'Lib\Roselt.JsonYamlConverter.pas',
  Roselt.LoremIpsum in 'Lib\Roselt.LoremIpsum.pas',
  Roselt.NameGenerator in 'Lib\Roselt.NameGenerator.pas',
  Roselt.NumberBaseConversion in 'Lib\Roselt.NumberBaseConversion.pas',
  Roselt.Screenshot in 'Lib\Roselt.Screenshot.pas',
  Roselt.SystemInformation in 'Lib\Roselt.SystemInformation.pas',
  Roselt.Utility in 'Lib\Roselt.Utility.pas',
  uBootstrapIcons in 'Lib\uBootstrapIcons.pas',
  Roselt.AppInfo in 'Roselt.AppInfo.pas',
  uFontAwesomeIcons in 'Lib\uFontAwesomeIcons.pas',
  uFrame_FontAwesomeIcons in 'Tools\App\uFrame_FontAwesomeIcons.pas' {Frame_FontAwesomeIcons: TFrame},
  uFeatherIcons in 'Lib\uFeatherIcons.pas',
  uFrame_TraceRoute in 'Tools\App\uFrame_TraceRoute.pas' {Frame_TraceRoute: TFrame},
  uFrame_FeatherIcons in 'Tools\App\uFrame_FeatherIcons.pas' {Frame_FeatherIcons: TFrame},
  Roselt.Clipboard in 'Lib\Roselt.Clipboard.pas',
  uFrame_ImageConverter in 'Tools\App\uFrame_ImageConverter.pas' {Frame_ImageConverter: TFrame};

{$R *.res}

begin
  GlobalUseSkia := True;
//  {$IFDEF DEBUG}
//    ReportMemoryLeaksOnShutdown := True; // This could be useful. Need to learn how it works.
//  {$ENDIF}
  Application.Initialize;
  Application.CreateForm(TdmStyles, dmStyles);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.