object Frm_BoletimAlternadoNota: TFrm_BoletimAlternadoNota
  Left = 4
  Top = 105
  BorderStyle = bsDialog
  Caption = 'Frm_BoletimAlternadoNota'
  ClientHeight = 394
  ClientWidth = 780
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
    Width = 780
    Height = 23
    Align = alTop
    Caption = 'Sele'#231#227'o de Boletins Alternados - Notas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 360
    Width = 780
    Height = 34
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 615
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 690
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 23
    Width = 780
    Height = 337
    Align = alClient
    TabOrder = 2
    object Label2: TLabel
      Left = 7
      Top = 10
      Width = 19
      Height = 13
      Caption = 'Ano'
    end
    object Label3: TLabel
      Left = 77
      Top = 8
      Width = 24
      Height = 13
      Caption = 'S'#233'rie'
    end
    object Spb_LocalizaSerie: TSpeedButton
      Left = 167
      Top = 24
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
    object Label5: TLabel
      Left = 216
      Top = 9
      Width = 27
      Height = 13
      Caption = 'Aluno'
    end
    object Spb_localizaaluno: TSpeedButton
      Left = 306
      Top = 25
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
    object Edt_Ano: TEdit
      Left = 6
      Top = 24
      Width = 61
      Height = 21
      MaxLength = 4
      TabOrder = 0
      Text = 'Edt_Ano'
      OnExit = Edt_AnoExit
      OnKeyPress = Edt_AnoKeyPress
    end
    object Edt_serie: TEdit
      Left = 77
      Top = 24
      Width = 87
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 1
      OnExit = Edt_serieExit
    end
    object edt_aluno: TEdit
      Left = 216
      Top = 25
      Width = 87
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 2
      OnExit = edt_alunoExit
    end
    object pnl_nomealuno: TPanel
      Left = 350
      Top = 25
      Width = 361
      Height = 22
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = 'Panel1'
      TabOrder = 3
    end
    object DBGrid1: TDBGrid
      Left = 6
      Top = 49
      Width = 764
      Height = 284
      DataSource = Dts_MensAlternada
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = DBGrid1KeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'NOTA_ANO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOTAALUN'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 77
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
          Width = 328
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOTASERI'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SERIDESC'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 232
          Visible = True
        end>
    end
    object Button3: TButton
      Left = 717
      Top = 24
      Width = 55
      Height = 23
      Caption = 'Adicionar'
      TabOrder = 5
      OnClick = Button3Click
    end
  end
  object IBQ_NotaAlternada: TIBQuery
    Database = Frm_Modulo.Dtb_Academico
    Transaction = Frm_Modulo.IBT_Transaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT M.*,A.ALUNNOME,S.SERIDESC FROM TB_NOTAALTERNADA M,'
      'TB_ALUNO A, tb_serie s'
      'WHERE M.NOTAALUN=A.ALUNMATR AND M.NOTASERI=S.SERICODG')
    Left = 246
    Top = 86
    object IBQ_NotaAlternadaNOTA_ANO: TIBStringField
      DisplayLabel = 'Ano'
      FieldName = 'NOTA_ANO'
      Origin = 'TB_NOTAALTERNADA.NOTA_ANO'
      Size = 4
    end
    object IBQ_NotaAlternadaNOTAALUN: TIBStringField
      DisplayLabel = 'Matr'#237'cula'
      FieldName = 'NOTAALUN'
      Origin = 'TB_NOTAALTERNADA.NOTAALUN'
      Size = 10
    end
    object IBQ_NotaAlternadaALUNNOME: TIBStringField
      DisplayLabel = 'Aluno'
      FieldName = 'ALUNNOME'
      Origin = 'TB_ALUNO.ALUNNOME'
      Size = 50
    end
    object IBQ_NotaAlternadaNOTASERI: TIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'NOTASERI'
      Origin = 'TB_NOTAALTERNADA.NOTASERI'
      Size = 10
    end
    object IBQ_NotaAlternadaSERIDESC: TIBStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIDESC'
      Origin = 'TB_SERIE.SERIDESC'
      Size = 40
    end
  end
  object Dts_MensAlternada: TDataSource
    DataSet = IBQ_NotaAlternada
    Left = 298
    Top = 90
  end
end
