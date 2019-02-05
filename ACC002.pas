// Actualizaciones
//HPC_201801_CXP    29/01/2018 Entrega a Control de Calidad

// Inicio HPC_201801_CXP
// Entrega a Control de Calidad

Unit ACC002;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, ExtCtrls, Mask, wwdbedit, DB,
   variants, Wwkeycb, wwdbdatetimepicker, wwclient, MConnect, Wwdatsrc,
   wwdblook, Wwdbdlg;
Type
   TFMantAcceso = Class(TForm)
      Label1: TLabel;
      pnlAcceso: TPanel;
      Label2: TLabel;
      bbtnOK: TBitBtn;
      pnlReg1: TPanel;
      pnlReg2: TPanel;
      bbtnOk1: TBitBtn;
      bbtnCanc1: TBitBtn;
      bbtnOk2: TBitBtn;
      bbtnCanc2: TBitBtn;
      Label3: TLabel;
      Label4: TLabel;
      dbeGrupo: TwwDBEdit;
      dbeGrupoDes: TwwDBEdit;
      lblUsuario: TLabel;
      dbeUsuario: TwwDBEdit;
      Label6: TLabel;
      dbeNombre: TwwDBEdit;
      dbePassw1: TwwDBEdit;
      dbePassw2: TwwDBEdit;
      Label5: TLabel;
      Label7: TLabel;
      bbtnAsignaModGrupo: TBitBtn;
      pnlUsuarios: TPanel;
      dbgUsuario: TwwDBGrid;
      Label10: TLabel;
      dbgGrupoDet: TwwDBGrid;
      BitBtn4: TBitBtn;
      BitBtn5: TBitBtn;
      dbgUser: TwwDBGrid;
      dbgUserIButton: TwwIButton;
      Label8: TLabel;
      dbgGrupo: TwwDBGrid;
      dbgGrupoIButton: TwwIButton;
      lblTitulo2: TLabel;
      lblTitulo1: TLabel;
      Label9: TLabel;
      cbAdm: TComboBox;
      Label11: TLabel;
      BitBtn2: TBitBtn;
      pnlGrupos: TPanel;
      dbgGrupoB: TwwDBGrid;
      BitBtn3: TBitBtn;
      pnlBusca: TPanel;
      isUser: TwwIncrementalSearch;
      Label12: TLabel;
      BitBtn6: TBitBtn;
      lblBusca: TLabel;
      gbFecha: TGroupBox;
      dtpFecExp: TwwDBDateTimePicker;
      cbExp: TCheckBox;
      dblcdOficina: TwwDBLookupComboDlg;
      Label13: TLabel;
      Panel1: TPanel;
      dbgGruposDelModulo: TwwDBGrid;
      wwIButton1: TwwIButton;
      Label15: TLabel;
      dblcdModulo: TwwDBLookupComboDlg;
      BitBtn1: TBitBtn;
      Label14: TLabel;
      bbtnCiaDel: TBitBtn;
      sbVer: TSpeedButton;
      Procedure bbtnOKClick(Sender: TObject);
      Procedure dbgGrupoIButtonClick(Sender: TObject);
      Procedure bbtnOk1Click(Sender: TObject);
      Procedure bbtnCanc1Click(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dbgGrupoDblClick(Sender: TObject);
      Procedure dbgUsuarioDblClick(Sender: TObject);
      Procedure bbtnOk2Click(Sender: TObject);
      Procedure bbtnCanc2Click(Sender: TObject);
      Procedure dbgGrupoKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure dbgUsuarioKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure bbtnAsignaModGrupoClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dbgUserIButtonClick(Sender: TObject);
      Procedure dbgUserDblClick(Sender: TObject);
      Procedure BitBtn5Click(Sender: TObject);
      Procedure BitBtn4Click(Sender: TObject);
      Procedure BitBtn2Click(Sender: TObject);
      Procedure BitBtn3Click(Sender: TObject);
      Procedure dbgUserTitleButtonClick(Sender: TObject; AFieldName: String);
      Procedure isUserExit(Sender: TObject);
      Procedure BitBtn6Click(Sender: TObject);
      Procedure cbExpClick(Sender: TObject);
      Procedure dbgGrupoDetKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure dblcdOficinaExit(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure dblcdModuloExit(Sender: TObject);
      Procedure dbgGruposDelModuloRowChanged(Sender: TObject);
      Procedure dbgGrupoRowChanged(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure bbtnCiaDelClick(Sender: TObject);
      Procedure sbVerClick(Sender: TObject);
   Private
    { Private declarations }
      wFormatFecha: String;
      Function BuscaObjeto(Const xNombre: String; xForm: TForm): TControl;
   Public
    { Public declarations }
      sSRV_D: String;
      sGrupoTmp: String;
      sModulo: String;
      wFPrincipal: TForm;

      Function BuscaTButton(Const xNombre: String; xForm: TForm): TButton;
      Procedure AccesosUsuarios(xxModulo, xxTipo, xxForma: String);
      Function BuscaTSpeedButton(Const xNombre: String; xForm: TForm): TSpeedButton;
      Procedure ColorButtons(xForm: TForm);
      Procedure ControlTran;
      Procedure AplicaDatos(wCDS: TwwClientDataSet; wNomArch: String);
   End;

Var
   FMantAcceso: TFMantAcceso;
   wOficina: String;

Implementation

{$R *.DFM}

Uses ACCDM;

Procedure TFMantAcceso.bbtnOKClick(Sender: TObject);
Begin
   If sModulo = '' Then
   Begin
      ShowMessage('Debe seleccionar un Modulo');
      Exit;
   End;

   If DMACC.cdsQry6.RecordCount = 0 Then
   Begin
      showmessage('Debe primero Asignar Grupo a Módulo');
      Raise exception.Create('Debe primero Asignar Grupo a Módulo');
   End;
   sGrupoTmp := DMACC.CdsQry6.FieldByName('GRUPOID').AsString;

   FMantAcceso.Close;
End;

Procedure TFMantAcceso.dbgGrupoIButtonClick(Sender: TObject);
Begin

   dbeGrupo.DataSource := dmacc.dsMGrupo;
   dbeGrupoDes.DataSource := dmacc.dsMGrupo;

   pnlAcceso.Enabled := False;
   pnlUsuarios.Enabled := False;

   dbgGrupo.Enabled := False;
   pnlReg1.Visible := True;
   pnlReg1.SetFocus;
   lblTitulo1.Caption := 'Inserta Registro';
   dmacc.cdsMGrupo.Insert;
   cbAdm.ItemIndex := 0;
   dbeGrupo.Enabled := True;
   dbeGrupo.SetFocus;
End;

Procedure TFMantAcceso.bbtnOk1Click(Sender: TObject);
Begin
   If cbAdm.Items[cbAdm.ItemIndex] = 'Administrador' Then //Administrador
      dmacc.cdsMGrupo.FieldByName('GRUPOADM').AsString := 'G'
   Else
   Begin
      If cbAdm.Items[cbAdm.ItemIndex] = 'Jefatura' Then
         dmacc.cdsMGrupo.FieldByName('GRUPOADM').AsString := 'P' // Jefaturas
      Else
         If cbAdm.Items[cbAdm.ItemIndex] = 'Supervisor' Then
            dmacc.cdsMGrupo.FieldByName('GRUPOADM').AsString := 'V' // Supervisor
         Else
            If cbAdm.Items[cbAdm.ItemIndex] = 'Consulta' Then
               dmacc.cdsMGrupo.FieldByName('GRUPOADM').AsString := 'C' // Solo Consulta
            Else
               dmacc.cdsMGrupo.FieldByName('GRUPOADM').AsString := 'U'; // Usuario
   End;

   If dmacc.cdsMGrupo.State = dsInsert Then
   Begin
      dmacc.cdsMGrupo.Post;
      dmacc.cdsMGrupo.ApplyUpdates(-1);
      dmacc.cdsMGrupo.Insert;

      pnlAcceso.Enabled := True;
      pnlUsuarios.Enabled := True;
      dbeGrupo.Enabled := True;
      dbeGrupo.SetFocus;
   End
   Else
   Begin
      dmacc.cdsMGrupo.Post;
      dmacc.cdsMGrupo.ApplyUpdates(-1);
      pnlReg1.Visible := False;

      pnlAcceso.Enabled := True;
      pnlUsuarios.Enabled := True;

      dbgGrupo.Enabled := True;
      dbgGrupo.SetFocus;
   End;
End;

Procedure TFMantAcceso.bbtnCanc1Click(Sender: TObject);
Begin
   dmacc.cdsMGrupo.CancelUpdates;
   pnlReg1.Visible := False;
   pnlAcceso.Enabled := True;
   pnlUsuarios.Enabled := True;
   dbgGrupo.Enabled := True;
   dbgGrupo.SetFocus;
End;

Procedure TFMantAcceso.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFMantAcceso.dbgGrupoDblClick(Sender: TObject);
Begin
   pnlAcceso.Enabled := False;
   pnlUsuarios.Enabled := False;
   dbgGrupo.Enabled := False;
   lblTitulo1.Caption := 'Edita Registro';
   pnlReg1.Visible := True;
   pnlReg1.SetFocus;

   cbAdm.ItemIndex := 0;
   If dmacc.cdsMGrupo.FieldByName('GRUPOADM').AsString = 'G' Then //Administrador
      cbAdm.ItemIndex := 4 // Administrador
   Else
   Begin
      If dmacc.cdsMGrupo.FieldByName('GRUPOADM').AsString = 'P' Then
         cbAdm.ItemIndex := 3 // Jefatura
      Else
         If dmacc.cdsMGrupo.FieldByName('GRUPOADM').AsString = 'V' Then
            cbAdm.ItemIndex := 2 // Supervisor
         Else
            If dmacc.cdsMGrupo.FieldByName('GRUPOADM').AsString = 'C' Then
               cbAdm.ItemIndex := 1 // Consulta
            Else
               cbAdm.ItemIndex := 0 // Usuario
   End;

   dmacc.cdsMGrupo.Edit;
   dbeGrupo.Enabled := False;
   dbeGrupoDes.SetFocus;

End;

Procedure TFMantAcceso.dbgUsuarioDblClick(Sender: TObject);
Begin
   dbgUsuario.Enabled := False;
   lblTitulo2.Caption := 'Edita Registro';
   pnlReg2.Visible := True;
   pnlReg2.SetFocus;
   dbeUsuario.Text := dmacc.cdsUsuarios.FieldByname('USERID').AsString;
   dbeNombre.Text := dmacc.cdsUsuarios.FieldByname('USERNOM').AsString;
   dbePassw1.Text := dmacc.DesEncripta(dmacc.cdsUsuarios.FieldByname('PASSWORD').AsString);
   dbePassw2.Text := dmacc.DesEncripta(dmacc.cdsUsuarios.FieldByname('PASSWORD').AsString);
   dmacc.cdsUsuarios.Edit;
   dbeUsuario.Enabled := False;
   dbeNombre.SetFocus;
End;

Procedure TFMantAcceso.bbtnOk2Click(Sender: TObject);
Var
   xSQL: String;
Begin
   If dbePassw1.Text <> dbePassw2.Text Then
   Begin
      ShowMessage('Error al Confirmar Password');
      Raise Exception.Create('Error al Confirmar Password');
   End;

   If dblcdOficina.Text = '' Then
      wOficina := ''
   Else
      wOficina := dblcdOficina.Text;

   If lblTitulo2.Caption = 'Inserta Registro' Then
   Begin
      If cbExp.Checked Then
         xSQL := 'Insert into TGE006 '
            + 'Values( ''' + dbeUsuario.Text + ''', ''' + dbeNombre.Text + ''', '
            + '''' + dmacc.Encripta(dbePassw1.Text) + ''', ' + quotedstr(FormatDatetime(wFormatFecha, dtpFecExp.date)) + ',' + quotedstr(wOficina) + ' ) '
      Else
         xSQL := 'Insert into TGE006( USERID, USERNOM, PASSWORD, OFDESID ) '
            + 'Values( ''' + dbeUsuario.Text + ''', ''' + dbeNombre.Text + ''', '
            + '''' + dmAcc.Encripta(dbePassw1.Text) + ''',' + quotedstr(wOficina) + ' ) ';

      dmacc.cdsUser.Close;
      dmacc.cdsUser.DataRequest(xSQL);
      dmacc.cdsUser.Execute;

      dbePassw1.Text := '';
      dbePassw2.Text := '';

      dbeUsuario.Enabled := True;
      dbeUsuario.SetFocus;
   End
   Else
   Begin

      If Not cbExp.Checked Then
         xSQL := 'Update TGE006 Set USERNOM=''' + dbeNombre.Text + ''', PASSWORD=''' + DMAcc.Encripta(dbePassw1.Text) + ''', '
            + 'FECEXP=null ' + ', OFDESID=' + quotedstr(wOficina)
            + ' Where USERID=''' + dbeUsuario.Text + ''''
      Else
         xSQL := 'Update TGE006 Set USERNOM=''' + dbeNombre.Text + ''', PASSWORD=''' + dmAcc.Encripta(dbePassw1.Text) + ''', '
            + 'FECEXP=' + quotedstr(FormatDatetime(wFormatFecha, dtpFecExp.date)) + ', OFDESID=' + quotedstr(wOficina)
            + ' Where USERID=''' + dbeUsuario.Text + '''';

      dmacc.cdsUser.Close;
      dmacc.cdsUser.DataRequest(xSQL);
      dmacc.cdsUser.Execute;

      pnlReg2.Visible := False;

      pnlAcceso.Enabled := True;
      pnlUsuarios.Enabled := True;

      dbgUsuario.SetFocus;
   End;

   xSQL := 'Select A.USERID, A.USERNOM, A.PASSWORD, A.FECEXP, A.OFDESID From TGE006 A '
      + 'Where not exists( Select * from TGE007 C '
      + 'where C.USERID=A.USERID and '
      + 'C.GrupoId=' + '''' + dmacc.cdsMGrupo.FieldByName('GRUPOID').AsString + ''' )';

   dmacc.cdsUser.Close;
   dmacc.cdsUser.DataRequest(xSQL);
   dmacc.cdsUser.Open;

