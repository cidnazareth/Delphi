object dmLocaliza: TdmLocaliza
  OldCreateOrder = False
  Left = 405
  Top = 82
  Height = 439
  Width = 855
  object sqlLocalizaCpfTitular: TSQLDataSet
    CommandText = 'SELECT * FROM PR_CONSULTA_CPF_TITULAR (:CPF)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'P_CPF'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 37
    Top = 16
  end
  object dspLocalizaCpfTitular: TDataSetProvider
    DataSet = sqlLocalizaCpfTitular
    Left = 38
    Top = 64
  end
  object cdsLocalizaCpfTitular: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'P_CPF'
        ParamType = ptInput
      end>
    ProviderName = 'dspLocalizaCpfTitular'
    Left = 40
    Top = 112
    object cdsLocalizaCpfTitularCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsLocalizaCpfTitularCPF_TITULAR: TStringField
      FieldName = 'CPF_TITULAR'
      Size = 14
    end
    object cdsLocalizaCpfTitularNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsLocalizaCpfTitularDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
    object cdsLocalizaCpfTitularIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
    end
    object cdsLocalizaCpfTitularOE: TStringField
      FieldName = 'OE'
      Size = 10
    end
    object cdsLocalizaCpfTitularNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      Size = 100
    end
    object cdsLocalizaCpfTitularNOME_PAI: TStringField
      FieldName = 'NOME_PAI'
      Size = 100
    end
    object cdsLocalizaCpfTitularCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object cdsLocalizaCpfTitularLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 200
    end
    object cdsLocalizaCpfTitularBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 50
    end
    object cdsLocalizaCpfTitularCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object cdsLocalizaCpfTitularUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsLocalizaCpfTitularTEL_CELULAR_01: TStringField
      FieldName = 'TEL_CELULAR_01'
      Size = 15
    end
    object cdsLocalizaCpfTitularTEL_CELULAR_02: TStringField
      FieldName = 'TEL_CELULAR_02'
      Size = 15
    end
    object cdsLocalizaCpfTitularTEL_RESIDENCIA: TStringField
      FieldName = 'TEL_RESIDENCIA'
      Size = 15
    end
    object cdsLocalizaCpfTitularTEL_TERCEIRO: TStringField
      FieldName = 'TEL_TERCEIRO'
      Size = 15
    end
    object cdsLocalizaCpfTitularRAMAL_TERCEIRO: TStringField
      FieldName = 'RAMAL_TERCEIRO'
      Size = 5
    end
    object cdsLocalizaCpfTitularPARENTESCO_TERCEIRO: TStringField
      FieldName = 'PARENTESCO_TERCEIRO'
      Size = 50
    end
    object cdsLocalizaCpfTitularEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsLocalizaCpfTitularDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsLocalizaCpfTitularATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object cdsLocalizaCpfTitularUSUARIO_SISTEMA: TIntegerField
      FieldName = 'USUARIO_SISTEMA'
    end
    object cdsLocalizaCpfTitularTIPO: TStringField
      FieldName = 'TIPO'
      Size = 10
    end
  end
  object sqlLocalizaCnpjLoja: TSQLDataSet
    CommandText = 'select '#13#10'* '#13#10'from'#13#10'   TB_LOJAS_SHOPPING_SEL(:p_id, :p_cnpj)'
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
    Left = 144
    Top = 216
  end
  object dspLocalizaCnpjLoja: TDataSetProvider
    DataSet = sqlLocalizaCnpjLoja
    Left = 144
    Top = 264
  end
  object cdsLocalizaCnpjLoja: TClientDataSet
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
    ProviderName = 'dspLocalizaCnpjLoja'
    Left = 144
    Top = 312
    object cdsLocalizaCnpjLojaID: TIntegerField
      FieldName = 'ID'
    end
    object cdsLocalizaCnpjLojaID_SHOPPING: TIntegerField
      FieldName = 'ID_SHOPPING'
    end
    object cdsLocalizaCnpjLojaCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object cdsLocalizaCnpjLojaRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 150
    end
    object cdsLocalizaCnpjLojaNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 100
    end
    object cdsLocalizaCnpjLojaCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 100
    end
    object cdsLocalizaCnpjLojaTELEFONE_01: TStringField
      FieldName = 'TELEFONE_01'
      Size = 15
    end
    object cdsLocalizaCnpjLojaTELEFONE_02: TStringField
      FieldName = 'TELEFONE_02'
      Size = 15
    end
    object cdsLocalizaCnpjLojaRAMAL: TStringField
      FieldName = 'RAMAL'
      Size = 5
    end
    object cdsLocalizaCnpjLojaCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 15
    end
    object cdsLocalizaCnpjLojaEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 200
    end
    object cdsLocalizaCnpjLojaNUMERO_LOJA: TStringField
      FieldName = 'NUMERO_LOJA'
      Size = 10
    end
    object cdsLocalizaCnpjLojaATIVA: TStringField
      FieldName = 'ATIVA'
      Size = 1
    end
    object cdsLocalizaCnpjLojaDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsLocalizaCnpjLojaUSUARIO_SISTEMA: TIntegerField
      FieldName = 'USUARIO_SISTEMA'
    end
  end
  object dspLocalizaSorteio: TDataSetProvider
    DataSet = sqlLocalizaSorteio
    Left = 260
    Top = 264
  end
  object cdsLocalizaSorteio: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'dt_Sorteio'
        ParamType = ptInput
      end>
    ProviderName = 'dspLocalizaSorteio'
    Left = 260
    Top = 312
    object cdsLocalizaSorteioID: TIntegerField
      FieldName = 'ID'
    end
    object cdsLocalizaSorteioID_SHOPPING: TIntegerField
      FieldName = 'ID_SHOPPING'
    end
    object cdsLocalizaSorteioDESC_SORTEIO: TStringField
      FieldName = 'DESC_SORTEIO'
      Size = 100
    end
    object cdsLocalizaSorteioDT_INICIO: TDateField
      FieldName = 'DT_INICIO'
    end
    object cdsLocalizaSorteioDT_FIM: TDateField
      FieldName = 'DT_FIM'
    end
    object cdsLocalizaSorteioDT_SORTEIO: TDateField
      FieldName = 'DT_SORTEIO'
    end
    object cdsLocalizaSorteioOBS_SORTEIO: TMemoField
      FieldName = 'OBS_SORTEIO'
      BlobType = ftMemo
    end
    object cdsLocalizaSorteioDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsLocalizaSorteioUSUARIO_SISTEMA: TIntegerField
      FieldName = 'USUARIO_SISTEMA'
    end
  end
  object sqlLocalizaSorteio: TSQLDataSet
    CommandText = 'select * from tb_sorteio_sel(:p_data)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'dt_Sorteio'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 262
    Top = 216
  end
  object sqlLocalizaCpfDep: TSQLDataSet
    CommandText = 'SELECT * FROM PR_CONSULTA_CPF_DEPENDENTE(:P_CPF)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'P_CPF'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 149
    Top = 16
  end
  object dspLocalizaCpfDep: TDataSetProvider
    DataSet = sqlLocalizaCpfDep
    Left = 150
    Top = 64
  end
  object cdsLocalizaCpfDep: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'P_CPF'
        ParamType = ptInput
      end>
    ProviderName = 'dspLocalizaCpfDep'
    Left = 152
    Top = 112
    object cdsLocalizaCpfDepCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsLocalizaCpfDepCPF_TITULAR: TStringField
      FieldName = 'CPF_TITULAR'
      Size = 14
    end
    object cdsLocalizaCpfDepNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsLocalizaCpfDepDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
    object cdsLocalizaCpfDepIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
    end
    object cdsLocalizaCpfDepOE: TStringField
      FieldName = 'OE'
      Size = 10
    end
    object cdsLocalizaCpfDepNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      Size = 100
    end
    object cdsLocalizaCpfDepNOME_PAI: TStringField
      FieldName = 'NOME_PAI'
      Size = 100
    end
    object cdsLocalizaCpfDepCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object cdsLocalizaCpfDepLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 200
    end
    object cdsLocalizaCpfDepBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 50
    end
    object cdsLocalizaCpfDepCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object cdsLocalizaCpfDepUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsLocalizaCpfDepTEL_CELULAR_01: TStringField
      FieldName = 'TEL_CELULAR_01'
      Size = 15
    end
    object cdsLocalizaCpfDepTEL_CELULAR_02: TStringField
      FieldName = 'TEL_CELULAR_02'
      Size = 15
    end
    object cdsLocalizaCpfDepTEL_RESIDENCIA: TStringField
      FieldName = 'TEL_RESIDENCIA'
      Size = 15
    end
    object cdsLocalizaCpfDepTEL_TERCEIRO: TStringField
      FieldName = 'TEL_TERCEIRO'
      Size = 15
    end
    object cdsLocalizaCpfDepRAMAL_TERCEIRO: TStringField
      FieldName = 'RAMAL_TERCEIRO'
      Size = 5
    end
    object cdsLocalizaCpfDepPARENTESCO_TERCEIRO: TStringField
      FieldName = 'PARENTESCO_TERCEIRO'
      Size = 50
    end
    object cdsLocalizaCpfDepEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsLocalizaCpfDepDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsLocalizaCpfDepATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object cdsLocalizaCpfDepUSUARIO_SISTEMA: TIntegerField
      FieldName = 'USUARIO_SISTEMA'
    end
    object cdsLocalizaCpfDepTIPO: TStringField
      FieldName = 'TIPO'
      Size = 10
    end
  end
  object sqlLocalizaCartao: TSQLDataSet
    CommandText = 'select * from pr_consulta_cartao(:p_cartao, :p_cpf)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftBCD
        Name = 'p_cartao'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_cpf'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 40
    Top = 215
  end
  object dspLocalizaCartao: TDataSetProvider
    DataSet = sqlLocalizaCartao
    Left = 40
    Top = 263
  end
  object sqlLocalizaDepSemCartao: TSQLDataSet
    CommandText = 'select * from PR_CONSULTA_DEP_SEM_CARTAO(:P_CPF)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'P_CPF'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 625
    Top = 15
  end
  object dspLocalizaDepSemCartao: TDataSetProvider
    DataSet = sqlLocalizaDepSemCartao
    Left = 627
    Top = 64
  end
  object cdsLocalizaDepSemCartao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'P_CPF'
        ParamType = ptInput
      end>
    ProviderName = 'dspLocalizaDepSemCartao'
    Left = 628
    Top = 112
    object cdsLocalizaDepSemCartaoCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsLocalizaDepSemCartaoCPF_TITULAR: TStringField
      FieldName = 'CPF_TITULAR'
      Size = 14
    end
    object cdsLocalizaDepSemCartaoNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsLocalizaDepSemCartaoDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
    object cdsLocalizaDepSemCartaoIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
    end
    object cdsLocalizaDepSemCartaoOE: TStringField
      FieldName = 'OE'
      Size = 10
    end
    object cdsLocalizaDepSemCartaoNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      Size = 100
    end
    object cdsLocalizaDepSemCartaoNOME_PAI: TStringField
      FieldName = 'NOME_PAI'
      Size = 100
    end
    object cdsLocalizaDepSemCartaoCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object cdsLocalizaDepSemCartaoLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 200
    end
    object cdsLocalizaDepSemCartaoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 50
    end
    object cdsLocalizaDepSemCartaoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object cdsLocalizaDepSemCartaoUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsLocalizaDepSemCartaoTEL_CELULAR_01: TStringField
      FieldName = 'TEL_CELULAR_01'
      Size = 15
    end
    object cdsLocalizaDepSemCartaoTEL_CELULAR_02: TStringField
      FieldName = 'TEL_CELULAR_02'
      Size = 15
    end
    object cdsLocalizaDepSemCartaoTEL_RESIDENCIA: TStringField
      FieldName = 'TEL_RESIDENCIA'
      Size = 15
    end
    object cdsLocalizaDepSemCartaoTEL_TERCEIRO: TStringField
      FieldName = 'TEL_TERCEIRO'
      Size = 15
    end
    object cdsLocalizaDepSemCartaoRAMAL_TERCEIRO: TStringField
      FieldName = 'RAMAL_TERCEIRO'
      Size = 5
    end
    object cdsLocalizaDepSemCartaoPARENTESCO_TERCEIRO: TStringField
      FieldName = 'PARENTESCO_TERCEIRO'
      Size = 50
    end
    object cdsLocalizaDepSemCartaoEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 200
    end
    object cdsLocalizaDepSemCartaoDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsLocalizaDepSemCartaoATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 1
    end
  end
  object sqlLocalizaCupomSorteio: TSQLDataSet
    CommandText = 
      'Select * from PR_CONSULTA_CUPOM(:P_IDSORTEIO,:P_NCUPOM,:P_NCARTA' +
      'O)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'P_IDSORTEIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_NCUPOM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_IDCARTAO'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 379
    Top = 215
  end
  object dspLocalizaCupomSorteio: TDataSetProvider
    DataSet = sqlLocalizaCupomSorteio
    Left = 382
    Top = 264
  end
  object cdsLocalizaCupomSorteio: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'P_IDSORTEIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_NCUPOM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_IDCARTAO'
        ParamType = ptInput
      end>
    ProviderName = 'dspLocalizaCupomSorteio'
    Left = 383
    Top = 311
    object cdsLocalizaCupomSorteioN_CUPOM: TIntegerField
      FieldName = 'N_CUPOM'
    end
    object cdsLocalizaCupomSorteioN_CARTAO: TFMTBCDField
      FieldName = 'N_CARTAO'
      Precision = 15
      Size = 0
    end
    object cdsLocalizaCupomSorteioDT_EMISSAO: TDateField
      FieldName = 'DT_EMISSAO'
    end
    object cdsLocalizaCupomSorteioN_TERMINAL: TIntegerField
      FieldName = 'N_TERMINAL'
    end
    object cdsLocalizaCupomSorteioDESC_SORTEIO: TStringField
      FieldName = 'DESC_SORTEIO'
      Size = 100
    end
    object cdsLocalizaCupomSorteioDESC_PREMIO: TStringField
      FieldName = 'DESC_PREMIO'
      Size = 100
    end
    object cdsLocalizaCupomSorteioORDEM_PREMIO: TIntegerField
      FieldName = 'ORDEM_PREMIO'
    end
  end
  object cdsLocalizaCartao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftBCD
        Name = 'p_cartao'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_cpf'
        ParamType = ptInput
      end>
    ProviderName = 'dspLocalizaCartao'
    Left = 43
    Top = 314
    object cdsLocalizaCartaoID: TIntegerField
      FieldName = 'ID'
    end
    object cdsLocalizaCartaoCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsLocalizaCartaoCARTAO: TFMTBCDField
      FieldName = 'CARTAO'
      Precision = 15
      Size = 0
    end
    object cdsLocalizaCartaoQTDE_PONTOS: TFMTBCDField
      FieldName = 'QTDE_PONTOS'
      Precision = 18
      Size = 2
    end
    object cdsLocalizaCartaoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 10
    end
    object cdsLocalizaCartaoATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object cdsLocalizaCartaoNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsLocalizaCartaoDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
    object cdsLocalizaCartaoIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
    end
    object cdsLocalizaCartaoOE: TStringField
      FieldName = 'OE'
      Size = 10
    end
    object cdsLocalizaCartaoNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      Size = 100
    end
    object cdsLocalizaCartaoNOME_PAI: TStringField
      FieldName = 'NOME_PAI'
      Size = 100
    end
    object cdsLocalizaCartaoCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object cdsLocalizaCartaoLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 200
    end
    object cdsLocalizaCartaoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 50
    end
    object cdsLocalizaCartaoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object cdsLocalizaCartaoUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsLocalizaCartaoTEL_CELULAR_01: TStringField
      FieldName = 'TEL_CELULAR_01'
      Size = 15
    end
    object cdsLocalizaCartaoTEL_CELULAR_02: TStringField
      FieldName = 'TEL_CELULAR_02'
      Size = 15
    end
    object cdsLocalizaCartaoTEL_RESIDENCIA: TStringField
      FieldName = 'TEL_RESIDENCIA'
      Size = 15
    end
    object cdsLocalizaCartaoTEL_TERCEIRO: TStringField
      FieldName = 'TEL_TERCEIRO'
      Size = 15
    end
    object cdsLocalizaCartaoRAMAL_TERCEIRO: TStringField
      FieldName = 'RAMAL_TERCEIRO'
      Size = 5
    end
    object cdsLocalizaCartaoPARENTESCO_TERCEIRO: TStringField
      FieldName = 'PARENTESCO_TERCEIRO'
      Size = 50
    end
    object cdsLocalizaCartaoEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
  end
  object sqlLocalizaDepPorTitular: TSQLDataSet
    CommandText = 'SELECT * FROM PR_CONSULTA_DEPENDENTE (:CPF_TITULAR)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'P_CPD_TITULAR'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 265
    Top = 16
  end
  object dspLocalizaDepPorTitular: TDataSetProvider
    DataSet = sqlLocalizaDepPorTitular
    Left = 264
    Top = 64
  end
  object cdsLocalizaDepPorTitular: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'P_CPD_TITULAR'
        ParamType = ptInput
      end>
    ProviderName = 'dspLocalizaDepPorTitular'
    Left = 266
    Top = 112
    object cdsLocalizaDepPorTitularCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsLocalizaDepPorTitularCPF_TITULAR: TStringField
      FieldName = 'CPF_TITULAR'
      Size = 14
    end
    object cdsLocalizaDepPorTitularNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsLocalizaDepPorTitularDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
    object cdsLocalizaDepPorTitularIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
    end
    object cdsLocalizaDepPorTitularOE: TStringField
      FieldName = 'OE'
      Size = 10
    end
    object cdsLocalizaDepPorTitularNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      Size = 100
    end
    object cdsLocalizaDepPorTitularNOME_PAI: TStringField
      FieldName = 'NOME_PAI'
      Size = 100
    end
    object cdsLocalizaDepPorTitularCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object cdsLocalizaDepPorTitularLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 200
    end
    object cdsLocalizaDepPorTitularBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 50
    end
    object cdsLocalizaDepPorTitularCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object cdsLocalizaDepPorTitularUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsLocalizaDepPorTitularTEL_CELULAR_01: TStringField
      FieldName = 'TEL_CELULAR_01'
      Size = 15
    end
    object cdsLocalizaDepPorTitularTEL_CELULAR_02: TStringField
      FieldName = 'TEL_CELULAR_02'
      Size = 15
    end
    object cdsLocalizaDepPorTitularTEL_RESIDENCIA: TStringField
      FieldName = 'TEL_RESIDENCIA'
      Size = 15
    end
    object cdsLocalizaDepPorTitularTEL_TERCEIRO: TStringField
      FieldName = 'TEL_TERCEIRO'
      Size = 15
    end
    object cdsLocalizaDepPorTitularRAMAL_TERCEIRO: TStringField
      FieldName = 'RAMAL_TERCEIRO'
      Size = 5
    end
    object cdsLocalizaDepPorTitularPARENTESCO_TERCEIRO: TStringField
      FieldName = 'PARENTESCO_TERCEIRO'
      Size = 50
    end
    object cdsLocalizaDepPorTitularEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsLocalizaDepPorTitularDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsLocalizaDepPorTitularATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object cdsLocalizaDepPorTitularUSUARIO_SISTEMA: TIntegerField
      FieldName = 'USUARIO_SISTEMA'
    end
    object cdsLocalizaDepPorTitularTIPO: TStringField
      FieldName = 'TIPO'
      Size = 10
    end
  end
  object sqlLocalizaTitPorDep: TSQLDataSet
    CommandText = 'SELECT * FROM PR_CONSULTA_TITULAR(:P_CPF_DEPENDENTE)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'P_CPF_DEPENDENTE'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 390
    Top = 16
  end
  object dspLocalizaTitPorDep: TDataSetProvider
    DataSet = sqlLocalizaTitPorDep
    Left = 393
    Top = 64
  end
  object cdsLocalizaTitPorDep: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'P_CPF_DEPENDENTE'
        ParamType = ptInput
      end>
    ProviderName = 'dspLocalizaTitPorDep'
    Left = 393
    Top = 112
    object cdsLocalizaTitPorDepCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsLocalizaTitPorDepCPF_TITULAR: TStringField
      FieldName = 'CPF_TITULAR'
      Size = 14
    end
    object cdsLocalizaTitPorDepNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsLocalizaTitPorDepDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
    object cdsLocalizaTitPorDepIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
    end
    object cdsLocalizaTitPorDepOE: TStringField
      FieldName = 'OE'
      Size = 10
    end
    object cdsLocalizaTitPorDepNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      Size = 100
    end
    object cdsLocalizaTitPorDepNOME_PAI: TStringField
      FieldName = 'NOME_PAI'
      Size = 100
    end
    object cdsLocalizaTitPorDepCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object cdsLocalizaTitPorDepLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 200
    end
    object cdsLocalizaTitPorDepBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 50
    end
    object cdsLocalizaTitPorDepCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object cdsLocalizaTitPorDepUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsLocalizaTitPorDepTEL_CELULAR_01: TStringField
      FieldName = 'TEL_CELULAR_01'
      Size = 15
    end
    object cdsLocalizaTitPorDepTEL_CELULAR_02: TStringField
      FieldName = 'TEL_CELULAR_02'
      Size = 15
    end
    object cdsLocalizaTitPorDepTEL_RESIDENCIA: TStringField
      FieldName = 'TEL_RESIDENCIA'
      Size = 15
    end
    object cdsLocalizaTitPorDepTEL_TERCEIRO: TStringField
      FieldName = 'TEL_TERCEIRO'
      Size = 15
    end
    object cdsLocalizaTitPorDepRAMAL_TERCEIRO: TStringField
      FieldName = 'RAMAL_TERCEIRO'
      Size = 5
    end
    object cdsLocalizaTitPorDepPARENTESCO_TERCEIRO: TStringField
      FieldName = 'PARENTESCO_TERCEIRO'
      Size = 50
    end
    object cdsLocalizaTitPorDepEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsLocalizaTitPorDepDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsLocalizaTitPorDepATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object cdsLocalizaTitPorDepUSUARIO_SISTEMA: TIntegerField
      FieldName = 'USUARIO_SISTEMA'
    end
    object cdsLocalizaTitPorDepTIPO: TStringField
      FieldName = 'TIPO'
      Size = 10
    end
  end
  object sqlLocalizaCpf: TSQLDataSet
    CommandText = 'SELECT * FROM PR_CONSULTA_CPF (:CPF)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'P_CPF'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 499
    Top = 16
  end
  object dspLocalizaCpf: TDataSetProvider
    DataSet = sqlLocalizaCpf
    Left = 500
    Top = 64
  end
  object cdsLocalizaCpf: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'P_CPF'
        ParamType = ptInput
      end>
    ProviderName = 'dspLocalizaCpf'
    Left = 502
    Top = 112
    object cdsLocalizaCpfCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsLocalizaCpfCPF_TITULAR: TStringField
      FieldName = 'CPF_TITULAR'
      Size = 14
    end
    object cdsLocalizaCpfNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsLocalizaCpfDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
    object cdsLocalizaCpfIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
    end
    object cdsLocalizaCpfOE: TStringField
      FieldName = 'OE'
      Size = 10
    end
    object cdsLocalizaCpfNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      Size = 100
    end
    object cdsLocalizaCpfNOME_PAI: TStringField
      FieldName = 'NOME_PAI'
      Size = 100
    end
    object cdsLocalizaCpfCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object cdsLocalizaCpfLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 200
    end
    object cdsLocalizaCpfBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 50
    end
    object cdsLocalizaCpfCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object cdsLocalizaCpfUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsLocalizaCpfTEL_CELULAR_01: TStringField
      FieldName = 'TEL_CELULAR_01'
      Size = 15
    end
    object cdsLocalizaCpfTEL_CELULAR_02: TStringField
      FieldName = 'TEL_CELULAR_02'
      Size = 15
    end
    object cdsLocalizaCpfTEL_RESIDENCIA: TStringField
      FieldName = 'TEL_RESIDENCIA'
      Size = 15
    end
    object cdsLocalizaCpfTEL_TERCEIRO: TStringField
      FieldName = 'TEL_TERCEIRO'
      Size = 15
    end
    object cdsLocalizaCpfRAMAL_TERCEIRO: TStringField
      FieldName = 'RAMAL_TERCEIRO'
      Size = 5
    end
    object cdsLocalizaCpfPARENTESCO_TERCEIRO: TStringField
      FieldName = 'PARENTESCO_TERCEIRO'
      Size = 50
    end
    object cdsLocalizaCpfEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsLocalizaCpfDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsLocalizaCpfATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object cdsLocalizaCpfUSUARIO_SISTEMA: TIntegerField
      FieldName = 'USUARIO_SISTEMA'
    end
    object cdsLocalizaCpfTIPO: TStringField
      FieldName = 'TIPO'
      Size = 10
    end
    object cdsLocalizaCpfDIGITAL: TMemoField
      FieldName = 'DIGITAL'
      BlobType = ftMemo
    end
  end
  object sqlLocalizaProcessamento: TSQLDataSet
    CommandText = 'select * from TB_PROCESSAMENTO_STATUS_SEL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 635
    Top = 212
  end
  object dspLocalizaProcessamento: TDataSetProvider
    DataSet = sqlLocalizaProcessamento
    Left = 637
    Top = 264
  end
  object cdsLocalizaProcessamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocalizaProcessamento'
    Left = 640
    Top = 314
    object cdsLocalizaProcessamentoDT_PROCESSAMENTO: TDateField
      FieldName = 'DT_PROCESSAMENTO'
    end
    object cdsLocalizaProcessamentoSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 50
    end
  end
  object sqlLocalizaSaldo: TSQLDataSet
    CommandText = 'select * from TB_CARTAO_SALDO_SEL (:p_id_cartao)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'p_id_cartao'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 504
    Top = 214
  end
  object dspLocalizaSaldo: TDataSetProvider
    DataSet = sqlLocalizaSaldo
    Left = 506
    Top = 265
  end
  object cdsLocalizaSaldo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'p_id_cartao'
        ParamType = ptInput
      end>
    ProviderName = 'dspLocalizaSaldo'
    Left = 510
    Top = 312
    object cdsLocalizaSaldoN_CARTAO: TFMTBCDField
      FieldName = 'N_CARTAO'
      Precision = 15
      Size = 0
    end
    object cdsLocalizaSaldoDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsLocalizaSaldoQTDE_SALDO_PONTOS: TFloatField
      FieldName = 'QTDE_SALDO_PONTOS'
    end
  end
  object sqlLocalizaUsuario: TSQLDataSet
    CommandText = 'select * from tb_usuario_sel(:p_cpf)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'p_cpf'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 762
    Top = 16
  end
  object dspLocalizaUsuario: TDataSetProvider
    DataSet = sqlLocalizaUsuario
    Left = 764
    Top = 65
  end
  object cdsLocalizaUsuario: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'p_cpf'
        ParamType = ptInput
      end>
    ProviderName = 'dspLocalizaUsuario'
    Left = 767
    Top = 112
    object cdsLocalizaUsuarioID: TIntegerField
      FieldName = 'ID'
    end
    object cdsLocalizaUsuarioCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsLocalizaUsuarioNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsLocalizaUsuarioDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
    object cdsLocalizaUsuarioIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
    end
    object cdsLocalizaUsuarioOE: TStringField
      FieldName = 'OE'
      Size = 10
    end
    object cdsLocalizaUsuarioNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      Size = 100
    end
    object cdsLocalizaUsuarioNOME_PAI: TStringField
      FieldName = 'NOME_PAI'
      Size = 100
    end
    object cdsLocalizaUsuarioCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object cdsLocalizaUsuarioLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 200
    end
    object cdsLocalizaUsuarioBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 50
    end
    object cdsLocalizaUsuarioCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object cdsLocalizaUsuarioUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsLocalizaUsuarioTEL_CELULAR_01: TStringField
      FieldName = 'TEL_CELULAR_01'
      Size = 15
    end
    object cdsLocalizaUsuarioTEL_CELULAR_02: TStringField
      FieldName = 'TEL_CELULAR_02'
      Size = 15
    end
    object cdsLocalizaUsuarioTEL_RESIDENCIA: TStringField
      FieldName = 'TEL_RESIDENCIA'
      Size = 15
    end
    object cdsLocalizaUsuarioEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsLocalizaUsuarioDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsLocalizaUsuarioATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object cdsLocalizaUsuarioUSUARIO_SISTEMA: TIntegerField
      FieldName = 'USUARIO_SISTEMA'
    end
    object cdsLocalizaUsuarioSENHA: TStringField
      FieldName = 'SENHA'
      Size = 11
    end
    object cdsLocalizaUsuarioID_PERFIL: TIntegerField
      FieldName = 'ID_PERFIL'
    end
    object cdsLocalizaUsuarioPERFIL: TStringField
      FieldName = 'PERFIL'
      Size = 50
    end
  end
end
