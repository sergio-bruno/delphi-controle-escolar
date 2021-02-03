object Frm_AlunosPorSerie: TFrm_AlunosPorSerie
  Left = 131
  Top = 144
  BorderStyle = bsDialog
  Caption = 'Frm_AlunosPorSerie'
  ClientHeight = 389
  ClientWidth = 459
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
    Width = 459
    Height = 25
    Align = alTop
    Caption = 'Alunos por S'#233'rie'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -17
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object SPB_help: TSpeedButton
      Left = 2
      Top = 2
      Width = 37
      Height = 22
      Hint = 'Ajuda|'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333F797F3333333333F737373FF333333BFB999BFB
        33333337737773773F3333BFBF797FBFB33333733337333373F33BFBFBFBFBFB
        FB3337F33333F33337F33FBFBFB9BFBFBF3337333337F333373FFBFBFBF97BFB
        FBF37F333337FF33337FBFBFBFB99FBFBFB37F3333377FF3337FFBFBFBFB99FB
        FBF37F33333377FF337FBFBF77BF799FBFB37F333FF3377F337FFBFB99FB799B
        FBF373F377F3377F33733FBF997F799FBF3337F377FFF77337F33BFBF99999FB
        FB33373F37777733373333BFBF999FBFB3333373FF77733F7333333BFBFBFBFB
        3333333773FFFF77333333333FBFBF3333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
    end
  end
  object Pnl_Calendario: TPanel
    Left = 0
    Top = 348
    Width = 459
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Btn_Sair: TButton
      Left = 377
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Sai&r'
      TabOrder = 0
      OnClick = Btn_SairClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 25
    Width = 459
    Height = 48
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 5
      Top = 2
      Width = 82
      Height = 13
      Caption = 'Ano de Matr'#237'cula'
    end
    object Label2: TLabel
      Left = 96
      Top = 3
      Width = 24
      Height = 13
      Caption = 'S'#233'rie'
    end
    object Spb_LocalizaSerie: TSpeedButton
      Left = 186
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
    object Edt_Ano: TEdit
      Left = 5
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
      Left = 96
      Top = 19
      Width = 87
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 1
      OnExit = Edt_serieExit
    end
    object Pnl_descricaoserie: TPanel
      Left = 230
      Top = 19
      Width = 195
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = 'Panel1'
      TabOrder = 2
    end
    object Button1: TButton
      Left = 428
      Top = 18
      Width = 27
      Height = 23
      Caption = 'Ok'
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 73
    Width = 459
    Height = 275
    Align = alClient
    TabOrder = 3
    object DBGrid1: TDBGrid
      Left = 8
      Top = 4
      Width = 441
      Height = 265
      DataSource = Dts_AlunoPorSerie
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'MATRALUN'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 87
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
          Width = 318
          Visible = True
        end>
    end
  end
  object IBQ_AlunoPorSerie: TIBQuery
    Database = Frm_Modulo.Dtb_Academico
    Transaction = Frm_Modulo.IBT_Transaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT DISTINCT MATRALUN,ALUNNOME FROM TB_MATRICULA MAT'
      'LEFT OUTER JOIN TB_ALUNO ON MATRALUN=ALUNMATR'
      '')
    Left = 52
    Top = 88
    object IBQ_AlunoPorSerieMATRALUN: TIBStringField
      DisplayLabel = 'Matr'#237'cula'
      FieldName = 'MATRALUN'
      Origin = 'TB_MATRICULA.MATRALUN'
      Required = True
      Size = 10
    end
    object IBQ_AlunoPorSerieALUNNOME: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'ALUNNOME'
      Origin = 'TB_ALUNO.ALUNNOME'
      Size = 50
    end
  end
  object Dts_AlunoPorSerie: TDataSource
    DataSet = IBQ_AlunoPorSerie
    Left = 82
    Top = 90
  end
end
