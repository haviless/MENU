object FAccesoTablas: TFAccesoTablas
  Left = 316
  Top = 56
  Width = 1005
  Height = 700
  Caption = 'Accesos de Usuarios a Codigos de Tablas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCodigo: TPanel
    Left = 1
    Top = 389
    Width = 993
    Height = 273
    Caption = 'pnlCodigo'
    Color = clSkyBlue
    TabOrder = 0
    object Label1: TLabel
      Left = 445
      Top = 14
      Width = 33
      Height = 13
      Caption = 'Campo'
    end
    object dbgTablas: TwwDBGrid
      Left = 7
      Top = 34
      Width = 292
      Height = 230
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DMACC.dsTmp
      KeyOptions = []
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = True
      OnTitleButtonClick = dbgTablasTitleButtonClick
      OnDblClick = dbgTablasDblClick
    end
    object bbtnTablas: TBitBtn
      Left = 9
      Top = 6
      Width = 115
      Height = 25
      Caption = 'Tablas Seleccionadas'
      TabOrder = 1
      OnClick = bbtnTablasClick
    end
    object dbgAccesos: TwwDBGrid
      Left = 704
      Top = 34
      Width = 275
      Height = 230
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DMACC.DSDOCID
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ReadOnly = True
      TabOrder = 2
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
    end
    object bbtnAccCod: TBitBtn
      Left = 713
      Top = 6
      Width = 118
      Height = 25
      Caption = 'Acessos a Usuario'
      TabOrder = 3
      OnClick = bbtnAccCodClick
    end
    object meTabla: TMaskEdit
      Left = 127
      Top = 7
      Width = 81
      Height = 21
      TabOrder = 4
    end
    object dbgDatos: TwwDBGrid
      Left = 333
      Top = 34
      Width = 292
      Height = 230
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DMACC.DSTIPCAM
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ReadOnly = True
      TabOrder = 5
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = True
      OnTitleButtonClick = dbgDatosTitleButtonClick
    end
    object bbtnCodigos: TBitBtn
      Left = 338
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Codigos'
      TabOrder = 6
      OnClick = bbtnCodigosClick
    end
    object meCodigo: TMaskEdit
      Left = 484
      Top = 8
      Width = 81
      Height = 21
      TabOrder = 7
    end
    object bbtnInserta: TBitBtn
      Left = 651
      Top = 128
      Width = 31
      Height = 25
      Caption = '-->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = bbtnInsertaClick
    end
    object bbtnElimina: TBitBtn
      Left = 651
      Top = 192
      Width = 31
      Height = 25
      Caption = '<--'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = bbtnEliminaClick
    end
    object pnlTablas: TPanel
      Left = 792
      Top = 88
      Width = 653
      Height = 266
      BevelInner = bvRaised
      TabOrder = 10
      Visible = False
      object dbgTablaSel: TwwDBGrid
        Left = 68
        Top = 32
        Width = 292
        Height = 223
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = DMACC.dsTablas
        KeyOptions = []
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = True
        OnTitleButtonClick = dbgTablaSelTitleButtonClick
        OnDblClick = dbgTablasDblClick
      end
      object bbtnTablaAdd: TBitBtn
        Left = 18
        Top = 84
        Width = 26
        Height = 25
        Caption = '<--'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = bbtnTablaAddClick
      end
      object bbtnTablaDel: TBitBtn
        Left = 18
        Top = 148
        Width = 26
        Height = 25
        Caption = '-->'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = bbtnTablaDelClick
      end
      object Cerrar: TBitBtn
        Left = 382
        Top = 221
        Width = 75
        Height = 25
        Caption = 'Cerrar'
        TabOrder = 3
        OnClick = CerrarClick
      end
      object bbtnTablasSel: TBitBtn
        Left = 70
        Top = 5
        Width = 104
        Height = 25
        Caption = 'Tablas del Sistema'
        TabOrder = 4
        OnClick = bbtnTablasSelClick
      end
    end
  end
  object bbtnAsigna: TBitBtn
    Left = 248
    Top = 395
    Width = 53
    Height = 25
    Caption = 'Asignar'
    TabOrder = 1
    OnClick = bbtnAsignaClick
  end
  object pnlCab1: TPanel
    Left = 1
    Top = 1
    Width = 993
    Height = 351
    Color = clSkyBlue
    TabOrder = 2
    object Label3: TLabel
      Left = 10
      Top = 329
      Width = 75
      Height = 13
      Caption = 'Usuario Destino'
    end
    object Label4: TLabel
      Left = 30
      Top = 5
      Width = 155
      Height = 18
      Caption = 'Usuario Seleccionado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 329
      Top = 5
      Width = 153
      Height = 18
      Caption = 'M'#243'dulo Seleccionado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 789
      Top = 5
      Width = 169
      Height = 18
      Caption = 'Compa'#241#237'a Seleccionada'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgUsuarios: TwwDBGrid
      Left = 8
      Top = 90
      Width = 250
      Height = 230
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DMACC.dsUsuarios
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = True
      OnTitleButtonClick = dbgUsuariosTitleButtonClick
      OnDblClick = dbgUsuariosDblClick
    end
    object bbtnUsuarios: TBitBtn
      Left = 10
      Top = 60
      Width = 151
      Height = 25
      Caption = 'Usuarios Del Sistema'
      TabOrder = 1
      OnClick = bbtnUsuariosClick
    end
    object bbtnModulo: TBitBtn
      Left = 282
      Top = 60
      Width = 108
      Height = 25
      Caption = 'Modulos del Sistema'
      TabOrder = 2
      OnClick = bbtnModuloClick
    end
    object dbgModulos: TwwDBGrid
      Left = 280
      Top = 90
      Width = 215
      Height = 230
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DMACC.dsQry66
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ReadOnly = True
      TabOrder = 3
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = True
      OnTitleButtonClick = dbgModulosTitleButtonClick
      OnDblClick = dbgModulosDblClick
    end
    object meUsuario: TMaskEdit
      Left = 32
      Top = 22
      Width = 147
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object meModulo: TMaskEdit
      Left = 344
      Top = 22
      Width = 117
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object meUsuDes: TMaskEdit
      Left = 99
      Top = 325
      Width = 91
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 6
    end
    object BitBtn3: TBitBtn
      Left = 203
      Top = 325
      Width = 53
      Height = 23
      Hint = 'Copiaar los Codigo del Usuario Origen al Usuario Destino'
      Caption = 'Copiar'
      TabOrder = 7
      OnClick = BitBtn3Click
    end
    object pnlCia: TPanel
      Left = 508
      Top = 52
      Width = 480
      Height = 276
      Color = 15835290
      TabOrder = 8
      object dbgCia: TwwDBGrid
        Left = 8
        Top = 37
        Width = 210
        Height = 230
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = DMACC.dsCia
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
      end
      object bbtnCia: TBitBtn
        Left = 10
        Top = 7
        Width = 153
        Height = 25
        Caption = 'Compa'#241#237'as de la Empresa'
        TabOrder = 1
        OnClick = bbtnCiaClick
      end
      object dbgCiaSelecc: TwwDBGrid
        Left = 255
        Top = 37
        Width = 216
        Height = 230
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = DMACC.dsCiaSelec
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        OnDblClick = dbgCiaSeleccDblClick
      end
      object bbtnCiaSelecc: TBitBtn
        Left = 256
        Top = 7
        Width = 129
        Height = 25
        Caption = 'Compa'#241#237'as Asignadas'
        TabOrder = 3
        OnClick = bbtnCiaSeleccClick
      end
      object bbtnCiaAdd: TBitBtn
        Left = 225
        Top = 108
        Width = 26
        Height = 25
        Caption = '-->'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = bbtnCiaAddClick
      end
      object bbtnCiaDel: TBitBtn
        Left = 225
        Top = 172
        Width = 26
        Height = 25
        Caption = '<--'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = bbtnCiaDelClick
      end
    end
    object meCia: TMaskEdit
      Left = 838
      Top = 22
      Width = 76
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
    end
    object bbtnRep: TBitBtn
      Left = 222
      Top = 59
      Width = 35
      Height = 25
      Hint = 'Imprime Accesos por Usuario'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = bbtnRepClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
  end
  object Panel1: TPanel
    Left = 318
    Top = 354
    Width = 276
    Height = 33
    BevelInner = bvRaised
    TabOrder = 3
    object Label2: TLabel
      Left = 9
      Top = 8
      Width = 43
      Height = 16
      Caption = 'Buscar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblBusca: TLabel
      Left = 69
      Top = 8
      Width = 43
      Height = 16
      Caption = 'Buscar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object isBusca: TwwIncrementalSearch
      Left = 142
      Top = 6
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
  end
  object ppdbAcc: TppDBPipeline
    DataSource = DMACC.dsReporte
    UserName = 'dbAcc'
    Left = 225
    Top = 97
  end
  object pprAcc: TppReport
    AutoStop = False
    DataPipeline = ppdbAcc
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 10000
    PrinterSetup.mmMarginLeft = 20000
    PrinterSetup.mmMarginRight = 10000
    PrinterSetup.mmMarginTop = 10000
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\Documents and Settings\hnoriega\Escritorio\ss.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 225
    Top = 137
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbAcc'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 15081
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Accesos a Modulos del Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 66411
        mmTop = 265
        mmWidth = 53181
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 167217
        mmTop = 265
        mmWidth = 14023
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 167217
        mmTop = 3969
        mmWidth = 17463
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 167217
        mmTop = 8202
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'DERRAMA MAGISTERIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 529
        mmTop = 265
        mmWidth = 38820
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 265
        mmTop = 13494
        mmWidth = 185473
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'MODULO'
        DataPipeline = ppdbAcc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppdbAcc'
        mmHeight = 3598
        mmLeft = 49213
        mmTop = 794
        mmWidth = 48154
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'OPCION'
        DataPipeline = ppdbAcc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbAcc'
        mmHeight = 3704
        mmLeft = 103188
        mmTop = 794
        mmWidth = 37835
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'MODULOID'
        DataPipeline = ppdbAcc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppdbAcc'
        mmHeight = 3598
        mmLeft = 34131
        mmTop = 794
        mmWidth = 6011
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'GRUPOID'
        DataPipeline = ppdbAcc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppdbAcc'
        mmHeight = 3598
        mmLeft = 1852
        mmTop = 794
        mmWidth = 12869
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'ESTADO'
        DataPipeline = ppdbAcc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbAcc'
        mmHeight = 3704
        mmLeft = 145521
        mmTop = 794
        mmWidth = 38629
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'USERID'
      DataPipeline = ppdbAcc
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbAcc'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'USERID'
          DataPipeline = ppdbAcc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbAcc'
          mmHeight = 3598
          mmLeft = 17198
          mmTop = 2117
          mmWidth = 27517
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'USERNOM'
          DataPipeline = ppdbAcc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbAcc'
          mmHeight = 3704
          mmLeft = 48948
          mmTop = 2117
          mmWidth = 59796
          BandType = 3
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'TIPO_USUARIO'
          DataPipeline = ppdbAcc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbAcc'
          mmHeight = 3704
          mmLeft = 143404
          mmTop = 2117
          mmWidth = 40746
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Usuario :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 2910
          mmTop = 2117
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Nivel :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 132557
          mmTop = 2117
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 15610
        mmPrintPosition = 0
        object ppSubReport1: TppSubReport
          UserName = 'SubReport1'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppdbAcc2'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 4233
          mmWidth = 186000
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = ppdbAcc2
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
            PrinterSetup.PaperName = 'Carta'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 10000
            PrinterSetup.mmMarginLeft = 20000
            PrinterSetup.mmMarginRight = 10000
            PrinterSetup.mmMarginTop = 10000
            PrinterSetup.mmPaperHeight = 279000
            PrinterSetup.mmPaperWidth = 216000
            PrinterSetup.PaperSize = 1
            Units = utMillimeters
            Version = '7.02'
            mmColumnWidth = 0
            DataPipelineName = 'ppdbAcc2'
            object ppTitleBand1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 7673
              mmPrintPosition = 0
              object ppLine2: TppLine
                UserName = 'Line2'
                Weight = 0.750000000000000000
                mmHeight = 1852
                mmLeft = 265
                mmTop = 3969
                mmWidth = 185209
                BandType = 1
              end
            end
            object ppDetailBand2: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5292
              mmPrintPosition = 0
              object ppDBText9: TppDBText
                UserName = 'DBText9'
                AutoSize = True
                DataField = 'COMPA'#209'IA'
                DataPipeline = ppdbAcc2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = []
                SuppressRepeatedValues = True
                Transparent = True
                DataPipelineName = 'ppdbAcc2'
                mmHeight = 3598
                mmLeft = 46302
                mmTop = 1058
                mmWidth = 64008
                BandType = 4
              end
              object ppDBText10: TppDBText
                UserName = 'DBText10'
                AutoSize = True
                DataField = 'CIAID'
                DataPipeline = ppdbAcc2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = []
                SuppressRepeatedValues = True
                Transparent = True
                DataPipelineName = 'ppdbAcc2'
                mmHeight = 3704
                mmLeft = 38894
                mmTop = 1058
                mmWidth = 3440
                BandType = 4
              end
              object ppDBText11: TppDBText
                UserName = 'DBText11'
                DataField = 'MODULO'
                DataPipeline = ppdbAcc2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = []
                SuppressRepeatedValues = True
                Transparent = True
                DataPipelineName = 'ppdbAcc2'
                mmHeight = 3704
                mmLeft = 1058
                mmTop = 1058
                mmWidth = 34131
                BandType = 4
              end
              object ppDBText12: TppDBText
                UserName = 'DBText12'
                DataField = 'TABLAS'
                DataPipeline = ppdbAcc2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppdbAcc2'
                mmHeight = 3704
                mmLeft = 118004
                mmTop = 1058
                mmWidth = 37042
                BandType = 4
              end
              object ppDBText13: TppDBText
                UserName = 'DBText13'
                DataField = 'CODSEL'
                DataPipeline = ppdbAcc2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppdbAcc2'
                mmHeight = 3704
                mmLeft = 158486
                mmTop = 1058
                mmWidth = 26458
                BandType = 4
              end
            end
            object ppSummaryBand1: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 13229
              mmPrintPosition = 0
            end
            object ppGroup4: TppGroup
              BreakName = 'MODULO'
              DataPipeline = ppdbAcc2
              KeepTogether = True
              OutlineSettings.CreateNode = True
              UserName = 'Group4'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'ppdbAcc2'
              object ppGroupHeaderBand4: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 2646
                mmPrintPosition = 0
              end
              object ppGroupFooterBand4: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 5556
                mmPrintPosition = 0
              end
            end
            object ppGroup5: TppGroup
              BreakName = 'CIAID'
              DataPipeline = ppdbAcc2
              KeepTogether = True
              OutlineSettings.CreateNode = True
              UserName = 'Group5'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'ppdbAcc2'
              object ppGroupHeaderBand5: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object ppGroupFooterBand5: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 2381
                mmPrintPosition = 0
              end
            end
          end
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'GRUPOID'
      DataPipeline = ppdbAcc
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbAcc'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'MODULOID'
      DataPipeline = ppdbAcc
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbAcc'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 2646
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppdAcc: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = pprAcc
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 225
    Top = 177
  end
  object ppdbAcc2: TppDBPipeline
    DataSource = DMACC.dsRepDet
    UserName = 'dbAcc2'
    Left = 185
    Top = 97
  end
end
