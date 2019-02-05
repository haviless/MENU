// Actualizaciones
//HPC_201801_CXP    29/01/2018 Entrega a Control de Calidad

// Inicio HPC_201801_CXP
// Entrega a Control de Calidad

Unit ACCDM;

Interface

Uses
   SysUtils, Classes, DB, DBClient, MConnect, SConnect, Wwdatsrc, wwclient,
   winsock, OleServer, Windows, IniFiles, Forms, Messages, Dialogs, oaVariables;

Type
   TDMACC = Class(TDataModule)
      DCOM1: TSocketConnection;
      cdsQry: TwwClientDataSet;
      dsQry: TwwDataSource;
      cdsUsuarios: TwwClientDataSet;
      dsUsuarios: TwwDataSource;
      cdsUser: TwwClientDataSet;
      dsUser: TwwDataSource;
      cdsMGrupo: TwwClientDataSet;
      dsMGrupo: TwwDataSource;
      cdsGrupos: TwwClientDataSet;
      dsGrupos: TwwDataSource;
      cdsAcceso: TwwClientDataSet;
      dsAcceso: TwwDataSource;
      cdsQry1: TwwClientDataSet;
      dsQry1: TwwDataSource;
      cdsModulos: TwwClientDataSet;
      dsModulos: TwwDataSource;
      cdsVerificaOPC: TwwClientDataSet;
      dsVerificaOPC: TwwDataSource;
      cdsConsulta: TwwClientDataSet;
      dsConsulta: TwwDataSource;
      wwClientDataSet1: TwwClientDataSet;
      wwDataSource1: TwwDataSource;
      cdsTmp: TwwClientDataSet;
      dsTmp: TwwDataSource;
      cdsQry6: TwwClientDataSet;
      dsQry6: TwwDataSource;
      DSDOCID: TwwDataSource;
      CDSDOCID: TwwClientDataSet;
      CDSTIPCAM: TwwClientDataSet;
      DSTIPCAM: TwwDataSource;
      cdsCia: TwwClientDataSet;
      dsCia: TwwDataSource;
      cdsCiaSelec: TwwClientDataSet;
      dsCiaSelec: TwwDataSource;
      cdsTablas: TwwClientDataSet;
      dsTablas: TwwDataSource;
      cdsBusca: TwwClientDataSet;
      dsBusca: TwwDataSource;
      cdsQry66: TwwClientDataSet;
      dsQry66: TwwDataSource;
      cdsReporte: TwwClientDataSet;
      dsReporte: TwwDataSource;
      cdsRepDet: TwwClientDataSet;
      dsRepDet: TwwDataSource;
      Procedure DataModuleCreate(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
      sOpcMenuCod: String;
      wUsuario: String;
      wModulo: String;
      cIP, wOfiId, widepc, ideconex, fechorcon: String;
      sClose, wSRV: String;
      cAccesoSistema: String;

      Function ObtenerIpdeNetbios(Host: String): String;
      Function ComputerName: String;
      Function Encripta(sPass: String): String;
      Function DesEncripta(sPass: String): String;
      Function VerificaAccesoOpcion(s_Objeto: String): Boolean;
   End;

Var
   DMACC: TDMACC;

Implementation

{$R *.dfm}

Uses MENU020;

Function TDMACC.ObtenerIpdeNetbios(Host: String): String;
Var
   WSAData: TWSADATA;
   HostEnt: phostent;
Begin
   Result := '';
   If WSAStartup(MAKEWORD(1, 1), WSADATA) = 0 Then
   Begin
      HostEnt := gethostbyname(PChar(Host));
      If HostEnt <> Nil Then
         Result := String(inet_ntoa(PInAddr(HostEnt.h_addr_list^)^));
      WSACleanup;
   End;
End;

Function TDMACC.ComputerName: String;
Var
   Buffer: Array[0..100] Of Char;
   MaxSize: Cardinal;
Begin
   MaxSize := SizeOf(Buffer);
   If Not GetComputerName(@Buffer, MaxSize) Then
      Raise Exception.Create('No puedo determinar el nombre de la máquina');
   Result := StrPas(@Buffer);
End;

Procedure TDMACC.DataModuleCreate(Sender: TObject);
Var
   inifile: TIniFile;
Begin
   sClose := '1';
   DCOM1.Connected := False;

   If ParamStr(1) = '' Then
   Begin
      inifile := TIniFile.Create(ExtractFilePath(application.ExeName) + '\oaCfg.ini');
      DCOM1.Address := IniFile.ReadString('TCPIP', 'ADDRESS', '');
      wSRV := IniFile.ReadString('MOTOR', 'NAME', '');
   End;

   Try
      DCOM1.Connected := true;
   Except
      // por no realizar la conexion
      SHOWMESSAGE('ERROR de Conexión al intentar asignarle la dirección ' + IniFile.ReadString('TCPIP', 'ADDRESS', ''));
      Exit;
   End;

   Try
      cIP := DMACC.ObtenerIpdeNetbios(DMACC.computerName);
   Except
      ShowMessage('ERROR de Conexión al tratar de obtener el Nombre de PC');
      DCOM1.Connected := False;
      Exit;
   End;

   sClose := '0';
End;

Function TDMACC.Encripta(sPass: String): String;
Var
   xLargoPal, i, j: integer;
   xReal, xEncriptado1, xEncriptado2, xEncriptado3, xEncriptado4,
      xEncriptado5, xNuevaPal, xEncriptado: String;
   xTiene: boolean;
Begin
{   xReal       := 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789abcdefghijklmnñopqrstuvwxyz';
   xEncriptado1:= '¶°ªº¾§¦¥¼»½·¸¹³.µ´±®¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË';
   xEncriptado2:= '§¦¥¼»½·¸¹³.µ´±®¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË¶°ªº¾';
   xEncriptado3:= '½·¸¹³.µ´±®¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË¶°ªº¾§¦¥¼»';
   xEncriptado4:= '.µ´±®¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË¶°ªº¾§¦¥¼»½·¸¹³';
   xEncriptado5:= '¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË¶°ªº¾§¦¥¼»½·¸¹³.µ´±®'; }
   xReal := 'abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789';
   xEncriptado1 := '¶°ªº¾§¦¥¼»½·¸¹³.µ´±®¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤ ¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË';
   xEncriptado2 := '§¦¥¼»½·¸¹³.µ´±®¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤ ¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË¶°ªº¾';
   xEncriptado3 := '½·¸¹³.µ´±®¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤ ¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË¶°ªº¾§¦¥¼»';
   xEncriptado4 := '.µ´±®¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤ ¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË¶°ªº¾§¦¥¼»½·¸¹³';
   xEncriptado5 := '¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤ ¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË¶°ªº¾§¦¥¼»½·¸¹³.µ´±®';
   xLargoPal := length(sPass);
   xNuevaPal := '';
   i := 1;
   While i <= xLargoPal Do
   Begin
      j := 1;
      xTiene := False;
      If (i = 1) Or (i = 11) Or (i = 21) Or (i = 31) Then xEncriptado := xEncriptado1;
      If (i = 2) Or (i = 12) Or (i = 22) Or (i = 32) Then xEncriptado := xEncriptado2;
      If (i = 3) Or (i = 13) Or (i = 23) Or (i = 33) Then xEncriptado := xEncriptado3;
      If (i = 4) Or (i = 14) Or (i = 24) Or (i = 34) Then xEncriptado := xEncriptado4;
      If (i = 5) Or (i = 15) Or (i = 25) Or (i = 35) Then xEncriptado := xEncriptado5;
      If (i = 6) Or (i = 16) Or (i = 26) Or (i = 36) Then xEncriptado := xEncriptado1;
      If (i = 7) Or (i = 17) Or (i = 27) Or (i = 37) Then xEncriptado := xEncriptado2;
      If (i = 8) Or (i = 18) Or (i = 28) Or (i = 38) Then xEncriptado := xEncriptado3;
      If (i = 9) Or (i = 19) Or (i = 29) Or (i = 39) Then xEncriptado := xEncriptado4;
      If (i = 10) Or (i = 20) Or (i = 30) Or (i = 40) Then xEncriptado := xEncriptado5;
      While j <= length(xReal) Do
      Begin
         If copy(sPass, i, 1) = copy(xReal, j, 1) Then
         Begin
            xNuevaPal := xNuevaPal + copy(xEncriptado, j, 1);
            xTiene := True;
         End;
         j := j + 1;
      End;
      If Not xTiene Then xNuevaPal := xNuevaPal + copy(sPass, i, 1);
      i := i + 1;
   End;
   //result:=Encripta(xNuevaPal);
   result := xNuevaPal;
End;

Function TDMACC.DesEncripta(sPass: String): String;
Var
   xLargoPal, i, j: integer;
   xReal, xEncriptado1, xEncriptado2, xEncriptado3, xEncriptado4,
      xEncriptado5, xNuevaPal, xEncriptado: String;
   xTiene: boolean;
Begin
   xReal := 'abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789';
   xEncriptado1 := '¶°ªº¾§¦¥¼»½·¸¹³.µ´±®¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤ ¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË';
   xEncriptado2 := '§¦¥¼»½·¸¹³.µ´±®¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤ ¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË¶°ªº¾';
   xEncriptado3 := '½·¸¹³.µ´±®¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤ ¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË¶°ªº¾§¦¥¼»';
   xEncriptado4 := '.µ´±®¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤ ¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË¶°ªº¾§¦¥¼»½·¸¹³';
   xEncriptado5 := '¯«¬­¨©²¿Ô Ö×ÕÙ¡ÚÛÜ¿Ş¤ ¿¿¢ÅÄİ£ÃÁÀÓÑĞÆÇÎÍÉÊÌË¶°ªº¾§¦¥¼»½·¸¹³.µ´±®';
   xLargoPal := length(sPass);
   xNuevaPal := '';
   i := 1;
   While i <= xLargoPal Do
   Begin
      j := 1;
      xTiene := False;
      If (i = 1) Or (i = 6) Or (i = 11) Or (i = 16) Then xEncriptado := xEncriptado1;
      If (i = 2) Or (i = 7) Or (i = 12) Or (i = 17) Then xEncriptado := xEncriptado2;
      If (i = 3) Or (i = 8) Or (i = 13) Or (i = 18) Then xEncriptado := xEncriptado3;
      If (i = 4) Or (i = 9) Or (i = 14) Or (i = 19) Then xEncriptado := xEncriptado4;
      If (i = 5) Or (i = 10) Or (i = 15) Or (i = 20) Then xEncriptado := xEncriptado5;
      While j <= length(xReal) Do
      Begin
         If copy(sPass, i, 1) = copy(xEncriptado, j, 1) Then
         Begin
            xNuevaPal := xNuevaPal + copy(xReal, j, 1);
            xTiene := True;
            break;
         End;
         j := j + 1;
      End;
      If Not xTiene Then xNuevaPal := xNuevaPal + copy(sPass, i, 1);
      i := i + 1;
   End;
   result := xNuevaPal;
End;

Function TDMACC.VerificaAccesoOpcion(s_Objeto: String): Boolean;
Var
   sAccesosTmp: String;
   sSQL: String;
Begin
   Result := True;
End;

End.
// Fin HPC_201801_CXP

