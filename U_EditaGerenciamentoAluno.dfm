object Frm_EditaGerenciamentoAluno: TFrm_EditaGerenciamentoAluno
  Left = 174
  Top = 48
  BorderStyle = bsDialog
  Caption = 'Frm_EditaGerenciamentoAluno'
  ClientHeight = 378
  ClientWidth = 495
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
    Width = 495
    Height = 23
    Align = alTop
    Caption = 'Edi'#231#227'o de Alunos'
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
    Width = 495
    Height = 321
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 17
      Top = 2
      Width = 82
      Height = 13
      Caption = 'Ano de Matr'#237'cula'
    end
    object Label2: TLabel
      Left = 108
      Top = 3
      Width = 24
      Height = 13
      Caption = 'S'#233'rie'
    end
    object Spb_LocalizaSerie: TSpeedButton
      Left = 198
      Top = 20
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
      Top = 43
      Width = 27
      Height = 13
      Caption = 'Aluno'
    end
    object Spb_localizaaluno: TSpeedButton
      Left = 107
      Top = 60
      Width = 40
      Height = 22
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
      Top = 82
      Width = 45
      Height = 13
      Caption = 'Disciplina'
    end
    object spb_localizadisciplina: TSpeedButton
      Left = 107
      Top = 99
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
      Top = 121
      Width = 44
      Height = 13
      Caption = 'Professor'
    end
    object spb_localizaprofessor: TSpeedButton
      Left = 107
      Top = 138
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
      Left = 17
      Top = 19
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
      Top = 19
      Width = 87
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 1
      OnExit = Edt_serieExit
    end
    object Pnl_descricaoserie: TPanel
      Left = 242
      Top = 19
      Width = 234
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = 'Panel1'
      TabOrder = 2
    end
    object edt_aluno: TEdit
      Left = 17
      Top = 59
      Width = 87
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 3
      OnExit = edt_alunoExit
    end
    object pnl_nomealuno: TPanel
      Left = 151
      Top = 59
      Width = 326
      Height = 22
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = 'Panel1'
      TabOrder = 4
    end
    object edt_disciplina: TEdit
      Left = 17
      Top = 98
      Width = 87
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 5
      OnExit = edt_disciplinaExit
    end
    object pnl_descricaodisciplina: TPanel
      Left = 151
      Top = 98
      Width = 326
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = 'Panel1'
      TabOrder = 6
    end
    object edt_professor: TEdit
      Left = 17
      Top = 137
      Width = 87
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 8
      TabOrder = 7
      OnExit = edt_professorExit
    end
    object pnl_nomeprofessor: TPanel
      Left = 151
      Top = 137
      Width = 326
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = 'Panel1'
      TabOrder = 8
    end
    object GroupBox1: TGroupBox
      Left = 17
      Top = 164
      Width = 460
      Height = 151
      Caption = 'Notas'
      TabOrder = 9
      object Label7: TLabel
        Left = 9
        Top = 27
        Width = 75
        Height = 13
        Alignment = taRightJustify
        Caption = '1o. Bimestre:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 86
        Top = 8
        Width = 28
        Height = 13
        Caption = 'Faltas'
      end
      object Label9: TLabel
        Left = 149
        Top = 8
        Width = 41
        Height = 13
        Caption = 'A. '#218'nica'
      end
      object Label10: TLabel
        Left = 225
        Top = 8
        Width = 42
        Height = 13
        Caption = 'Trabalho'
      end
      object Label11: TLabel
        Left = 303
        Top = 8
        Width = 55
        Height = 13
        Caption = 'P. Bimestral'
      end
      object Label13: TLabel
        Left = 381
        Top = 8
        Width = 29
        Height = 13
        Caption = 'M'#233'dia'
      end
      object Label14: TLabel
        Left = 9
        Top = 52
        Width = 75
        Height = 13
        Alignment = taRightJustify
        Caption = '2o. Bimestre:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 9
        Top = 77
        Width = 75
        Height = 13
        Alignment = taRightJustify
        Caption = '3o. Bimestre:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 9
        Top = 101
        Width = 75
        Height = 13
        Alignment = taRightJustify
        Caption = '4o. Bimestre:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 10
        Top = 126
        Width = 62
        Height = 13
        Alignment = taRightJustify
        Caption = 'Resultado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Spe_matr1bft: TSpinEdit
        Left = 85
        Top = 23
        Width = 61
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 0
        Value = 0
      end
      object Spe_matr2bft: TSpinEdit
        Left = 85
        Top = 48
        Width = 61
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 5
        Value = 0
      end
      object Spe_matr3bft: TSpinEdit
        Left = 85
        Top = 73
        Width = 61
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 10
        Value = 0
      end
      object Spe_matr4bft: TSpinEdit
        Left = 85
        Top = 97
        Width = 61
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 15
        Value = 0
      end
      object cmb_matrrsfn: TComboBox
        Left = 85
        Top = 122
        Width = 210
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 20
        Items.Strings = (
          'APROVADO'
          'CURSANDO'
          'REPROVADO'
          'TRANCADO')
      end
      object Fne_matr1bau: TFnpNumericEdit
        Left = 148
        Top = 23
        Width = 69
        Height = 21
        TabOrder = 1
        OnExit = CalculaMedia_1_Bimestre
      end
      object Fne_matr1btb: TFnpNumericEdit
        Left = 225
        Top = 23
        Width = 69
        Height = 21
        TabOrder = 2
        OnExit = CalculaMedia_1_Bimestre
      end
      object Fne_matr1bpb: TFnpNumericEdit
        Left = 302
        Top = 23
        Width = 69
        Height = 21
        TabOrder = 3
        OnExit = CalculaMedia_1_Bimestre
      end
      object Fne_matr1bmd: TFnpNumericEdit
        Left = 380
        Top = 23
        Width = 69
        Height = 21
        TabOrder = 4
      end
      object Fne_matr2bau: TFnpNumericEdit
        Left = 148
        Top = 48
        Width = 69
        Height = 21
        TabOrder = 6
        OnExit = CalculaMedia_2_Bimestre
      end
      object Fne_matr2btb: TFnpNumericEdit
        Left = 225
        Top = 48
        Width = 69
        Height = 21
        TabOrder = 7
        OnExit = CalculaMedia_2_Bimestre
      end
      object Fne_matr2bpb: TFnpNumericEdit
        Left = 302
        Top = 48
        Width = 69
        Height = 21
        TabOrder = 8
        OnExit = CalculaMedia_2_Bimestre
      end
      object Fne_matr2bmd: TFnpNumericEdit
        Left = 380
        Top = 48
        Width = 69
        Height = 21
        TabOrder = 9
      end
      object Fne_matr3bau: TFnpNumericEdit
        Left = 148
        Top = 73
        Width = 69
        Height = 21
        TabOrder = 11
        OnExit = CalculaMedia_3_Bimestre
      end
      object Fne_matr3btb: TFnpNumericEdit
        Left = 225
        Top = 73
        Width = 69
        Height = 21
        TabOrder = 12
        OnExit = CalculaMedia_3_Bimestre
      end
      object Fne_matr3bpb: TFnpNumericEdit
        Left = 302
        Top = 73
        Width = 69
        Height = 21
        TabOrder = 13
        OnExit = CalculaMedia_3_Bimestre
      end
      object Fne_matr3bmd: TFnpNumericEdit
        Left = 380
        Top = 73
        Width = 69
        Height = 21
        TabOrder = 14
      end
      object Fne_matr4bau: TFnpNumericEdit
        Left = 148
        Top = 97
        Width = 69
        Height = 21
        TabOrder = 16
        OnExit = CalculaMedia_4_Bimestre
      end
      object Fne_matr4btb: TFnpNumericEdit
        Left = 225
        Top = 97
        Width = 69
        Height = 21
        TabOrder = 17
        OnExit = CalculaMedia_4_Bimestre
      end
      object Fne_matr4bpb: TFnpNumericEdit
        Left = 302
        Top = 97
        Width = 69
        Height = 21
        TabOrder = 18
        OnExit = CalculaMedia_4_Bimestre
      end
      object Fne_matr4bmd: TFnpNumericEdit
        Left = 380
        Top = 97
        Width = 69
        Height = 21
        TabOrder = 19
      end
      object Fne_matrmdan: TFnpNumericEdit
        Left = 380
        Top = 122
        Width = 69
        Height = 21
        TabOrder = 21
        OnChange = Fne_matrmdanChange
      end
      object Button3: TButton
        Left = 302
        Top = 123
        Width = 70
        Height = 21
        Caption = '&M'#233'dia F.'
        TabOrder = 22
        OnClick = Button3Click
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 344
    Width = 495
    Height = 34
    Align = alBottom
    TabOrder = 2
    object Button1: TButton
      Left = 252
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Gravar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 402
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Sai&r'
      ModalResult = 2
      TabOrder = 2
    end
    object Button4: TButton
      Left = 327
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Excluir'
      TabOrder = 1
      OnClick = Button4Click
    end
  end
end
