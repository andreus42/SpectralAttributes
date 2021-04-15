object _SpectralAttributesForm: T_SpectralAttributesForm
  Left = 0
  Top = 0
  ActiveControl = PageControl1
  Caption = 'Spectral Attributes'
  ClientHeight = 883
  ClientWidth = 1062
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 448
    Top = 8
    Width = 121
    Height = 23
    Caption = 'Load Different Set'
    OnClick = SpeedButton1Click
  end
  object PageControl1: TPageControl
    Left = 24
    Top = 40
    Width = 1021
    Height = 836
    TabOrder = 0
  end
  object DeleteTestButton: TButton
    Left = 120
    Top = 6
    Width = 82
    Height = 25
    Caption = '&Delete Test'
    TabOrder = 1
    TabStop = False
    OnClick = DeleteTestButtonClick
  end
  object AddTestGroupButton: TButton
    Left = 24
    Top = 6
    Width = 93
    Height = 25
    Caption = '&Add Test Group'
    TabOrder = 2
    TabStop = False
    OnClick = AddTestGroupButtonClick
  end
  object PartRevLogEdit: TLabeledEdit
    Left = 348
    Top = 8
    Width = 77
    Height = 21
    EditLabel.Width = 111
    EditLabel.Height = 13
    EditLabel.Caption = 'SetID (PartRevLog)'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    LabelPosition = lpLeft
    ParentFont = False
    TabOrder = 3
  end
end
