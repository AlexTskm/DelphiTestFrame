object Square: TSquare
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 37
      Height = 23
      Align = alLeft
      Caption = #1063#1080#1089#1083#1086': '
      ExplicitHeight = 13
    end
    object poDataSquare: TEdit
      Left = 38
      Top = 1
      Width = 121
      Height = 23
      Hint = #1042#1074#1077#1076#1080#1090#1077' '#1095#1080#1089#1083#1086
      Align = alLeft
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = 'poDataSquare'
      OnExit = poDataSquareExit
      ExplicitTop = -2
    end
  end
end
