object Form1: TForm1
  Left = 366
  Top = 189
  Width = 610
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Status: TRichEdit
    Left = 280
    Top = 96
    Width = 257
    Height = 201
    Lines.Strings = (
      'Status')
    TabOrder = 0
  end
  object DPFPCapture1: TDPFPCapture
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    OnReaderDisconnect = DPFPCapture1ReaderDisconnect
    Left = 512
    Top = 352
  end
end
