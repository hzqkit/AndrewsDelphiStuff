unit NewLibrary_Intf;

{----------------------------------------------------------------------------}
{ This unit was automatically generated by the RemObjects SDK after reading  }
{ the RODL file associated with this project .                               }
{                                                                            }
{ Do not modify this unit manually, or your changes will be lost when this   }
{ unit is regenerated the next time you compile the project.                 }
{----------------------------------------------------------------------------}

{$I RemObjects.inc}

interface

uses
  {vcl:} Classes, TypInfo,
  {RemObjects:} uROXMLIntf, uROClasses, uROClient, uROTypes, uROClientIntf;

const
  { Library ID }
  LibraryUID = '{6BAEA71C-1331-4683-A563-7BFB47D02C65}';
  TargetNamespace = '';

  { Service Interface ID's }
  INewService_IID : TGUID = '{ABFB312B-B427-4A77-BD7E-830C192ED62B}';

type
  TSeekOrigin = Classes.TSeekOrigin; // fake declaration
  { Forward declarations }
  INewService = interface;


  { INewService }
  INewService = interface
    ['{ABFB312B-B427-4A77-BD7E-830C192ED62B}']
    function Sum(const A: Integer; const B: Integer): Integer;
    function GetServerTime: DateTime;
  end;

  { CoNewService }
  CoNewService = class
    class function Create(const aMessage: IROMessage; aTransportChannel: IROTransportChannel): INewService;
  end;

  { TNewService_Proxy }
  TNewService_Proxy = class(TROProxy, INewService)
  protected
    function __GetInterfaceName:string; override;

    function Sum(const A: Integer; const B: Integer): Integer;
    function GetServerTime: DateTime;
  end;

implementation

uses
  {vcl:} SysUtils,
  {RemObjects:} uROEventRepository, uROSerializer, uRORes;

{ CoNewService }

class function CoNewService.Create(const aMessage: IROMessage; aTransportChannel: IROTransportChannel): INewService;
begin
  Result := TNewService_Proxy.Create(aMessage, aTransportChannel);
end;

{ TNewService_Proxy }

function TNewService_Proxy.__GetInterfaceName:string;
begin
  Result := 'NewService';
end;

function TNewService_Proxy.Sum(const A: Integer; const B: Integer): Integer;
var
  lMessage: IROMessage;
  lTransportChannel: IROTransportChannel;
begin
  lMessage := __GetMessage;
  lTransportChannel := __TransportChannel;
  try
    lMessage.InitializeRequestMessage(lTransportChannel, 'NewLibrary', __InterfaceName, 'Sum');
    lMessage.Write('A', TypeInfo(Integer), A, []);
    lMessage.Write('B', TypeInfo(Integer), B, []);
    lMessage.Finalize;

    lTransportChannel.Dispatch(lMessage);

    lMessage.Read('Result', TypeInfo(Integer), Result, []);
  finally
    lMessage.UnsetAttributes(lTransportChannel);
    lMessage.FreeStream;
    lMessage := nil;
    lTransportChannel := nil;
  end;
end;

function TNewService_Proxy.GetServerTime: DateTime;
var
  lMessage: IROMessage;
  lTransportChannel: IROTransportChannel;
begin
  lMessage := __GetMessage;
  lTransportChannel := __TransportChannel;
  try
    lMessage.InitializeRequestMessage(lTransportChannel, 'NewLibrary', __InterfaceName, 'GetServerTime');
    lMessage.Finalize;

    lTransportChannel.Dispatch(lMessage);

    lMessage.Read('Result', TypeInfo(DateTime), Result, [paIsDateTime]);
  finally
    lMessage.UnsetAttributes(lTransportChannel);
    lMessage.FreeStream;
    lMessage := nil;
    lTransportChannel := nil;
  end;
end;

initialization
  RegisterProxyClass(INewService_IID, TNewService_Proxy);


finalization
  UnregisterProxyClass(INewService_IID);


end.
