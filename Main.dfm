object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'UKDevGroup MQTT Sample'
  ClientHeight = 413
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object TMSFNCWidgetGauge1: TTMSFNCWidgetGauge
    Left = 0
    Top = 0
    Width = 481
    Height = 413
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    TabOrder = 0
    Border.Color = 6908265
    UnlimitedValue = True
    UnlimitedDisplayValue = True
    MaximumValue = 10000.000000000000000000
    OuterCircle.Width = 0.030000000000000000
    InnerCircle.Color = 15130800
    OuterRim.Color = 9470064
    OuterRim.Width = 2
    Arc.Width = 0.030000000000000000
    Arc.Threshold.Center = 25.000000000000000000
    Arc.Threshold.EndValue = 100.000000000000000000
    DialText = 'Power (W)'
    GaugeValuesFormat = '0'
    ValueFont.Charset = DEFAULT_CHARSET
    ValueFont.Color = 5197615
    ValueFont.Height = -16
    ValueFont.Name = 'Tahoma'
    ValueFont.Style = []
    ValueFormat = '000'
    Sections = <>
    ExtraNeedles = <>
    ExplicitWidth = 373
    ExplicitHeight = 367
  end
  object TMSMQTTClient1: TTMSMQTTClient
    OnConnectedStatusChanged = TMSMQTTClient1ConnectedStatusChanged
    OnPublishReceived = TMSMQTTClient1PublishReceived
    Version = '1.3.1.0'
    Left = 52
    Top = 88
  end
end
