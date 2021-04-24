object _SpectralAttributesForm: T_SpectralAttributesForm
  Left = 0
  Top = 0
  ActiveControl = PageControl1
  Caption = 'Spectral Attributes'
  ClientHeight = 845
  ClientWidth = 1346
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
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 1346
    Height = 804
    Align = alClient
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1346
    Height = 41
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = -6
    object ReloadSet: TSpeedButton
      Left = 311
      Top = 8
      Width = 121
      Height = 23
      Caption = '&Loat Set'
      OnClick = ReloadSetClick
    end
    object DeleteTestGroupSpeedButton: TSpeedButton
      Left = 128
      Top = 10
      Width = 102
      Height = 25
      Caption = 'Delete Test Group'
      OnClick = DeleteTestGroupSpeedButtonClick
    end
    object AddTestGroupSpeedButton: TSpeedButton
      Left = 12
      Top = 10
      Width = 102
      Height = 25
      Caption = 'Add Test Group'
      OnClick = AddTestGroupSpeedButtonClick
    end
    object PartRevLogEdit: TLabeledEdit
      Left = 438
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
      LabelPosition = lpRight
      ParentFont = False
      TabOrder = 0
    end
    object DarkModeCheckBox: TCheckBox
      Left = 1240
      Top = 10
      Width = 97
      Height = 17
      Caption = 'Dark Mode'
      TabOrder = 1
      Visible = False
      OnClick = DarkModeCheckBoxClick
    end
  end
end
