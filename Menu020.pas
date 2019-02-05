// Actualizaciones
//HPC_201801_CXP    29/01/2018 Entrega a Control de Calidad

// Inicio HPC_201801_CXP
// Entrega a Control de Calidad

Unit Menu020;

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, Mask, wwdbedit, Qt, MConnect, SConnect, winsock;

Type
   TFCtrlAcceso = Class(TForm)
      gbControlAcceso: TGroupBox;
      lblUsuario: TLabel;
      lblContrasena: TLabel;
      dbePassword: TwwDBEdit;
      dbeUsuario: TwwDBEdit;
      bbtnOkIngreso: TBitBtn;
      bbtnCancelaIngreso: TBitBtn;
      Label1: TLabel;
      Procedure bbtnOkIngresoClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dbePasswordKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure bbtnCancelaIngresoClick(Sender: TObject);
   Private
    { Private declarations }
      Function AccesosModulo: Boolean;
   Public
      wDCOM1: TSocketConnection;
    { Public declarations }
      xdiasduracpass: Integer;
      nCont: Integer;
   End;

Var
   FCtrlAcceso: TFCtrlAcceso;
   xSQL: String;

Implementation

{$R *.dfm}

Uses ACCDM;

Procedure TFCtrlAcceso.bbtnOkIngresoClick(Sender: TObject);
Begin
   // Usuario se conecta a la base de datos
   inc(nCont);
   DMACC.cAccesoSistema := 'N';
   Try
      DMACC.DCOM1.AppServer.Conectate('xxxxxx', dbeUsuario.Text, dbePassword.Text, DMACC.cAccesoSistema);
      If DMACC.cAccesoSistema = 'N' Then
      Begin
         Showmessage('Usuario y/o contraseña no reconocido por la Base de Datos');
         If nCont >= 3 Then
         Begin
            ShowMessage('Tres intentos fallidos de conexión, se bloqueara su Usuario. Avice a Sistemas para volver a intentar');
            Application.Terminate;
         End;
         Exit;
      End;
   Except
      Showmessage('Usuario y/o contraseña no reconocido por la Base de Datos');
      If nCont > 3 Then
      Begin
         ShowMessage('Tres intentos fallidos de conexión, se bloqueara su Usuario. Avice a Sistemas para volver a intentar');
         Application.Terminate;
      End;
      Exit;
   End;

   If Not AccesosModulo Then
   Begin
      DMACC.DCOM1.Connected := False;
      Screen.Cursor := CrDefault;
      Application.Terminate;
   End;

   Close;
End;

Procedure TFCtrlAcceso.FormShow(Sender: TObject);
Begin
   dbeUsuario.SetFocus;
End;

Procedure TFCtrlAcceso.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
   End;
End;

Procedure TFCtrlAcceso.dbePasswordKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
   If Key = 13 Then
      bbtnOkIngreso.OnClick(bbtnOkIngreso);
End;

Procedure TFCtrlAcceso.bbtnCancelaIngresoClick(Sender: TObject);
Begin
   Close;
End;

Function TFCtrlAcceso.AccesosModulo: Boolean;
Var
   xSQL: String;
   xfecfin: TDate;
   xdiasexppass: Integer;
   xdiasfaltantes: Integer;
   xdiasduracpass: Integer;
   xpassact, xctrl_ip, xingresa: String;
   cIP, wOfiId, widepc, ideconex, fechorcon: String;
   wModulo: String;
Begin
   wModulo := 'CNT'; // 'SEG';
// busca en tabla DE USUARIO (TGE006) para determinar que es un usuario de base de datos
   xSQL := 'select FECEXP, OFDESID, nvl(CTRL_IP,''S'') CTRL_IP, '
      + '       TO_DATE(nvl(FECINI_PWD,sysdate-30)) FECINI_PWD, '
      + '       TO_DATE(nvl(FECFIN_PWD, sysdate-1)) FECFIN_PWD, '
      + '       nvl(DIASEXP_PWD,7) DIASEXP_PWD,'
      + '       nvl(DIASDURAC_PWD,30) DIASDURAC_PWD '
      + 'from TGE006 '
      + 'where USERID = ' + QuotedStr(dbeUsuario.Text);
   DMACC.cdsQry.Close;
   DMACC.cdsQry.DataRequest(xSql);
   DMACC.cdsQry.Open;
   If DMACC.cdsQry.RecordCount = 0 Then
   Begin
      Showmessage('Usuario no reconocido para el uso de Aplicaciones');
      Result := False;
      Exit;
   End;

// valida que contraseña en control de aplicaciones (TGE006), no haya expirado
   If (DMACC.cdsQry.FieldByName('FECEXP').AsDateTime > 0) And
      (DMACC.cdsQry.FieldByName('FECEXP').AsDateTime < Date) Then
   Begin
      Showmessage('Usuario ha caducado para el uso de Aplicaciones');
      Result := False;
      Exit;
   End;
   xfecfin := DMACC.cdsQry.FieldByName('FECFIN_PWD').AsDateTime;
   xdiasexppass := DMACC.cdsQry.FieldByName('DIASEXP_PWD').AsInteger;
   xdiasduracpass := DMACC.cdsQry.FieldByName('DIASDURAC_PWD').AsInteger;

   wOfiId := DMACC.cdsQry.FieldByName('OFDESID').AsString;
   xctrl_ip := DMACC.cdsQry.FieldByName('CTRL_IP').AsString;
   widepc := DMACC.computerName;

