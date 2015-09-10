unit NewService_Impl;

{----------------------------------------------------------------------------}
{ This unit was automatically generated by the RemObjects SDK after reading  }
{ the RODL file associated with this project .                               }
{                                                                            }
{ This is where you are supposed to code the implementation of your objects. }
{----------------------------------------------------------------------------}

{$I RemObjects.inc}

interface

uses
  {$IFDEF LCL}LResources,{$ENDIF}
  {vcl:} Classes, SysUtils, 
  {RemObjects:} uROXMLIntf, uROClientIntf, uROTypes, uROServer, uROServerIntf, uROSessions,
  {Required:} uRORemoteDataModule,
  {Generated:} NewLibrary_Intf;

type
  { TNewService }
  TNewService = class(TRORemoteDataModule,
                      INewService)
  private
  protected
    { INewService methods }
    function Sum(const A: Integer; const B: Integer): Integer;
    function GetServerTime: DateTime;
    function TestParams(const InParamInt: Integer; const InParamAnsi: AnsiString; const InParamBool: Boolean; const InParamCur: Currency;
                        const InParamDatetime: DateTime; const InParamDec: Decimal; const InParamDouble: Double; const InParamInt64: Int64;
                        const InParamUtf8: Utf8String; const InParamWide: UnicodeString; out OutParamAnsi: AnsiString; out OutParamBool: Boolean;
                        out OutParamCurr: Currency; out OutParamDatetime: DateTime; out OutParamDec: Decimal; out OutParamDouble: Double;
                        out OutParamInt64: Int64; out OutParamInt: Integer; out OutParamUtf8: Utf8String; out OutParamWide: UnicodeString;
                        var InOutParam: AnsiString): Boolean;
    function TestEnum(const NewParam: NewEnum): NewEnum;
  end;

implementation

{$IFNDEF FPC}
  {$R *.dfm}
{$ENDIF}
uses
  {Generated:} NewLibrary_Invk;

procedure Create_NewService(out anInstance : IUnknown);
begin
  anInstance := TNewService.Create(nil);
end;

{ NewService }
function TNewService.Sum(const A: Integer; const B: Integer): Integer;
begin
  Result := A + B;
end;

function TNewService.TestEnum(const NewParam: NewEnum): NewEnum;
begin
  Result := NewEnum(Ord(NewParam) + 1);
end;

function TNewService.TestParams(const InParamInt: Integer;
  const InParamAnsi: AnsiString; const InParamBool: Boolean;
  const InParamCur: Currency; const InParamDatetime: DateTime;
  const InParamDec: Decimal; const InParamDouble: Double;
  const InParamInt64: Int64; const InParamUtf8: Utf8String;
  const InParamWide: UnicodeString; out OutParamAnsi: AnsiString;
  out OutParamBool: Boolean; out OutParamCurr: Currency;
  out OutParamDatetime: DateTime; out OutParamDec: Decimal;
  out OutParamDouble: Double; out OutParamInt64: Int64;
  out OutParamInt: Integer; out OutParamUtf8: Utf8String;
  out OutParamWide: UnicodeString; var InOutParam: AnsiString): Boolean;
begin
  OutParamAnsi     := InParamAnsi;
  OutParamBool     := InParamBool;
  OutParamCurr     := InParamCur;
  OutParamDatetime := InParamDatetime;
  OutParamDec      := InParamDec;
  OutParamDouble   := InParamDouble;
  OutParamInt64    := InParamInt64;
  OutParamInt      := InParamInt;
  OutParamUtf8     := InParamUtf8;
  OutParamWide     := InParamWide;

  InOutParam := InOutParam;

  Result := True;
end;

function TNewService.GetServerTime: DateTime;
begin
  Result := Now;
end;

var
  fClassFactory: IROClassFactory;
initialization
{$IFDEF LCL}
  {$I NewService_Impl.lrs}
{$ENDIF}
  fClassFactory := TROClassFactory.Create('NewService', {$IFDEF FPC}@{$ENDIF}Create_NewService, TNewService_Invoker);
  // RegisterForZeroConf(fClassFactory,'_NewService_rosdk._tcp.');

finalization
  UnRegisterClassFactory(fClassFactory);
  fClassFactory := nil;

end.