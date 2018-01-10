object frmPrincipal: TfrmPrincipal
  Left = 546
  Top = 201
  Width = 434
  Height = 373
  Caption = 'DPFP Delphi sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btCapture: TButton
    Left = 32
    Top = 24
    Width = 353
    Height = 25
    Caption = 'Capture'
    TabOrder = 0
    OnClick = btCaptureClick
  end
  object Button1: TButton
    Left = 40
    Top = 96
    Width = 345
    Height = 33
    Caption = 'Capture Novo'
    TabOrder = 1
    OnClick = Button1Click
  end
end
