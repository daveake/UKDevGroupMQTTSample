unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TMS.MQTT.Global, VCL.TMSFNCTypes,
  VCL.TMSFNCUtils, VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes,
  Vcl.ExtCtrls, VCL.TMSFNCCustomControl, VCL.TMSFNCWidgetGauge,
  TMS.MQTT.Client, System.JSON;

type
  TForm1 = class(TForm)
    TMSMQTTClient1: TTMSMQTTClient;
    TMSFNCWidgetGauge1: TTMSFNCWidgetGauge;
    procedure FormCreate(Sender: TObject);
    procedure TMSMQTTClient1ConnectedStatusChanged(ASender: TObject;
      const AConnected: Boolean; AStatus: TTMSMQTTConnectionStatus);
    procedure TMSMQTTClient1PublishReceived(ASender: TObject;
      APacketID: Word; ATopic: string; APayload: TArray<System.Byte>);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
    TMSMQTTClient1.BrokerHostName := '192.168.1.11';
    TMSMQTTClient1.Connect();
end;

procedure TForm1.TMSMQTTClient1ConnectedStatusChanged(ASender: TObject;
  const AConnected: Boolean; AStatus: TTMSMQTTConnectionStatus);
begin
    if AConnected then begin
        TMSMQTTClient1.Subscribe('tele/DELLPC/SENSOR');
    end;
end;

procedure TForm1.TMSMQTTClient1PublishReceived(ASender: TObject;
  APacketID: Word; ATopic: string; APayload: TArray<System.Byte>);
var
    msg: string;
    JsonValue: TJSONValue;
begin
    msg := TEncoding.UTF8.GetString(APayload);

    JsonValue := TJSonObject.ParseJSONValue(msg);

    JsonValue := JsonValue.FindValue('ENERGY');

    JsonValue := JsonValue.FindValue('ReactivePower');

    TMSFNCWidgetGauge1.Value := StrToFloat(JsonValue.ToString);
end;

end.
