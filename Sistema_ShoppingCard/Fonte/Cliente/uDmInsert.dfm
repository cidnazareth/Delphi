object dmInsert: TdmInsert
  OldCreateOrder = False
  Left = 629
  Top = 174
  Height = 269
  Width = 360
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
    SQLConnection = dmCliente.SQLConnecShoppCard
    Left = 53
    Top = 30
  end
  object sqlVoucherIns: TSQLDataSet
    CommandText = 'TB_VOUCHER_INS'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PRODUTO'
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
    SQLConnection = dmCliente.SQLConnecShoppCard
    Left = 159
    Top = 30
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
    SQLConnection = dmCliente.SQLConnecShoppCard
    Left = 55
    Top = 104
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
    SQLConnection = dmCliente.SQLConnecShoppCard
    Left = 165
    Top = 106
  end
end
