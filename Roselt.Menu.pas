unit Roselt.Menu;

interface

uses
  FMX.Forms,
  System.Classes,
  System.SysUtils,
  System.UITypes,
  System.Generics.Collections,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Layouts,
  FMX.Objects,
  FMX.StdCtrls,
  FMX.Skia,
  uBootstrapIcons,
  uFrame_Base64TextEncoderDecoder,
  uFrame_JsonYamlConverter,
  uFrame_HashGenerator,
  uFrame_HTMLEncoderDecoder,
  uFrame_JsonFormatter,
  uFrame_LoremIpsumGenerator,
  uFrame_TextCaseConverterInspector,
  uFrame_ColorPicker,
  uFrame_ImageEffects,
  uFrame_TimestampConverter,
  uFrame_NumberBaseConverter,
  uFrame_URLEncoderDecoder,
  uFrame_GZipCompressDecompress,
  uFrame_JWTDecoder,
  uFrame_Base64ImageEncoderDecoder,
  uFrame_DelphiFormatter,
  uFrame_SQLFormatter,
  uFrame_HTMLFormatter,
  uFrame_CSSFormatter,
  uFrame_PHPFormatter,
  uFrame_XMLFormatter,
  uFrame_JavaScriptFormatter,
  uFrame_UUIDGenerator,
  uFrame_JWTTokenGenerator,
  uFrame_PasswordGenerator,
  uFrame_TextEscapeUnescape,
  uFrame_MarkdownPreview,
  uFrame_HTMLPreview,
  uFrame_RegexTester,
  uFrame_NameGenerator,
  uFrame_TextToArray,
  uFrame_PingIPDomain,
  uFrame_TraceRoute,
  uFrame_ImageConverter,
  uFrame_BootstrapIcons,
  uFrame_FontAwesomeIcons,
  uFrame_FeatherIcons;

type
  TRoseltMenuFrame = class of TFrame;

  TBuildMenuOptions = record
    NavContainer: TControl;
    OnExpandCollapse: TNotifyEvent;
    OnNavItemClick: TNotifyEvent;
  end;

  TRoseltMenu = record
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
    frame: TRoseltMenuFrame;
  end;

  TNavMouseHelper = class
  public
    procedure NavMouseEnter(Sender: TObject);
    procedure NavMouseLeave(Sender: TObject);
    procedure ExpandCollapseNavItem(Sender: TObject);
  end;

function IsMenuParent(Menu: TRoseltMenu): Boolean;

procedure BuildMenu(var Options: TBuildMenuOptions);

var
  NavMouseHelper: TNavMouseHelper;

