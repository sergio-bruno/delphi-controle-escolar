object Frm_FiltroGerenciamentoAluno: TFrm_FiltroGerenciamentoAluno
  Left = 163
  Top = 140
  BorderStyle = bsDialog
  Caption = 'Frm_FiltroGerenciamentoAluno'
  ClientHeight = 252
  ClientWidth = 503
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
    Width = 503
    Height = 23
    Align = alTop
    Caption = 'Sele'#231#227'o de Alunos'
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
    Width = 503
    Height = 195
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 18
      Top = 11
      Width = 82
      Height = 13
      Caption = 'Ano de Matr'#237'cula'
    end
    object Label2: TLabel
      Left = 108
      Top = 12
      Width = 24
      Height = 13
      Caption = 'S'#233'rie'
    end
    object Spb_LocalizaSerie: TSpeedButton
      Left = 198
      Top = 29
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
      Left = 17
      Top = 56
      Width = 27
      Height = 13
      Caption = 'Aluno'
    end
    object Spb_localizaaluno: TSpeedButton
      Left = 107
      Top = 73
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
      OnClick = Spb_localizaalunoClick
    end
    object Label4: TLabel
      Left = 17
      Top = 99
      Width = 45
      Height = 13
      Caption = 'Disciplina'
    end
    object spb_localizadisciplina: TSpeedButton
      Left = 107
      Top = 116
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
      OnClick = spb_localizadisciplinaClick
    end
    object Label5: TLabel
      Left = 17
      Top = 142
      Width = 44
      Height = 13
      Caption = 'Professor'
    end
    object spb_localizaprofessor: TSpeedButton
      Left = 107
      Top = 159
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
      OnClick = spb_localizaprofessorClick
    end
    object Edt_Ano: TEdit
      Left = 18
      Top = 28
      Width = 82
      Height = 21
      MaxLength = 4
      TabOrder = 0
      Text = 'Edt_Ano'
      OnExit = Edt_AnoExit
      OnKeyPress = Edt_AnoKeyPress
    end
    object Edt_serie: TEdit
      Left = 108
      Top = 28
      Width = 87
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 1
      OnExit = Edt_serieExit
    end
    object Pnl_descricaoserie: TPanel
      Left = 242
      Top = 28
      Width = 244
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = 'Panel1'
      TabOrder = 2
    end
    object edt_aluno: TEdit
      Left = 17
      Top = 72
      Width = 87
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 3
      OnExit = edt_alunoExit
    end
    object pnl_nomealuno: TPanel
      Left = 151
      Top = 72
      Width = 336
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = 'Panel1'
      TabOrder = 4
    end
    object edt_disciplina: TEdit
      Left = 17
      Top = 115
      Width = 87
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 5
      OnExit = edt_disciplinaExit
    end
    object pnl_descricaodisciplina: TPanel
      Left = 151
      Top = 115
      Width = 336
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = 'Panel1'
      TabOrder = 6
    end
    object edt_professor: TEdit
      Left = 17
      Top = 158
      Width = 87
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 8
      TabOrder = 7
      OnExit = edt_professorExit
    end
    object pnl_nomeprofessor: TPanel
      Left = 151
      Top = 158
      Width = 336
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = 'Panel1'
      TabOrder = 8
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 218
    Width = 503
    Height = 34
    Align = alBottom
    TabOrder = 2
    object Button1: TButton
      Left = 337
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Ok'
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 412
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
