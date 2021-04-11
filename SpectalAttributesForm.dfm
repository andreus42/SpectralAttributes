object _SpectralAttributesForm: T_SpectralAttributesForm
  Left = 0
  Top = 0
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
  object PageControl1: TPageControl
    Left = 20
    Top = 39
    Width = 1021
    Height = 836
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
  object DeleteTestButton: TButton
    Left = 119
    Top = 8
    Width = 82
    Height = 25
    Caption = '&Delete Test'
    TabOrder = 1
    OnClick = DeleteTestButtonClick
  end
  object AddTestGroupButton: TButton
    Left = 20
    Top = 8
    Width = 93
    Height = 25
    Caption = '&Add Test Group'
    TabOrder = 2
    OnClick = AddTestGroupButtonClick
  end
end
