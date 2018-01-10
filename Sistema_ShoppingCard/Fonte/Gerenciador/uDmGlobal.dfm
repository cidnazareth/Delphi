object dmGlobal: TdmGlobal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 496
  Top = 218
  Height = 249
  Width = 705
  object SQLConnecShopCard: TSQLConnection
    ConnectionName = 'shoppingcard'
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
    Top = 40
  end
end
