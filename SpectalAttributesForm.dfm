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
    Left = 24
    Top = 40
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
        Left = 3
        Top = 0
        Width = 1401
        Height = 201
        ParentBackground = False
        TabOrder = 0
        object LabledMemo1: TLabledMemo
          Left = 16
          Top = 16
          Width = 345
          Height = 169
          AMemo.Left = 0
          AMemo.Top = 13
          AMemo.Width = 345
          AMemo.Height = 156
          AMemo.Align = alClient
          AMemo.TabOrder = 0
          ALabel.Left = 0
          ALabel.Top = 0
          ALabel.Width = 345
          ALabel.Height = 13
          ALabel.Align = alTop
          ALabel.Caption = 'Published Specifications'
          ALabel.Font.Charset = DEFAULT_CHARSET
          ALabel.Font.Color = clWindowText
          ALabel.Font.Height = -11
          ALabel.Font.Name = 'Tahoma'
          ALabel.Font.Style = [fsBold]
          ALabel.ParentFont = False
          ALabel.Layout = tlCenter
          ALabel.ExplicitWidth = 135
          Caption = 'Published Specifications'
          FieldWidth = 100
          LabelSpacing = 1
          TabOrder = 0
          TabStop = False
          Text = ''
        end
        object LabledMemo2: TLabledMemo
          Left = 384
          Top = 16
          Width = 345
          Height = 169
          AMemo.Left = 0
          AMemo.Top = 13
          AMemo.Width = 345
          AMemo.Height = 156
          AMemo.Align = alClient
          AMemo.TabOrder = 0
          ALabel.Left = 0
          ALabel.Top = 0
          ALabel.Width = 345
          ALabel.Height = 13
          ALabel.Align = alTop
          ALabel.Caption = 'Final In-House Specifcations'
          ALabel.Font.Charset = DEFAULT_CHARSET
          ALabel.Font.Color = clWindowText
          ALabel.Font.Height = -11
          ALabel.Font.Name = 'Tahoma'
          ALabel.Font.Style = [fsBold]
          ALabel.ParentFont = False
          ALabel.Layout = tlCenter
          ALabel.ExplicitWidth = 159
          Caption = 'Final In-House Specifcations'
          FieldWidth = 100
          LabelSpacing = 1
          TabOrder = 1
          TabStop = False
          Text = ''
        end
      end
    end
  end
  object DeleteTestButton: TButton
    Left = 120
    Top = 8
    Width = 82
    Height = 25
    Caption = '&Delete Test'
    TabOrder = 1
    OnClick = DeleteTestButtonClick
  end
  object AddTestGroupButton: TButton
    Left = 24
    Top = 8
    Width = 93
    Height = 25
    Caption = '&Add Test Group'
    TabOrder = 2
    OnClick = AddTestGroupButtonClick
  end
end