// determina que el usuario tenga acceso al módulo
// busca en tabla TGE006 para determinar que es un usuario de base de datos y de la aplicación
   xSQL := 'Select USUARIOS.USERID, USUARIOS.USERNOM, USUARIOGRUPO.GRUPOID, '
      + '       GRUPOS.GRUPODES, GRUPOS.GRUPOADM, ACCESOGRUPO.MODULOID, '
      + '       ACCESOGRUPO.TIPO, ACCESOGRUPO.OBJETO, ACCESOGRUPO.FORMA '
      + 'From TGE006 USUARIOS, TGE007 USUARIOGRUPO, TGE003 GRUPOS, TGE001 ACCESOGRUPO '
      + 'where USUARIOS.USERID=' + quotedstr(dbeUsuario.Text) // -- TGE006 USUARIOS
      + '  and USUARIOGRUPO.USERID=USUARIOS.USERID' // -- TGE007 USUARIOGRUPO
      + '  and GRUPOS.GRUPOID=USUARIOGRUPO.GRUPOID' // -- TGE003 GRUPOS
      + '  and ACCESOGRUPO.GRUPOID=USUARIOGRUPO.GRUPOID '
      + '  and ACCESOGRUPO.MODULOID=' + quotedstr(wModulo)
      + '  and ACCESOGRUPO.TIPO=''0'' '; // TGE001 ACCESOGRUPO
   DMACC.cdsQry.Close;
   DMACC.cdsQry.DataRequest(xSQL);
   DMACC.cdsQry.Open;
   If DMACC.cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('No tiene Acceso al módulo');
      Result := False;
      Exit;
   End;

// Identifica si el usuario puede ejecutar los sistemas de cualquier maquina
// o solo de las máquina que se le han asignado
   xingresa := 'N';
   If xctrl_ip = 'S' Then
   Begin
      xSQL := 'SELECT IP_ASIGNADO FROM TGE010 WHERE USERID = ' + QuotedStr(dbeUsuario.Text);
      DMACC.cdsQry.Close;
      DMACC.cdsQry.DataRequest(xSQL);
      DMACC.cdsQry.Open;
      While Not DMACC.cdsQry.Eof Do
      Begin
         If DMACC.cdsQry.FieldByName('IP_ASIGNADO').AsString = cIP Then xingresa := 'S';
         DMACC.cdsQry.Next;
      End;
   End;
   If (xingresa = 'N') And (xctrl_ip = 'S') Then
   Begin
      Showmessage('Usuario no autorizado para ingresar de este equipo');
      Result := False;
      Exit;
   End;

// DETERMINA NRO DE IDENTIFICADOR PARA GRABAR EN ARCHIVO LOG DE ACCESOS
// SE DETERMINA EN BASE A LA FECHA+HORA DE INGRESO A LA BASE DE DATOS
   xSQL := 'SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') IDE, SYSDATE FECHORCON FROM DUAL';
   DMACC.cdsQry.Close;
   DMACC.cdsQry.DataRequest(xSQL);
   DMACC.cdsQry.Open;
   ideconex := DMACC.cdsQry.FieldByName('IDE').AsString;
   fechorcon := DMACC.cdsQry.FieldByName('FECHORCON').AsString;

// ENVIA PARAMETROS DE LA PC DEL USUARIO HACIA LA APLICACION SERVIDOR
   DMACC.DCOM1.AppServer.ConexionON(dbeUsuario.Text, cIP, wModulo, ideconex, fechorcon, widepc);

// controla caducidad de contraseña
   xSQL := 'SELECT TO_DATE(' + QuotedStr(DateToStr(xfecfin)) + ') - TO_DATE(SYSDATE) DIASFALTANTE FROM DUAL';
   DMACC.cdsQry.Close;
   DMACC.cdsQry.DataRequest(xSQL);
   DMACC.cdsQry.Open;

   xdiasfaltantes := DMACC.cdsQry.FieldByName('DIASFALTANTE').AsInteger; // dias que faltan
   If xdiasfaltantes <= xdiasexppass Then
   Begin
      If xdiasfaltantes <= 0 Then
         MessageDlg('SU CONTRASEÑA HA CADUCADO, DEBE CAMBIARLA AHORA', mtCustom, [mbOk], 0)
      Else
         If xdiasfaltantes = 1 Then
            MessageDlg('!!! FALTA 1 DíA PARA EL VENCIMIENTO DE SU CONTRASEÑA ¡¡¡' + chr(13)
               + '            SE SUGIERE CAMBIARLA AHORA                  ', mtInformation, [mbOk], 0)
         Else
            MessageDlg('!!! FALTAN ' + IntToStr(xdiasfaltantes) + ' DÍAS PARA EL VENCIMIENTO DE SU CONTRASEÑA ¡¡¡' + chr(13)
               + '            SE SUGIERE CAMBIARLA AHORA                  ', mtInformation, [mbOk], 0);
   End;
   If xdiasfaltantes <= 0 Then
   Begin
      Result := False;
      Exit;
   End;

   Result := True;
End;

End.
// Fin HPC_201801_CXP


