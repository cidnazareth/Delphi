object dmCliente: TdmCliente
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 528
  Top = 250
  Height = 384
  Width = 788
  object sqlProdutosPromocao: TSQLDataSet
    CommandText = 
      'select pp.*, pp.qtde_produto-pp.qtde_cupom_emitido as Disponivel' +
      ', ls.cnpj, ls.nome_fantasia, ls.numero_loja'#13#10'from tb_produto_pro' +
      'mocao_sel (:p_cnpj, :p_id) pp'#13#10'inner join tb_lojas_shopping ls'#13#10 +
      'on pp.id_loja = ls.id'#13#10' where (pp.qtde_produto > pp.qtde_cupom_e' +
      'mitido)'#13#10' and   ('#13#10'            (pp.ativado_periodo = '#39'S'#39' and cur' +
      'rent_date between pp.data_inicio and pp.data_fim)'#13#10'         or'#13#10 +
      '             (pp.ativado_periodo = '#39'N'#39')'#13#10'           )'#13#10' order by' +
      ' pp.Qtde_Pontos'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'P_CNPJ'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_ID'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnecShoppCard
    Left = 377
    Top = 8
  end
  object dspProdutosPromocao: TDataSetProvider
    DataSet = sqlProdutosPromocao
    Left = 377
    Top = 55
  end
  object cdsProdutosPromocao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'P_CNPJ'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspProdutosPromocao'
    Left = 377
    Top = 104
    object cdsProdutosPromocaoID: TIntegerField
      FieldName = 'ID'
    end
    object cdsProdutosPromocaoID_LOJA: TIntegerField
      FieldName = 'ID_LOJA'
    end
    object cdsProdutosPromocaoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 100
    end
    object cdsProdutosPromocaoQTDE_PONTOS: TFloatField
      FieldName = 'QTDE_PONTOS'
    end
    object cdsProdutosPromocaoQTDE_PRODUTO: TIntegerField
      FieldName = 'QTDE_PRODUTO'
    end
    object cdsProdutosPromocaoATIVADO_PERIODO: TStringField
      FieldName = 'ATIVADO_PERIODO'
      Size = 1
    end
    object cdsProdutosPromocaoDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
    end
    object cdsProdutosPromocaoDATA_FIM: TDateField
      FieldName = 'DATA_FIM'
    end
    object cdsProdutosPromocaoPATH_IMAGEM: TStringField
      FieldName = 'PATH_IMAGEM'
      Size = 200
    end
    object cdsProdutosPromocaoATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object cdsProdutosPromocaoDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsProdutosPromocaoQTDE_CUPOM_EMITIDO: TIntegerField
      FieldName = 'QTDE_CUPOM_EMITIDO'
    end
    object cdsProdutosPromocaoDESTAQUE: TStringField
      FieldName = 'DESTAQUE'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosPromocaoDISPONIVEL: TFMTBCDField
      FieldName = 'DISPONIVEL'
      ReadOnly = True
      Precision = 15
      Size = 0
    end
    object cdsProdutosPromocaoCNPJ: TStringField
      FieldName = 'CNPJ'
      ReadOnly = True
      Required = True
      Size = 18
    end
    object cdsProdutosPromocaoNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      ReadOnly = True
      Size = 100
    end
    object cdsProdutosPromocaoNUMERO_LOJA: TStringField
      FieldName = 'NUMERO_LOJA'
      ReadOnly = True
      Required = True
      Size = 10
    end
  end
  object sqlImgStandBy: TSQLDataSet
    CommandText = 'select * from tb_img_stand_by_sel'#13#10'order by id'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnecShoppCard
    Left = 712
    Top = 184
  end
  object dspImgStandBy: TDataSetProvider
    DataSet = sqlImgStandBy
    Left = 712
    Top = 232
  end
  object cdsImgStandBy: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspImgStandBy'
    Left = 712
    Top = 280
    object cdsImgStandByID: TIntegerField
      FieldName = 'ID'
    end
    object cdsImgStandByDESC_IMAGEM: TStringField
      FieldName = 'DESC_IMAGEM'
      Size = 100
    end
    object cdsImgStandByPATH_IMAGEM: TStringField
      FieldName = 'PATH_IMAGEM'
      Size = 200
    end
    object cdsImgStandByDT_INICIO: TDateField
      FieldName = 'DT_INICIO'
    end
    object cdsImgStandByDT_FIM: TDateField
      FieldName = 'DT_FIM'
    end
    object cdsImgStandByATIVA: TStringField
      FieldName = 'ATIVA'
      Size = 1
    end
    object cdsImgStandByTEMPO_EXIBICAO: TIntegerField
      FieldName = 'TEMPO_EXIBICAO'
    end
    object cdsImgStandByDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsImgStandByUSUARIO_SISTEMA: TIntegerField
      FieldName = 'USUARIO_SISTEMA'
    end
  end
  object cdsLojas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'P_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_CNPJ'
        ParamType = ptInput
      end>
    ProviderName = 'dspLojas'
    Left = 466
    Top = 105
    object cdsLojasID: TIntegerField
      FieldName = 'ID'
    end
    object cdsLojasID_SHOPPING: TIntegerField
      FieldName = 'ID_SHOPPING'
    end
    object cdsLojasCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object cdsLojasRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 150
    end
    object cdsLojasNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 100
    end
    object cdsLojasCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 100
    end
    object cdsLojasTELEFONE_01: TStringField
      FieldName = 'TELEFONE_01'
      Size = 15
    end
    object cdsLojasTELEFONE_02: TStringField
      FieldName = 'TELEFONE_02'
      Size = 15
    end
    object cdsLojasRAMAL: TStringField
      FieldName = 'RAMAL'
      Size = 5
    end
    object cdsLojasCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 15
    end
    object cdsLojasEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 200
    end
    object cdsLojasNUMERO_LOJA: TStringField
      FieldName = 'NUMERO_LOJA'
      Size = 10
    end
    object cdsLojasATIVA: TStringField
      FieldName = 'ATIVA'
      Size = 1
    end
    object cdsLojasDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsLojasUSUARIO_SISTEMA: TIntegerField
      FieldName = 'USUARIO_SISTEMA'
    end
  end
  object dspLojas: TDataSetProvider
    DataSet = sqlLojas
    Left = 466
    Top = 56
  end
  object sqlLojas: TSQLDataSet
    CommandText = 'select * from TB_LOJAS_SHOPPING_SEL(:P_ID, :P_CNPJ)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'P_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_CNPJ'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnecShoppCard
    Left = 466
    Top = 7
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
    SQLConnection = SQLConnecShoppCard
    Left = 541
    Top = 7
  end
  object dspConsultaExtrato: TDataSetProvider
    DataSet = sqlConsultaExtrato
    Left = 542
    Top = 56
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
    Left = 543
    Top = 105
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
    SQLConnection = SQLConnecShoppCard
    Left = 120
    Top = 186
  end
  object dspConsultaDigital: TDataSetProvider
    DataSet = sqlConsultaDigital
    Left = 122
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
    Left = 122
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
    SQLConnection = SQLConnecShoppCard
    Left = 267
    Top = 9
  end
  object dspLocalizaCartao: TDataSetProvider
    DataSet = sqlLocalizaCartao
    Left = 268
    Top = 56
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
    Left = 268
    Top = 104
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
  object sqlLocalizaCpf: TSQLDataSet
    CommandText = 'SELECT * FROM PR_CONSULTA_CPF (:CPF)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'P_CPF'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnecShoppCard
    Left = 179
    Top = 8
  end
  object dspLocalizaCpf: TDataSetProvider
    DataSet = sqlLocalizaCpf
    Left = 180
    Top = 56
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
    Left = 182
    Top = 104
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
  object sqlConsTipoMovimento: TSQLDataSet
    CommandText = 'select * from tb_tipo_movimento_sel(:p_id)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'p_id'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnecShoppCard
    Left = 233
    Top = 185
  end
  object dspConsTipoMovimento: TDataSetProvider
    DataSet = sqlConsTipoMovimento
    Left = 235
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
    Left = 238
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
  object sqlPremioSorteio: TSQLDataSet
    CommandText = 'Select * from pr_consulta_premios'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnecShoppCard
    Left = 377
    Top = 186
  end
  object dspPremioSorteio: TDataSetProvider
    DataSet = sqlPremioSorteio
    Left = 377
    Top = 233
  end
  object cdsPremioSorteio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPremioSorteio'
    Left = 377
    Top = 282
    object cdsPremioSorteioID: TIntegerField
      FieldName = 'ID'
    end
    object cdsPremioSorteioID_SORTEIO: TIntegerField
      FieldName = 'ID_SORTEIO'
    end
    object cdsPremioSorteioORDEM_PREMIO: TIntegerField
      FieldName = 'ORDEM_PREMIO'
    end
    object cdsPremioSorteioDESC_PREMIO: TStringField
      FieldName = 'DESC_PREMIO'
      Size = 100
    end
    object cdsPremioSorteioVALOR_FISCAL_PREMIO: TFloatField
      FieldName = 'VALOR_FISCAL_PREMIO'
    end
    object cdsPremioSorteioQTDE_PONTOS_CUPOM: TFloatField
      FieldName = 'QTDE_PONTOS_CUPOM'
    end
    object cdsPremioSorteioPATH_IMAGEM: TStringField
      FieldName = 'PATH_IMAGEM'
      Size = 200
    end
    object cdsPremioSorteioOBS_PREMIO: TMemoField
      FieldName = 'OBS_PREMIO'
      BlobType = ftMemo
    end
    object cdsPremioSorteioDT_INICIO: TDateField
      FieldName = 'DT_INICIO'
    end
    object cdsPremioSorteioDT_FIM: TDateField
      FieldName = 'DT_FIM'
    end
    object cdsPremioSorteioDT_SORTEIO: TDateField
      FieldName = 'DT_SORTEIO'
    end
    object cdsPremioSorteioDESC_SORTEIO: TStringField
      FieldName = 'DESC_SORTEIO'
      Size = 100
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
    SQLConnection = SQLConnecShoppCard
    Left = 650
    Top = 7
  end
  object dspConsultaParametros: TDataSetProvider
    DataSet = sqlConsultaParametros
    Left = 652
    Top = 55
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
    Left = 654
    Top = 105
    object cdsConsultaParametrosVALOR: TStringField
      FieldName = 'VALOR'
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
    SQLConnection = SQLConnecShoppCard
    Left = 487
    Top = 185
  end
  object dspLocalizaCupomSorteio: TDataSetProvider
    DataSet = sqlLocalizaCupomSorteio
    Left = 490
    Top = 233
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
    Left = 491
    Top = 282
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
  object SQLConnecShoppCard: TSQLConnection
    ConnectionName = 'shoppingCard_local'
    DriverName = 'UIB FireBird15'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpUIBfire15.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=UIB FireBird15'
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=E:\SHOPPINGCARD_DB\DBSHOPCARD.FDB'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet='
      'SQLDialect=3'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=SYSDBA'
      'WaitOnLocks=True')
    VendorLib = 'fbclient.dll'
    Left = 56
    Top = 32
  end
end