End;

Procedure TFMantAcceso.bbtnCanc2Click(Sender: TObject);
Var
   xSQL: String;
Begin
   pnlReg2.Visible := False;
   pnlAcceso.Enabled := True;
   pnlUsuarios.Enabled := True;
   dbePassw2.PasswordChar := '*';

   xSQL := 'Select A.USERID, A.USERNOM, A.PASSWORD, A.FECEXP, A.OFDESID From TGE006 A';

   dmacc.cdsUser.Close;
   dmacc.cdsUser.DataRequest(xSQL);
   dmacc.cdsUser.Open;

   dbgUser.SetFocus;
End;

Procedure TFMantAcceso.dbgGrupoKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      If dmacc.cdsUsuarios.RecordCount > 0 Then
      Begin
         ShowMessage('No se puede Eliminar Grupo. Existen Usuarios Asignados al Grupo');
         Exit;
      End;
      If MessageDlg('¿Esta Seguro de Eliminar Registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         dmacc.cdsMGrupo.Delete;
         dmacc.cdsMGrupo.ApplyUpdates(-1);
      End;
   End;
End;

Procedure TFMantAcceso.dbgUsuarioKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      If MessageDlg('¿Esta Seguro de Eliminar Registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         dmacc.cdsUsuarios.Delete;
         dmacc.cdsUsuarios.ApplyUpdates(-1);
      End;
   End;
End;

Procedure TFMantAcceso.bbtnAsignaModGrupoClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If sModulo = '' Then
   Begin
      ShowMessage('Debe seleccionar un Modulo');
      Exit;
   End;

   xSQL := 'Select * from TGE001 '
      + 'where GRUPOID=''' + dmacc.cdsMGrupo.FieldByName('GRUPOID').AsString + ''' and '
      + 'MODULOID=''' + sModulo + ''' and TIPO=''0''';
   dmacc.cdsQry.Close;
   dmacc.cdsQry.DataRequest(xSQL);
   dmacc.cdsQry.Open;
   If dmacc.cdsQry.RecordCount > 0 Then
   Begin
      ShowMessage('Error : Ya existe Modulo en Grupo');
      Exit;
   End;

   xSQL := 'Select * from '
      + '( SELECT * FROM TGE007 WHERE GRUPOID=''' + dmacc.cdsMGrupo.FieldByName('GRUPOID').AsString + ''' ) A, '
      + '( SELECT A.GRUPOID, A.MODULOID, B.USERID '
      + 'FROM TGE001 A, TGE007 B '
      + 'WHERE A.MODULOID=''' + sModulo + ''' AND A.TIPO=''0'' AND A.GRUPOID=B.GRUPOID ) B '
      + 'WHERE A.USERID=B.USERID ';
   dmacc.cdsQry.Close;
   dmacc.cdsQry.DataRequest(xSQL);
   dmacc.cdsQry.Open;
   If dmacc.cdsQry.RecordCount > 0 Then
   Begin
      ShowMessage('No se puede dar Accesos a Modulo. Existe Usuario con Acceso a Este Modulo');
      Exit;
   End;

   xSQL := 'Select * from TGE001 '
      + 'where GRUPOID=''' + dmacc.cdsMGrupo.FieldByName('GRUPOID').AsString + ''' and '
      + 'MODULOID=''' + sModulo + '''';
   dmacc.cdsQry.Close;
   dmacc.cdsQry.DataRequest(xSQL);
   dmacc.cdsQry.Open;

   If sSRV_D = 'ORACLE' Then
      xSQL := 'Select NVL(DESCRIP,''' + sModulo + ''') NB from TGE600 Where CODIGO=''' + sModulo + ''''
   Else
      xSQL := 'Select COALESCE(DESCRIP,''' + sModulo + ''') NB from TGE600 Where CODIGO=''' + sModulo + '''';

   dmacc.cdsQry.Close;
   dmacc.cdsQry.DataRequest(xSQL);
   dmacc.cdsQry.Open;

   dmacc.cdsGrupos.Insert;
   dmacc.cdsGrupos.FieldByName('GRUPOID').AsString := dmacc.cdsMGrupo.FieldByName('GRUPOID').AsString;
   dmacc.cdsGrupos.FieldByName('MODULOID').AsString := sModulo;
   dmacc.cdsGrupos.FieldByName('TIPO').AsString := '0';
   dmacc.cdsGrupos.FieldByName('DESCRIPTIVO').AsString := 'Acceso Modulo: ' + Copy(dmacc.cdsQry.FieldByName('NB').AsString, 1, 18);
   dmacc.cdsGrupos.Post;
   dmacc.cdsGrupos.ApplyUpdates(-1);

   dbgGrupoRowChanged(Self);
End;

Procedure TFMantAcceso.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   dmacc.cdsUsuarios.Filtered := False;
End;

Procedure TFMantAcceso.dbgUserIButtonClick(Sender: TObject);
Begin
   pnlAcceso.Enabled := False;
   pnlUsuarios.Enabled := False;

   pnlReg2.Visible := True;
   pnlReg2.SetFocus;
   lblTitulo2.Caption := 'Inserta Registro';
   dbeUsuario.Text := '';
   dbeNombre.Text := '';
   dbePassw1.Text := '';
   dbePassw2.Text := '';
   dbeUsuario.Enabled := True;
   dbeUsuario.SetFocus;
End;

Procedure TFMantAcceso.dbgUserDblClick(Sender: TObject);
Begin

   pnlAcceso.Enabled := False;
   pnlUsuarios.Enabled := False;

   lblTitulo2.Caption := 'Edita Registro';
   pnlReg2.Visible := True;
   pnlReg2.SetFocus;
   dbeUsuario.Text := dmacc.cdsUser.FieldByname('USERID').AsString;
   dbeNombre.Text := dmacc.cdsUser.FieldByname('USERNOM').AsString;
   dbePassw1.Text := dmAcc.DesEncripta(dmacc.cdsUser.FieldByname('PASSWORD').AsString);
   dbePassw2.Text := dmAcc.DesEncripta(dmacc.cdsUser.FieldByname('PASSWORD').AsString);
   dblcdOficina.Text := dmacc.cdsUser.FieldByName('OFDESID').AsString;
   dbeUsuario.Enabled := False;
   dbeNombre.SetFocus;
End;

Procedure TFMantAcceso.BitBtn5Click(Sender: TObject);
Var
   xSQL: String;
Begin
   If dmacc.cdsMGrupo.FieldByname('GRUPOID').AsString = '' Then
   Begin
      ShowMessage('Falta Crear Grupos');
      Exit;
   End;

   xSQL := 'Select * from '
      + '( SELECT A.GRUPOID, A.MODULOID, B.USERID '
      + 'FROM TGE001 A, TGE007 B '
      + 'WHERE A.MODULOID=''' + sModulo + ''' AND A.TIPO=''0'' AND A.GRUPOID=B.GRUPOID ) B '
      + 'WHERE USERID=''' + dmacc.cdsUser.FieldByName('USERID').AsString + '''';
   dmacc.cdsQry.Close;
   dmacc.cdsQry.DataRequest(xSQL);
   dmacc.cdsQry.Open;

   If dmacc.cdsQry.RecordCount > 0 Then
   Begin
      ShowMessage('No se puede dar Accesos a Usuario. Existe Usuario con Acceso a Este Modulo');
      Exit;
   End;

   xSQL := 'Insert into TGE007 ( USERID, USERNOM, GRUPOID )'
      + 'Values( ''' + dmacc.cdsUser.FieldByName('USERID').AsString + ''', '
      + '''' + dmacc.cdsUser.FieldByName('USERNOM').AsString + ''', '
      + '''' + dmacc.cdsMGrupo.FieldByname('GRUPOID').AsString + ''' )';
   dmacc.cdsUsuarios.Close;
   dmacc.cdsUsuarios.DataRequest(xSQL);
   dmacc.cdsUsuarios.Execute;

   xSQL := 'Select A.USERID, A.USERNOM, A.GRUPOID From TGE007 A '
      + 'Where A.GRUPOID=' + '''' + dmacc.cdsMGrupo.FieldByName('GRUPOID').AsString + ''' ';

   dmacc.cdsUsuarios.Close;
   dmacc.cdsUsuarios.DataRequest(xSQL);
   dmacc.cdsUsuarios.Open;
End;

Procedure TFMantAcceso.BitBtn4Click(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'Delete from TGE007 '
      + 'Where USERID=''' + dmacc.cdsUsuarios.FieldByName('USERID').AsString + ''' '
      + 'and GRUPOID=''' + dmacc.cdsUsuarios.FieldByName('GRUPOID').AsString + ''' ';
   dmacc.cdsUsuarios.Close;
   dmacc.cdsUsuarios.DataRequest(xSQL);
   dmacc.cdsUsuarios.Execute;
   xSQL := 'Select A.USERID, A.USERNOM, A.GRUPOID From TGE007 A '
      + 'Where A.GRUPOID=' + '''' + dmacc.cdsMGrupo.FieldByName('GRUPOID').AsString + ''' ';

   dmacc.cdsUsuarios.Close;
   dmacc.cdsUsuarios.DataRequest(xSQL);
   dmacc.cdsUsuarios.Open;
End;

Procedure TFMantAcceso.BitBtn2Click(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'Select A.GRUPOID, D.GRUPODES, B.MODULOID, C.DESCRIP '
      + 'From TGE007 A, TGE001 B, TGE600 C, TGE003 D '
      + 'Where A.USERID=''' + dmacc.cdsUser.FieldByName('USERID').AsString + ''' '
      + 'and B.GRUPOID=A.GRUPOID AND B.TIPO=''0'' and B.MODULOID=C.CODIGO '
      + 'and A.GRUPOID=D.GRUPOID '
      + 'Order by A.GRUPOID, B.MODULOID';

   dmacc.cdsQry.Close;
   dmacc.cdsQry.DataRequest(xSQL);
   dmacc.cdsQry.Open;
   dbgGrupoB.DataSource := dmacc.dsQry;
   pnlGrupos.Visible := True;
   pnlAcceso.Enabled := False;
   pnlUsuarios.Enabled := False;
End;

Procedure TFMantAcceso.BitBtn3Click(Sender: TObject);
Begin
   dbgGrupoB.DataSource := Nil;
   dmacc.cdsQry.Close;
   pnlGrupos.Visible := False;
   pnlAcceso.Enabled := True;
   pnlUsuarios.Enabled := True;
   dbgUser.SetFocus;
End;

Procedure TFMantAcceso.dbgUserTitleButtonClick(Sender: TObject;
   AFieldName: String);
Begin
   pnlAcceso.Enabled := False;
   pnlUsuarios.Enabled := False;
   pnlBusca.Visible := True;
   isUser.DataSource := dmacc.dsUser;
   If AFieldName = 'USERID' Then
   Begin
      lblBusca.Caption := 'Usuario';
      isUser.SearchField := 'USERID';
   End;
   If AFieldName = 'USERNOM' Then
   Begin
      lblBusca.Caption := 'Nombre';
      isUser.SearchField := 'USERNOM';
   End;
   isUser.SetFocus;
End;

Procedure TFMantAcceso.isUserExit(Sender: TObject);
Begin
   pnlBusca.Visible := False;
   pnlAcceso.Enabled := True;
   pnlUsuarios.Enabled := True;
End;

Procedure TFMantAcceso.BitBtn6Click(Sender: TObject);
Begin
   pnlBusca.Visible := False;
   pnlAcceso.Enabled := True;
   pnlUsuarios.Enabled := True;
End;

Procedure TFMantAcceso.cbExpClick(Sender: TObject);
Begin
   If cbExp.Checked Then
   Begin
      dtpFecExp.DateTime := Date;
      gbFecha.Enabled := True
   End
   Else
   Begin
      dtpFecExp.Clear;
      gbFecha.Enabled := False;
   End
End;

Procedure TFMantAcceso.dbgGrupoDetKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      If MessageDlg('¿Esta Seguro de Eliminar Registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         dmacc.cdsGrupos.Delete;
         dmacc.cdsGrupos.ApplyUpdates(-1);
      End;
   End;
End;

Procedure TFMantAcceso.AccesosUsuarios(xxModulo, xxTipo, xxForma: String);
Begin
End;

Function TFMantAcceso.BuscaTButton(Const xNombre: String; xForm: TForm): TButton;
Var
   ic: Integer;
Begin
   Result := Nil;
   ic := xForm.ComponentCount - 1;
   While (xForm.Components[ic].Name <> xNombre) And (ic > -1) Do
   Begin
      Dec(ic);
   End;
   If xForm.Components[ic].Name = xNombre Then Result := TButton(xForm.Components[ic]);
End;

Function TFMantAcceso.BuscaTSpeedButton(Const xNombre: String; xForm: TForm): TSpeedButton;
Var
   ic: Integer;
Begin
   Result := Nil;
   ic := xForm.ComponentCount - 1;
   While (xForm.Components[ic].Name <> xNombre) And (ic > -1) Do
   Begin
      Dec(ic);
   End;
   If xForm.Components[ic].Name = xNombre Then Result := TSpeedButton(xForm.Components[ic]);
End;

Procedure TFMantAcceso.ColorButtons(xForm: TForm);
Var
   ic: Integer;
Begin
   ic := xForm.ComponentCount - 1;
   For ic := 0 To xForm.ComponentCount - 1 Do
   Begin
      If xForm.Components[ic].ClassName = 'TButton' Then
         TButton(xForm.Components[ic]).Font.Color := clNavy;

      If xForm.Components[ic].ClassName = 'TBitBtn' Then
         TBitBtn(xForm.Components[ic]).Font.Color := clNavy;

      If xForm.Components[ic].ClassName = 'TSpeedButton' Then
         TSpeedButton(xForm.Components[ic]).Font.Color := clNavy;

      If xForm.Components[ic].ClassName = 'TwwIButton' Then
         TwwIButton(xForm.Components[ic]).Font.Color := clNavy;
   End;

End;

Procedure TFMantAcceso.AplicaDatos(wCDS: TwwClientDataSet; wNomArch: String);
Begin
//
End;

Procedure TFMantAcceso.ControlTran;
Begin
//
End;

Function TFMantAcceso.BuscaObjeto(Const xNombre: String; xForm: TForm): TControl;
Var
   ic: Integer;
Begin
   ic := xForm.ComponentCount - 1;
   While (xForm.Components[ic].Name <> xNombre) And (ic > -1) Do
   Begin
      Dec(ic);
   End;
   If xForm.Components[ic].Name = xNombre Then
      Result := TControl(xForm.Components[ic])
   Else
      Result := Nil;
End;

Procedure TFMantAcceso.dblcdOficinaExit(Sender: TObject);
Begin
   Label13.Caption := dmacc.cdsQry1.FieldByName('OFDESNOM').AsString;
End;

Procedure TFMantAcceso.FormCreate(Sender: TObject);
Var
   xSQL: String;
Begin
// Módulo - dblcdModulo
   xSQL := 'Select CODIGO, DESCRIP From TGE600 A where FLAGSTD=''S'' ';
   xSQL := 'Select CODIGO, DESCRIP From TGE600 ';
   DMACC.cdsModulos.Close;
   DMACC.cdsModulos.DataRequest(xSQL);
   DMACC.cdsModulos.Open;
   DMACC.cdsModulos.First;
   dblcdModulo.LookupField := '';
   dblcdModulo.LookupTable := DMACC.cdsModulos;
   dblcdModulo.LookupField := 'DESCRIP';
   dblcdModulo.Selected.Clear;
   dblcdModulo.Selected.Add('CODIGO' + #9 + '6' + #9 + 'Id');
   dblcdModulo.Selected.Add('DESCRIP' + #9 + '16' + #9 + 'Módulo');

// Grupos de Usuarios
   xSQL := 'Select GRUPOID, GRUPODES, GRUPOADM from TGE003 '
      + 'where GRUPOID '
      + ' not in (select DISTINCT GRUPOID '
      + '         from TGE001 '
      + '         where MODULOID=' + quotedstr(dblcdModulo.Text)
      + '           and TIPO=''0'') ';
   DMACC.cdsMGrupo.Close;
   DMACC.cdsMGrupo.DataRequest(xSQL);
   DMACC.cdsMGrupo.Open;
   dbgGrupo.DataSource := DMACC.dsMGrupo;
   dbgGrupo.Selected.Clear;
   dbgGrupo.Selected.Add('GRUPOID'#9'18'#9'Grupo');
   dbgGrupo.Selected.Add('GRUPODES'#9'25'#9'Nombre Grupo');
   dbgGrupo.Selected.Add('GRUPOADM'#9'5'#9'Adm.~S/N');
   dbgGrupo.ApplySelected;

// Grupos del Módulo
   xSQL := 'select distinct TGE001.GRUPOID, TGE003.GRUPODES, TGE003.GRUPOADM '
      + 'from TGE001, TGE003 '
      + 'where TGE001.MODULOID=' + quotedstr(dblcdModulo.Text)
      + '  and TGE001.TIPO=''0'' '
      + '  and TGE003.GRUPOID=TGE001.GRUPOID ';
   DMACC.cdsQry6.Close;
   DMACC.cdsQry6.DataRequest(xSQL);
   DMACC.cdsQry6.Open;
   dbgGruposDelModulo.DataSource := DMACC.dsQry6;
   dbgGruposDelModulo.Selected.Clear;
   dbgGruposDelModulo.Selected.Add('GRUPOID'#9'18'#9'Grupo');
   dbgGruposDelModulo.Selected.Add('GRUPODES'#9'20'#9'Nombre Grupo');
   dbgGruposDelModulo.Selected.Add('GRUPOADM'#9'5'#9'Adm.~S/N');
   dbgGruposDelModulo.ApplySelected;

// Accesos del Grupo
   xSQL := 'Select GRUPOID, MODULOID, TIPO, OBJETO, FORMA, DESCRIPTIVO from TGE001';
   DMACC.cdsGrupos.Open;
   DMACC.cdsGrupos.Filter := '';
   DMACC.cdsGrupos.Filter := 'GrupoId=' + quotedstr(DMACC.cdsMGrupo.FieldByName('GRUPOID').AsString);
   DMACC.cdsGrupos.Filtered := True;
   dbgGrupodet.DataSource := DMACC.dsGrupos;
   dbgGrupodet.Selected.Add('MODULOID'#9'5'#9'Módulo');
   dbgGrupodet.Selected.Add('DESCRIPTIVO'#9'35'#9'Descriptivo'#9'F');
   dbgGrupodet.ApplySelected;

// Oficina
   xSQL := 'Select OFDESID, OFDESNOM From APO110';
   DMACC.cdsQry1.Close;
   DMACC.cdsQry1.DataRequest(xSQL);
   DMACC.cdsQry1.Open;
   dblcdOficina.LookupField := '';
   dblcdOficina.LookupTable := DMACC.cdsQry1;
   dblcdOficina.LookupField := 'OFDESID';
   dblcdOficina.Selected.Clear;
   dblcdOficina.Selected.Add('OFDESID' + #9 + '4' + #9 + 'Id');
   dblcdOficina.Selected.Add('OFDESNOM' + #9 + '30' + #9 + 'Oficina');

// Usuarios
   xSQL := 'Select A.USERID, A.USERNOM, A.PASSWORD, A.FECEXP, A.OFDESID From TGE006 A';
   DMACC.cdsUser.Close;
   DMACC.cdsUser.DataRequest(xSQL);
   DMACC.cdsUser.Open;
   dbgUser.DataSource := DMACC.dsUser;
   dbgUser.Selected.Clear;
   dbgUser.Selected.Add('USERID'#9'14'#9'Usuario');
   dbgUser.Selected.Add('USERNOM'#9'17'#9'Nombre Usuario');
   dbgUser.Selected.Add('FECEXP'#9'10'#9'Fecha~Expiración');
   dbgUser.ApplySelected;

// Grupos del Usuario
   xSQL := 'Select A.USERID, A.USERNOM, GRUPOID From TGE007 A '
      + 'Where A.GrupoId=' + '''' + dmacc.cdsMGrupo.FieldByName('GRUPOID').AsString + ''' ';
   DMACC.cdsUsuarios.Close;
   DMACC.cdsUsuarios.IndexFieldNames := 'USERID';
   DMACC.cdsUsuarios.DataRequest(xSQL);
   DMACC.cdsUsuarios.Open;
   dbgUsuario.DataSource := dmacc.dsUsuarios;
   dbgUsuario.Selected.Clear;
   dbgUsuario.Selected.Add('USERID'#9'20'#9'Usuario');
   dbgUsuario.Selected.Add('USERNOM'#9'24'#9'Nombre');
   dbgUsuario.ApplySelected;
End;

Procedure TFMantAcceso.dblcdModuloExit(Sender: TObject);
Begin
   sModulo := DMACC.cdsModulos.FielDbyname('CODIGO').AsString;
End;

Procedure TFMantAcceso.dbgGruposDelModuloRowChanged(Sender: TObject);
Begin
// Accesos del Grupo
// filtra Accesos del Grupo en el puntero
   DMACC.cdsGrupos.Filter := '';
   DMACC.cdsGrupos.Filter := 'GrupoId=''' + DMACC.cdsMGrupo.FieldByName('GRUPOID').AsString + ''' and TIPO<>''0'' '
      + ' and ModuloId=''' + DMACC.cdsQry6.FieldByName('MODULOID').AsString + '''';
   DMACC.cdsGrupos.Filtered := true;
End;

Procedure TFMantAcceso.dbgGrupoRowChanged(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'select grupoid, moduloid, descrip  from TGE001, TGE600 '
      + 'where tipo=''0'' and grupoid=''' + DMACC.cdsMGrupo.FieldByName('GRUPOID').AsString + ''''
      + ' and moduloid=codigo(+)';
   DMACC.cdsQry6.Close;
   DMACC.cdsQry6.DataRequest(xSQL);
   DMACC.cdsQry6.Open;
   dbgGruposDelModulo.DataSource := DMACC.dsQry6;
   dbgGruposDelModulo.Selected.Clear;
   dbgGruposDelModulo.Selected.Add('MODULOID'#9'5'#9'Id.');
   dbgGruposDelModulo.Selected.Add('DESCRIP'#9'20'#9'Módulo');
   dbgGruposDelModulo.ApplySelected;

// Accesos del Grupo
// filtra Accesos del Grupo en el puntero
   DMACC.cdsGrupos.Filter := '';
   DMACC.cdsGrupos.Filter := 'GrupoId=''' + DMACC.cdsMGrupo.FieldByName('GRUPOID').AsString + ''' and TIPO<>''0'' '
      + ' and ModuloId=''' + DMACC.cdsQry6.FieldByName('MODULOID').AsString + '''';
   DMACC.cdsGrupos.Filtered := true;

// Grupos del Usuario
   xSQL := 'Select A.USERID, A.USERNOM, A.GRUPOID From TGE007 A '
      + 'Where A.GrupoId=' + '''' + dmacc.cdsMGrupo.FieldByName('GRUPOID').AsString + ''' ';
   DMACC.cdsUsuarios.Close;
   DMACC.cdsUsuarios.DataRequest(xSQL);
   DMACC.cdsUsuarios.Open;
End;

Procedure TFMantAcceso.BitBtn1Click(Sender: TObject);
Var
   xSQL: String;
Begin
   If MessageDlg('¿ Esta Seguro de Eliminar el Módulo ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      xSQL := 'delete from TGE001 '
         + 'Where GRUPOID = ''' + dmacc.cdsQry6.FieldByName('GRUPOID').AsString + ''' '
         + ' and MODULOID= ''' + dmacc.cdsQry6.FieldByName('MODULOID').AsString + '''';
      dmacc.cdsQry.Close;
      dmacc.cdsQry.DataRequest(xSQL);
      dmacc.cdsQry.Execute;

      dbgGrupoRowChanged(Self);
   End;
End;

Procedure TFMantAcceso.bbtnCiaDelClick(Sender: TObject);
Begin
   If MessageDlg('¿Esta Seguro de Eliminar Registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      dmacc.cdsGrupos.Delete;
      dmacc.cdsGrupos.ApplyUpdates(-1);
   End;
End;

Procedure TFMantAcceso.sbVerClick(Sender: TObject);
Begin
   dbePassw2.PasswordChar := #0;
   dbePassw2.Refresh;
End;

End.
// Fin HPC_201801_CXP


