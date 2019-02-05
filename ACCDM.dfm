object DMACC: TDMACC
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 443
  Top = 254
  Height = 416
  Width = 581
  object DCOM1: TSocketConnection
    ServerName = 'DMACCSrv.SrvDMAcceso'
    Left = 32
    Top = 16
  end
  object cdsQry: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 102
    Top = 19
  end
  object dsQry: TwwDataSource
    DataSet = cdsQry
    Left = 105
    Top = 35
  end
  object cdsUsuarios: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'USERID'
    Params = <>
    ProviderName = 'dspUsuario'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 177
    Top = 96
  end
  object dsUsuarios: TwwDataSource
    DataSet = cdsUsuarios
    Left = 177
    Top = 121
  end
  object cdsUser: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'USERID'
    Params = <>
    ProviderName = 'dspUser'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 112
    Top = 96
  end
  object dsUser: TwwDataSource
    DataSet = cdsUser
    Left = 112
    Top = 121
  end
  object cdsMGrupo: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'GRUPOID'
    Params = <>
    ProviderName = 'dspMGrupo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 58
    Top = 96
  end
  object dsMGrupo: TwwDataSource
    DataSet = cdsMGrupo
    Left = 58
    Top = 121
  end
  object cdsGrupos: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupos'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 300
    Top = 96
  end
  object dsGrupos: TwwDataSource
    DataSet = cdsGrupos
    Left = 300
    Top = 121
  end
  object cdsAcceso: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAcceso'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 238
    Top = 96
  end
  object dsAcceso: TwwDataSource
    DataSet = cdsAcceso
    Left = 238
    Top = 121
  end
  object cdsQry1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 190
    Top = 19
  end
  object dsQry1: TwwDataSource
    DataSet = cdsQry1
    Left = 193
    Top = 35
  end
  object cdsModulos: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 371
    Top = 97
  end
  object dsModulos: TwwDataSource
    DataSet = cdsModulos
    Left = 371
    Top = 122
  end
  object cdsVerificaOPC: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 278
    Top = 19
  end
  object dsVerificaOPC: TwwDataSource
    DataSet = cdsVerificaOPC
    Left = 281
    Top = 35
  end
  object cdsConsulta: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 46
    Top = 187
  end
  object dsConsulta: TwwDataSource
    DataSet = cdsConsulta
    Left = 49
    Top = 203
  end
  object wwClientDataSet1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 174
    Top = 187
  end
  object wwDataSource1: TwwDataSource
    DataSet = wwClientDataSet1
    Left = 177
    Top = 203
  end
  object cdsTmp: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 280
    Top = 184
  end
  object dsTmp: TwwDataSource
    DataSet = cdsTmp
    Left = 280
    Top = 200
  end
  object cdsQry6: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 360
    Top = 188
  end
  object dsQry6: TwwDataSource
    DataSet = cdsQry6
    Left = 360
    Top = 200
  end
  object DSDOCID: TwwDataSource
    DataSet = CDSDOCID
    Left = 448
    Top = 104
  end
  object CDSDOCID: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAcceso'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 448
    Top = 88
  end
  object CDSTIPCAM: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 448
    Top = 184
  end
  object DSTIPCAM: TwwDataSource
    DataSet = CDSTIPCAM
    Left = 448
    Top = 200
  end
  object cdsCia: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 54
    Top = 283
  end
  object dsCia: TwwDataSource
    DataSet = cdsCia
    Left = 57
    Top = 299
  end
  object cdsCiaSelec: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUser'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 150
    Top = 283
  end
  object dsCiaSelec: TwwDataSource
    DataSet = cdsCiaSelec
    Left = 153
    Top = 299
  end
  object cdsTablas: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUser'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 246
    Top = 283
  end
  object dsTablas: TwwDataSource
    DataSet = cdsTablas
    Left = 249
    Top = 299
  end
  object cdsBusca: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 366
    Top = 275
  end
  object dsBusca: TwwDataSource
    DataSet = cdsBusca
    Left = 369
    Top = 291
  end
  object cdsQry66: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 464
    Top = 276
  end
  object dsQry66: TwwDataSource
    DataSet = cdsQry66
    Left = 464
    Top = 288
  end
  object cdsReporte: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 382
    Top = 19
  end
  object dsReporte: TwwDataSource
    DataSet = cdsReporte
    Left = 385
    Top = 35
  end
  object cdsRepDet: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 470
    Top = 19
  end
  object dsRepDet: TwwDataSource
    DataSet = cdsRepDet
    Left = 473
    Top = 35
  end
end
