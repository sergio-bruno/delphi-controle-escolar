object Frm_SelecionaAlunoMatriculaC: TFrm_SelecionaAlunoMatriculaC
  Left = 16
  Top = 25
  BorderStyle = bsDialog
  Caption = 'Frm_SelecionaAlunoMatriculaC'
  ClientHeight = 519
  ClientWidth = 716
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
    Width = 716
    Height = 23
    Align = alTop
    Caption = 'Seleciona Alunos Para Efetuar Matr'#237'cula'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 97
    Width = 716
    Height = 371
    Align = alClient
    DataSource = Frm_Modulo.Dts_Aluno
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ALUNMATR'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUNNOME'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 478
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUNFONE'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 124
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 23
    Width = 716
    Height = 74
    Align = alTop
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 3
      Top = 1
      Width = 710
      Height = 66
      Caption = 'Dados Cadastrais'
      TabOrder = 0
      object Label1: TLabel
        Left = 158
        Top = 17
        Width = 82
        Height = 13
        Caption = 'Ano de Matr'#237'cula'
      end
      object Label2: TLabel
        Left = 248
        Top = 18
        Width = 24
        Height = 13
        Caption = 'S'#233'rie'
      end
      object Spb_LocalizaSerie: TSpeedButton
        Left = 338
        Top = 35
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
      object Button1: TButton
        Left = 629
        Top = 34
        Width = 74
        Height = 23
        Caption = '&Matricular'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Edt_Ano: TEdit
        Left = 158
        Top = 34
        Width = 82
        Height = 21
        MaxLength = 4
        TabOrder = 1
        Text = 'Edt_Ano'
        OnExit = Edt_AnoExit
        OnKeyPress = Edt_AnoKeyPress
      end
      object Edt_serie: TEdit
        Left = 248
        Top = 34
        Width = 87
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 10
        TabOrder = 2
        OnExit = Edt_serieExit
      end
      object Pnl_descricaoserie: TPanel
        Left = 381
        Top = 35
        Width = 244
        Height = 21
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = 'Panel1'
        TabOrder = 3
      end
      object Rdg_Ordem: TRadioGroup
        Left = 9
        Top = 17
        Width = 144
        Height = 39
        Caption = 'Ordem Alunos'
        Columns = 2
        Items.Strings = (
          'Matr'#237'cula'
          'Nome')
        TabOrder = 4
        OnClick = Rdg_OrdemClick
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 468
    Width = 716
    Height = 51
    Align = alBottom
    TabOrder = 3
    object Label3: TLabel
      Left = 12
      Top = 6
      Width = 194
      Height = 13
      Caption = 'Sele'#231#227'o - <SHIFT> + click com o mouse '
    end
    object Button2: TButton
      Left = 634
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Sai&r'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Prb_matricula: TProgressBar
      Left = 1
      Top = 34
      Width = 714
      Height = 16
      Align = alBottom
      Min = 0
      Max = 100
      TabOrder = 1
    end
  end
end
