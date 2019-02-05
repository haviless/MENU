// Actualizaciones
//HPC_201801_CXP    29/01/2018 Entrega a Control de Calidad

// Inicio HPC_201801_CXP
// Entrega a Control de Calidad

Unit CambioPwd;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Mask, wwdbedit, Buttons, ExtCtrls, db, wwclient, MConnect,
   DBClient, SConnect;

Type
   TFCPassw = Class(TForm)
      pnlRegistro: TPanel;
      lblUsuario: TLabel;
      dbeUsuario: TwwDBEdit;
      Label3: TLabel;
      bbtnOk: TBitBtn;
      lblContrasena: TLabel;
      dbePwdAnterior: TwwDBEdit;
      BitBtn1: TBitBtn;
      pnlNuevoPwd: TPanel;
      bbtnOk2: TBitBtn;
      bbtnCanc2: TBitBtn;
      GroupBox1: TGroupBox;
      lblPwdNue: TLabel;
      lblPwdConf: TLabel;
      dbePwdConfirma: TwwDBEdit;
      dbePwdNuevo: TwwDBEdit;
      Panel1: TPanel;
      Label6: TLabel;
      dbeNombre: TwwDBEdit;
      Procedure bbtnCanc2Click(Sender: TObject);
      Procedure bbtnOk2Click(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormActivate(Sender: TObject);
      Procedure bbtnOkClick(Sender: TObject);
      Function isAlfanumerico(ICad: String): boolean;
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
   Private
    { Private declarations }
   Public
    { Public declarations }
      wDCOM1: TSocketConnection;
      cAccesoSistema: String;
      xdiasduracpass: Integer;
      wIntentos: Integer;
      wcdsUsuarios: TwwClientDataSet;
      sModulo, sUser, sPassword: String;
   End;

Var
   FCPassw: TFCPassw;

Implementation

{$R *.DFM}

Uses ACCDM;

Procedure TFCPassw.bbtnCanc2Click(Sender: TObject);
Begin
   Close;
End;

Procedure TFCPassw.bbtnOk2Click(Sender: TObject);
Var
   xSQL: String;
Begin
   If dbePwdAnterior.Text = dbePwdNuevo.text Then
   Begin
      Showmessage('No se permite volver a digitar la misma contraseña, reintente');
      dbePwdNuevo.SetFocus;
      exit;
   End;
   If dbePwdNuevo.text <> dbePwdConfirma.text Then
   Begin
      Showmessage('Contraseña Nueva no coincide con la confirmación, reintente');
      dbePwdNuevo.SetFocus;
      exit;
   End;

   If DMACC.DCOM1.AppServer.setPassword(dbeUsuario.Text, dbePwdNuevo.Text) <> '' Then
   Begin
      ShowMessage('No se pudo cambiar Contraseña');
      exit;
   End;

   Try
      xSQL := 'UPDATE TGE006 '
         + 'SET FECINI_PWD = TO_DATE(SYSDATE), '
         + '    FECFIN_PWD = TO_DATE(SYSDATE)+' + IntToStr(xdiasduracpass) + ', '
         + '    PASSWORD= ' + QuotedStr(dmacc.Encripta(dbePwdNuevo.text)) + ' '
         + 'WHERE USERID = ' + QuotedStr(dbeUsuario.Text);
      DMACC.DCOM1.AppServer.EjecutaSQL(xSQL);
      ShowMessage('             El Password se ha cambiado Satisfactoriamente' + #13
         + 'La Sesión va a ser Finalizada para Terminar con el Proceso de Actualización');
   Except
      showmessage('Ocurrió algun error y no se pudo cambiar la Contraseña');
   End;
   Application.Terminate;
End;

Procedure TFCPassw.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      If Self.ActiveControl Is TMemo Then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFCPassw.FormActivate(Sender: TObject);
Begin
   dbeUsuario.SetFocus;
End;

Procedure TFCPassw.bbtnOkClick(Sender: TObject);
Var
   xfecfin: TDate;
   //xdiasexppass:Integer;
   xpassact, xctrl_ip, xingresa: String;
   xSQL: String;
Begin
// Usuario se conecta a la base de datos
   cAccesoSistema := 'N';
   inc(wIntentos);
   Try
      DMACC.DCOM1.AppServer.Conectate('xxxxxx', dbeUsuario.Text, dbePwdAnterior.Text, cAccesoSistema);
      If cAccesoSistema = 'N' Then
      Begin
         Showmessage('Usuario y/o contraseña no reconocido por la Base de Datos');
         If wIntentos >= 3 Then
         Begin
            ShowMessage('Tres intentos fallidos de conexión, se bloqueará su Usuario. Avise a Sistemas para volver a intentar');
            Application.Terminate;
         End;
         Exit;
      End;
   Except
      Showmessage('Usuario y/o contraseña no reconocido por la Base de Datos');
      If wIntentos > 3 Then
      Begin
         ShowMessage('Tres intentos fallidos de conexión, se bloqueara su Usuario. Avise a Sistemas para volver a intentar');
         Application.Terminate;
      End;
      Exit;
   End;

   xSQL := 'select FECEXP, OFDESID, nvl(CTRL_IP,''S'') CTRL_IP, '
      + '       TO_DATE(nvl(FECINI_PWD,sysdate-30)) FECINI_PWD, '
      + '       TO_DATE(nvl(FECFIN_PWD, sysdate-1)) FECFIN_PWD, '
      + '       nvl(DIASEXP_PWD,7) DIASEXP_PWD,'
      + '       nvl(DIASDURAC_PWD,30) DIASDURAC_PWD '
      + 'from TGE006 '
      + 'where USERID = ' + QuotedStr(dbeUsuario.Text);
   dmacc.cdsQry.Close;
   dmacc.cdsQry.DataRequest(xSql);
   dmacc.cdsQry.Open;
   If dmacc.cdsQry.RecordCount = 0 Then
   Begin
      Showmessage('Usuario no está reconocido para el uso de Aplicaciones');
      Close;
   End;

// valida que contraseña en control de aplicaciones (TGE006), no haya expirado
   If (dmacc.cdsQry.FieldByName('FECEXP').AsDateTime > 0) And
      (dmacc.cdsQry.FieldByName('FECEXP').AsDateTime < Date) Then
   Begin
      Showmessage('Usuario ha caducado para el uso de Aplicaciones');
      Close;
   End;
   xfecfin := DMACC.cdsQry.FieldByName('FECFIN_PWD').AsDateTime;
   //xdiasexppass    := DMACC.cdsQry.FieldByName('DIASEXP_PWD').AsInteger;
   xdiasduracpass := DMACC.cdsQry.FieldByName('DIASDURAC_PWD').AsInteger;
   xpassact := dbePwdAnterior.Text;
   xctrl_ip := DMACC.cdsQry.FieldByName('CTRL_IP').AsString;
   DMACC.widepc := DMACC.computerName;

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
      + '  and ACCESOGRUPO.TIPO=''0'' '; // TGE001 ACCESOGRUPO
   DMACC.cdsQry.Close;
   DMACC.cdsQry.DataRequest(xSQL);
   DMACC.cdsQry.Open;
   If DMACC.cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('No tiene Acceso a los módulos');
      Close;
   End;

   dbeNombre.TEXT := DMACC.cdsQry.fieldbyname('USERNOM').asstring;

// Identifica si el usuario puede ejecutar los sistemas de cualquier maquina
// o solo de las máquina que se le han asignado
   xingresa := 'N';
   If xctrl_ip = 'S' Then
   Begin
      xSQL := 'SELECT IP_ASIGNADO FROM TGE010 WHERE USERID = ' + QuotedStr(DMACC.wUsuario);
      DMACC.cdsQry.Close;
      DMACC.cdsQry.DataRequest(xSQL);
      DMACC.cdsQry.Open;
      While Not DMACC.cdsQry.Eof Do
      Begin
         If DMACC.cdsQry.FieldByName('IP_ASIGNADO').AsString = DMACC.cIP Then xingresa := 'S';
         DMACC.cdsQry.Next;
      End;
   End;
   If (xingresa = 'N') And (xctrl_ip = 'S') Then
   Begin
      Showmessage('Usuario no autorizado para ingresar desde este equipo');
      Close;
   End;

// DETERMINA NRO DE IDENTIFICADOR PARA GRABAR EN ARCHIVO LOG DE ACCESOS
// SE DETERMINA EN BASE A LA FECHA+HORA DE INGRESO A LA BASE DE DATOS
   xSQL := 'SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') IDE, SYSDATE FECHORCON FROM DUAL';
   DMACC.cdsQry.Close;
   DMACC.cdsQry.DataRequest(xSQL);
   DMACC.cdsQry.Open;
   DMACC.ideconex := DMACC.cdsQry.FieldByName('IDE').AsString;
   DMACC.fechorcon := DMACC.cdsQry.FieldByName('FECHORCON').AsString;

