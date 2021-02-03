object Frm_BaixaMensalidade: TFrm_BaixaMensalidade
  Left = 181
  Top = 162
  BorderStyle = bsDialog
  Caption = 'Frm_BaixaMensalidade'
  ClientHeight = 163
  ClientWidth = 589
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 589
    Height = 23
    Align = alTop
    Caption = 'Baixa de Mensalidade Individual'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel3: TPanel
    Left = 0
    Top = 23
    Width = 589
    Height = 106
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 44
      Top = 6
      Width = 19
      Height = 13
      Caption = 'Ano'
    end
    object Label3: TLabel
      Left = 189
      Top = 7
      Width = 27
      Height = 13
      Caption = 'Aluno'
    end
    object Spb_localizaaluno: TSpeedButton
      Left = 279
      Top = 23
      Width = 40
      Height = 21
      Hint = 'Localizar aluno|'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333FFF333333333333000333333333
        3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
        3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
        0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
        BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
        33337777773FF733333333333300033333333333337773333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = Spb_localizaalunoClick
    end
    object Label2: TLabel
      Left = 9
      Top = 6
      Width = 20
      Height = 13
      Caption = 'M'#234's'
    end
    object Label16: TLabel
      Left = 98
      Top = 49
      Width = 56
      Height = 13
      Caption = 'Vencimento'
      FocusControl = Button1
    end
    object Label4: TLabel
      Left = 9
      Top = 49
      Width = 52
      Height = 13
      Caption = 'Valor Pago'
      FocusControl = Button1
    end
    object Label5: TLabel
      Left = 188
      Top = 49
      Width = 54
      Height = 13
      Caption = 'Pagamento'
      FocusControl = Button1
    end
    object Label6: TLabel
      Left = 98
      Top = 7
      Width = 24
      Height = 13
      Caption = 'S'#233'rie'
    end
    object Spb_LocalizaSerie: TSpeedButton
      Left = 148
      Top = 23
      Width = 40
      Height = 21
      Hint = 'Localizar s'#233'rie|'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333FFF333333333333000333333333
        3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
        3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
        0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
        BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
        33337777773FF733333333333300033333333333337773333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
    end
    object edt_mens_ano: TEdit
      Left = 44
      Top = 23
      Width = 51
      Height = 21
      MaxLength = 4
      TabOrder = 1
      Text = 'edt_mens_ano'
      OnExit = edt_mens_anoExit
      OnKeyPress = edt_mens_mesKeyPress
    end
    object edt_mensalun: TEdit
      Left = 189
      Top = 23
      Width = 87
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 3
      OnExit = edt_mensalunExit
    end
    object pnl_nomealuno: TPanel
      Left = 323
      Top = 23
      Width = 255
      Height = 22
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = 'Panel1'
      TabOrder = 4
    end
    object edt_mens_mes: TEdit
      Left = 9
      Top = 23
      Width = 33
      Height = 21
      MaxLength = 2
      TabOrder = 0
      Text = 'Edt_Ano'
      OnExit = edt_mens_mesExit
      OnKeyPress = edt_mens_mesKeyPress
    end
    object Fne_mensvlpg: TFnpNumericEdit
      Left = 9
      Top = 65
      Width = 86
      Height = 21
      TabOrder = 5
    end
    object Mke_mensdtvc: TMaskEdit
      Left = 98
      Top = 65
      Width = 87
      Height = 21
      EditMask = '99/99/9999;1; '
      MaxLength = 10
      TabOrder = 6
      Text = '  /  /    '
      OnExit = Mke_mensdtvcExit
    end
    object mke_mensdtpg: TMaskEdit
      Left = 188
      Top = 65
      Width = 87
      Height = 21
      EditMask = '99/99/9999;1; '
      MaxLength = 10
      TabOrder = 7
      Text = '  /  /    '
      OnExit = Mke_mensdtvcExit
    end
    object chk_menspago: TCheckBox
      Left = 286
      Top = 66
      Width = 97
      Height = 17
      Caption = 'Pago'
      TabOrder = 8
    end
    object Edt_serie: TEdit
      Left = 98
      Top = 23
      Width = 48
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 2
      OnExit = Edt_serieExit
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 129
    Width = 589
    Height = 34
    Align = alBottom
    TabOrder = 2
    object Button1: TButton
      Left = 354
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Gravar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 504
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Sai&r'
      ModalResult = 2
      TabOrder = 2
    end
    object Button4: TButton
      Left = 429
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Excluir'
      TabOrder = 1
      OnClick = Button4Click
    end
  end
end
