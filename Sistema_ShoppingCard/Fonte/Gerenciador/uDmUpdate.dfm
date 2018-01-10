object dmUpdate: TdmUpdate
  OldCreateOrder = False
  Left = 617
  Top = 145
  Height = 291
  Width = 413
  object sqlReativaCartao: TSQLDataSet
    CommandText = 'TB_CARTAO_REATIVACAO'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CPF'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TIPO'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 320
    Top = 8
  end
  object sqlLojasShoppingUpd: TSQLDataSet
    CommandText = 'TB_LOJAS_SHOPPING_UPD'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CNPJ'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RAZAO_SOCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME_FANTASIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONTATO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TELEFONE_01'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TELEFONE_02'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RAMAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CELULAR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMAIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMERO_LOJA'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 43
    Top = 70
  end
  object sqlProdutoPromocaoUpd: TSQLDataSet
    CommandText = 'TB_PRODUTO_PROMOCAO_UPD'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESC_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QTDE_PONTOS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'QTDE_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ATIVADO_PERIODO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA_INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA_FIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PATH_IMAGEM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ATIVO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESTAQUE'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 45
    Top = 126
  end
  object sqlSorteioUpd: TSQLDataSet
    CommandText = 'TB_SORTEIO_UPD'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESC_SORTEIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_FIM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_SORTEIO'
        ParamType = ptInput
      end
      item
        DataType = ftBlob
        Name = 'OBS_SORTEIO'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 176
    Top = 16
  end
  object sqlPremioSorteioUpd: TSQLDataSet
    CommandText = 'TB_PREMIO_SORTEIO_UPD'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ORDEM_PREMIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESC_PREMIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_FISCAL_PREMIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QTDE_PONTOS_CUPOM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PATH_IMAGEM'
        ParamType = ptInput
      end
      item
        DataType = ftBlob
        Name = 'OBS_PREMIO'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 180
    Top = 70
  end
  object sqlResultadoSorteioUpd: TSQLDataSet
    CommandText = 'TB_RESULTADO_SORTEIO_UPD'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SORTEIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'N_SORTEIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '01_PREMIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '02_PREMIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '03_PREMIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '04_PREMIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '05_PREMIO'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 183
    Top = 125
  end
  object sqlDebitaCartao: TSQLDataSet
    CommandText = 'PR_DEBITA_CARTAO'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'P_CPF'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_QTDE_PONTOS'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 187
    Top = 183
  end
  object sqlClienteUpd: TSQLDataSet
    CommandText = 'TB_CLIENTE_UPD'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CPF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_NASCIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDENTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME_MAE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME_PAI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CEP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LOGRADOURO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BAIRRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TEL_CELULAR_01'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TEL_CELULAR_02'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TEL_RESIDENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TEL_TERCEIRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RAMAL_TERCEIRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PARENTESCO_TERCEIRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMAIL'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 40
    Top = 17
  end
  object sqlClienteDigitalUpd: TSQLDataSet
    CommandText = 'PR_CLIENTE_DIGITAL_UPD'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CPF'
        ParamType = ptInput
      end
      item
        DataType = ftBlob
        Name = 'DIGITAL'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 48
    Top = 184
  end
  object sqlUsuarioUpd: TSQLDataSet
    CommandText = 'TB_USUARIO_UPD'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CPF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_NASCIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDENTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME_MAE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME_PAI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CEP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LOGRADOURO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BAIRRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TEL_CELULAR_01'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TEL_CELULAR_02'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TEL_RESIDENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMAIL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_PERFIL'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 320
    Top = 65
  end
  object sqlSenhaUpd: TSQLDataSet
    CommandText = 'PR_ALTERA_SENHA'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CPF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SENHA'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 322
    Top = 123
  end
end
