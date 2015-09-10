unit fClientForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  uROClient, uROClientIntf, uRORemoteService, uROJSONMessage, uROIndyTCPChannel;

type
  TClientForm = class(TForm)
    ROMessage: TROJSONMessage;
    ROChannel: TROIndyTCPChannel;
    RORemoteService: TRORemoteService;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientForm: TClientForm;

implementation

{
  The unit NewLibrary_Intf.pas will be generated by the RemObjects preprocessor the first time you
  compile your server application. Make sure to do that before trying to compile the client.

  To invoke your server simply typecast your server to the name of the service interface like this:

      (RORemoteService as INewService).Sum(1,2)
}

uses NewLibrary_Intf, uROWebsocketChannel;

{$R *.dfm}

procedure TClientForm.Button1Click(Sender: TObject);
var
  i: Integer;
  chn: TROWebsocketChannel;
begin
  chn := TROWebsocketChannel.Create(Self);
  try
    chn.Host := 'localhost';
    chn.Port := 7000;

    RORemoteService.Channel := chn;
    i := (RORemoteService as INewService).Sum(1,2);
  finally
    chn.Free;
  end;

  ShowMessage('Sum of 1 and 2 is: ' + IntToStr(i));
end;

procedure TClientForm.FormCreate(Sender: TObject);
begin
  //
end;

end.
