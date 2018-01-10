object dmConsulta: TdmConsulta
  OldCreateOrder = False
  Left = 433
  Top = 132
  Height = 398
  Width = 752
  object sqlConsShopping: TSQLDataSet
    CommandText = 'select * from TB_SHOPPING_SEL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 40
    Top = 8
  end
  object dspConsShopping: TDataSetProvider
    DataSet = sqlConsShopping
    Left = 40
    Top = 56
  end
  object cdsConsShopping: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsShopping'
    Left = 40
    Top = 104
    object cdsConsShoppingID: TIntegerField
      FieldName = 'ID'
    end
    object cdsConsShoppingNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 100
    end
  end
  object sqlConsProdutosPromocao: TSQLDataSet
    CommandText = 'select * from TB_PRODUTO_PROMOCAO_SEL(:p_id_loja, :p_id)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'p_id_loja'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_id'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 302
    Top = 8
  end
  object dspConsProdutosPromocao: TDataSetProvider
    DataSet = sqlConsProdutosPromocao
    Left = 302
    Top = 56
  end
  object cdsConsProdutosPromocao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'p_id_loja'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsProdutosPromocao'
    Left = 302
    Top = 104
    object cdsConsProdutosPromocaoID: TIntegerField
      FieldName = 'ID'
    end
    object cdsConsProdutosPromocaoID_LOJA: TIntegerField
      FieldName = 'ID_LOJA'
    end
    object cdsConsProdutosPromocaoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 100
    end
    object cdsConsProdutosPromocaoQTDE_PONTOS: TFloatField
      FieldName = 'QTDE_PONTOS'
    end
    object cdsConsProdutosPromocaoQTDE_PRODUTO: TIntegerField
      FieldName = 'QTDE_PRODUTO'
    end
    object cdsConsProdutosPromocaoATIVADO_PERIODO: TStringField
      FieldName = 'ATIVADO_PERIODO'
      Size = 1
    end
    object cdsConsProdutosPromocaoDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
    end
    object cdsConsProdutosPromocaoDATA_FIM: TDateField
      FieldName = 'DATA_FIM'
    end
    object cdsConsProdutosPromocaoPATH_IMAGEM: TStringField
      FieldName = 'PATH_IMAGEM'
      Size = 200
    end
    object cdsConsProdutosPromocaoATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object cdsConsProdutosPromocaoDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsConsProdutosPromocaoQTDE_CUPOM_EMITIDO: TIntegerField
      FieldName = 'QTDE_CUPOM_EMITIDO'
    end
    object cdsConsProdutosPromocaoDESTAQUE: TStringField
      FieldName = 'DESTAQUE'
      FixedChar = True
      Size = 1
    end
  end
  object sqlConsultaPremio: TSQLDataSet
    CommandText = 'select * from TB_PREMIO_SORTEIO_SEL(:p_sorteio)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'p_idsorteio'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 40
    Top = 184
  end
  object dspConsultaPremio: TDataSetProvider
    DataSet = sqlConsultaPremio
    Left = 41
    Top = 240
  end
  object cdsConsultaPremio: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'p_idsorteio'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsultaPremio'
    Left = 43
    Top = 292
    object cdsConsultaPremioID: TIntegerField
      FieldName = 'ID'
    end
    object cdsConsultaPremioID_SORTEIO: TIntegerField
      FieldName = 'ID_SORTEIO'
    end
    object cdsConsultaPremioORDEM_PREMIO: TIntegerField
      FieldName = 'ORDEM_PREMIO'
    end
    object cdsConsultaPremioDESC_PREMIO: TStringField
      FieldName = 'DESC_PREMIO'
      Size = 100
    end
    object cdsConsultaPremioVALOR_FISCAL_PREMIO: TFloatField
      FieldName = 'VALOR_FISCAL_PREMIO'
    end
    object cdsConsultaPremioQTDE_PONTOS_CUPOM: TFloatField
      FieldName = 'QTDE_PONTOS_CUPOM'
    end
    object cdsConsultaPremioPATH_IMAGEM: TStringField
      FieldName = 'PATH_IMAGEM'
      Size = 200
    end
    object cdsConsultaPremioOBS_PREMIO: TMemoField
      FieldName = 'OBS_PREMIO'
      BlobType = ftMemo
    end
    object cdsConsultaPremioDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsConsultaPremioUSUARIO_SISTEMA: TIntegerField
      FieldName = 'USUARIO_SISTEMA'
    end
  end
  object sqlConsultaResultadoSorteio: TSQLDataSet
    CommandText = 'select * from TB_RESULTADO_SORTEIO_SEL(:p_idsorteio)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'p_idsorteio'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 170
    Top = 184
  end
  object dspConsultaResultadoSorteio: TDataSetProvider
    DataSet = sqlConsultaResultadoSorteio
    Left = 171
    Top = 238
  end
  object cdsConsultaResultadoSorteio: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'p_idsorteio'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsultaResultadoSorteio'
    Left = 174
    Top = 290
    object cdsConsultaResultadoSorteioID_SORTEIO: TIntegerField
      FieldName = 'ID_SORTEIO'
    end
    object cdsConsultaResultadoSorteioN_SORTEIO: TIntegerField
      FieldName = 'N_SORTEIO'
    end
    object cdsConsultaResultadoSorteioCDSDesigner01_PREMIO: TIntegerField
      FieldName = '01_PREMIO'
    end
    object cdsConsultaResultadoSorteioCDSDesigner02_PREMIO: TIntegerField
      FieldName = '02_PREMIO'
    end
    object cdsConsultaResultadoSorteioCDSDesigner03_PREMIO: TIntegerField
      FieldName = '03_PREMIO'
    end
    object cdsConsultaResultadoSorteioCDSDesigner04_PREMIO: TIntegerField
      FieldName = '04_PREMIO'
    end
    object cdsConsultaResultadoSorteioCDSDesigner05_PREMIO: TIntegerField
      FieldName = '05_PREMIO'
    end
  end
  object sqlConsultaParametros: TSQLDataSet
    CommandText = 'select * from tb_parametros_sel(:p_cod_param) '
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'p_cod_param'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 304
    Top = 184
  end
  object dspConsultaParametros: TDataSetProvider
    DataSet = sqlConsultaParametros
    Left = 308
    Top = 236
  end
  object cdsConsultaParametros: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'p_cod_param'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsultaParametros'
    Left = 310
    Top = 292
    object cdsConsultaParametrosVALOR: TStringField
      FieldName = 'VALOR'
    end
  end
  object sqlConsLojasShopping: TSQLDataSet
    CommandText = 'select * from tb_Lojas_shopping_sel(:p_cnpj, :p_id)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'p_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_cnpj'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 174
    Top = 8
  end
  object dspConsLojasShopping: TDataSetProvider
    DataSet = sqlConsLojasShopping
    Left = 174
    Top = 56
  end
  object cdsConsLojasShopping: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'p_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_cnpj'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsLojasShopping'
    Left = 174
    Top = 104
    object cdsConsLojasShoppingID: TIntegerField
      FieldName = 'ID'
    end
    object cdsConsLojasShoppingID_SHOPPING: TIntegerField
      FieldName = 'ID_SHOPPING'
    end
    object cdsConsLojasShoppingCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object cdsConsLojasShoppingRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 150
    end
    object cdsConsLojasShoppingNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 100
    end
    object cdsConsLojasShoppingCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 100
    end
    object cdsConsLojasShoppingTELEFONE_01: TStringField
      FieldName = 'TELEFONE_01'
      Size = 15
    end
    object cdsConsLojasShoppingTELEFONE_02: TStringField
      FieldName = 'TELEFONE_02'
      Size = 15
    end
    object cdsConsLojasShoppingRAMAL: TStringField
      FieldName = 'RAMAL'
      Size = 5
    end
    object cdsConsLojasShoppingCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 15
    end
    object cdsConsLojasShoppingEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 200
    end
    object cdsConsLojasShoppingNUMERO_LOJA: TStringField
      FieldName = 'NUMERO_LOJA'
      Size = 10
    end
    object cdsConsLojasShoppingATIVA: TStringField
      FieldName = 'ATIVA'
      Size = 1
    end
    object cdsConsLojasShoppingDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsConsLojasShoppingUSUARIO_SISTEMA: TIntegerField
      FieldName = 'USUARIO_SISTEMA'
    end
  end
  object sqlConsultaExtrato: TSQLDataSet
    CommandText = 'select * from PR_CONSULTA_EXTRATO(:p_id_cartao)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'p_id_cartao'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 434
    Top = 8
  end
  object dspConsultaExtrato: TDataSetProvider
    DataSet = sqlConsultaExtrato
    Left = 431
    Top = 57
  end
  object cdsConsultaExtrato: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'p_id_cartao'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsultaExtrato'
    Left = 434
    Top = 104
    object cdsConsultaExtratoDT_MOVIMENTO: TDateField
      FieldName = 'DT_MOVIMENTO'
    end
    object cdsConsultaExtratoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsConsultaExtratoPONTOS: TFloatField
      FieldName = 'PONTOS'
    end
    object cdsConsultaExtratoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      FixedChar = True
      Size = 1
    end
    object cdsConsultaExtratoSALDO: TFloatField
      FieldName = 'SALDO'
    end
  end
  object sqlConsultaDigital: TSQLDataSet
    CommandText = 'select * from PR_CONSULTA_DIGITAL(:P_CPF)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'P_CPF'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 432
    Top = 184
  end
  object dspConsultaDigital: TDataSetProvider
    DataSet = sqlConsultaDigital
    Left = 432
    Top = 240
  end
  object cdsConsultaDigital: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'P_CPF'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsultaDigital'
    Left = 432
    Top = 296
    object cdsConsultaDigitalCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsConsultaDigitalDIGITAL: TMemoField
      FieldName = 'DIGITAL'
      BlobType = ftMemo
      Size = 1
    end
  end
  object sqlConsultaUsuario: TSQLDataSet
    CommandText = 'select * from tb_usuario_sel(:p_cpf)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'p_id_cartao'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 546
    Top = 7
  end
  object dspConsultaUsuario: TDataSetProvider
    DataSet = sqlConsultaUsuario
    Left = 548
    Top = 56
  end
  object cdsConsultaUsuario: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'p_id_cartao'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsultaUsuario'
    Left = 551
    Top = 103
    object cdsConsultaUsuarioID: TIntegerField
      FieldName = 'ID'
    end
    object cdsConsultaUsuarioCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsConsultaUsuarioNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsConsultaUsuarioDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
    object cdsConsultaUsuarioIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
    end
    object cdsConsultaUsuarioOE: TStringField
      FieldName = 'OE'
      Size = 10
    end
    object cdsConsultaUsuarioNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      Size = 100
    end
    object cdsConsultaUsuarioNOME_PAI: TStringField
      FieldName = 'NOME_PAI'
      Size = 100
    end
    object cdsConsultaUsuarioCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object cdsConsultaUsuarioLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 200
    end
    object cdsConsultaUsuarioBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 50
    end
    object cdsConsultaUsuarioCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object cdsConsultaUsuarioUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsConsultaUsuarioTEL_CELULAR_01: TStringField
      FieldName = 'TEL_CELULAR_01'
      Size = 15
    end
    object cdsConsultaUsuarioTEL_CELULAR_02: TStringField
      FieldName = 'TEL_CELULAR_02'
      Size = 15
    end
    object cdsConsultaUsuarioTEL_RESIDENCIA: TStringField
      FieldName = 'TEL_RESIDENCIA'
      Size = 15
    end
    object cdsConsultaUsuarioEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsConsultaUsuarioDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsConsultaUsuarioATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object cdsConsultaUsuarioUSUARIO_SISTEMA: TIntegerField
      FieldName = 'USUARIO_SISTEMA'
    end
    object cdsConsultaUsuarioSENHA: TStringField
      FieldName = 'SENHA'
      Size = 11
    end
    object cdsConsultaUsuarioID_PERFIL: TIntegerField
      FieldName = 'ID_PERFIL'
    end
    object cdsConsultaUsuarioPERFIL: TStringField
      FieldName = 'PERFIL'
      Size = 50
    end
  end
  object sqlConsPerfilMenu: TSQLDataSet
    CommandText = 'select * from tb_perfilmenu_sel(:p_idperfil)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'p_idperfil'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 655
    Top = 8
  end
  object dspConsPerfilMenu: TDataSetProvider
    DataSet = sqlConsPerfilMenu
    Left = 657
    Top = 57
  end
  object cdsConsPerfilMenu: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'p_idperfil'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsPerfilMenu'
    Left = 660
    Top = 104
    object cdsConsPerfilMenuACESSAR: TStringField
      FieldName = 'ACESSAR'
      FixedChar = True
      Size = 1
    end
    object cdsConsPerfilMenuID: TIntegerField
      FieldName = 'ID'
    end
    object cdsConsPerfilMenuID_PERFIL: TIntegerField
      FieldName = 'ID_PERFIL'
    end
    object cdsConsPerfilMenuID_MENU: TIntegerField
      FieldName = 'ID_MENU'
    end
    object cdsConsPerfilMenuMENU: TStringField
      FieldName = 'MENU'
      Size = 50
    end
    object cdsConsPerfilMenuPOSICAO: TStringField
      FieldName = 'POSICAO'
      Size = 8
    end
    object cdsConsPerfilMenuDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsConsPerfilMenuINCLUIR: TStringField
      FieldName = 'INCLUIR'
      FixedChar = True
      Size = 1
    end
    object cdsConsPerfilMenuALTERAR: TStringField
      FieldName = 'ALTERAR'
      FixedChar = True
      Size = 1
    end
    object cdsConsPerfilMenuEXCLUIR: TStringField
      FieldName = 'EXCLUIR'
      FixedChar = True
      Size = 1
    end
    object cdsConsPerfilMenuCONSULTAR: TStringField
      FieldName = 'CONSULTAR'
      FixedChar = True
      Size = 1
    end
    object cdsConsPerfilMenuTEM_INCLUSAO: TStringField
      FieldName = 'TEM_INCLUSAO'
      FixedChar = True
      Size = 1
    end
    object cdsConsPerfilMenuTEM_ALTERACAO: TStringField
      FieldName = 'TEM_ALTERACAO'
      FixedChar = True
      Size = 1
    end
    object cdsConsPerfilMenuTEM_EXCLUSAO: TStringField
      FieldName = 'TEM_EXCLUSAO'
      FixedChar = True
      Size = 1
    end
    object cdsConsPerfilMenuTEM_CONSULTA: TStringField
      FieldName = 'TEM_CONSULTA'
      FixedChar = True
      Size = 1
    end
  end
  object sqlConsultaPerfil: TSQLDataSet
    CommandText = 'select * from tb_perfil_sel(:p_idperfil)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'p_idperfil'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 543
    Top = 184
  end
  object dspConsultaPerfil: TDataSetProvider
    DataSet = sqlConsultaPerfil
    Left = 545
    Top = 240
  end
  object cdsConsultaPerfil: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'p_idperfil'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsultaPerfil'
    Left = 548
    Top = 295
    object cdsConsultaPerfilID: TIntegerField
      FieldName = 'ID'
    end
    object cdsConsultaPerfilPERFIL: TStringField
      FieldName = 'PERFIL'
      Size = 50
    end
  end
  object sqlConsTipoMovimento: TSQLDataSet
    CommandText = 'select * from tb_tipo_movimento_sel(:p_id)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'p_id'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 654
    Top = 184
  end
  object dspConsTipoMovimento: TDataSetProvider
    DataSet = sqlConsTipoMovimento
    Left = 656
    Top = 240
  end
  object cdsConsTipoMovimento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'p_id'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsTipoMovimento'
    Left = 659
    Top = 295
    object cdsConsTipoMovimentoID: TIntegerField
      FieldName = 'ID'
    end
    object cdsConsTipoMovimentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsConsTipoMovimentoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 1
    end
    object cdsConsTipoMovimentoFATOR_CUSTO: TFMTBCDField
      FieldName = 'FATOR_CUSTO'
      Precision = 18
      Size = 2
    end
  end
end