const
  RoseltMenuArray: array[0..47] of TRoseltMenu = (
    ( // Converters Main Category (Parent)
      text_short: 'Converters';
      text_long: 'Converters';
      name: 'Converters';
      description: 'Converters';
      icon: 'arrow-left-right';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: '';
    ),
    ( // Converters Main Category (Parent)
      text_short: 'Encoders / Decoders';
      text_long: 'Encoders / Decoders';
      name: 'EncodersDecoders';
      description: 'Encoders / Decoders';
      icon: 'file-binary';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: '';
    ),
    ( // Converters Main Category (Parent)
      text_short: 'Formatters';
      text_long: 'Formatters';
      name: 'Formatters';
      description: 'Formatters';
      icon: 'list-columns';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: '';
    ),
    ( // Converters Main Category (Parent)
      text_short: 'Generators';
      text_long: 'Generators';
      name: 'Generators';
      description: 'Generators';
      icon: 'asterisk';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: '';
    ),
    ( // Converters Main Category (Parent)
      text_short: 'Text';
      text_long: 'Text';
      name: 'Text';
      description: 'Text';
      icon: 'body-text';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: '';
    ),
    ( // Converters Main Category (Parent)
      text_short: 'Graphics';
      text_long: 'Graphics';
      name: 'Graphics';
      description: 'Graphics';
      icon: 'images';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: '';
    ),
    ( // Converters Main Category (Parent)
      text_short: 'Other';
      text_long: 'Other';
      name: 'Other';
      description: 'Other';
      icon: 'hexagon';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: '';
    ),
    (
      text_short: 'Testing';
      text_long: 'Testing';
      name: 'Testing';
      description: 'Just a playground for me to test random things on';
      icon: 'box';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: false;
        visible: false;
      {$ENDIF}
      parent: '';
    ),
    (
      text_short: 'JSON <> YAML';
      text_long: 'JSON <> YAML';
      name: 'JsonYamlConverter';
      description: 'Convert JSON to YAML and vice versa';
      icon: 'arrow-left-right';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'Converters';
      frame: TFrame_JsonYamlConverter;
    ),
    (
      text_short: 'Text to Array';
      text_long: 'Text to Array';
      name: 'TextToArray';
      description: 'Convert a text to an array';
      icon: 'braces';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'Converters';
      frame: TFrame_TextToArray;
    ),
    (
      text_short: 'Timestamp';
      text_long: 'Timestamp';
      name: 'TimestampConverter';
      description: 'Convert timestamp to human-readable text and vice versa';
      icon: 'calendar3';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'Converters';
      frame: TFrame_TimestampConverter;
    ),
    (
      text_short: 'Number Base';
      text_long: 'Number Base';
      name: 'NumberBaseConverter';
      description: 'Convert numbers from one base to another';
      icon: '123';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'Converters';
      frame: TFrame_NumberBaseConverter;
    ),
    (
      text_short: 'HTML';
      text_long: 'HTML';
      name: 'HTMLEncoderDecoder';
      description: 'Encode and decode applicable characters';
      icon: 'code-slash';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'EncodersDecoders';
      frame: TFrame_HTMLEncoderDecoder;
    ),
    (
      text_short: 'URL';
      text_long: 'URL';
      name: 'URLEncoderDecoder';
      description: 'Encode and decode applicable characters';
      icon: 'link';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'EncodersDecoders';
      frame: TFrame_URLEncoderDecoder;
    ),
    (
      text_short: 'Base64 Text';
      text_long: 'Base64 Text';
      name: 'Base64TextEncoderDecoder';
      description: 'Encode and decode Base64 text data';
      icon: 'file-binary';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'EncodersDecoders';
      frame: TFrame_Base64TextEncoderDecoder;
    ),
    (
      text_short: 'Base64 Image';
      text_long: 'Base64 Image';
      name: 'Base64ImageEncoderDecoder';
      description: 'Encode and decode Base64 image data';
      icon: 'file-binary';
      {$IFDEF DEBUG}
        active: false;
        visible: true;
      {$ELSE}
        active: false;
        visible: false;
      {$ENDIF}
      parent: 'EncodersDecoders';
      frame: TFrame_Base64ImageEncoderDecoder;
    ),
    (
      text_short: 'GZip';
      text_long: 'GZip';
      name: 'GZipCompressDecompress';
      description: 'Compress or decompress strings';
      icon: 'file-zip';
      {$IFDEF DEBUG}
        active: false;
        visible: true;
      {$ELSE}
        active: false;
        visible: false;
      {$ENDIF}
      parent: 'EncodersDecoders';
      frame: TFrame_GZipCompressDecompress;
    ),
    (
      text_short: 'JWT Decoder';
      text_long: 'JWT Decoder';
      name: 'JWTDecoder';
      description: 'Decode a JWT header, payload and signature';
      icon: 'key';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'EncodersDecoders';
      frame: TFrame_JWTDecoder;
    ),
    (
      text_short: 'Delphi';
      text_long: 'Delphi Formatter';
      name: 'DelphiFormatter';
      description: 'Indent or minify Delphi code';
      icon: 'file-earmark';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'Formatters';
      frame: TFrame_DelphiFormatter;
    ),
    (
      text_short: 'JSON';
      text_long: 'JSON Formatter';
      name: 'JsonFormatter';
      description: 'Indent or minify JSON data';
      icon: 'filetype-json';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'Formatters';
      frame: TFrame_JsonFormatter;
    ),
    (
      text_short: 'HTML';
      text_long: 'HTML Formatter';
      name: 'HTMLFormatter';
      description: 'Indent or minify HTML code';
      icon: 'filetype-html';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: false;
        visible: false;
      {$ENDIF}
      parent: 'Formatters';
      frame: TFrame_HTMLFormatter;
    ),
    (
      text_short: 'SQL';
      text_long: 'SQL Formatter';
      name: 'SQLFormatter';
      description: 'Indent SQL queries';
      icon: 'server';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: false;
        visible: false;
      {$ENDIF}
      parent: 'Formatters';
      frame: TFrame_SQLFormatter;
    ),
    (
      text_short: 'XML';
      text_long: 'XML Formatter';
      name: 'XMLFormatter';
      description: 'Indent or minify XML data';
      icon: 'filetype-xml';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'Formatters';
      frame: TFrame_XMLFormatter;
    ),
    (
      text_short: 'JavaScript';
      text_long: 'JavaScript Formatter';
      name: 'JavaScriptFormatter';
      description: 'Indent or minify JavaScript code';
      icon: 'filetype-js';
      {$IFDEF DEBUG}
        active: false;
        visible: true;
      {$ELSE}
        active: false;
        visible: false;
      {$ENDIF}
      parent: 'Formatters';
      frame: TFrame_JavaScriptFormatter;
    ),
    (
      text_short: 'PHP';
      text_long: 'PHP Formatter';
      name: 'PHPFormatter';
      description: 'Indent PHP code';
      icon: 'filetype-php';
      {$IFDEF DEBUG}
        active: false;
        visible: true;
      {$ELSE}
        active: false;
        visible: false;
      {$ENDIF}
      parent: 'Formatters';
      frame: TFrame_PHPFormatter;
    ),
    (
      text_short: 'CSS';
      text_long: 'CSS Formatter';
      name: 'CSSFormatter';
      description: 'Indent CSS code';
      icon: 'filetype-css';
      {$IFDEF DEBUG}
        active: false;
        visible: true;
      {$ELSE}
        active: false;
        visible: false;
      {$ENDIF}
      parent: 'Formatters';
      frame: TFrame_CSSFormatter;
    ),
    (
      text_short: 'Hash';
      text_long: 'Hash Generator';
      name: 'HashGenerator';
      description: 'Calculate hashes';
      icon: 'fingerprint';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'Generators';
      frame: TFrame_HashGenerator;
    ),
    (
      text_short: 'UUID';
      text_long: 'UUID Generator';
      name: 'UUIDGenerator';
      description: 'Generate UUIDs';
      icon: 'grid';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'Generators';
      frame: TFrame_UUIDGenerator;
    ),
    (
      text_short: 'Lorem Ipsum';
      text_long: 'Lorem Ipsum Generator';
      name: 'LoremIpsumGenerator';
      description: 'Generate Lorem Ipsum text';
      icon: 'textarea';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'Generators';
      frame: TFrame_LoremIpsumGenerator;
    ),
    (
      text_short: 'JWT Token';
      text_long: 'JWT Token Generator';
      name: 'JWTTokenGenerator';
      description: 'Generate a JWT Token';
      icon: 'shield-lock';
      {$IFDEF DEBUG}
        active: false;
        visible: true;
      {$ELSE}
        active: false;
        visible: false;
      {$ENDIF}
      parent: 'Generators';
      frame: TFrame_JWTTokenGenerator;
    ),
    (
      text_short: 'Name';
      text_long: 'Name Generator';
      name: 'NameGenerator';
      description: 'Generate random names';
      icon: 'person-square';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'Generators';
      frame: TFrame_NameGenerator;
    ),
    (
      text_short: 'Password';
      text_long: 'Password Generator';
      name: 'PasswordGenerator';
      description: 'Generate random passwords';
      icon: 'key';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'Generators';
      frame: TFrame_PasswordGenerator;
    ),
    (
      text_short: 'Case Converter && Inspector';
      text_long: 'Case Converter && Inspector';
      name: 'TextCaseConverterInspector';
      description: 'Analyse text and convert it to different cases';
      icon: 'textarea-t';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'Text';
      frame: TFrame_TextCaseConverterInspector;
    ),
    (
      text_short: 'Escape / Unescape';
      text_long: 'Escape / Unescape';
      name: 'TextEscapeUnescape';
      description: 'Escape or unescape text';
      icon: 'card-text';
      {$IFDEF DEBUG}
        active: false;
        visible: true;
      {$ELSE}
        active: false;
        visible: false;
      {$ENDIF}
      parent: 'Text';
      frame: TFrame_TextEscapeUnescape;
    ),
    (
      text_short: 'Regex Tester';
      text_long: 'Regex Tester';
      name: 'RegexTester';
      description: 'Validate and test regular expressions';
      icon: 'braces-asterisk';
      {$IFDEF DEBUG}
        active: false;
        visible: true;
      {$ELSE}
        active: false;
        visible: false;
      {$ENDIF}
      parent: 'Text';
      frame: TFrame_RegexTester;
    ),
    (
      text_short: 'Text Difference';
      text_long: 'Text Difference';
      name: 'TextDifference';
      description: 'Find the difference between two texts';
      icon: 'file-diff';
      {$IFDEF DEBUG}
        active: false;
        visible: true;
      {$ELSE}
        active: false;
        visible: false;
      {$ENDIF}
      parent: 'Text';
//      frame: TFrame_TextDifference;
    ),
    (
      text_short: 'Markdown Preview';
      text_long: 'Markdown Preview';
      name: 'MarkdownPreview';
      description: 'Preview Markdown text';
      icon: 'markdown';
      {$IFDEF DEBUG}
        active: false;
        visible: true;
      {$ELSE}
        active: false;
        visible: false;
      {$ENDIF}
      parent: 'Text';
      frame: TFrame_MarkdownPreview;
    ),
    (
      text_short: 'HTML Preview';
      text_long: 'HTML Preview';
      name: 'HTMLPreview';
      description: 'Preview HTML, CSS and JavaScript';
      icon: 'browser-edge';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'Text';
      frame: TFrame_HTMLPreview;
    ),
    (
      text_short: 'Color Picker';
      text_long: 'Color Picker';
      name: 'ColorPicker';
      description: 'Fully featured color picker';
      icon: 'brush';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'Graphics';
      frame: TFrame_ColorPicker;
    ),
    (
      text_short: 'Image Effects';
      text_long: 'Image Effects';
      name: 'ImageEffects';
      description: 'Different Effects applied to images';
      icon: 'mask';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'Graphics';
      frame: TFrame_ImageEffects;
    ),
    (
      text_short: 'Bootstrap Icons';
      text_long: 'Bootstrap Icons';
      name: 'BootstrapIcons';
      description: 'Bootstrap Icons (SVG)';
      icon: 'filetype-svg';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'Graphics';
      frame: TFrame_BootstrapIcons;
    ),
    (
      text_short: 'Font Awesome Icons';
      text_long: 'Font Awesome Icons';
      name: 'FontAwesomeIcons';
      description: 'Font Awesome Icons (SVG)';
      icon: 'filetype-svg';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'Graphics';
      frame: TFrame_FontAwesomeIcons;
    ),
    (
      text_short: 'Feather Icons';
      text_long: 'Feather Icons';
      name: 'FeatherIcons';
      description: 'Feather Icons (SVG)';
      icon: 'filetype-svg';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'Graphics';
      frame: TFrame_FeatherIcons;
    ),
    (
      text_short: 'Color Blindness Simulator';
      text_long: 'Color Blindness Simulator';
      name: 'ColorBlindnessSimulator';
      description: 'Simulate color blindness on a picture or color';
      icon: 'eye-slash';
      {$IFDEF DEBUG}
        active: false;
        visible: true;
      {$ELSE}
        active: false;
        visible: false;
      {$ENDIF}
      parent: 'Graphics';
//      frame: TFrame_ColorBlindnessSimulator;
    ),
    (
      text_short: 'PNG / JPEG Compressor';
      text_long: 'PNG / JPEG Compressor';
      name: 'PNGJPEGCompressor';
      description: 'Compress PNG and JPEG images';
      icon: 'image';
      {$IFDEF DEBUG}
        active: false;
        visible: true;
      {$ELSE}
        active: false;
        visible: false;
      {$ENDIF}
      parent: 'Graphics';
//      frame: TFrame_PNGJPEGCompressor;
    ),
    (
      text_short: 'Ping IP / Domain';
      text_long: 'Ping IP / Domain';
      name: 'PingIPDomain';
      description: 'Ping and IP Address or Domain Name';
      icon: 'wifi';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'Other';
      frame: TFrame_PingIPDomain;
    ),
    (
      text_short: 'Trace Route';
      text_long: 'Trace Route';
      name: 'TraceRoute';
      description: 'Trace Route of IP Address or Domain';
      icon: 'wifi';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: true;
        visible: true;
      {$ENDIF}
      parent: 'Other';
      frame: TFrame_TraceRoute;
    ),
    (
      text_short: 'Image Converter';
      text_long: 'Image Converter';
      name: 'ImageConverter';
      description: 'Convert images to different formats';
      icon: 'file-earmark-image';
      {$IFDEF DEBUG}
        active: true;
        visible: true;
      {$ELSE}
        active: false;
        visible: false;
      {$ENDIF}
      parent: 'Graphics';
      frame: TFrame_ImageConverter;
    )
  );


