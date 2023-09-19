// This unit is far from complete. We need to be able to ping an ip on all platforms (Windows, iOS, MacOS, Android, Linux)
// Should maybe also investigate using Indy for pinging instead of this.
unit Ping;

interface
{$IFDEF MSWINDOWS}
uses
  Winapi.Winsock2,
  Windows;
{$ENDIF}

type
  TPingStatistics = record
    Address: AnsiString;
    Status: DWORD;
    RoundTripTime: DWORD;
    DataSize: Integer;
    RepliesReceived: Cardinal;
  end;

function PingHost(const HostName: AnsiString; TimeoutMS: Cardinal = 900): TPingStatistics;

implementation

uses SysUtils;

function IcmpCreateFile: THandle; stdcall; external 'iphlpapi.dll';
function IcmpCloseHandle(icmpHandle: THandle): boolean; stdcall; external 'iphlpapi.dll';
function IcmpSendEcho(icmpHandle: THandle; DestinationAddress: In_Addr; RequestData: Pointer; RequestSize: Smallint; RequestOptions: Pointer; ReplyBuffer: Pointer; ReplySize: DWORD; Timeout: DWORD): DWORD; stdcall; external 'iphlpapi.dll';

type
  PEchoReply = ^TEchoReply;
  TEchoReply = packed record
    Addr: In_Addr;
    Status: DWORD;
    RoundTripTime: DWORD;
  end;

var
  WSAData: TWSAData;

procedure Startup;
begin
  if WSAStartup(MAKEWORD(2, 2), WSAData) <> 0 then
    raise Exception.Create('WSAStartup');
end;

procedure Cleanup;
begin
  if WSACleanup <> 0 then
    raise Exception.Create('WSACleanup');
end;

function PingHost(const HostName: AnsiString; TimeoutMS: Cardinal = 900): TPingStatistics;
const
  rSize = $400;
var
  h: THandle;
  d: string;
  r: array [0 .. rSize - 1] of byte;
  i: cardinal;
  Addr: TSockAddrIn;
  InAddr: TInAddr;
  Host: PHostEnt;
begin
  Startup;
  InAddr.S_addr := inet_addr(PAnsiChar(HostName));
  if InAddr.S_addr <> u_long(INADDR_NONE) then begin
    // hostname is an IP address
    Host := gethostbyaddr(@InAddr, 4, AF_INET);
    if Host <> nil then
      Result.Address := Host^.h_name
    else
      Result.Address := '';
  end else begin
    // hostname is a domain name
    Host := gethostbyname(PAnsiChar(HostName));
    if Host <> nil then
      Result.Address := inet_ntoa(PInAddr(Host^.h_addr_list^)^)
    else
      Result.Address := '';
  end;
  if Result.Address <> '' then begin
    h := IcmpCreateFile;
    if h = INVALID_HANDLE_VALUE then
      RaiseLastOSError;
    try
      d := FormatDateTime('yyyymmddhhnnsszzz', Now);
      Addr.sin_addr.s_addr := InAddr.S_addr;
      i := IcmpSendEcho(h, Addr.sin_addr, PChar(d), Length(d), nil, @r[0], rSize, TimeoutMS);
      Result.RoundTripTime := PEchoReply(@r[0])^.RoundTripTime;
      Result.DataSize := Length(d);
      Result.RepliesReceived := i;
    finally
      IcmpCloseHandle(h);
    end;
  end;
  Cleanup;
end;

end.

