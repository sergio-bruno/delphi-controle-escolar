object Frm_Modulo: TFrm_Modulo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 219
  Top = 122
  Height = 308
  Width = 372
  object Dtb_Academico: TIBDatabase
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBT_Transaction
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 265
    Top = 12
  end
  object IBT_Transaction: TIBTransaction
    Active = False
    DefaultDatabase = Dtb_Academico
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 268
    Top = 60
  end
  object IBQ_Funcoes: TIBQuery
    Database = Dtb_Academico
    Transaction = IBT_Transaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 26
    Top = 108
  end
  object IBQ_Funcoes2: TIBQuery
    Database = Dtb_Academico
    Transaction = IBT_Transaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      '')
    Left = 28
    Top = 56
  end
  object Opd_dialogo: TOpenDialog
    FileName = 'ACADEMICO.GDB'
    Filter = 'Arquivos Interbase (*.GDB)|*.GDB'
    Title = 'SIGCom'
    Left = 268
    Top = 112
  end
  object IBQ_Funcionario: TIBQuery
    Database = Dtb_Academico
    Transaction = IBT_Transaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM TB_FUNCIONARIO')
    Left = 26
    Top = 8
    object IBQ_FuncionarioAGENCODG: TIBStringField
      FieldName = 'AGENCODG'
      Origin = 'TB_FUNCIONARIO.AGENCODG'
      Required = True
      Size = 8
    end
    object IBQ_FuncionarioAGENNOME: TIBStringField
      FieldName = 'AGENNOME'
      Origin = 'TB_FUNCIONARIO.AGENNOME'
      Required = True
      Size = 40
    end
    object IBQ_FuncionarioAGENIDEN: TIBStringField
      FieldName = 'AGENIDEN'
      Origin = 'TB_FUNCIONARIO.AGENIDEN'
    end
    object IBQ_FuncionarioAGENCPFS: TIBStringField
      FieldName = 'AGENCPFS'
      Origin = 'TB_FUNCIONARIO.AGENCPFS'
      Size = 11
    end
    object IBQ_FuncionarioAGENENDR: TIBStringField
      FieldName = 'AGENENDR'
      Origin = 'TB_FUNCIONARIO.AGENENDR'
      Size = 50
    end
    object IBQ_FuncionarioAGENBAIR: TIBStringField
      FieldName = 'AGENBAIR'
      Origin = 'TB_FUNCIONARIO.AGENBAIR'
      Size = 30
    end
    object IBQ_FuncionarioAGENCIDA: TIBStringField
      FieldName = 'AGENCIDA'
      Origin = 'TB_FUNCIONARIO.AGENCIDA'
      Size = 30
    end
    object IBQ_FuncionarioAGENCEPS: TIBStringField
      FieldName = 'AGENCEPS'
      Origin = 'TB_FUNCIONARIO.AGENCEPS'
      Size = 8
    end
    object IBQ_FuncionarioAGENUFED: TIBStringField
      FieldName = 'AGENUFED'
      Origin = 'TB_FUNCIONARIO.AGENUFED'
      Size = 2
    end
    object IBQ_FuncionarioAGENFON1: TIBStringField
      FieldName = 'AGENFON1'
      Origin = 'TB_FUNCIONARIO.AGENFON1'
      Size = 10
    end
    object IBQ_FuncionarioAGENFON2: TIBStringField
      FieldName = 'AGENFON2'
      Origin = 'TB_FUNCIONARIO.AGENFON2'
      Size = 10
    end
    object IBQ_FuncionarioAGENFAXS: TIBStringField
      FieldName = 'AGENFAXS'
      Origin = 'TB_FUNCIONARIO.AGENFAXS'
      Size = 10
    end
    object IBQ_FuncionarioAGENCELU: TIBStringField
      FieldName = 'AGENCELU'
      Origin = 'TB_FUNCIONARIO.AGENCELU'
      Size = 10
    end
    object IBQ_FuncionarioAGENDTNC: TDateTimeField
      FieldName = 'AGENDTNC'
      Origin = 'TB_FUNCIONARIO.AGENDTNC'
      OnGetText = Apagadata
    end
    object IBQ_FuncionarioAGENEMAI: TIBStringField
      FieldName = 'AGENEMAI'
      Origin = 'TB_FUNCIONARIO.AGENEMAI'
      Size = 50
    end
    object IBQ_FuncionarioAGENSEXO: TIBStringField
      FieldName = 'AGENSEXO'
      Origin = 'TB_FUNCIONARIO.AGENSEXO'
      Size = 1
    end
    object IBQ_FuncionarioAGENOBSV: TMemoField
      FieldName = 'AGENOBSV'
      Origin = 'TB_FUNCIONARIO.AGENOBSV'
      BlobType = ftMemo
      Size = 8
    end
    object IBQ_FuncionarioAGENFOTO: TBlobField
      FieldName = 'AGENFOTO'
      Origin = 'TB_FUNCIONARIO.AGENFOTO'
      Size = 8
    end
    object IBQ_FuncionarioAGENSENH: TIBStringField
      FieldName = 'AGENSENH'
      Origin = 'TB_FUNCIONARIO.AGENSENH'
      Size = 8
    end
  end
  object IBQ_DisciplinaSerie: TIBQuery
    Database = Dtb_Academico
    Transaction = IBT_Transaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT DS.*,D.DISCDESC,FUN.AGENNOME '
      'FROM TB_DISCIPLINASERIE DS'
      'LEFT OUTER JOIN TB_DISCIPLINA D ON DS.DISSDISC=D.DISCCODG'
      'LEFT OUTER JOIN TB_FUNCIONARIO FUN ON DS.DISSAGEN=FUN.AGENCODG'
      'WHERE  DS.DISSSERI=:WS')
    Left = 102
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'WS'
        ParamType = ptUnknown
        Value = ' '
      end>
    object IBQ_DisciplinaSerieDISSSERI: TIBStringField
      FieldName = 'DISSSERI'
      Origin = 'TB_DISCIPLINASERIE.DISSSERI'
      Required = True
      Size = 10
    end
    object IBQ_DisciplinaSerieDISSDISC: TIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'DISSDISC'
      Origin = 'TB_DISCIPLINASERIE.DISSDISC'
      Required = True
      Size = 10
    end
    object IBQ_DisciplinaSerieDISCDESC: TIBStringField
      DisplayLabel = 'Disciplina'
      FieldName = 'DISCDESC'
      Origin = 'TB_DISCIPLINA.DISCDESC'
      Required = True
      Size = 40
    end
    object IBQ_DisciplinaSerieDISSAGEN: TIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'DISSAGEN'
      Origin = 'TB_DISCIPLINASERIE.DISSAGEN'
      Size = 8
    end
    object IBQ_DisciplinaSerieAGENNOME: TIBStringField
      DisplayLabel = 'Professor'
      FieldName = 'AGENNOME'
      Origin = 'TB_FUNCIONARIO.AGENNOME'
      Required = True
      Size = 40
    end
  end
  object Dts_DisciplinaSerie: TDataSource
    DataSet = IBQ_DisciplinaSerie
    Left = 152
    Top = 12
  end
  object IBQ_Aluno: TIBQuery
    Database = Dtb_Academico
    Transaction = IBT_Transaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM TB_ALUNO')
    Left = 106
    Top = 62
    object IBQ_AlunoALUNMATR: TIBStringField
      DisplayLabel = 'Matr'#237'cula'
      FieldName = 'ALUNMATR'
      Origin = 'TB_ALUNO.ALUNMATR'
      Required = True
      Size = 10
    end
    object IBQ_AlunoALUNNOME: TIBStringField
      DisplayLabel = 'Aluno'
      FieldName = 'ALUNNOME'
      Origin = 'TB_ALUNO.ALUNNOME'
      Size = 50
    end
    object IBQ_AlunoALUNSEXO: TIBStringField
      FieldName = 'ALUNSEXO'
      Origin = 'TB_ALUNO.ALUNSEXO'
      OnGetText = IBQ_AlunoALUNSEXOGetText
      Size = 1
    end
    object IBQ_AlunoALUNENDE: TIBStringField
      FieldName = 'ALUNENDE'
      Origin = 'TB_ALUNO.ALUNENDE'
      Size = 50
    end
    object IBQ_AlunoALUNBAIR: TIBStringField
      FieldName = 'ALUNBAIR'
      Origin = 'TB_ALUNO.ALUNBAIR'
      Size = 30
    end
    object IBQ_AlunoALUNCIDA: TIBStringField
      FieldName = 'ALUNCIDA'
      Origin = 'TB_ALUNO.ALUNCIDA'
      Size = 30
    end
    object IBQ_AlunoALUNESTA: TIBStringField
      FieldName = 'ALUNESTA'
      Origin = 'TB_ALUNO.ALUNESTA'
      Size = 2
    end
    object IBQ_AlunoALUNFONE: TIBStringField
      DisplayLabel = 'Telefone'
      FieldName = 'ALUNFONE'
      Origin = 'TB_ALUNO.ALUNFONE'
      OnGetText = FONEGetText
      Size = 10
    end
    object IBQ_AlunoALUNNASC: TDateTimeField
      FieldName = 'ALUNNASC'
      Origin = 'TB_ALUNO.ALUNNASC'
      OnGetText = Apagadata
    end
    object IBQ_AlunoALUNCDNS: TIBStringField
      FieldName = 'ALUNCDNS'
      Origin = 'TB_ALUNO.ALUNCDNS'
      Size = 30
    end
    object IBQ_AlunoALUNUFNS: TIBStringField
      FieldName = 'ALUNUFNS'
      Origin = 'TB_ALUNO.ALUNUFNS'
      Size = 2
    end
    object IBQ_AlunoALUNCADA: TDateTimeField
      FieldName = 'ALUNCADA'
      Origin = 'TB_ALUNO.ALUNCADA'
    end
    object IBQ_AlunoALUNCTNM: TIBStringField
      FieldName = 'ALUNCTNM'
      Origin = 'TB_ALUNO.ALUNCTNM'
      Size = 50
    end
    object IBQ_AlunoALUNCTRG: TIBStringField
      FieldName = 'ALUNCTRG'
      Origin = 'TB_ALUNO.ALUNCTRG'
      Size = 15
    end
    object IBQ_AlunoALUNCTLV: TIBStringField
      FieldName = 'ALUNCTLV'
      Origin = 'TB_ALUNO.ALUNCTLV'
      Size = 15
    end
    object IBQ_AlunoALUNCTFL: TIBStringField
      FieldName = 'ALUNCTFL'
      Origin = 'TB_ALUNO.ALUNCTFL'
      Size = 10
    end
    object IBQ_AlunoALUNCTCD: TIBStringField
      FieldName = 'ALUNCTCD'
      Origin = 'TB_ALUNO.ALUNCTCD'
      Size = 30
    end
    object IBQ_AlunoALUNCTUF: TIBStringField
      FieldName = 'ALUNCTUF'
      Origin = 'TB_ALUNO.ALUNCTUF'
      Size = 2
    end
    object IBQ_AlunoALUNCTEM: TDateTimeField
      FieldName = 'ALUNCTEM'
      Origin = 'TB_ALUNO.ALUNCTEM'
      OnGetText = Apagadata
    end
    object IBQ_AlunoALUNFLPA: TIBStringField
      FieldName = 'ALUNFLPA'
      Origin = 'TB_ALUNO.ALUNFLPA'
      Size = 50
    end
    object IBQ_AlunoALUNFLFP: TIBStringField
      DisplayLabel = 'Pai'
      FieldName = 'ALUNFLFP'
      Origin = 'TB_ALUNO.ALUNFLFP'
      OnGetText = FONEGetText
      Size = 10
    end
    object IBQ_AlunoALUNFLTP: TIBStringField
      FieldName = 'ALUNFLTP'
      Origin = 'TB_ALUNO.ALUNFLTP'
      Size = 50
    end
    object IBQ_AlunoALUNFLPF: TIBStringField
      FieldName = 'ALUNFLPF'
      Origin = 'TB_ALUNO.ALUNFLPF'
      OnGetText = FONEGetText
      Size = 10
    end
    object IBQ_AlunoALUNFLPB: TIBStringField
      FieldName = 'ALUNFLPB'
      Origin = 'TB_ALUNO.ALUNFLPB'
      Size = 30
    end
    object IBQ_AlunoALUNFLPC: TIBStringField
      FieldName = 'ALUNFLPC'
      Origin = 'TB_ALUNO.ALUNFLPC'
      Size = 30
    end
    object IBQ_AlunoALUNFLMA: TIBStringField
      DisplayLabel = 'M'#227'e'
      FieldName = 'ALUNFLMA'
      Origin = 'TB_ALUNO.ALUNFLMA'
      Size = 50
    end
    object IBQ_AlunoALUNFLFM: TIBStringField
      FieldName = 'ALUNFLFM'
      Origin = 'TB_ALUNO.ALUNFLFM'
      OnGetText = FONEGetText
      Size = 10
    end
    object IBQ_AlunoALUNFLTM: TIBStringField
      FieldName = 'ALUNFLTM'
      Origin = 'TB_ALUNO.ALUNFLTM'
      Size = 50
    end
    object IBQ_AlunoALUNFLMF: TIBStringField
      FieldName = 'ALUNFLMF'
      Origin = 'TB_ALUNO.ALUNFLMF'
      OnGetText = FONEGetText
      Size = 10
    end
    object IBQ_AlunoALUNFLMB: TIBStringField
      FieldName = 'ALUNFLMB'
      Origin = 'TB_ALUNO.ALUNFLMB'
      Size = 30
    end
    object IBQ_AlunoALUNFLMC: TIBStringField
      FieldName = 'ALUNFLMC'
      Origin = 'TB_ALUNO.ALUNFLMC'
      Size = 30
    end
    object IBQ_AlunoALUN_CEP: TIBStringField
      FieldName = 'ALUN_CEP'
      Origin = 'TB_ALUNO.ALUN_CEP'
      Size = 8
    end
    object IBQ_AlunoALUNNOM1: TIBStringField
      FieldName = 'ALUNNOM1'
      Origin = 'TB_ALUNO.ALUNNOM1'
      Size = 50
    end
    object IBQ_AlunoALUNNOM2: TIBStringField
      FieldName = 'ALUNNOM2'
      Origin = 'TB_ALUNO.ALUNNOM2'
      Size = 50
    end
    object IBQ_AlunoALUNFON2: TIBStringField
      FieldName = 'ALUNFON2'
      Origin = 'TB_ALUNO.ALUNFON2'
      OnGetText = FONEGetText
      Size = 50
    end
    object IBQ_AlunoALUNFON1: TIBStringField
      FieldName = 'ALUNFON1'
      Origin = 'TB_ALUNO.ALUNFON1'
      OnGetText = FONEGetText
      Size = 50
    end
    object IBQ_AlunoALUNPBSD: TMemoField
      FieldName = 'ALUNPBSD'
      Origin = 'TB_ALUNO.ALUNPBSD'
      BlobType = ftMemo
      Size = 8
    end
    object IBQ_AlunoALUNALER: TMemoField
      FieldName = 'ALUNALER'
      Origin = 'TB_ALUNO.ALUNALER'
      BlobType = ftMemo
      Size = 8
    end
    object IBQ_AlunoALUNMEDI: TMemoField
      FieldName = 'ALUNMEDI'
      Origin = 'TB_ALUNO.ALUNMEDI'
      BlobType = ftMemo
      Size = 8
    end
    object IBQ_AlunoALUNCIRU: TMemoField
      FieldName = 'ALUNCIRU'
      Origin = 'TB_ALUNO.ALUNCIRU'
      BlobType = ftMemo
      Size = 8
    end
    object IBQ_AlunoALUNPLSD: TIBStringField
      FieldName = 'ALUNPLSD'
      Origin = 'TB_ALUNO.ALUNPLSD'
      Size = 50
    end
    object IBQ_AlunoALUNTPSG: TIBStringField
      FieldName = 'ALUNTPSG'
      Origin = 'TB_ALUNO.ALUNTPSG'
      Size = 5
    end
    object IBQ_AlunoALUNFOTO: TBlobField
      FieldName = 'ALUNFOTO'
      Origin = 'TB_ALUNO.ALUNFOTO'
      Size = 8
    end
    object IBQ_AlunoALUNDINS: TIBStringField
      FieldName = 'ALUNDINS'
      Origin = 'TB_ALUNO.ALUNDINS'
      Size = 2
    end
    object IBQ_AlunoALUNFLPP: TIBStringField
      FieldName = 'ALUNFLPP'
      Origin = 'TB_ALUNO.ALUNFLPP'
      Size = 40
    end
    object IBQ_AlunoALUNFLMP: TIBStringField
      FieldName = 'ALUNFLMP'
      Origin = 'TB_ALUNO.ALUNFLMP'
      Size = 40
    end
    object IBQ_AlunoALUNINAT: TIBStringField
      FieldName = 'ALUNINAT'
      Origin = 'TB_ALUNO.ALUNINAT'
      Size = 1
    end
    object IBQ_AlunoALUNDTIN: TDateTimeField
      FieldName = 'ALUNDTIN'
      Origin = 'TB_ALUNO.ALUNDTIN'
      OnGetText = Apagadata
    end
  end
  object IBQ_Matricula: TIBQuery
    Database = Dtb_Academico
    Transaction = IBT_Transaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT MAT.*,ALU.ALUNNOME,SER.SERITURN,SER.SERIDESC,TRN.TURNDESC' +
        ','
      'AGE.AGENNOME ,DIS.DISCDESC,ALU.ALUNINAT'
      
        'FROM TB_MATRICULA MAT, TB_ALUNO ALU, TB_SERIE SER, TB_TURNO TRN,' +
        'TB_FUNCIONARIO AGE, TB_DISCIPLINA DIS'
      
        'WHERE MAT.MATRALUN=ALU.ALUNMATR AND MAT.MATRSERI=SER.SERICODG AN' +
        'D SER.SERITURN=TRN.TURNCODG'
      'AND MAT.MATRAGEN=AGE.AGENCODG AND MAT.MATRDISC=DIS.DISCCODG ')
    Left = 104
    Top = 110
    object IBQ_MatriculaMATR_ANO: TIBStringField
      DisplayLabel = 'Ano'
      FieldName = 'MATR_ANO'
      Origin = 'TB_MATRICULA.MATR_ANO'
      Required = True
      Size = 4
    end
    object IBQ_MatriculaMATRALUN: TIBStringField
      DisplayLabel = 'Matr'#237'cula'
      FieldName = 'MATRALUN'
      Origin = 'TB_MATRICULA.MATRALUN'
      Required = True
      Size = 10
    end
    object IBQ_MatriculaALUNNOME: TIBStringField
      DisplayLabel = 'Aluno'
      FieldName = 'ALUNNOME'
      Origin = 'TB_ALUNO.ALUNNOME'
      Size = 50
    end
    object IBQ_MatriculaMATRDISC: TIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'MATRDISC'
      Origin = 'TB_MATRICULA.MATRDISC'
      Required = True
      Size = 10
    end
    object IBQ_MatriculaDISCDESC: TIBStringField
      DisplayLabel = 'Disciplina'
      FieldName = 'DISCDESC'
      Origin = 'TB_DISCIPLINA.DISCDESC'
      Required = True
      Size = 40
    end
    object IBQ_MatriculaMATRSERI: TIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'MATRSERI'
      Origin = 'TB_MATRICULA.MATRSERI'
      Size = 10
    end
    object IBQ_MatriculaSERIDESC: TIBStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIDESC'
      Origin = 'TB_SERIE.SERIDESC'
      Size = 40
    end
    object IBQ_MatriculaTURNDESC: TIBStringField
      DisplayLabel = 'Turno'
      FieldName = 'TURNDESC'
      Origin = 'TB_TURNO.TURNDESC'
      Required = True
      Size = 10
    end
    object IBQ_MatriculaMATRAGEN: TIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'MATRAGEN'
      Origin = 'TB_MATRICULA.MATRAGEN'
      Size = 8
    end
    object IBQ_MatriculaAGENNOME: TIBStringField
      DisplayLabel = 'Professor'
      FieldName = 'AGENNOME'
      Origin = 'TB_FUNCIONARIO.AGENNOME'
      Required = True
      Size = 40
    end
    object IBQ_MatriculaMATR1BFT: TIntegerField
      DisplayLabel = '1o.B - Faltas'
      FieldName = 'MATR1BFT'
      Origin = 'TB_MATRICULA.MATR1BFT'
    end
    object IBQ_MatriculaMATR1BAU: TFloatField
      DisplayLabel = '1o.B - AU'
      FieldName = 'MATR1BAU'
      Origin = 'TB_MATRICULA.MATR1BAU'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_MatriculaMATR1BTB: TFloatField
      DisplayLabel = '1o.B - TB'
      FieldName = 'MATR1BTB'
      Origin = 'TB_MATRICULA.MATR1BTB'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_MatriculaMATR1BPB: TFloatField
      DisplayLabel = '1o.B - PB'
      FieldName = 'MATR1BPB'
      Origin = 'TB_MATRICULA.MATR1BPB'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_MatriculaMATR1BMD: TFloatField
      DisplayLabel = '1o.B - M'
      FieldName = 'MATR1BMD'
      Origin = 'TB_MATRICULA.MATR1BMD'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_MatriculaMATR2BFT: TIntegerField
      DisplayLabel = '2o.B - Faltas'
      FieldName = 'MATR2BFT'
      Origin = 'TB_MATRICULA.MATR2BFT'
    end
    object IBQ_MatriculaMATR2BAU: TFloatField
      DisplayLabel = '2o.B - AU'
      FieldName = 'MATR2BAU'
      Origin = 'TB_MATRICULA.MATR2BAU'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_MatriculaMATR2BTB: TFloatField
      DisplayLabel = '2o.B - TB'
      FieldName = 'MATR2BTB'
      Origin = 'TB_MATRICULA.MATR2BTB'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_MatriculaMATR2BPB: TFloatField
      DisplayLabel = '2o.B - PB'
      FieldName = 'MATR2BPB'
      Origin = 'TB_MATRICULA.MATR2BPB'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_MatriculaMATR2BMD: TFloatField
      DisplayLabel = '2o.B - M'
      FieldName = 'MATR2BMD'
      Origin = 'TB_MATRICULA.MATR2BMD'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_MatriculaMATR3BFT: TIntegerField
      DisplayLabel = '3o.B - Faltas'
      FieldName = 'MATR3BFT'
      Origin = 'TB_MATRICULA.MATR3BFT'
    end
    object IBQ_MatriculaMATR3BAU: TFloatField
      DisplayLabel = '3o.B - AU'
      FieldName = 'MATR3BAU'
      Origin = 'TB_MATRICULA.MATR3BAU'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_MatriculaMATR3BTB: TFloatField
      DisplayLabel = '3o.B - TB'
      FieldName = 'MATR3BTB'
      Origin = 'TB_MATRICULA.MATR3BTB'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_MatriculaMATR3BPB: TFloatField
      DisplayLabel = '3o.B - PB'
      FieldName = 'MATR3BPB'
      Origin = 'TB_MATRICULA.MATR3BPB'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_MatriculaMATR3BMD: TFloatField
      DisplayLabel = '3o.B - M'
      FieldName = 'MATR3BMD'
      Origin = 'TB_MATRICULA.MATR3BMD'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_MatriculaMATR4BFT: TIntegerField
      DisplayLabel = '4o.B - Faltas'
      FieldName = 'MATR4BFT'
      Origin = 'TB_MATRICULA.MATR4BFT'
    end
    object IBQ_MatriculaMATR4BAU: TFloatField
      DisplayLabel = '4o.B - AU'
      FieldName = 'MATR4BAU'
      Origin = 'TB_MATRICULA.MATR4BAU'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_MatriculaMATR4BTB: TFloatField
      DisplayLabel = '4o.B - TB'
      FieldName = 'MATR4BTB'
      Origin = 'TB_MATRICULA.MATR4BTB'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_MatriculaMATR4BPB: TFloatField
      DisplayLabel = '4o.B - PB'
      FieldName = 'MATR4BPB'
      Origin = 'TB_MATRICULA.MATR4BPB'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_MatriculaMATR4BMD: TFloatField
      DisplayLabel = '4o.B - M'
      FieldName = 'MATR4BMD'
      Origin = 'TB_MATRICULA.MATR4BMD'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_MatriculaMATRMDAN: TFloatField
      DisplayLabel = 'M'#233'dia Anual'
      FieldName = 'MATRMDAN'
      Origin = 'TB_MATRICULA.MATRMDAN'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_MatriculaMATRRSFN: TIBStringField
      DisplayLabel = 'Resultado'
      FieldName = 'MATRRSFN'
      Origin = 'TB_MATRICULA.MATRRSFN'
      OnGetText = IBQ_MatriculaMATRRSFNGetText
      Size = 1
    end
    object IBQ_MatriculaMATROBSV: TMemoField
      FieldName = 'MATROBSV'
      Origin = 'TB_MATRICULA.MATROBSV'
      BlobType = ftMemo
      Size = 8
    end
    object IBQ_MatriculaSERITURN: TIBStringField
      FieldName = 'SERITURN'
      Origin = 'TB_SERIE.SERITURN'
      Size = 1
    end
    object IBQ_MatriculaALUNINAT: TIBStringField
      FieldName = 'ALUNINAT'
      Origin = 'TB_ALUNO.ALUNINAT'
      Size = 1
    end
  end
  object Dts_Matricula: TDataSource
    DataSet = IBQ_Matricula
    Left = 160
    Top = 110
  end
  object Dts_Aluno: TDataSource
    DataSet = IBQ_Aluno
    Left = 158
    Top = 64
  end
  object IBQ_TmpAtaFinal: TIBQuery
    Database = Dtb_Academico
    Transaction = IBT_Transaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select TMP.*,AL.ALUNNOME  from TB_TMPATAFINAL TMP'
      'LEFT OUTER JOIN TB_ALUNO AL ON TMP.ATFNALUN=AL.ALUNMATR'
      'ORDER BY AL.ALUNNOME')
    Left = 24
    Top = 164
    object IBQ_TmpAtaFinalATFNALUN: TIBStringField
      FieldName = 'ATFNALUN'
      Origin = 'TB_TMPATAFINAL.ATFNALUN'
      Required = True
      Size = 10
    end
    object IBQ_TmpAtaFinalATFN0001: TFloatField
      FieldName = 'ATFN0001'
      Origin = 'TB_TMPATAFINAL.ATFN0001'
      DisplayFormat = ',0.0'
      EditFormat = ',0.0'
    end
    object IBQ_TmpAtaFinalATFN0002: TFloatField
      FieldName = 'ATFN0002'
      Origin = 'TB_TMPATAFINAL.ATFN0002'
      DisplayFormat = ',0.0'
      EditFormat = ',0.0'
    end
    object IBQ_TmpAtaFinalATFN0003: TFloatField
      FieldName = 'ATFN0003'
      Origin = 'TB_TMPATAFINAL.ATFN0003'
      DisplayFormat = ',0.0'
      EditFormat = ',0.0'
    end
    object IBQ_TmpAtaFinalATFN0004: TFloatField
      FieldName = 'ATFN0004'
      Origin = 'TB_TMPATAFINAL.ATFN0004'
      DisplayFormat = ',0.0'
      EditFormat = ',0.0'
    end
    object IBQ_TmpAtaFinalATFN0005: TFloatField
      FieldName = 'ATFN0005'
      Origin = 'TB_TMPATAFINAL.ATFN0005'
      DisplayFormat = ',0.0'
      EditFormat = ',0.0'
    end
    object IBQ_TmpAtaFinalATFN0006: TFloatField
      FieldName = 'ATFN0006'
      Origin = 'TB_TMPATAFINAL.ATFN0006'
      DisplayFormat = ',0.0'
      EditFormat = ',0.0'
    end
    object IBQ_TmpAtaFinalATFN0007: TFloatField
      FieldName = 'ATFN0007'
      Origin = 'TB_TMPATAFINAL.ATFN0007'
      DisplayFormat = ',0.0'
      EditFormat = ',0.0'
    end
    object IBQ_TmpAtaFinalATFN0008: TFloatField
      FieldName = 'ATFN0008'
      Origin = 'TB_TMPATAFINAL.ATFN0008'
      DisplayFormat = ',0.0'
      EditFormat = ',0.0'
    end
    object IBQ_TmpAtaFinalATFN0009: TFloatField
      FieldName = 'ATFN0009'
      Origin = 'TB_TMPATAFINAL.ATFN0009'
      DisplayFormat = ',0.0'
      EditFormat = ',0.0'
    end
    object IBQ_TmpAtaFinalATFNMFIM: TFloatField
      FieldName = 'ATFNMFIM'
      Origin = 'TB_TMPATAFINAL.ATFNMFIM'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_TmpAtaFinalALUNNOME: TIBStringField
      FieldName = 'ALUNNOME'
      Origin = 'TB_ALUNO.ALUNNOME'
      Size = 50
    end
    object IBQ_TmpAtaFinalATFNRSFN: TIBStringField
      FieldName = 'ATFNRSFN'
      Origin = 'TB_TMPATAFINAL.ATFNRSFN'
      OnGetText = IBQ_MatriculaMATRRSFNGetText
      Size = 1
    end
  end
  object IBQ_Mensalidade: TIBQuery
    Database = Dtb_Academico
    Transaction = IBT_Transaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT M.*,A.ALUNNOME FROM TB_MENSALIDADE M, TB_ALUNO A'
      'WHERE M.MENSALUN=A.ALUNMATR AND M.MENSPAGO='#39'N'#39
      'AND M.MENSDTVC < '#39'05/05/2004'#39
      'ORDER BY M.MENSALUN,M.MENSDTVC')
    Left = 102
    Top = 160
    object IBQ_MensalidadeMENS_ANO: TIBStringField
      DisplayLabel = 'Ano'
      FieldName = 'MENS_ANO'
      Origin = 'TB_MENSALIDADE.MENS_ANO'
      Required = True
      Size = 4
    end
    object IBQ_MensalidadeMENS_MES: TIBStringField
      DisplayLabel = 'M'#234's'
      FieldName = 'MENS_MES'
      Origin = 'TB_MENSALIDADE.MENS_MES'
      Required = True
      Size = 2
    end
    object IBQ_MensalidadeMENSALUN: TIBStringField
      DisplayLabel = 'Matr'#237'cula'
      FieldName = 'MENSALUN'
      Origin = 'TB_MENSALIDADE.MENSALUN'
      Required = True
      Size = 10
    end
    object IBQ_MensalidadeALUNNOME: TIBStringField
      DisplayLabel = 'Aluno'
      FieldName = 'ALUNNOME'
      Origin = 'TB_ALUNO.ALUNNOME'
      Size = 50
    end
    object IBQ_MensalidadeMENSDTVC: TDateTimeField
      DisplayLabel = 'Vencimento'
      FieldName = 'MENSDTVC'
      Origin = 'TB_MENSALIDADE.MENSDTVC'
      OnGetText = Apagadata
    end
    object IBQ_MensalidadeMENSDTPG: TDateTimeField
      DisplayLabel = 'Pagamento'
      FieldName = 'MENSDTPG'
      Origin = 'TB_MENSALIDADE.MENSDTPG'
      OnGetText = Apagadata
    end
    object IBQ_MensalidadeMENSVLPG: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'MENSVLPG'
      Origin = 'TB_MENSALIDADE.MENSVLPG'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_MensalidadeMENSPAGO: TIBStringField
      DisplayLabel = 'Pago'
      FieldName = 'MENSPAGO'
      Origin = 'TB_MENSALIDADE.MENSPAGO'
      Size = 1
    end
  end
  object Dts_Mensalidade: TDataSource
    DataSet = IBQ_Mensalidade
    Left = 158
    Top = 160
  end
  object IBQ_Boleto: TIBQuery
    Database = Dtb_Academico
    Transaction = IBT_Transaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT DISTINCT M.*,A.ALUNNOME,T.MATRSERI,S.SERIDESC,'
      'A.ALUNMATR FROM TB_MENSALIDADE M, TB_ALUNO A, '
      'TB_MATRICULA T, TB_SERIE S'
      
        'WHERE M.MENSALUN=A.ALUNMATR AND M.MENSALUN=T.MATRALUN AND T.MATR' +
        'SERI=S.SERICODG')
    Left = 24
    Top = 224
    object IBQ_BoletoMENS_ANO: TIBStringField
      FieldName = 'MENS_ANO'
      Origin = 'TB_MENSALIDADE.MENS_ANO'
      Required = True
      Size = 4
    end
    object IBQ_BoletoMENS_MES: TIBStringField
      FieldName = 'MENS_MES'
      Origin = 'TB_MENSALIDADE.MENS_MES'
      Required = True
      Size = 2
    end
    object IBQ_BoletoMENSALUN: TIBStringField
      FieldName = 'MENSALUN'
      Origin = 'TB_MENSALIDADE.MENSALUN'
      Required = True
      Size = 10
    end
    object IBQ_BoletoMENSDTPG: TDateTimeField
      FieldName = 'MENSDTPG'
      Origin = 'TB_MENSALIDADE.MENSDTPG'
      OnGetText = Apagadata
    end
    object IBQ_BoletoMENSVLPG: TFloatField
      FieldName = 'MENSVLPG'
      Origin = 'TB_MENSALIDADE.MENSVLPG'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_BoletoMENSPAGO: TIBStringField
      FieldName = 'MENSPAGO'
      Origin = 'TB_MENSALIDADE.MENSPAGO'
      Size = 1
    end
    object IBQ_BoletoMENSDTVC: TDateTimeField
      FieldName = 'MENSDTVC'
      Origin = 'TB_MENSALIDADE.MENSDTVC'
      OnGetText = Apagadata
    end
    object IBQ_BoletoALUNNOME: TIBStringField
      FieldName = 'ALUNNOME'
      Origin = 'TB_ALUNO.ALUNNOME'
      Size = 50
    end
    object IBQ_BoletoMATRSERI: TIBStringField
      FieldName = 'MATRSERI'
      Origin = 'TB_MATRICULA.MATRSERI'
      Required = True
      Size = 10
    end
    object IBQ_BoletoSERIDESC: TIBStringField
      FieldName = 'SERIDESC'
      Origin = 'TB_SERIE.SERIDESC'
      Size = 40
    end
    object IBQ_BoletoALUNMATR: TIBStringField
      FieldName = 'ALUNMATR'
      Origin = 'TB_ALUNO.ALUNMATR'
      Required = True
      Size = 10
    end
  end
  object IBQ_Boletim: TIBQuery
    Database = Dtb_Academico
    Transaction = IBT_Transaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT MAT.*,ALU.ALUNNOME,SER.SERITURN,SER.SERIDESC,TRN.TURNDESC' +
        ',DIS.DISCDESC,NIV.NIVEDESC'
      
        'FROM TB_MATRICULA MAT, TB_ALUNO ALU, TB_SERIE SER, TB_TURNO TRN,' +
        ' TB_DISCIPLINA DIS, TB_NIVELESCOLAR NIV'
      'WHERE MAT.MATRALUN=ALU.ALUNMATR AND MAT.MATRSERI=SER.SERICODG '
      'AND SER.SERITURN=TRN.TURNCODG  AND MAT.MATRDISC=DIS.DISCCODG'
      'AND SER.SERINIVE=NIV.NIVECODG'
      '')
    Left = 98
    Top = 224
    object IBQ_BoletimMATR_ANO: TIBStringField
      FieldName = 'MATR_ANO'
      Origin = 'TB_MATRICULA.MATR_ANO'
      Required = True
      Size = 4
    end
    object IBQ_BoletimMATRSERI: TIBStringField
      FieldName = 'MATRSERI'
      Origin = 'TB_MATRICULA.MATRSERI'
      Required = True
      Size = 10
    end
    object IBQ_BoletimMATRALUN: TIBStringField
      FieldName = 'MATRALUN'
      Origin = 'TB_MATRICULA.MATRALUN'
      Required = True
      Size = 10
    end
    object IBQ_BoletimMATRDISC: TIBStringField
      FieldName = 'MATRDISC'
      Origin = 'TB_MATRICULA.MATRDISC'
      Required = True
      Size = 10
    end
    object IBQ_BoletimMATR1BFT: TIntegerField
      FieldName = 'MATR1BFT'
      Origin = 'TB_MATRICULA.MATR1BFT'
    end
    object IBQ_BoletimMATR1BAU: TFloatField
      FieldName = 'MATR1BAU'
      Origin = 'TB_MATRICULA.MATR1BAU'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_BoletimMATR1BTB: TFloatField
      FieldName = 'MATR1BTB'
      Origin = 'TB_MATRICULA.MATR1BTB'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_BoletimMATR1BPB: TFloatField
      FieldName = 'MATR1BPB'
      Origin = 'TB_MATRICULA.MATR1BPB'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_BoletimMATR1BMD: TFloatField
      FieldName = 'MATR1BMD'
      Origin = 'TB_MATRICULA.MATR1BMD'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_BoletimMATR2BFT: TIntegerField
      FieldName = 'MATR2BFT'
      Origin = 'TB_MATRICULA.MATR2BFT'
    end
    object IBQ_BoletimMATR2BAU: TFloatField
      FieldName = 'MATR2BAU'
      Origin = 'TB_MATRICULA.MATR2BAU'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_BoletimMATR2BTB: TFloatField
      FieldName = 'MATR2BTB'
      Origin = 'TB_MATRICULA.MATR2BTB'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_BoletimMATR2BPB: TFloatField
      FieldName = 'MATR2BPB'
      Origin = 'TB_MATRICULA.MATR2BPB'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_BoletimMATR2BMD: TFloatField
      FieldName = 'MATR2BMD'
      Origin = 'TB_MATRICULA.MATR2BMD'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_BoletimMATR3BFT: TIntegerField
      FieldName = 'MATR3BFT'
      Origin = 'TB_MATRICULA.MATR3BFT'
    end
    object IBQ_BoletimMATR3BAU: TFloatField
      FieldName = 'MATR3BAU'
      Origin = 'TB_MATRICULA.MATR3BAU'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_BoletimMATR3BTB: TFloatField
      FieldName = 'MATR3BTB'
      Origin = 'TB_MATRICULA.MATR3BTB'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_BoletimMATR3BPB: TFloatField
      FieldName = 'MATR3BPB'
      Origin = 'TB_MATRICULA.MATR3BPB'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_BoletimMATR3BMD: TFloatField
      FieldName = 'MATR3BMD'
      Origin = 'TB_MATRICULA.MATR3BMD'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_BoletimMATR4BFT: TIntegerField
      FieldName = 'MATR4BFT'
      Origin = 'TB_MATRICULA.MATR4BFT'
    end
    object IBQ_BoletimMATR4BAU: TFloatField
      FieldName = 'MATR4BAU'
      Origin = 'TB_MATRICULA.MATR4BAU'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_BoletimMATR4BTB: TFloatField
      FieldName = 'MATR4BTB'
      Origin = 'TB_MATRICULA.MATR4BTB'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_BoletimMATR4BPB: TFloatField
      FieldName = 'MATR4BPB'
      Origin = 'TB_MATRICULA.MATR4BPB'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_BoletimMATR4BMD: TFloatField
      FieldName = 'MATR4BMD'
      Origin = 'TB_MATRICULA.MATR4BMD'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_BoletimMATRMDAN: TFloatField
      FieldName = 'MATRMDAN'
      Origin = 'TB_MATRICULA.MATRMDAN'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBQ_BoletimMATROBSV: TMemoField
      FieldName = 'MATROBSV'
      Origin = 'TB_MATRICULA.MATROBSV'
      BlobType = ftMemo
      Size = 8
    end
    object IBQ_BoletimMATRAGEN: TIBStringField
      FieldName = 'MATRAGEN'
      Origin = 'TB_MATRICULA.MATRAGEN'
      Size = 8
    end
    object IBQ_BoletimMATRRSFN: TIBStringField
      FieldName = 'MATRRSFN'
      Origin = 'TB_MATRICULA.MATRRSFN'
      Size = 1
    end
    object IBQ_BoletimALUNNOME: TIBStringField
      FieldName = 'ALUNNOME'
      Origin = 'TB_ALUNO.ALUNNOME'
      Size = 50
    end
    object IBQ_BoletimSERITURN: TIBStringField
      FieldName = 'SERITURN'
      Origin = 'TB_SERIE.SERITURN'
      Size = 1
    end
    object IBQ_BoletimSERIDESC: TIBStringField
      FieldName = 'SERIDESC'
      Origin = 'TB_SERIE.SERIDESC'
      Size = 40
    end
    object IBQ_BoletimTURNDESC: TIBStringField
      FieldName = 'TURNDESC'
      Origin = 'TB_TURNO.TURNDESC'
      Required = True
      Size = 10
    end
    object IBQ_BoletimDISCDESC: TIBStringField
      FieldName = 'DISCDESC'
      Origin = 'TB_DISCIPLINA.DISCDESC'
      Required = True
      Size = 40
    end
    object IBQ_BoletimNIVEDESC: TIBStringField
      FieldName = 'NIVEDESC'
      Origin = 'TB_NIVELESCOLAR.NIVEDESC'
      Required = True
      Size = 40
    end
  end
  object IBQ_MatrConceito: TIBQuery
    Database = Dtb_Academico
    Transaction = IBT_Transaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT MAT.*,ALU.ALUNNOME,SER.SERITURN,SER.SERIDESC,TRN.TURNDESC' +
        ','
      'AGE.AGENNOME ,DIS.DISCDESC,ALU.ALUNINAT'
      
        'FROM TB_MATRCONCEITO MAT, TB_ALUNO ALU, TB_SERIE SER, TB_TURNO T' +
        'RN,TB_FUNCIONARIO AGE, TB_DISCIPLINA DIS'
      
        'WHERE MAT.MATRALUN=ALU.ALUNMATR AND MAT.MATRSERI=SER.SERICODG AN' +
        'D SER.SERITURN=TRN.TURNCODG'
      'AND MAT.MATRAGEN=AGE.AGENCODG AND MAT.MATRDISC=DIS.DISCCODG ')
    Left = 168
    Top = 222
    object IBQ_MatrConceitoMATR_ANO: TIBStringField
      DisplayLabel = 'Ano'
      FieldName = 'MATR_ANO'
      Origin = 'TB_MATRCONCEITO.MATR_ANO'
      Required = True
      Size = 4
    end
    object IBQ_MatrConceitoMATRSERI: TIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'MATRSERI'
      Origin = 'TB_MATRCONCEITO.MATRSERI'
      Required = True
      Size = 10
    end
    object IBQ_MatrConceitoSERIDESC: TIBStringField
      DisplayLabel = 'S'#233'ries'
      FieldName = 'SERIDESC'
      Origin = 'TB_SERIE.SERIDESC'
      Size = 40
    end
    object IBQ_MatrConceitoMATRALUN: TIBStringField
      DisplayLabel = 'Matr'#237'cula'
      FieldName = 'MATRALUN'
      Origin = 'TB_MATRCONCEITO.MATRALUN'
      Required = True
      Size = 10
    end
    object IBQ_MatrConceitoALUNNOME: TIBStringField
      DisplayLabel = 'Aluno'
      FieldName = 'ALUNNOME'
      Origin = 'TB_ALUNO.ALUNNOME'
      Size = 50
    end
    object IBQ_MatrConceitoMATRDISC: TIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'MATRDISC'
      Origin = 'TB_MATRCONCEITO.MATRDISC'
      Required = True
      Size = 10
    end
    object IBQ_MatrConceitoDISCDESC: TIBStringField
      DisplayLabel = 'Disciplina'
      FieldName = 'DISCDESC'
      Origin = 'TB_DISCIPLINA.DISCDESC'
      Required = True
      Size = 40
    end
    object IBQ_MatrConceitoMATR1BCT: TIBStringField
      DisplayLabel = '1o.B'
      FieldName = 'MATR1BCT'
      Origin = 'TB_MATRCONCEITO.MATR1BCT'
      Size = 1
    end
    object IBQ_MatrConceitoMATR2BCT: TIBStringField
      DisplayLabel = '2o.B'
      FieldName = 'MATR2BCT'
      Origin = 'TB_MATRCONCEITO.MATR2BCT'
      Size = 1
    end
    object IBQ_MatrConceitoMATR3BCT: TIBStringField
      DisplayLabel = '3o.B'
      FieldName = 'MATR3BCT'
      Origin = 'TB_MATRCONCEITO.MATR3BCT'
      Size = 1
    end
    object IBQ_MatrConceitoMATR4BCT: TIBStringField
      DisplayLabel = '4o.B'
      FieldName = 'MATR4BCT'
      Origin = 'TB_MATRCONCEITO.MATR4BCT'
      Size = 1
    end
    object IBQ_MatrConceitoMATROBSV: TMemoField
      FieldName = 'MATROBSV'
      Origin = 'TB_MATRCONCEITO.MATROBSV'
      BlobType = ftMemo
      Size = 8
    end
    object IBQ_MatrConceitoTURNDESC: TIBStringField
      DisplayLabel = 'Turno'
      FieldName = 'TURNDESC'
      Origin = 'TB_TURNO.TURNDESC'
      Required = True
      Size = 10
    end
    object IBQ_MatrConceitoMATRAGEN: TIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'MATRAGEN'
      Origin = 'TB_MATRCONCEITO.MATRAGEN'
      Size = 8
    end
    object IBQ_MatrConceitoAGENNOME: TIBStringField
      DisplayLabel = 'Professor'
      FieldName = 'AGENNOME'
      Origin = 'TB_FUNCIONARIO.AGENNOME'
      Required = True
      Size = 40
    end
    object IBQ_MatrConceitoSERITURN: TIBStringField
      FieldName = 'SERITURN'
      Origin = 'TB_SERIE.SERITURN'
      Size = 1
    end
    object IBQ_MatrConceitoALUNINAT: TIBStringField
      FieldName = 'ALUNINAT'
      Origin = 'TB_ALUNO.ALUNINAT'
      Size = 1
    end
  end
  object Dts_MatrConceito: TDataSource
    DataSet = IBQ_MatrConceito
    Left = 224
    Top = 222
  end
  object IBQ_MatrTabConceito: TIBQuery
    Database = Dtb_Academico
    Transaction = IBT_Transaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT MT.*,C.CONCDESC FROM TB_MATRTABCONCEITO MT, TB_CONCEITO C'
      'WHERE MT.MATRCONC=C.CONCCODG AND'
      
        'MT.MATR_ANO=:WMATR_ANO AND MT.MATRSERI=:WMATRSERI AND MT.MATRALU' +
        'N=:WMATRALUN'
      'ORDER BY MT.MATRCONC')
    Left = 232
    Top = 172
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WMATR_ANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WMATRSERI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WMATRALUN'
        ParamType = ptUnknown
      end>
    object IBQ_MatrTabConceitoMATR_ANO: TIBStringField
      FieldName = 'MATR_ANO'
      Origin = 'TB_MATRTABCONCEITO.MATR_ANO'
      Required = True
      Size = 4
    end
    object IBQ_MatrTabConceitoMATRSERI: TIBStringField
      FieldName = 'MATRSERI'
      Origin = 'TB_MATRTABCONCEITO.MATRSERI'
      Required = True
      Size = 10
    end
    object IBQ_MatrTabConceitoMATRALUN: TIBStringField
      FieldName = 'MATRALUN'
      Origin = 'TB_MATRTABCONCEITO.MATRALUN'
      Required = True
      Size = 10
    end
    object IBQ_MatrTabConceitoMATRCONC: TIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'MATRCONC'
      Origin = 'TB_MATRTABCONCEITO.MATRCONC'
      Required = True
      Size = 2
    end
    object IBQ_MatrTabConceitoCONCDESC: TIBStringField
      DisplayLabel = 'Conceito'
      FieldName = 'CONCDESC'
      Origin = 'TB_CONCEITO.CONCDESC'
      Required = True
      Size = 50
    end
    object IBQ_MatrTabConceitoMATR1BNT: TIBStringField
      DisplayLabel = '1o B.'
      FieldName = 'MATR1BNT'
      Origin = 'TB_MATRTABCONCEITO.MATR1BNT'
      Size = 1
    end
    object IBQ_MatrTabConceitoMATR2BNT: TIBStringField
      DisplayLabel = '2o B.'
      FieldName = 'MATR2BNT'
      Origin = 'TB_MATRTABCONCEITO.MATR2BNT'
      Size = 1
    end
    object IBQ_MatrTabConceitoMATR3BNT: TIBStringField
      DisplayLabel = '3o B.'
      FieldName = 'MATR3BNT'
      Origin = 'TB_MATRTABCONCEITO.MATR3BNT'
      Size = 1
    end
    object IBQ_MatrTabConceitoMATR4BNT: TIBStringField
      DisplayLabel = '4o B.'
      FieldName = 'MATR4BNT'
      Origin = 'TB_MATRTABCONCEITO.MATR4BNT'
      Size = 1
    end
  end
  object Dts_MatrTabConceito: TDataSource
    DataSet = IBQ_MatrTabConceito
    Left = 278
    Top = 174
  end
end