implementation

function IsMenuParent(Menu: TRoseltMenu): Boolean;
// Checks to see if the Menu qualifies as a parent
{
   A Menu qualifies as a Parent when the parent property is empty and
   there is a different Menu in the array with its parent property set to the name of the parent
}
var
  ParentValid, ChildFound: Boolean;
  ArrayItem: TRoseltMenu;
begin
  ParentValid := (Menu.parent = '');
  ChildFound := False;
  for ArrayItem in RoseltMenuArray do
    if (Menu.name = ArrayItem.parent) then
    begin
      ChildFound := True;
      break;
    end;

  result := ParentValid and ChildFound;
end;

procedure TNavMouseHelper.NavMouseEnter(Sender: TObject);
begin
  if (Sender is TRectangle) then
  begin
    TRectangle(Sender).Fill.Kind := TBrushKind.Solid;
    TRectangle(Sender).Fill.Color := $FF2B2B2B;
  end;
end;

procedure TNavMouseHelper.NavMouseLeave(Sender: TObject);
begin
  if (Sender is TRectangle) then
  begin
    TRectangle(Sender).Fill.Kind := TBrushKind.None;
  end;
end;

procedure TNavMouseHelper.ExpandCollapseNavItem(Sender: TObject);
begin
  var Button := TRectangle(Sender);
  var ButtonLayout := Button.ParentControl;
  var ExpandCollapseLayout := ButtonLayout.ParentControl;
  var ExpandCollapseImage := TSkSvg(Button.Children.Items[2]);

  if (ExpandCollapseLayout.Height = ButtonLayout.Height) then
  begin
    ExpandCollapseLayout.Height := ButtonLayout.Height * ExpandCollapseLayout.ChildrenCount;
    ExpandCollapseImage.Svg.Source := GetBootstrapIcon('chevron-up');

    for var I := 0 to ExpandCollapseLayout.ChildrenCount-1 do
      if ExpandCollapseLayout.Children.Items[I].Name <> ButtonLayout.Name then
        TControl(ExpandCollapseLayout.Children.Items[I]).Visible := True;
  end else
  begin
    ExpandCollapseLayout.Height := ButtonLayout.Height;
    ExpandCollapseImage.Svg.Source := GetBootstrapIcon('chevron-down');

    for var I := 0 to ExpandCollapseLayout.ChildrenCount-1 do
      if ExpandCollapseLayout.Children.Items[I].Name <> ButtonLayout.Name then
        TControl(ExpandCollapseLayout.Children.Items[I]).Visible := False;
  end;
