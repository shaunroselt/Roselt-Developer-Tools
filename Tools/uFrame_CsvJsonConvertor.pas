<<<<<<< HEAD
unit uFrame_CsvJsonConvertor;   //Converting CSV to JSON and JSON to CSV , Nice tool
=======
unit uFrame_CsvJsonConvertor;   //Converting CSV to JSON and JSON to CSV
>>>>>>> f38b82d4d7325319d652cb3d06d1ce7177ba432a

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Skia, FMX.Memo.Types, FMX.ListBox, FMX.Objects, FMX.ScrollBox, FMX.Memo,
  Skia.FMX, FMX.Controls.Presentation, FMX.Layouts,System.JSON, Fmx.Clipboard, FMX.Platform, System.Threading,
  System.Generics.Collections;

type
  TFrame_CsvJsonConvertor = class(TFrame)
    layBottom: TLayout;
    layInput: TLayout;
    memTitleInput: TLabel;
    btnInputPasteFromClipboard: TButton;
    imgInputPasteFromClipboard: TSkSvg;
    lblInputPasteFromClipboard: TLabel;
    btnInputCopyToClipboard: TButton;
    imgInputCopyToClipboard: TSkSvg;
    lblInputCopyToClipboard: TLabel;
    btnInputClear: TButton;
    imgInputClear: TSkSvg;
    lblInputClear: TLabel;
    memInput: TMemo;
    layOutput: TLayout;
    memTitleOutput: TLabel;
    btnOutputCopyToClipboard: TButton;
    imgOutputCopyToClipboard: TSkSvg;
    lblOutputCopyToClipboard: TLabel;
    memOutput: TMemo;
    btnInputLoad: TButton;
    imgInputLoad: TSkSvg;
    lblInputLoad: TLabel;
    OpenDialog1: TOpenDialog;
    SplitterInputOutput: TSplitter;
<<<<<<< HEAD
    layTop: TLayout;
    lblConfiguration: TLabel;
    layConversion: TRectangle;
    cbConversion: TComboBox;
    layConversionTitleDescription: TLayout;
    lblConversionTitle: TLabel;
    lblConversionDescription: TLabel;
    imgConversion: TSkSvg;
=======
    cbConversion: TComboBox;
>>>>>>> f38b82d4d7325319d652cb3d06d1ce7177ba432a
    function CSVToJSON(const CSV: string): string;
    procedure memInputChange(Sender: TObject);
    procedure memInputChangeTracking(Sender: TObject);
    procedure btnInputLoadClick(Sender: TObject);
    procedure btnInputClearClick(Sender: TObject);
    procedure btnInputPasteFromClipboardClick(Sender: TObject);
    procedure btnOutputCopyToClipboardClick(Sender: TObject);
    procedure btnInputCopyToClipboardClick(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    function JSONToCSV(const JSON: string): string;
<<<<<<< HEAD
    procedure cbConverChange(Sender: TObject);
=======
    procedure cbConversionChange(Sender: TObject);
>>>>>>> f38b82d4d7325319d652cb3d06d1ce7177ba432a
    function DetermineDelimiter(const JObj: TJSONObject; const JSON: string): string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}




procedure TFrame_CsvJsonConvertor.btnInputClearClick(Sender: TObject);
begin
  memInput.Text := '';
end;

procedure TFrame_CsvJsonConvertor.btnInputCopyToClipboardClick(Sender: TObject);
var
ClipboardService: IFMXClipboardService;
begin
if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, IInterface(ClipboardService)) then
begin
ClipboardService.SetClipboard(memInput.Text);
end;
end;

procedure TFrame_CsvJsonConvertor.btnInputLoadClick(Sender: TObject);
begin
begin
  if (OpenDialog1.Execute) then
  begin
    memInput.Lines.LoadFromFile(OpenDialog1.FileName);
    memOutput.Text := CsvToJson(memInput.Text);
  end;
end;
end;

procedure TFrame_CsvJsonConvertor.btnInputPasteFromClipboardClick(
  Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, IInterface(ClipboardService)) then
  begin
    memInput.Text := ClipboardService.GetClipboard.AsString;
  end;
end;

procedure TFrame_CsvJsonConvertor.btnOutputCopyToClipboardClick(
  Sender: TObject);
var
ClipboardService: IFMXClipboardService;
begin
if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, IInterface(ClipboardService)) then
ClipboardService.SetClipboard(memOutput.Text)
end;

