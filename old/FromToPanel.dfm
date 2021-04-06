object FromToFrame: TFromToFrame
  Left = 0
  Top = 0
  Width = 820
  Height = 28
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 820
    Height = 28
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -3
    object FromLambdaLabel: TLabel
      Left = 199
      Top = 4
      Width = 24
      Height = 20
      Alignment = taCenter
      Caption = 'From'
      Layout = tlCenter
    end
    object ToLabel: TLabel
      Left = 295
      Top = 4
      Width = 12
      Height = 20
      Alignment = taCenter
      Caption = 'To'
      Layout = tlCenter
    end
    object SpecLabel: TLabel
      Left = 33
      Top = 4
      Width = 23
      Height = 20
      Alignment = taCenter
      Caption = 'Spec'
      Layout = tlCenter
    end
    object PlusLabel: TLabel
      Left = 384
      Top = 4
      Width = 14
      Height = 20
      Alignment = taCenter
      Caption = '  +'
      Layout = tlCenter
    end
    object MinusLabel: TLabel
      Left = 455
      Top = 4
      Width = 10
      Height = 20
      Alignment = taCenter
      Caption = '  -'
      Layout = tlCenter
    end
    object ToLambdaEdit: TEdit
      Left = 313
      Top = 4
      Width = 60
      Height = 20
      Alignment = taCenter
      TabOrder = 0
    end
    object PlusEdit: TEdit
      Left = 471
      Top = 4
      Width = 40
      Height = 20
      Alignment = taCenter
      TabOrder = 1
    end
    object SpecEdit: TEdit
      Left = 72
      Top = 4
      Width = 121
      Height = 20
      Alignment = taCenter
      TabOrder = 3
      TextHint = 'Spec'
    end
    object MinusEdit: TEdit
      Left = 404
      Top = 4
      Width = 40
      Height = 20
      Alignment = taCenter
      TabOrder = 2
    end
    object fromLambdaEdit1: TEdit
      Left = 229
      Top = 4
      Width = 60
      Height = 20
      Alignment = taCenter
      TabOrder = 4
      Text = 'From'
    end
  end
end
