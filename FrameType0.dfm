object FrameType01: TFrameType01
  Left = 0
  Top = 0
  Width = 1206
  Height = 27
  Align = alClient
  TabOrder = 0
  object EvalTestPanel: TPanel
    Left = 0
    Top = 0
    Width = 1206
    Height = 27
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 55
      Top = 3
      Width = 20
      Height = 21
      Caption = '-'
      OnClick = SpeedButton1Click
    end
    object NumLabel: TLabel
      Left = 7
      Top = 3
      Width = 8
      Height = 13
      Alignment = taCenter
      Caption = '#'
      Layout = tlCenter
    end
  end
end