end;

procedure BuildMenu(var Options: TBuildMenuOptions);
  function CreateParentContainer(Menu: TRoseltMenu; Owner, Parent: TControl; NameStart: String = 'layNav'): TLayout;
  begin
    Result := TLayout.Create(Owner);
    Result.Parent := Parent;
    Result.Align := TAlignLayout.Bottom;
    Result.Height := 100;
    Result.Align := TAlignLayout.Top;
    Result.Name := NameStart + Menu.name;
  end;
  function CreateButtonContainer(Menu: TRoseltMenu; Owner, Parent: TControl; NameStart: String = 'layNav'): TLayout;
  begin
    Result := TLayout.Create(Owner);
    Result.Parent := Parent;
    Result.Align := TAlignLayout.Bottom;
    Result.Height := 50;
    Result.Align := TAlignLayout.Top;
    Result.Name := NameStart + Menu.name;
    Result.Enabled := Menu.active;
  end;
  function CreateButton(Menu: TRoseltMenu; Owner, Parent: TControl; NameStart: String = 'btn'): TRectangle;
  begin
    Result := TRectangle.Create(Owner);
    Result.Parent := Parent;
    Result.Align := TAlignLayout.Client;
    Result.Margins.Top := 5;
    Result.Margins.Right := 5;
    Result.Margins.Bottom := 5;
    Result.Margins.Left := 5;
    Result.Name := NameStart + Menu.name;
    Result.Cursor := crHandPoint;
    Result.Fill.Kind := TBrushKind.None;
    Result.Sides := [];
    Result.YRadius := 8;
    Result.XRadius := 8;
    Result.Stroke.Kind := TBrushKind.None;
  Result.OnMouseEnter := NavMouseHelper.NavMouseEnter;
  Result.OnMouseLeave := NavMouseHelper.NavMouseLeave;
  end;
  function CreateButtonImg(Menu: TRoseltMenu; Owner, Parent: TControl; NameStart: String = 'img'): TSkSvg;
  begin
    Result := TSkSvg.Create(Owner);
    Result.Parent := Parent;
    Result.Align := TAlignLayout.Left;
    Result.Margins.Top := 8;
    Result.Margins.Right := 8;
    Result.Margins.Bottom := 8;
    Result.Margins.Left := 8;
    if (Menu.parent <> '') then Result.Margins.Left := 32;
    Result.Width := Result.Height;
    Result.Name := NameStart + Menu.name;
    Result.Svg.Source := GetBootstrapIcon(Menu.icon);
    Result.Svg.OverrideColor := TAlphaColors.White;
  end;
  function CreateButtonLabel(Menu: TRoseltMenu; Owner, Parent: TControl; NameStart: String = 'lbl'): TLabel;
  begin
    Result := TLabel.Create(Owner);
    Result.Parent := Parent;
    Result.Align := TAlignLayout.Client;
    Result.Margins.Top := 5;
    Result.Margins.Right := 5;
    Result.Margins.Bottom := 5;
    Result.Name := NameStart + Menu.name;
    Result.Text := Menu.text_long;
    Result.StyledSettings := [TStyledSetting.Family,TStyledSetting.FontColor];
    Result.TextSettings.Font.Size := 20;
    if (Menu.active = False) then
      Result.TextSettings.Font.Style := [TFontStyle.fsStrikeOut];
  end;
  function CreateButtonImgExpandCollapseIcon(Menu: TRoseltMenu; Owner, Parent: TControl; NameStart: String = 'imgExpandCollapseIcon'): TSkSvg;
  begin
    Result := TSkSvg.Create(Owner);
    Result.Parent := Parent;
    Result.Align := TAlignLayout.Right;
    Result.Margins.Top := 11;
    Result.Margins.Right := 5;
    Result.Margins.Bottom := 11;
    Result.Margins.Left := 5;
    Result.Width := Result.Height;
    Result.Name := NameStart + Menu.name;
    Result.Svg.Source := GetBootstrapIcon('chevron-down');
    Result.Svg.OverrideColor := TAlphaColors.White;
    Result.Visible := Menu.active;
  end;
