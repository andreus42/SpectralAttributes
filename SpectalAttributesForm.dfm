object _SpectralAttributesForm: T_SpectralAttributesForm
  Left = 0
  Top = 0
  Caption = 'Spectral Attributes'
  ClientHeight = 927
  ClientWidth = 1478
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
    Left = 20
    Top = 55
    Width = 1405
    Height = 818
    ActivePage = SummaryTab
    TabOrder = 0
    object SummaryTab: TTabSheet
      Margins.Left = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = 'Summary'
      object SummaryPanel: TPanel
        Left = 0
        Top = 0
        Width = 1401
        Height = 201
        ParentBackground = False
        TabOrder = 0
        object SummaryLabel: TLabel
          Left = 16
          Top = 88
          Width = 44
          Height = 13
          Caption = 'Summary'
        end
        object Memo1: TMemo
          Left = 64
          Top = 16
          Width = 369
          Height = 169
          Lines.Strings = (
            'Memo1')
          TabOrder = 0
        end
        object Memo2: TMemo
          Left = 456
          Top = 16
          Width = 305
          Height = 169
          Lines.Strings = (
            'Memo2')
          TabOrder = 1
        end
      end
    end
  end
  object Button2: TButton
    Left = 127
    Top = 24
    Width = 82
    Height = 25
    Caption = '&Delete Test'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 20
    Top = 24
    Width = 93
    Height = 25
    Caption = '&Add Test Group'
    TabOrder = 2
    OnClick = Button3Click
  end
  object UpdateButton: TButton
    Left = 224
    Top = 24
    Width = 81
    Height = 25
    Caption = '&Update'
    TabOrder = 3
    OnClick = UpdateButtonClick
  end
end
