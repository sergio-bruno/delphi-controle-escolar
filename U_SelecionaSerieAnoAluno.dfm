object Frm_SelecionaSerieAnoAluno: TFrm_SelecionaSerieAnoAluno
  Left = 192
  Top = 103
  BorderStyle = bsDialog
  Caption = 'Frm_SelecionaSerieAnoAluno'
  ClientHeight = 181
  ClientWidth = 367
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
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 367
    Height = 23
    Align = alTop
    Caption = 'Sele'#231#227'o de S'#233'rie e Ano Letivo'
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
    Width = 367
    Height = 124
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 20
      Top = 19
      Width = 82
      Height = 13
      Caption = 'Ano de Matr'#237'cula'
    end
    object Label2: TLabel
      Left = 110
      Top = 20
      Width = 24
      Height = 13
      Caption = 'S'#233'rie'
    end
    object Spb_LocalizaSerie: TSpeedButton
      Left = 200
      Top = 37
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
      OnClick = Spb_LocalizaSerieClick
    end
    object Label3: TLabel
      Left = 20
      Top = 63
      Width = 27
      Height = 13
      Caption = 'Aluno'
    end
    object Spb_localizaaluno: TSpeedButton
      Left = 111
      Top = 79
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
    object Edt_Ano: TEdit
      Left = 20
      Top = 36
      Width = 82
      Height = 21
      MaxLength = 4
      TabOrder = 0
      Text = 'Edt_Ano'
      OnExit = Edt_AnoExit
      OnKeyPress = Edt_AnoKeyPress
    end
    object Edt_serie: TEdit
      Left = 110
      Top = 36
      Width = 87
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 1
      OnExit = Edt_serieExit
    end
    object edt_mensalun: TEdit
      Left = 20
      Top = 79
      Width = 82
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 2
      OnExit = edt_mensalunExit
    end
    object pnl_nomealuno: TPanel
      Left = 159
      Top = 79
      Width = 191
      Height = 22
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = 'Panel1'
      TabOrder = 3
    end
    object rdg_tipo: TRadioGroup
      Left = 247
      Top = 16
      Width = 103
      Height = 57
      Caption = 'Tipo'
      Items.Strings = (
        'Nota'
        'Conceito')
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 147
    Width = 367
    Height = 34
    Align = alBottom
    TabOrder = 2
    object Button1: TButton
      Left = 203
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Ok'
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 278
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end
