unit Roselt.Clipboard;

interface

uses
  {$IFDEF WEBLIB}
    WEBLib.Clipboard;
  {$ENDIF}

  {$IFNDEF WEBLIB}
    System.Rtti,
    FMX.Platform;
  {$ENDIF}

procedure CopyToClipboard(aText: TValue);

implementation

procedure CopyToClipboard(aText: TValue);
  {$IFNDEF WEBLIB}
    var ClipboardService: IFMXClipboardService;
  {$ENDIF}
  {$IFDEF WEBLIB}
    var WebClipboard: TWebClipboard;
  {$ENDIF}
begin
  {$IFNDEF WEBLIB}
    if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
      ClipboardService.SetClipboard(aText);
  {$ENDIF}
  {$IFDEF WEBLIB}
    WebClipboard := TWebClipboard.Create(nil);
    try
      WebClipboard.CopyToClipboard(aText);
    finally
      WebClipboard.Free;
    end;
  {$ENDIF}
end;

end.
