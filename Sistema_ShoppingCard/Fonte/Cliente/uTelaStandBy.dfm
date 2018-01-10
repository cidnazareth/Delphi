object frmTelaStandBy: TfrmTelaStandBy
  Left = 281
  Top = 8
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'frmTelaStandBy'
  ClientHeight = 729
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnMouseDown = FormMouseDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object imgStandBy: TImage
    Left = 0
    Top = 60
    Width = 1008
    Height = 600
    OnMouseDown = FormMouseDown
  end
  object tmStandBy: TTimer
    Enabled = False
    OnTimer = tmStandByTimer
    Left = 16
    Top = 80
  end
end
