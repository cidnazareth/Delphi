object dmInsert: TdmInsert
  OldCreateOrder = False
  Left = 546
  Top = 129
  Height = 380
  Width = 600
  object sqlCartaoDependenteIns: TSQLDataSet
    CommandText = 'TB_CARTAO_DEPENDENTE_INS'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftBCD
        Name = 'N_CARTAO_DEPENDENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_SHOPPING'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QTDE_PONTOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CPF_DEPENDENTE'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'N_CARTAO_TITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_TIPO_CARTAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'USUARIO_SISTEMA'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 46
    Top = 261
  end
  object sqlLojasShoppingIns: TSQLDataSet
    CommandText = 'TB_LOJAS_SHOPPING_INS'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SHOPPING'
        ParamType = ptInput
      end
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
      end
      item
        DataType = ftInteger
        Name = 'USUARIO_SISTEMA'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 176
    Top = 18
  end
  object sqlSorteioIns: TSQLDataSet
    CommandText = 'TB_SORTEIO_INS'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SHOPPING'
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
      end
      item
        DataType = ftInteger
        Name = 'USUARIO_SISTEMA'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 177
    Top = 143
  end
  object sqlPremioSorteioIns: TSQLDataSet
    CommandText = 'TB_PREMIO_SORTEIO_INS'
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
      end
      item
        DataType = ftInteger
        Name = 'USUARIO_SISTEMA'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 181
    Top = 202
  end
  object sqlIncShopping: TSQLDataSet
    CommandText = 'TB_SHOPPING_INS'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NOME_FANTASIA'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 34
    Top = 22
  end
  object sqlResultadoSorteioIns: TSQLDataSet
    CommandText = 'TB_RESULTADO_SORTEIO_INS'
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
      end
      item
        DataType = ftInteger
        Name = 'USUARIO_SISTEMA'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 184
    Top = 260
  end
  object sqlClienteIns: TSQLDataSet
    CommandText = 'TB_CLIENTE_INS'
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
        Name = 'CPF_TITULAR'
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
      end
      item
        DataType = ftInteger
        Name = 'USUARIO_SISTEMA'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 36
    Top = 82
  end
  object sqlCartaoIns: TSQLDataSet
    CommandText = 'TB_CARTAO_INS'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CPF_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_SHOPPING'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_TIPO_CARTAO'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'N_CARTAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QTDE_PONTOS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'USUARIO_SISTEMA'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 37
    Top = 142
  end
  object sqlProdutoPromocaoIns: TSQLDataSet
    CommandText = 'TB_PRODUTO_PROMOCAO_INS'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_LOJA'
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
        DataType = ftInteger
        Name = 'USUARIO_SISTEMA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESTAQUE'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 176
    Top = 82
  end
  object sqlAtualizaSaldo: TSQLDataSet
    CommandText = 'PR_ATUALIZA_SALDO'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 336
    Top = 24
  end
  object sqlGeraExtrato: TSQLDataSet
    CommandText = 'PR_GERA_EXTRATO'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'P_ID_CARTAO'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 336
    Top = 82
  end
  object sqlMovimentoIns: TSQLDataSet
    CommandText = 'TB_MOVIMENTO_INS'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_CARTAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_TIPO_MOVIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_CUPOM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_LOJA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_VOUCHER'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QTDE_PONTO_OPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QTDE_PONTO_CUSTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TERMINAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'USUARIO_SISTEMA'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 339
    Top = 145
  end
  object sqlCupomSorteioIns: TSQLDataSet
    CommandText = 'TB_CUPOM_SORTEIO_INS'
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
        Name = 'N_CUPOM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_PREMIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_CARTAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'N_TERMINAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'USUARIO_SISTEMA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptOutput
        Size = 4
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 40
    Top = 208
  end
  object sqlUsuarioIns: TSQLDataSet
    CommandText = 'TB_USUARIO_INS'
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
        Name = 'USUARIO_SISTEMA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SENHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_PERFIL'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 343
    Top = 206
  end
  object sqlPerfilmenuIns: TSQLDataSet
    CommandText = 'TB_PERFILMENU_INS'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PERFIL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_MENU'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'INCLUIR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'ALTERAR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'EXCLUIR'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CONSULTAR'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 343
    Top = 261
  end
end
