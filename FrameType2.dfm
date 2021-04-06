object Type2: TType2
  Left = 0
  Top = 0
  Width = 560
  Height = 26
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 560
    Height = 26
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object AtLambdaLabel: TLabel
      Left = 19
      Top = 3
      Width = 11
      Height = 13
      Alignment = taCenter
      Caption = 'At'
      Layout = tlCenter
    end
    object SpecLabel: TLabel
      Left = 185
      Top = 2
      Width = 23
      Height = 13
      Alignment = taCenter
      Caption = 'Spec'
      Layout = tlCenter
    end
    object PlusLabel: TLabel
      Left = 373
      Top = 2
      Width = 14
      Height = 13
      Alignment = taCenter
      Caption = '  +'
      Layout = tlCenter
    end
    object MinusLabel: TLabel
      Left = 455
      Top = 2
      Width = 10
      Height = 13
      Alignment = taCenter
      Caption = '  -'
      Layout = tlCenter
    end
    object MinusEdit: TEdit
      Left = 471
      Top = 3
      Width = 40
      Height = 21
      Alignment = taCenter
      TabOrder = 0
      TextHint = '0'
    end
    object PlusEdit: TEdit
      Left = 393
      Top = 3
      Width = 40
      Height = 21
      Alignment = taCenter
      TabOrder = 1
      TextHint = '0'
    end
    object SpecEdit: TEdit
      Left = 222
      Top = 3
      Width = 100
      Height = 21
      Alignment = taCenter
      TabOrder = 2
      TextHint = 'Spec'
    end
    object AtLambdaEdit: TEdit
      Left = 36
      Top = 3
      Width = 100
      Height = 21
      Alignment = taCenter
      TabOrder = 3
      TextHint = 'at lambda'
    end
  end
end
