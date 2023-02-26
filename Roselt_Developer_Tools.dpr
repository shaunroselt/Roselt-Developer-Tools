program Roselt_Developer_Tools;



uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {frmMain},
  uStyles in 'uStyles.pas' {dmStyles: TDataModule},
  Roselt.ColorConversion in 'Roselt.ColorConversion.pas',
  Roselt.LoremIpsum in 'Roselt.LoremIpsum.pas',
  Roselt.Screenshot in 'Roselt.Screenshot.pas',
  Roselt.NameGenerator in 'Roselt.NameGenerator.pas',
  uFrame_Base64TextEncoderDecoder in 'Tools\uFrame_Base64TextEncoderDecoder.pas' {Frame_Base64TextEncoderDecoder: TFrame},
  uFrame_JsonYamlConverter in 'Tools\uFrame_JsonYamlConverter.pas' {Frame_JsonYamlConverter: TFrame},
  uFrame_HashGenerator in 'Tools\uFrame_HashGenerator.pas' {Frame_HashGenerator: TFrame},
  uFrame_HTMLEncoderDecoder in 'Tools\uFrame_HTMLEncoderDecoder.pas' {Frame_HTMLEncoderDecoder: TFrame},
  uFrame_JsonFormatter in 'Tools\uFrame_JsonFormatter.pas' {Frame_JsonFormatter: TFrame},
  uFrame_LoremIpsumGenerator in 'Tools\uFrame_LoremIpsumGenerator.pas' {Frame_LoremIpsumGenerator: TFrame},
  uFrame_TextCaseConverterInspector in 'Tools\uFrame_TextCaseConverterInspector.pas' {Frame_TextCaseConverterInspector: TFrame},
  uFrame_ColorPicker in 'Tools\uFrame_ColorPicker.pas' {Frame_ColorPicker: TFrame},
  Roselt.JsonYamlConverter in 'Roselt.JsonYamlConverter.pas',
  uFrame_TimestampConverter in 'Tools\uFrame_TimestampConverter.pas' {Frame_TimestampConverter: TFrame},
  uFrame_NumberBaseConverter in 'Tools\uFrame_NumberBaseConverter.pas' {Frame_NumberBaseConverter: TFrame},
  uFrame_URLEncoderDecoder in 'Tools\uFrame_URLEncoderDecoder.pas' {Frame_URLEncoderDecoder: TFrame},
  uFrame_GZipCompressDecompress in 'Tools\uFrame_GZipCompressDecompress.pas' {Frame_GZipCompressDecompress: TFrame},
  uFrame_JWTDecoder in 'Tools\uFrame_JWTDecoder.pas' {Frame_JWTDecoder: TFrame},
  uFrame_Base64ImageEncoderDecoder in 'Tools\uFrame_Base64ImageEncoderDecoder.pas' {Frame_Base64ImageEncoderDecoder: TFrame},
  uFrame_SQLFormatter in 'Tools\uFrame_SQLFormatter.pas' {Frame_SQLFormatter: TFrame},
  uFrame_HTMLFormatter in 'Tools\uFrame_HTMLFormatter.pas' {Frame_HTMLFormatter: TFrame},
  uFrame_CSSFormatter in 'Tools\uFrame_CSSFormatter.pas' {Frame_CSSFormatter: TFrame},
  uFrame_PHPFormatter in 'Tools\uFrame_PHPFormatter.pas' {Frame_PHPFormatter: TFrame},
  uFrame_JavaScriptFormatter in 'Tools\uFrame_JavaScriptFormatter.pas' {Frame_JavaScriptFormatter: TFrame},
  uFrame_XMLFormatter in 'Tools\uFrame_XMLFormatter.pas' {Frame_XMLFormatter: TFrame},
  uFrame_UUIDGenerator in 'Tools\uFrame_UUIDGenerator.pas' {Frame_UUIDGenerator: TFrame},
  uFrame_NameGenerator in 'Tools\uFrame_NameGenerator.pas' {Frame_NameGenerator: TFrame},
  uFrame_TextEscapeUnescape in 'Tools\uFrame_TextEscapeUnescape.pas' {Frame_TextEscapeUnescape: TFrame},
  uFrame_MarkdownPreview in 'Tools\uFrame_MarkdownPreview.pas' {Frame_MarkdownPreview: TFrame},
  uFrame_RegexTester in 'Tools\uFrame_RegexTester.pas' {Frame_RegexTester: TFrame},
  uBootstrapIcons in 'uBootstrapIcons.pas',
  Roselt.SystemInformation in 'Roselt.SystemInformation.pas',
  Roselt.NumberBaseConversion in 'Roselt.NumberBaseConversion.pas',
  Roselt.Tools in 'Roselt.Tools.pas',
  uFrame_JWTTokenGenerator in 'Tools\uFrame_JWTTokenGenerator.pas' {Frame_JWTTokenGenerator: TFrame},
  Roselt.Utility in 'Roselt.Utility.pas',
  uFrame_PasswordGenerator in 'Tools\uFrame_PasswordGenerator.pas' {Frame_PasswordGenerator: TFrame},
  uFrame_ImageEffects in 'Tools\uFrame_ImageEffects.pas' {Frame_ImageEffects: TFrame},
  uFrame_HTMLPreview in 'Tools\uFrame_HTMLPreview.pas' {Frame_HTMLPreview: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmStyles, dmStyles);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
