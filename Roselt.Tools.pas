unit Roselt.Tools;

interface

type
  TRoseltTools = record
    {
      A Tool qualifies as a Parent when the parent property is empty and
      there is a different Tool in the array with its parent property set to the name of the parent
    }
    text_short: String;
    text_long: String;
    name: String;
    description: String;
    icon: String;
    active: Boolean;
    visible: Boolean;
    parent: String;
  end;

const
  RoseltToolsArray: array[0..35] of TRoseltTools = (
    ( // Converters Main Category (Parent)
      text_short: 'Converters';
      text_long: 'Converters';
      name: 'Converters';
      description: 'Converters';
      icon: 'arrow-left-right';
      active: true;
      visible: true;
      parent: '';
    ),
    ( // Converters Main Category (Parent)
      text_short: 'Encoders / Decoders';
      text_long: 'Encoders / Decoders';
      name: 'EncodersDecoders';
      description: 'Encoders / Decoders';
      icon: 'file-binary';
      active: true;
      visible: true;
      parent: '';
    ),
    ( // Converters Main Category (Parent)
      text_short: 'Formatters';
      text_long: 'Formatters';
      name: 'Formatters';
      description: 'Formatters';
      icon: 'list-columns';
      active: true;
      visible: true;
      parent: '';
    ),
    ( // Converters Main Category (Parent)
      text_short: 'Generators';
      text_long: 'Generators';
      name: 'Generators';
      description: 'Generators';
      icon: 'asterisk';
      active: true;
      visible: true;
      parent: '';
    ),
    ( // Converters Main Category (Parent)
      text_short: 'Text';
      text_long: 'Text';
      name: 'Text';
      description: 'Text';
      icon: 'body-text';
      active: true;
      visible: true;
      parent: '';
    ),
    ( // Converters Main Category (Parent)
      text_short: 'Graphics';
      text_long: 'Graphics';
      name: 'Graphics';
      description: 'Graphics';
      icon: 'images';
      active: true;
      visible: true;
      parent: '';
    ),
    (
      text_short: 'Testing';
      text_long: 'Testing';
      name: 'Testing';
      description: 'Just a playground for me to test random things on';
      icon: 'box';
      active: true;
      visible: true;
      parent: '';
    ),
    (
      text_short: 'JSON <> YAML';
      text_long: 'JSON <> YAML';
      name: 'JsonYamlConverter';
      description: 'Convert JSON to YAML and vice versa';
      icon: 'arrow-left-right';
      active: true;
      visible: true;
      parent: 'Converters';
    ),
    (
      text_short: 'Timestamp';
      text_long: 'Timestamp';
      name: 'TimestampConverter';
      description: 'Convert timestamp to human-readable text and vice versa';
      icon: 'calendar3';
      active: true;
      visible: true;
      parent: 'Converters';
    ),
    (
      text_short: 'Number Base';
      text_long: 'Number Base';
      name: 'NumberBaseConverter';
      description: 'Convert numbers from one base to another';
      icon: '123';
      active: true;
      visible: true;
      parent: 'Converters';
    ),
    (
      text_short: 'HTML';
      text_long: 'HTML';
      name: 'HTMLEncoderDecoder';
      description: 'Encode and decode applicable characters';
      icon: 'code-slash';
      active: true;
      visible: true;
      parent: 'EncodersDecoders';
    ),
    (
      text_short: 'URL';
      text_long: 'URL';
      name: 'URLEncoderDecoder';
      description: 'Encode and decode applicable characters';
      icon: 'link';
      active: true;
      visible: true;
      parent: 'EncodersDecoders';
    ),
    (
      text_short: 'Base64 Text';
      text_long: 'Base64 Text';
      name: 'Base64EncoderDecoder';
      description: 'Encode and decode Base64 text data';
      icon: 'file-binary';
      active: true;
      visible: true;
      parent: 'EncodersDecoders';
    ),
    (
      text_short: 'Base64 Image';
      text_long: 'Base64 Image';
      name: 'Base64ImageEncoderDecoder';
      description: 'Encode and decode Base64 image data';
      icon: 'file-binary';
      active: true;
      visible: true;
      parent: 'EncodersDecoders';
    ),
    (
      text_short: 'GZip';
      text_long: 'GZip';
      name: 'GZipCompressDecompress';
      description: 'Compress or decompress strings';
      icon: 'file-zip';
      active: true;
      visible: true;
      parent: 'EncodersDecoders';
    ),
    (
      text_short: 'JWT Decoder';
      text_long: 'JWT Decoder';
      name: 'JWTDecoder';
      description: 'Decode a JWT header, payload and signature';
      icon: 'gear-wide';
      active: true;
      visible: true;
      parent: 'EncodersDecoders';
    ),
    (
      text_short: 'JSON';
      text_long: 'JSON Formatter';
      name: 'JsonFormatter';
      description: 'Indent or minify JSON data';
      icon: 'filetype-json';
      active: true;
      visible: true;
      parent: 'Formatters';
    ),
    (
      text_short: 'HTML';
      text_long: 'HTML Formatter';
      name: 'HTMLFormatter';
      description: 'Indent or minify HTML code';
      icon: 'filetype-html';
      active: true;
      visible: true;
      parent: 'Formatters';
    ),
    (
      text_short: 'SQL';
      text_long: 'SQL Formatter';
      name: 'SQLFormatter';
      description: 'Indent SQL queries';
      icon: 'server';
      active: true;
      visible: true;
      parent: 'Formatters';
    ),
    (
      text_short: 'XML';
      text_long: 'XML Formatter';
      name: 'XMLFormatter';
      description: 'Indent or minify XML data';
      icon: 'filetype-xml';
      active: true;
      visible: true;
      parent: 'Formatters';
    ),
    (
      text_short: 'JavaScript';
      text_long: 'JavaScript Formatter';
      name: 'JavaScriptFormatter';
      description: 'Indent or minify JavaScript code';
      icon: 'filetype-js';
      active: true;
      visible: true;
      parent: 'Formatters';
    ),
    (
      text_short: 'PHP';
      text_long: 'PHP Formatter';
      name: 'PHPFormatter';
      description: 'Indent PHP code';
      icon: 'filetype-php';
      active: true;
      visible: true;
      parent: 'Formatters';
    ),
    (
      text_short: 'CSS';
      text_long: 'CSS Formatter';
      name: 'CSSFormatter';
      description: 'Indent CSS code';
      icon: 'filetype-css';
      active: true;
      visible: true;
      parent: 'Formatters';
    ),
    (
      text_short: 'Hash';
      text_long: 'Hash Generator';
      name: 'HashGenerator';
      description: 'Calculate hashes';
      icon: 'fingerprint';
      active: true;
      visible: true;
      parent: 'Generators';
    ),
    (
      text_short: 'UUID';
      text_long: 'UUID Generator';
      name: 'UUIDGenerator';
      description: 'Generate UUIDs';
      icon: 'grid';
      active: true;
      visible: true;
      parent: 'Generators';
    ),
    (
      text_short: 'Lorem Ipsum';
      text_long: 'Lorem Ipsum Generator';
      name: 'LoremIpsumGenerator';
      description: 'Generate Lorem Ipsum text';
      icon: 'textarea';
      active: true;
      visible: true;
      parent: 'Generators';
    ),
    (
      text_short: 'Name';
      text_long: 'Name Generator';
      name: 'NameGenerator';
      description: 'Generate random names';
      icon: 'person-square';
      active: true;
      visible: true;
      parent: 'Generators';
    ),
    (
      text_short: 'Case Converter & Inspector';
      text_long: 'Case Converter & Inspector';
      name: 'TextCaseConverterInspector';
      description: 'Analyse text and convert it to different cases';
      icon: 'textarea-t';
      active: true;
      visible: true;
      parent: 'Text';
    ),
    (
      text_short: 'Escape / Unescape';
      text_long: 'Escape / Unescape';
      name: 'TextEscapeUnescape';
      description: 'Escape or unescape text';
      icon: 'card-text';
      active: true;
      visible: true;
      parent: 'Text';
    ),
    (
      text_short: 'Regex Tester';
      text_long: 'Regex Tester';
      name: 'RegexTester';
      description: 'Validate and test regular expressions';
      icon: 'braces-asterisk';
      active: true;
      visible: true;
      parent: 'Text';
    ),
    (
      text_short: 'Text Difference';
      text_long: 'Text Difference';
      name: 'TextDifference';
      description: 'Find the difference between two texts';
      icon: 'file-diff';
      active: true;
      visible: true;
      parent: 'Text';
    ),
    (
      text_short: 'Markdown Preview';
      text_long: 'Markdown Preview';
      name: 'MarkdownPreview';
      description: 'Preview Markdown text';
      icon: 'markdown';
      active: true;
      visible: true;
      parent: 'Text';
    ),
    (
      text_short: 'Color Picker';
      text_long: 'Color Picker';
      name: 'ColorPicker';
      description: 'Fully featured color picker';
      icon: 'brush';
      active: true;
      visible: true;
      parent: 'Graphics';
    ),
    (
      text_short: 'Color Blindness Simulator';
      text_long: 'Color Blindness Simulator';
      name: 'ColorBlindnessSimulator';
      description: 'Simulate color blindness on a picture or color';
      icon: 'eye-slash';
      active: true;
      visible: true;
      parent: 'Graphics';
    ),
    (
      text_short: 'PNG / JPEG Compressor';
      text_long: 'PNG / JPEG Compressor';
      name: 'PNGJPEGCompressor';
      description: 'Compress PNG and JPEG images';
      icon: 'image';
      active: true;
      visible: true;
      parent: 'Graphics';
    ),
    (
      text_short: 'Image Converter';
      text_long: 'Image Converter';
      name: 'ImageConverter';
      description: 'Convert images to different formats';
      icon: 'file-earmark-image';
      active: true;
      visible: true;
      parent: 'Graphics';
    )
  );

function IsToolParent(Tool: TRoseltTools): Boolean;

implementation

function IsToolParent(Tool: TRoseltTools): Boolean;
// Checks to see if the tool qualifies as a parent
{
   A Tool qualifies as a Parent when the parent property is empty and
   there is a different Tool in the array with its parent property set to the name of the parent
}
begin
  var ToolParentValid := (Tool.parent = '');
  var ToolChildFound := False;
  for var ToolArrayItem in RoseltToolsArray do
    if (Tool.name = ToolArrayItem.parent) then
    begin
      ToolChildFound := True;
      break;
    end;

  result := ToolParentValid and ToolChildFound;
end;

end.