<<<<<<< HEAD
procedure TFrame_CsvJsonConvertor.cbConverChange(Sender: TObject);
=======
procedure TFrame_CsvJsonConvertor.cbConversionChange(Sender: TObject);
>>>>>>> f38b82d4d7325319d652cb3d06d1ce7177ba432a
begin
memInput.Text := '';
memOutput.Text := '';
end;

function TFrame_CsvJsonConvertor.CSVToJSON(const CSV: string): string;
var
  List: TStringList;
  Fields: TArray<string>;
  Line: string;
  i, j: Integer;
  JObj: TJSONObject;
  JArr: TJSONArray;
begin
  List := TStringList.Create;
  try
    List.Text := CSV;
    JArr := TJSONArray.Create;
    for i := 0 to List.Count - 1 do
    begin
      Line := List[i];
      Fields := Line.Split([',']);
      JObj := TJSONObject.Create;
      for j := 0 to High(Fields) do
      begin
        JObj.AddPair(IntToStr(j), Fields[j]);
      end;
      JArr.AddElement(JObj);
    end;
    Result := JArr.ToString;
  finally
    List.Free;
  end;
end;

procedure TFrame_CsvJsonConvertor.FrameResize(Sender: TObject);
begin
  layInput.Width := (layBottom.Width - layBottom.Padding.Left - layBottom.Padding.Right - SplitterInputOutput.Width) / 2;
end;

procedure TFrame_CsvJsonConvertor.memInputChange(Sender: TObject);
begin
 memOutput.Text := CsvToJson(memInput.Text);
end;

procedure TFrame_CsvJsonConvertor.memInputChangeTracking(Sender: TObject);
var
ConvertTask: ITask;
begin
ConvertTask := TTask.Create(
procedure
begin
TThread.Synchronize(nil,
procedure
begin
case cbConversion.ItemIndex of
0: memOutput.Text := CsvToJson(memInput.Text);
1: memOutput.Text := JsonToCsv(memInput.Text)
end;
end);
end);
ConvertTask.Start;
end;



function TFrame_CsvJsonConvertor.JSONToCSV(const JSON: string): string;
var
  JArr: TJSONArray;
  JObj: TJSONObject;
  i, j: Integer;
  Line: string;
  Fields: TArray<string>;
  List: TStringList;
  Delimiter: string;
begin
  JArr := TJSONObject.ParseJSONValue(JSON) as TJSONArray;
  List := TStringList.Create;
  try
    if (JArr.Count > 0) and (JArr.Items[0] is TJSONObject) then
    begin
      JObj := JArr.Items[0] as TJSONObject;
      Delimiter := DetermineDelimiter(JObj, JSON);
    end
    else
    begin
      Delimiter := ',';
    end;

    for i := 0 to JArr.Count - 1 do
    begin
      JObj := JArr.Items[i] as TJSONObject;
      SetLength(Fields, JObj.Count);
      for j := 0 to JObj.Count - 1 do
      begin
        Fields[j] := JObj.Pairs[j].JsonValue.Value;
      end;
      Line := string.Join(Delimiter, Fields);
      List.Add(Line);
    end;
    Result := List.Text;
  finally
    List.Free;
  end;
end;

function TFrame_CsvJsonConvertor.DetermineDelimiter(const JObj: TJSONObject; const JSON: string): string;
var
  i: Integer;
  CharCounts: TDictionary<Char, Integer>;
  MaxCount: Integer;
  MaxChar: Char;
begin
  Result := ',';
  CharCounts := TDictionary<Char, Integer>.Create;
  try
    for i := 1 to Length(JSON) do
    begin
      if CharCounts.ContainsKey(JSON[i]) then
      begin
        CharCounts[JSON[i]] := CharCounts[JSON[i]] + 1;
      end
      else
      begin
        CharCounts.Add(JSON[i], 1);
      end;
    end;
    MaxCount := 0;
    for i := 0 to JObj.Count - 1 do
    begin
      if CharCounts[JObj.Pairs[i].JsonValue.Value[1]] > MaxCount then
      begin
        MaxCount := CharCounts[JObj.Pairs[i].JsonValue.Value[1]];
        MaxChar := JObj.Pairs[i].JsonValue.Value[1];
      end;
    end;
    Result := MaxChar;
  finally
    CharCounts.Free;
  end;
end;

end.


end.

