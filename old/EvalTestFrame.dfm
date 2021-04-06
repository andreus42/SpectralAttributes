object EvalTestFrame: TEvalTestFrame
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
      Left = 23
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
      Height = 21
      Alignment = taCenter
      Caption = '#'
      Layout = tlCenter
    end
    object Button1: TButton
      Left = 200
      Top = 3
      Width = 41
      Height = 21
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Button2: TButton
    Left = 247
    Top = 3
    Width = 50
    Height = 21
    Caption = 'Button2'
    TabOrder = 1
    OnClick = Button2Click
  end
end