// ENVIA PARAMETROS DE LA PC DEL USUARIO HACIA LA APLICACION SERVIDOR
   DMACC.DCOM1.AppServer.ConexionON(DMACC.wUsuario, DMACC.cIP, DMACC.wModulo, DMACC.ideconex, DMACC.fechorcon, DMACC.widepc);

// controla caducidad de contraseña
   xSQL := 'SELECT TO_DATE(' + QuotedStr(DateToStr(xfecfin)) + ') - TO_DATE(SYSDATE) DIASFALTANTE FROM DUAL';
   DMACC.cdsQry.Close;
   DMACC.cdsQry.DataRequest(xSQL);
   DMACC.cdsQry.Open;

   pnlNuevoPwd.Enabled := True;
   lblPwdNue.Enabled := True;
   lblPwdConf.Enabled := True;
   pnlRegistro.Enabled := False;
   dbePwdNuevo.SetFocus;
End;

Function TFCPassw.isAlfanumerico(ICad: String): boolean;
Var
   i: integer;
   valor: char;
Begin
   For i := 1 To Length(ICad) Do
   Begin
      valor := ICad[i];
      If Not ((valor In ['A'..'Z'])
         Or (valor In ['a'..'z'])
         Or (valor In ['0'..'9'])) Then
      Begin
         Result := False;
         exit;
      End;
   End;
   Result := true;
End;

Procedure TFCPassw.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   Action := caFree;
End;

End.
// Fin HPC_201801_CXP