begin
  var DynamicParents := TList<TLayout>.Create;
  try
  for var Menu in RoseltMenuArray do
    begin
      if (Menu.Visible = False) then Continue;
      if IsMenuParent(Menu) then
      begin
        var ToolParentContainer := CreateParentContainer(Menu, Options.NavContainer, Options.NavContainer);
        var ToolButtonContainer := CreateButtonContainer(Menu, ToolParentContainer, ToolParentContainer, 'layNavExpandCollapse');
        var ToolButtonRect := CreateButton(Menu, ToolButtonContainer, ToolButtonContainer, 'btnExpandCollapse');
        ToolButtonRect.OnClick := Options.OnExpandCollapse;
        ToolButtonRect.OnDblClick := Options.OnExpandCollapse;
        CreateButtonImg(Menu, ToolButtonContainer, ToolButtonRect, 'imgExpandCollapse');
        CreateButtonLabel(Menu, ToolButtonContainer, ToolButtonRect, 'lblExpandCollapse');
        CreateButtonImgExpandCollapseIcon(Menu, ToolButtonContainer, ToolButtonRect, 'imgExpandCollapseIcon');
        DynamicParents.Add(ToolParentContainer);
      end else
      begin
        var ToolButtonContainer := CreateButtonContainer(Menu, Options.NavContainer, Options.NavContainer, 'layNav');
        if (Menu.parent = '') then
        begin
          ToolButtonContainer.Parent := Options.NavContainer;
        end else
        begin
          var ParentFound := False;
          for var ParentContainer in DynamicParents do
            if (TLayout(ParentContainer).Name = 'layNav' + Menu.parent) then
            begin
              ToolButtonContainer.Parent := TLayout(ParentContainer);
              TLayout(ParentContainer).Height := TLayout(ParentContainer).Height + 50;
              ParentFound := True;
              break;
            end;
          if (ParentFound = False) then
          begin
            FreeAndNil(ToolButtonContainer);
            Continue;
          end;
        end;

        var ToolRect := CreateButton(Menu, ToolButtonContainer, ToolButtonContainer);
        ToolRect.OnClick := Options.OnNavItemClick;
        CreateButtonImg(Menu, ToolButtonContainer, ToolRect);
        CreateButtonLabel(Menu, ToolButtonContainer, ToolRect);
      end;
    end;

    for var ParentContainer in DynamicParents do
      for var ParentChild in TLayout(ParentContainer).Children do
        if (String(TLayout(ParentChild).Name).Contains('ExpandCollapse')) then
        begin
          Options.OnExpandCollapse(TRectangle(TLayout(ParentChild).Children[0])); // Collapse all Menu Categories
          break;
        end;
  finally
    DynamicParents.Free;
  end;
end;

initialization
  NavMouseHelper := TNavMouseHelper.Create;

finalization
  NavMouseHelper.Free;

end.
