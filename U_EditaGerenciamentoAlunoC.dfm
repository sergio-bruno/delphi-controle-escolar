object Frm_EditaGerenciamentoAlunoC: TFrm_EditaGerenciamentoAlunoC
  Left = 63
  Top = 60
  BorderStyle = bsDialog
  Caption = 'Frm_EditaGerenciamentoAlunoC'
  ClientHeight = 463
  ClientWidth = 639
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
    Width = 639
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
    Width = 639
    Height = 440
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
      Left = 485
      Top = 14
      Width = 138
      Height = 145
      Caption = 'Notas'
      TabOrder = 9
      object Label7: TLabel
        Left = 9
        Top = 28
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
        Left = 88
        Top = 9
        Width = 42
        Height = 13
        Caption = 'Conceito'
      end
      object Label14: TLabel
        Left = 9
        Top = 58
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
        Top = 89
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
        Top = 120
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
      object edt_matr1bct: TEdit
        Left = 90
        Top = 25
        Width = 35
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 1
        TabOrder = 0
        Text = 'EDT_MATR1BCT'
        OnKeyPress = edt_matr1bctKeyPress
      end
      object edt_matr2bct: TEdit
        Left = 90
        Top = 55
        Width = 35
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 1
        TabOrder = 1
        Text = 'EDIT1'
        OnKeyPress = edt_matr1bctKeyPress
      end
      object edt_matr3bct: TEdit
        Left = 90
        Top = 85
        Width = 35
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 1
        TabOrder = 2
        Text = 'EDIT1'
        OnKeyPress = edt_matr1bctKeyPress
      end
      object edt_matr4bct: TEdit
        Left = 90
        Top = 116
        Width = 35
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 1
        TabOrder = 3
        Text = 'EDIT1'
        OnKeyPress = edt_matr1bctKeyPress
      end
    end
    object GroupBox2: TGroupBox
      Left = 17
      Top = 196
      Width = 606
      Height = 235
      Caption = 'Caracter'#237'sticas individuais, comportamento social/emocional'
      TabOrder = 13
      object SpeedButton1: TSpeedButton
        Left = 62
        Top = 28
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
        OnClick = SpeedButton1Click
      end
      object Label6: TLabel
        Left = 8
        Top = 14
        Width = 47
        Height = 13
        Caption = 'Conceitos'
      end
      object Label9: TLabel
        Left = 374
        Top = 14
        Width = 22
        Height = 13
        Caption = '1oB.'
      end
      object Label10: TLabel
        Left = 402
        Top = 14
        Width = 22
        Height = 13
        Caption = '2oB.'
      end
      object Label11: TLabel
        Left = 430
        Top = 14
        Width = 22
        Height = 13
        Caption = '3oB.'
      end
      object Label12: TLabel
        Left = 458
        Top = 14
        Width = 22
        Height = 13
        Caption = '4oB.'
      end
      object DBGrid1: TDBGrid
        Left = 8
        Top = 56
        Width = 590
        Height = 172
        DataSource = Frm_Modulo.Dts_MatrTabConceito
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'MATRCONC'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONCDESC'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 353
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MATR1BNT'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MATR2BNT'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MATR3BNT'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MATR4BNT'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
      object edt_matrconc: TEdit
        Left = 8
        Top = 27
        Width = 49
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 2
        TabOrder = 1
        OnExit = edt_matrconcExit
      end
      object Pnl_DescricaoConceito: TPanel
        Left = 106
        Top = 28
        Width = 264
        Height = 22
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = 'Panel1'
        TabOrder = 2
      end
      object edt_matr1bnt: TEdit
        Left = 374
        Top = 28
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 1
        TabOrder = 3
        Text = 'EDT_MATRNOTA'
        OnKeyPress = edt_matr1bntKeyPress
      end
      object Button3: TButton
        Left = 488
        Top = 28
        Width = 111
        Height = 22
        Caption = '&Gravar'
        TabOrder = 7
        OnClick = Button3Click
      end
      object edt_matr2bnt: TEdit
        Left = 402
        Top = 28
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 1
        TabOrder = 4
        Text = 'EDT_MATRNOTA'
        OnKeyPress = edt_matr1bntKeyPress
      end
      object edt_matr3bnt: TEdit
        Left = 430
        Top = 28
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 1
        TabOrder = 5
        Text = 'EDT_MATRNOTA'
        OnKeyPress = edt_matr1bntKeyPress
      end
      object edt_matr4bnt: TEdit
        Left = 458
        Top = 28
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 1
        TabOrder = 6
        Text = 'EDT_MATRNOTA'
        OnKeyPress = edt_matr1bntKeyPress
      end
    end
    object Button1: TButton
      Left = 398
      Top = 165
      Width = 75
      Height = 25
      Caption = '&Gravar'
      TabOrder = 10
      OnClick = Button1Click
    end
    object Button4: TButton
      Left = 473
      Top = 165
      Width = 75
      Height = 25
      Caption = '&Excluir'
      TabOrder = 11
      OnClick = Button4Click
    end
    object Button2: TButton
      Left = 548
      Top = 165
      Width = 75
      Height = 25
      Caption = 'Sai&r'
      ModalResult = 2
      TabOrder = 12
    end
  end
end
