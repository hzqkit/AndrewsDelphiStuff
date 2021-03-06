unit BasicService_Impl;

{----------------------------------------------------------------------------}
{ This unit was automatically generated by the RemObjects SDK after reading  }
{ the RODL file associated with this project .                               }
{                                                                            }
{ This is where you are supposed to code the implementation of your objects. }
{----------------------------------------------------------------------------}

{$I RemObjects.inc}

interface

uses
  {vcl:} Classes, SysUtils, 
  {RemObjects:} uROXMLIntf, uROClientIntf, uROTypes, uROServer, uROServerIntf, uROSessions,
  {Required:} uRORemoteDataModule,
  {Generated:} TestLibrary_Intf;

type
  { TBasicService }
  TBasicService = class(TRORemoteDataModule, IBasicService)
  private
  protected
    { IBasicService methods }
    function Sum(const A: Integer; const B: Integer): Integer;
    function GetServerTime: DateTime;
  end;

implementation

{$IFDEF DELPHIXE2UP}
{%CLASSGROUP 'System.Classes.TPersistent'}
{$ENDIF}

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}
uses
  {Generated:} TestLibrary_Invk;

procedure Create_BasicService(out anInstance : IUnknown);
begin
  anInstance := TBasicService.Create(nil);
end;

{ BasicService }

    function TBasicService.Sum(const A: Integer; const B: Integer): Integer;
    begin
      Result := A + B;
    end;

    function TBasicService.GetServerTime: DateTime;
    begin
      Result := Now;
    end;

var
  fClassFactory: IROClassFactory;
initialization
  fClassFactory := TROClassFactory.Create('BasicService', {$IFDEF FPC}@{$ENDIF}Create_BasicService, TBasicService_Invoker);
  // RegisterForZeroConf(fClassFactory,'_BasicService_rosdk._tcp.');

finalization
  UnRegisterClassFactory(fClassFactory);
  fClassFactory := nil;

end.
