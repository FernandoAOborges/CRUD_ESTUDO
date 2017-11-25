object DMConexao: TDMConexao
  OldCreateOrder = False
  Height = 326
  Width = 466
  object FDConnection1: TFDConnection
    LoginPrompt = False
    Left = 16
    Top = 16
  end
  object FDQuery1: TFDQuery
    FilterOptions = [foCaseInsensitive]
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT C.cod_cliente as CODIGO,'
      '       C.cod_cidade AS CODIGO_CIDADE,'
      '       C.nome AS NOME,'
      '       C.datainicial AS DATA,'
      '       CI.nom_cidade AS NOME_CIDADE,'
      '       CI.cod_estado AS CODIGO_ESTADO,'
      '       ES.nom_estado AS NOME_ESTADO FROM CLIENTE C'
      '         INNER JOIN cidade CI ON C.cod_cidade = CI.cod_cidade'
      '         INNER JOIN ESTADO ES ON ES.cod_estado = CI.cod_estado'
      '         WHERE C.nome = :CLIENTE'
      '         order by C.cod_cliente desc')
    Left = 56
    Top = 16
    ParamData = <
      item
        Name = 'CLIENTE'
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 40
    Top = 80
  end
  object FDPhysOracleDriverLink1: TFDPhysOracleDriverLink
    Left = 40
    Top = 176
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 120
    Top = 152
  end
  object CidadeTable: TFDQuery
    MasterSource = dsEstado
    MasterFields = 'COD_ESTADO'
    DetailFields = 'NOM_CIDADE'
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT * FROM CIDADE ci where ci.cod_estado = :cod_estado')
    Left = 384
    Top = 20
    ParamData = <
      item
        Name = 'COD_ESTADO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = 2
      end>
  end
  object dscidade: TDataSource
    DataSet = CidadeTable
    Left = 384
    Top = 64
  end
  object EstadoTable: TFDQuery
    MasterFields = 'COD_CIDADE_1'
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM ESTADO')
    Left = 323
    Top = 17
  end
  object dsEstado: TDataSource
    DataSet = EstadoTable
    Left = 320
    Top = 64
  end
  object GrupoTable: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select ID_GRUPO, NOME_GRUPO from GRUPO')
    Left = 381
    Top = 132
  end
  object dsGrupo: TDataSource
    DataSet = GrupoTable
    Left = 328
    Top = 136
  end
end
