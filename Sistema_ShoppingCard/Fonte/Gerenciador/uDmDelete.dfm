object dmDelete: TdmDelete
  OldCreateOrder = False
  Left = 370
  Top = 170
  Height = 226
  Width = 291
  object sqlPerfilMenuDel: TSQLDataSet
    CommandText = 'TB_PERFILMENU_DEL'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PERFIL'
        ParamType = ptInput
      end>
    SQLConnection = dmGlobal.SQLConnecShopCard
    Left = 40
    Top = 24
  end
end
