object FCPassw: TFCPassw
  Left = 378
  Top = 181
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'SisDema'
  ClientHeight = 326
  ClientWidth = 352
  Color = clSilver
  Constraints.MaxHeight = 364
  Constraints.MaxWidth = 368
  Constraints.MinHeight = 360
  Constraints.MinWidth = 360
  DefaultMonitor = dmMainForm
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    00000000000000000000000000000008FFF00000000000000000000000000088
    7777000000000000000000000000008800770F00000000000000000000000880
    88F70FFF0000000000000000000008808880FFFFF00000000000000000000888
    000FFF8FFFF0000000000000000007888800F8088FFF00000000000000000078
    888800F0088F8800000000000000000077700FFFF00888880000000000000000
    000FFFFFFFF088800000000000000000000000FFF8880008BBBBBB8800000000
    000000000800BBBBBBBBBBBBB80000000000000000BBBBBBBBBBBBBBBBB00000
    00000000BBBBBBBBB0000BBBBBB00000000000BB87000000000BB0BBBB800000
    000000008B8BBBBBBBBBB00BB80000000000BBBBBBBBBBBBBBBBBBB000000000
    00BBBBBB0000000000BBB0BB0F000000BBBBB0008888888870BB0B0B0FF0000B
    BBB00888BBBBBBB070BB0BB00FF0000BB0088BBBBBBBBBB070BB0B700000000B
    088BBBBBBBBBBB070BB0BB00000000008BBBBBBBBBBBBB070BB0BB0000000000
    0BBBBBBBBBBBB070BB0BB7000000000008BBBBBBBBBBB070BB0BB00000000000
    008BBBBBBBBB070BB0BB0000000000000000BBBBBBB070BB0BB0000000000000
    0000088888070BB0B0000000000000000000000000BBBB000000000000000000
    00000000BBBB000000000000000000000000000000000000000000000000E07F
    FFFFC01FFFFF8007FFFF8003FFFF0000FFFF00007FFF00001FFF000007FF8000
    03FFC0000007F0000001FC000000FFC00000FFE00000FFC00000FF800000FE00
    0001F8000000F0000000E0000000C0000000C0000009C000000FC000000FF000
    001FF000003FF800007FFC0000FFFF0001FFFF8007FFFFC03FFFFFF0FFFF}
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 15
  object Label3: TLabel
    Left = 12
    Top = 1
    Width = 224
    Height = 30
    Caption = 'Cambio de Contrase'#241'a'
    Color = 5131930
    Font.Charset = ANSI_CHARSET
    Font.Color = clTeal
    Font.Height = -21
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object pnlRegistro: TPanel
    Left = 8
    Top = 32
    Width = 336
    Height = 113
    BevelWidth = 2
    Color = 15329769
    TabOrder = 0
    object lblUsuario: TLabel
      Left = 16
      Top = 13
      Width = 47
      Height = 19
      Caption = 'Usuario'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblContrasena: TLabel
      Left = 16
      Top = 49
      Width = 68
      Height = 19
      Caption = 'Contrase'#241'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbeUsuario: TwwDBEdit
      Left = 98
      Top = 9
      Width = 219
      Height = 27
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object bbtnOk: TBitBtn
      Left = 247
      Top = 77
      Width = 32
      Height = 30
      TabOrder = 2
      OnClick = bbtnOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object dbePwdAnterior: TwwDBEdit
      Left = 99
      Top = 47
      Width = 120
      Height = 31
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object BitBtn1: TBitBtn
      Left = 285
      Top = 77
      Width = 32
      Height = 30
      TabOrder = 3
      OnClick = bbtnCanc2Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object pnlNuevoPwd: TPanel
    Left = 8
    Top = 146
    Width = 336
    Height = 177
    BevelWidth = 2
    Color = clMoneyGreen
    Enabled = False
    TabOrder = 1
    object bbtnOk2: TBitBtn
      Left = 249
      Top = 141
      Width = 32
      Height = 30
      TabOrder = 1
      OnClick = bbtnOk2Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object bbtnCanc2: TBitBtn
      Left = 287
      Top = 141
      Width = 32
      Height = 30
      TabOrder = 2
      OnClick = bbtnCanc2Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 49
      Width = 303
      Height = 85
      Caption = 'Nueva'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object lblPwdNue: TLabel
        Left = 47
        Top = 22
        Width = 68
        Height = 19
        Caption = 'Contrase'#241'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPwdConf: TLabel
        Left = 47
        Top = 54
        Width = 56
        Height = 19
        Caption = 'Confirma'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbePwdConfirma: TwwDBEdit
        Left = 129
        Top = 49
        Width = 120
        Height = 27
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbePwdNuevo: TwwDBEdit
        Left = 129
        Top = 20
        Width = 120
        Height = 27
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 2
      Width = 332
      Height = 50
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Panel1'
      Color = clMoneyGreen
      Enabled = False
      TabOrder = 3
      object Label6: TLabel
        Left = 16
        Top = 14
        Width = 49
        Height = 19
        Caption = 'Nombre'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbeNombre: TwwDBEdit
        Left = 98
        Top = 10
        Width = 220
        Height = 31
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
end
