// Actualizaciones
//HPC_201801_CXP    29/01/2018 Entrega a Control de Calidad

// Inicio HPC_201801_CXP
// Entrega a Control de Calidad

Unit ACC020;

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, Mask, Grids, Wwdbigrd, Wwdbgrid, Wwkeycb,
   ExtCtrls, ppEndUsr, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppBands, ppStrtch, ppSubRpt, ppCtrls, ppVar, ppPrnabl, ppCache,
   ppParameter;

Type
   TFAccesoTablas = Class(TForm)
      pnlCodigo: TPanel;
      dbgTablas: TwwDBGrid;
      bbtnTablas: TBitBtn;
      dbgAccesos: TwwDBGrid;
      bbtnAccCod: TBitBtn;
      meTabla: TMaskEdit;
      dbgDatos: TwwDBGrid;
      bbtnCodigos: TBitBtn;
      meCodigo: TMaskEdit;
      bbtnInserta: TBitBtn;
      bbtnElimina: TBitBtn;
      Label1: TLabel;
      bbtnAsigna: TBitBtn;
      pnlCab1: TPanel;
      Label3: TLabel;
      Label4: TLabel;
      Label5: TLabel;
      Label6: TLabel;
      dbgUsuarios: TwwDBGrid;
      bbtnUsuarios: TBitBtn;
      bbtnModulo: TBitBtn;
      dbgModulos: TwwDBGrid;
      meUsuario: TMaskEdit;
      meModulo: TMaskEdit;
      meUsuDes: TMaskEdit;
      BitBtn3: TBitBtn;
      pnlCia: TPanel;
      dbgCia: TwwDBGrid;
      bbtnCia: TBitBtn;
      dbgCiaSelecc: TwwDBGrid;
      bbtnCiaSelecc: TBitBtn;
      bbtnCiaAdd: TBitBtn;
      bbtnCiaDel: TBitBtn;
      meCia: TMaskEdit;
      pnlTablas: TPanel;
      dbgTablaSel: TwwDBGrid;
      bbtnTablaAdd: TBitBtn;
      bbtnTablaDel: TBitBtn;
      Cerrar: TBitBtn;
      Panel1: TPanel;
      Label2: TLabel;
      lblBusca: TLabel;
      isBusca: TwwIncrementalSearch;
      bbtnTablasSel: TBitBtn;
      bbtnRep: TBitBtn;
      ppdbAcc: TppDBPipeline;
      pprAcc: TppReport;
      ppdAcc: TppDesigner;
      ppdbAcc2: TppDBPipeline;
      ppParameterList1: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      ppLabel2: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppSystemVariable3: TppSystemVariable;
      ppLabel4: TppLabel;
      ppLine1: TppLine;
      ppDetailBand1: TppDetailBand;
      ppDBText2: TppDBText;
      ppDBText5: TppDBText;
      ppDBText7: TppDBText;
      ppDBText3: TppDBText;
      ppDBText8: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppDBText1: TppDBText;
      ppDBText4: TppDBText;
      ppDBText6: TppDBText;
      ppLabel1: TppLabel;
      ppLabel3: TppLabel;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppSubReport1: TppSubReport;
      ppChildReport1: TppChildReport;
      ppTitleBand1: TppTitleBand;
      ppLine2: TppLine;
      ppDetailBand2: TppDetailBand;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppGroup5: TppGroup;
      ppGroupHeaderBand5: TppGroupHeaderBand;
      ppGroupFooterBand5: TppGroupFooterBand;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      Procedure bbtnUsuariosClick(Sender: TObject);
      Procedure bbtnTablasClick(Sender: TObject);
      Procedure bbtnModuloClick(Sender: TObject);
      Procedure bbtnAccCodClick(Sender: TObject);
      Procedure dbgUsuariosDblClick(Sender: TObject);
      Procedure dbgModulosDblClick(Sender: TObject);
      Procedure dbgTablasDblClick(Sender: TObject);
      Procedure bbtnCodigosClick(Sender: TObject);
      Procedure bbtnInsertaClick(Sender: TObject);
      Procedure dbgUsuariosTitleButtonClick(Sender: TObject;
         AFieldName: String);
      Procedure dbgModulosTitleButtonClick(Sender: TObject;
         AFieldName: String);
      Procedure dbgTablasTitleButtonClick(Sender: TObject;
         AFieldName: String);
      Procedure dbgDatosTitleButtonClick(Sender: TObject;
         AFieldName: String);
      Procedure bbtnEliminaClick(Sender: TObject);
      Procedure BitBtn3Click(Sender: TObject);
      Procedure bbtnCiaSeleccClick(Sender: TObject);
      Procedure bbtnCiaClick(Sender: TObject);
      Procedure bbtnCiaAddClick(Sender: TObject);
      Procedure bbtnCiaDelClick(Sender: TObject);
      Procedure dbgCiaSeleccDblClick(Sender: TObject);
      Procedure bbtnAsignaClick(Sender: TObject);
      Procedure CerrarClick(Sender: TObject);
      Procedure dbgTablaSelTitleButtonClick(Sender: TObject;
         AFieldName: String);
      Procedure bbtnTablaAddClick(Sender: TObject);
      Procedure bbtnTablaDelClick(Sender: TObject);
      Procedure bbtnTablasSelClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure bbtnRepClick(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FAccesoTablas: TFAccesoTablas;

Implementation

{$R *.dfm}

Uses ACCDM;

Procedure TFAccesoTablas.bbtnUsuariosClick(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'Select * from TGE004 '
      + 'Where NTABLA LIKE ''' + meTabla.Text + '%'' '
      + 'and USERID LIKE ''' + meUsuario.Text + '%'' '
      + 'Order by USERID, NTABLA';

   xSQL := 'Select USERID, USERNOM from TGE006 '
      + 'Order by USERID';
   dbgUsuarios.Selected.Clear;
   dbgUsuarios.Selected.Add('USERID'#9'15'#9'Usuario'#9'F');
   dbgUsuarios.Selected.Add('USERNOM'#9'19'#9'Nombre'#9'F');

   DMACC.cdsUsuarios.Close;
   DMACC.cdsUsuarios.DataRequest(xSQL);
   DMACC.cdsUsuarios.Open;
End;

Procedure TFAccesoTablas.bbtnTablasClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If trim(meModulo.Text) <> '' Then
      xSQL := 'Select ZARCHIVO, DESCRIP from SOLREF WHERE GESTIONDET LIKE ''%' + meModulo.TEXT + ',%'' '
         + 'Order by ZARCHIVO'
   Else
      xSQL := 'Select ZARCHIVO, DESCRIP from SOLREF WHERE GESTIONDET LIKE ''ZZYY'' '
         + 'Order by ZARCHIVO';

   dbgTablas.Selected.Clear;
   dbgTablas.Selected.Add('ZARCHIVO'#9'15'#9'Tabla'#9'F');
   dbgTablas.Selected.Add('DESCRIP'#9'25'#9'Descripción'#9'F');
   DMACC.cdsTmp.Close;
   DMACC.cdsTmp.DataRequest(xSQL);
   DMACC.cdsTmp.Open;

End;

Procedure TFAccesoTablas.bbtnModuloClick(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'Select CODIGO, DESCRIP from TGE600 WHERE FLAGSTD=''S'' '
      + 'Order by CODIGO';
   DMACC.cdsQry66.Close;
   DMACC.cdsQry66.DataRequest(xSQL);
   DMACC.cdsQry66.Open;
   dbgModulos.Selected.Clear;
   dbgModulos.Selected.Add('CODIGO'#9'06'#9'Módulo'#9'F');
   dbgModulos.Selected.Add('DESCRIP'#9'22'#9'Descripción'#9'F');
End;

Procedure TFAccesoTablas.bbtnAccCodClick(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'Select * from TGE004 '
      + 'Where NTABLA   LIKE ''' + meTabla.Text + '%'' '
      + 'and USERID   =    ''' + meUsuario.Text + ''' '
      + 'and MODULOID LIKE ''' + meModulo.Text + '%'' '
      + 'and CIAID = ''' + meCia.TEXT + ''' '
      + 'Order by USERID, MODULOID, NTABLA, CODIGO';

   dbgAccesos.Selected.Clear;
   dbgAccesos.Selected.Add('CODIGO'#9'12'#9'Código'#9'F');
   dbgAccesos.Selected.Add('MODULOID'#9'07'#9'Módulo'#9'F');
   dbgAccesos.Selected.Add('NTABLA'#9'15'#9'Tabla'#9'F');
   dbgAccesos.Selected.Add('CIAID'#9'3'#9'Cía'#9'F');

   DMACC.CDSDOCID.Close;
   DMACC.CDSDOCID.DataRequest(xSQL);
   DMACC.CDSDOCID.Open;

End;

Procedure TFAccesoTablas.dbgUsuariosDblClick(Sender: TObject);
Begin
   meUsuario.Text := DMACC.cdsUsuarios.FieldByName('USERID').AsString;
   bbtnCiaClick(self);
   bbtnCiaSeleccClick(self);
   bbtnTablasClick(Self);
   bbtnCodigosClick(Self);
   bbtnAccCodClick(Self);
End;

Procedure TFAccesoTablas.dbgModulosDblClick(Sender: TObject);
Begin
   meModulo.Text := DMACC.cdsQry66.FieldByName('CODIGO').AsString;
   meCia.text := '';
   bbtnCiaClick(self);
   bbtnCiaSeleccClick(self);
   bbtnTablasClick(self);
End;

Procedure TFAccesoTablas.dbgTablasDblClick(Sender: TObject);
Begin
   meTabla.Text := DMACC.cdsTmp.FieldByName('ZARCHIVO').AsString;
   bbtnAccCodClick(self);
   bbtnCodigosClick(self);
End;

Procedure TFAccesoTablas.bbtnCodigosClick(Sender: TObject);
Var
   xSQL, cCodigo, cDesc, sWhereCia: String;
Begin
   If metabla.Text = '' Then Exit;

   xSQL := 'Select * from PLAN04 '
      + 'WHERE ARCHIVO=''' + metabla.Text + ''' '
      + 'AND CAMPO=''CIAID''';
   DMACC.CDSTIPCAM.Close;
   DMACC.CDSTIPCAM.DataRequest(xSQL);
   DMACC.CDSTIPCAM.Open;
   sWhereCia := '';
   If DMACC.CDSTIPCAM.RecordCount > 0 Then
      sWhereCia := ' where CIAID=''' + DMACC.cdsCiaSelec.FieldByname('CODIGO').AsString + ''' ';

   xSQL := 'Select * from PLAN04 '
      + 'WHERE ARCHIVO=''' + metabla.Text + ''' '
      + 'AND DETALLE IN (''C'')';
   DMACC.CDSTIPCAM.Close;
   DMACC.CDSTIPCAM.DataRequest(xSQL);
   DMACC.CDSTIPCAM.Open;
   cCodigo := DMACC.CDSTIPCAM.FieldByname('CAMPO').AsString;
   meCodigo.Text := DMACC.CDSTIPCAM.FieldByname('CAMPO').AsString;

   xSQL := 'Select * from PLAN04 '
      + 'WHERE ARCHIVO=''' + metabla.Text + ''' '
      + 'AND DETALLE IN (''S'')';
   DMACC.CDSTIPCAM.Close;
   DMACC.CDSTIPCAM.DataRequest(xSQL);
   DMACC.CDSTIPCAM.Open;
   cDesc := DMACC.CDSTIPCAM.FieldByname('CAMPO').AsString;

   xSQL := 'Select ' + cCodigo + ', ' + cDesc + ' from ' + metabla.Text + sWhereCia + ' ORDER BY ' + cCodigo;

   dbgDatos.Selected.Clear;
   dbgDatos.Selected.Add(cCodigo + #9'12'#9'Codigo'#9'F');
   dbgDatos.Selected.Add(cDesc + #9'28'#9'Descripción'#9'F');

   DMACC.CDSTIPCAM.Close;
   DMACC.CDSTIPCAM.DataRequest(xSQL);
   DMACC.CDSTIPCAM.Open;
End;

Procedure TFAccesoTablas.bbtnInsertaClick(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'Select USERID from DB2ADMIN.TGE004 '
      + 'where MODULOID=''' + DMACC.cdsQry66.FieldByname('CODIGO').AsString + ''''
      + ' and USERID=''' + meUsuario.text + ''''
      + ' and NTABLA=''' + meTabla.text + ''''
      + ' and CODIGO=''' + DMACC.CDSTIPCAM.FieldByName(meCodigo.Text).AsString + ''''
      + ' and CIAID=''' + DMACC.cdsCiaSelec.FieldByName('CODIGO').AsString + '''';
   DMACC.cdsBusca.close;
   DMACC.cdsBusca.DataRequest(xSQL);
   DMACC.cdsBusca.Open;

   If DMACC.cdsBusca.recordcount > 0 Then
   Begin
      ShowMessage('Codigo ya fue registrador');
      Exit;
   End;

   DMACC.CDSDOCID.Append;
   DMACC.CDSDOCID.FieldByName('MODULOID').AsString := DMACC.cdsQry66.FieldByname('CODIGO').AsString;
   DMACC.CDSDOCID.FieldByName('USERID').AsString := meUsuario.text;
   DMACC.CDSDOCID.FieldByName('NTABLA').AsString := meTabla.text;
   DMACC.CDSDOCID.FieldByName('CODIGO').AsString := DMACC.CDSTIPCAM.FieldByName(meCodigo.Text).AsString;
   DMACC.CDSDOCID.FieldByName('CIAID').AsString := DMACC.cdsCiaSelec.FieldByName('CODIGO').AsString;
   DMACC.CDSDOCID.Post;
   DMACC.CDSDOCID.ApplyUpdates(0);

End;

Procedure TFAccesoTablas.dbgUsuariosTitleButtonClick(Sender: TObject;
   AFieldName: String);
Begin
   lblBusca.Caption := 'Usuarios';
   isBusca.DataSource := DMACC.dsUsuarios;
   isBusca.SearchField := AFieldName;
   isBusca.SetFocus;
End;

Procedure TFAccesoTablas.dbgModulosTitleButtonClick(Sender: TObject;
   AFieldName: String);
Begin
   lblBusca.Caption := 'Módulo';
   isBusca.DataSource := DMACC.dsQry6;
   isBusca.SearchField := AFieldName;
   isBusca.SetFocus;
End;

Procedure TFAccesoTablas.dbgTablasTitleButtonClick(Sender: TObject;
   AFieldName: String);
Begin
   lblBusca.Caption := 'Tablas';
   isBusca.DataSource := DMACC.dsTmp;
   isBusca.SearchField := AFieldName;
   isBusca.SetFocus;
End;

Procedure TFAccesoTablas.dbgDatosTitleButtonClick(Sender: TObject;
   AFieldName: String);
Begin
   lblBusca.Caption := 'Datos';
   isBusca.DataSource := DMACC.DSTIPCAM;
   isBusca.SearchField := AFieldName;
   isBusca.SetFocus;
End;

Procedure TFAccesoTablas.bbtnEliminaClick(Sender: TObject);
Begin
   DMACC.CDSDOCID.Delete;
   DMACC.CDSDOCID.ApplyUpdates(0);
End;

Procedure TFAccesoTablas.BitBtn3Click(Sender: TObject);
Var
   xSQL: String;
Begin

   xSQL := 'INSERT INTO TGE004 '
      + 'Select CODIGO, MODULOID, NTABLA, ''' + meUsuDes.Text + ''', CHK from TGE004 A '
      + 'WHERE USERID=''' + meUsuario.Text + ''' '
      + ' AND NOT EXISTS ( SELECT * FROM TGE004 B '
      + ' WHERE USERID=''' + meUsuDes.Text + ''' '
      + ' AND A.CODIGO=B.CODIGO AND A.MODULOID=B.MODULOID AND A.NTABLA=B.NTABLA ) ';

   If meModulo.Text <> '' Then
      xSQL := xSQL + ' and MODULOID=''' + meModulo.Text + ''' ';

   DMACC.CDSTIPCAM.Close;
   DMACC.CDSTIPCAM.DataRequest(xSQL);
   DMACC.CDSTIPCAM.Execute;

   ShowMessage('Ok');
End;

Procedure TFAccesoTablas.bbtnCiaSeleccClick(Sender: TObject);
Var
   xSQL: String;
Begin

   If (trim(meUsuario.Text) = '') Or (trim(meModulo.Text) = '') Then
      xSQL := 'Select CODIGO, CIADES, MODULOID, USERID, NTABLA from TGE004, TGE101 B '
         + 'Where NTABLA   LIKE ''TGE101'' '
         + 'and USERID   =    ''zzzzzzzz'' '
         + 'and MODULOID LIKE ''xxyy'' '
         + 'and CODIGO=B.CIAID(+) '
         + 'Order by USERID, MODULOID, NTABLA, CODIGO'
   Else
      xSQL := 'Select CODIGO, CIADES, MODULOID, USERID, NTABLA from TGE004, TGE101 B '
         + 'Where NTABLA   LIKE ''TGE101'' '
         + 'and USERID   =    ''' + meUsuario.Text + ''' '
         + 'and MODULOID LIKE ''' + meModulo.Text + '%'' '
         + 'and CODIGO=B.CIAID(+) '
         + 'Order by USERID, MODULOID, NTABLA, CODIGO';

   dbgCiaSelecc.Selected.Clear;
   dbgCiaSelecc.Selected.Add('CODIGO'#9'03'#9'Cod'#9'F');
   dbgCiaSelecc.Selected.Add('CIADES'#9'18'#9'Compañía'#9'F');
   dbgCiaSelecc.Selected.Add('MODULOID'#9'04'#9'Módulo'#9'F');

   DMACC.cdsCiaSelec.Close;
   DMACC.cdsCiaSelec.DataRequest(xSQL);
   DMACC.cdsCiaSelec.Open;
End;

Procedure TFAccesoTablas.bbtnCiaClick(Sender: TObject);
Var
   sSQL: String;
Begin
   If (trim(meUsuario.Text) = '') Or (trim(meModulo.Text) = '') Then
      sSQL := 'Select CIAID, CIADES FROM TGE101 '
         + 'WHERE CIAID IN ( '
         + 'Select CODIGO from TGE004 '
         + 'Where NTABLA=''TGE101'' '
         + ' and USERID = ''zzzzzzzz'' '
         + ' and MODULOID = ''zzyy'' )'
         + 'ORDER BY CIAID'
   Else

      sSQL := 'Select CIAID, CIADES FROM TGE101 '
         + 'WHERE CIAID NOT IN ( '
         + 'Select CODIGO from TGE004 '
         + 'Where NTABLA=''TGE101'' '
         + ' and USERID = ''' + meUsuario.Text + ''' '
         + ' and MODULOID = ''' + meModulo.Text + ''' )'
         + 'ORDER BY CIAID';

   dbgCia.Selected.Clear;
   dbgCia.Selected.Add('CIAID'#9'04'#9'Cod.'#9'F');
   dbgCia.Selected.Add('CIADES'#9'24'#9'Compañía'#9'F');

   DMACC.cdsCia.Close;
   DMACC.cdsCia.DataRequest(sSQL);
   DMACC.cdsCia.Open;
   dbgCia.Selected.Clear;
   dbgCia.Selected.Add('CIAID'#9'04'#9'Cod.'#9'F');
   dbgCia.Selected.Add('CIADES'#9'24'#9'Compañía'#9'F');
End;

Procedure TFAccesoTablas.bbtnCiaAddClick(Sender: TObject);
Var
   cSQL: String;
Begin
   cSQL := 'Insert into TGE004( CODIGO, MODULOID, NTABLA, USERID ) '
      + 'Values( ''' + DMACC.cdsCia.FieldByName('CIAID').AsString + ''', '
      + '''' + DMACC.cdsQry66.FieldByname('CODIGO').AsString + ''', '
      + '''' + 'TGE101' + ''', '
      + '''' + meUsuario.text + ''' )';
   DMACC.CDSTIPCAM.Close;
   DMACC.CDSTIPCAM.DataRequest(cSQL);
   DMACC.CDSTIPCAM.Execute;
   bbtnCiaSeleccClick(Self);
   bbtnCiaClick(Self);
End;

Procedure TFAccesoTablas.bbtnCiaDelClick(Sender: TObject);
Var
   cSQL: String;
Begin
   cSQL := 'Delete from TGE004 '
      + 'where CODIGO=  ''' + DMACC.cdsCiaSelec.FieldByName('CODIGO').AsString + ''' '
      + ' and MODULOID=''' + DMACC.cdsCiaSelec.FieldByName('MODULOID').AsString + ''' '
      + ' and NTABLA=  ''' + DMACC.cdsCiaSelec.FieldByName('NTABLA').AsString + ''' '
      + ' and USERID=  ''' + DMACC.cdsCiaSelec.FieldByName('USERID').AsString + ''' ';
   DMACC.CDSTIPCAM.Close;
   DMACC.CDSTIPCAM.DataRequest(cSQL);
   DMACC.CDSTIPCAM.Execute;

   bbtnCiaSeleccClick(Self);
   bbtnCiaClick(Self);
End;

Procedure TFAccesoTablas.dbgCiaSeleccDblClick(Sender: TObject);
Begin
   meCia.Text := DMACC.cdsCiaSelec.FieldByName('CODIGO').AsString;

   bbtnAccCodClick(SeLF);
End;

Procedure TFAccesoTablas.bbtnAsignaClick(Sender: TObject);
Begin
   pnlCab1.Enabled := False;
   bbtnAsigna.Enabled := False;
   bbtnTablas.Enabled := False;
   pnlTablas.Visible := True;
   pnlTablas.Left := 328;
   pnlTablas.Top := 3;
   pnlTablas.Color := clSkyBlue;
   pnlCab1.Color := clBtnFace;
   pnlCia.Color := clBtnFace;
   bbtnTablasSelClick(self);
End;

Procedure TFAccesoTablas.CerrarClick(Sender: TObject);
Begin
   pnlTablas.Visible := False;
   pnlCab1.Enabled := True;
   bbtnAsigna.Enabled := True;
   bbtnTablas.Enabled := True;
   pnlCab1.Color := clSkyBlue;
   pnlTablas.Color := clBtnFace;
   pnlCia.Color := $00F1A09A
End;

Procedure TFAccesoTablas.dbgTablaSelTitleButtonClick(Sender: TObject;
   AFieldName: String);
Begin
   lblBusca.Caption := 'Tablas';
   isBusca.DataSource := DMACC.dsTablas;
   isBusca.SearchField := AFieldName;
   isBusca.SetFocus;
End;

Procedure TFAccesoTablas.bbtnTablaAddClick(Sender: TObject);
Var
   cSQL: String;
Begin
   cSQL := 'update solref '
      + 'set gestiondet=gestiondet||''' + meModulo.Text + ','' '
      + 'where zarchivo=''' + DMACC.cdsTablas.FieldByname('ZARCHIVO').AsString + '''';

   DMACC.CDSTIPCAM.Close;
   DMACC.CDSTIPCAM.DataRequest(cSQL);
   DMACC.CDSTIPCAM.Execute;

   bbtnTablasClick(SELF);
   bbtnTablasSelClick(self);
End;

Procedure TFAccesoTablas.bbtnTablaDelClick(Sender: TObject);
Var
   cSQL: String;
Begin
   cSQL := 'update solref '
      + 'set gestiondet=replace( gestiondet, ''' + meModulo.Text + ',''' + ', ' + ''''' ) '
      + 'where zarchivo=''' + DMACC.cdsTmp.FieldByname('ZARCHIVO').AsString + '''';

   DMACC.CDSTIPCAM.Close;
   DMACC.CDSTIPCAM.DataRequest(cSQL);
   DMACC.CDSTIPCAM.Execute;

   bbtnTablasClick(SELF);
   bbtnTablasSelClick(self);
End;

Procedure TFAccesoTablas.bbtnTablasSelClick(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'Select ZARCHIVO, DESCRIP from SOLREF '
      + 'WHERE ZARCHIVO NOT IN ( '
      + 'Select ZARCHIVO from SOLREF '
      + 'Where GESTIONDET LIKE ''%' + meModulo.Text + ',%'' ) '
      + 'ORDER BY ZARCHIVO';

   dbgTablaSel.Selected.Clear;
   dbgTablaSel.Selected.Add('ZARCHIVO'#9'15'#9'Tabla'#9'F');
   dbgTablaSel.Selected.Add('DESCRIP'#9'25'#9'Descripción'#9'F');
   DMACC.cdsTablas.Close;
   DMACC.cdsTablas.DataRequest(sSQL);
   DMACC.cdsTablas.Open;
End;

Procedure TFAccesoTablas.FormShow(Sender: TObject);
Begin
   bbtnUsuariosClick(self);
   bbtnModuloClick(Self);
   bbtnTablasClick(Self);
End;

Procedure TFAccesoTablas.bbtnRepClick(Sender: TObject);
Var
   sSQL: String;
Begin
   sSQL := 'SELECT A.USERID, A.USERNOM, B.GRUPOID, '
      + 'CASE WHEN C.GRUPOADM=''G'' THEN ''ADMINISTRADOR'' '
      + 'WHEN C.GRUPOADM=''P'' THEN ''JEFE DE MODULO'' '
      + 'WHEN C.GRUPOADM=''V'' THEN ''SUPERVISOR DE MODULO'' '
      + 'WHEN C.GRUPOADM=''U'' THEN ''USUARIO OPERATIVO'' '
      + 'ELSE ''USUARIO DE CONSULTA'' END TIPO_USUARIO, '
      + 'D.MODULOID, MM.DESCRIP MODULO, E.TIPO, E.OBJETO, E.DESCRIPTIVO OPCION, '
      + 'CASE WHEN E.TIPO=''0'' THEN ''ACCESO AL MODULO'' ELSE ''NO ACCESO A OPCION'' END ESTADO '
      + 'FROM TGE006 A, TGE007 B, TGE003 C, TGE001 D, TGE001 E, TGE600 MM '
      + 'WHERE A.USERID=''' + DMACC.cdsUsuarios.FieldByname('USERID').AsString + ''' '
      + 'AND A.USERID=B.USERID(+) '
      + 'AND B.GRUPOID=C.GRUPOID(+) '
      + 'AND B.GRUPOID=D.GRUPOID(+) AND D.TIPO=''0'' '
      + 'AND D.GRUPOID=E.GRUPOID(+) AND D.MODULOID=E.MODULOID(+) '
      + 'AND D.MODULOID=MM.CODIGO(+) '
      + 'ORDER BY A.USERID, B.GRUPOID, D.MODULOID, E.TIPO';
   DMACC.cdsReporte.Close;
   DMACC.cdsReporte.DataRequest(sSQL);
   DMACC.cdsReporte.Open;

   sSQL := 'SELECT A.USERID, A.USERNOM, B.GRUPOID, '
      + 'CASE WHEN C.GRUPOADM=''G'' THEN ''ADMINISTRADOR'' '
      + 'WHEN C.GRUPOADM=''P'' THEN ''JEFE DE MODULO'' '
      + 'WHEN C.GRUPOADM=''V'' THEN ''SUPERVISOR DE MODULO'' '
      + 'WHEN C.GRUPOADM=''U'' THEN ''USUARIO OPERATIVO'' '
      + 'ELSE ''USUARIO DE CONSULTA'' END TIPO_USUARIO, '
      + 'D.MODULOID, MM.DESCRIP MODULO, '
      + 'F.CODIGO CIAID, CC.CIADES COMPAÑIA, '
      + 'G.NTABLA, RR.DESCRIP TABLAS, G.CODIGO CODSEL '
      + 'FROM TGE006 A, TGE007 B, TGE003 C, TGE001 D, TGE004 F, TGE004 G, TGE101 CC, TGE600 MM, SOLREF RR '
      + 'WHERE A.USERID=''' + DMACC.cdsUsuarios.FieldByname('USERID').AsString + ''' '
      + 'AND A.USERID=B.USERID(+)   AND B.GRUPOID=C.GRUPOID(+) AND B.GRUPOID=D.GRUPOID(+) AND D.TIPO=''0'' '
      + 'AND A.USERID=F.USERID AND D.MODULOID=F.MODULOID(+) AND F.NTABLA(+)=''TGE101'' '
      + 'AND F.USERID=G.USERID(+) AND F.MODULOID=G.MODULOID(+) AND F.CODIGO=G.CIAID(+) '
      + 'AND F.CODIGO=CC.CIAID(+) '
      + 'AND D.MODULOID=MM.CODIGO(+) '
      + 'AND G.NTABLA=RR.ZARCHIVO(+) '
      + 'ORDER BY A.USERID, B.GRUPOID, D.MODULOID, F.CODIGO, G.NTABLA, G.CODIGO';

   DMACC.cdsRepDet.Close;
   DMACC.cdsRepDet.DataRequest(sSQL);
   DMACC.cdsRepDet.Open;

   DMACC.cdsRepDet.IndexFieldNames := 'USERID;GRUPOID;MODULOID;CIAID;NTABLA;CODSEL';

   ppdAcc.ShowModal;
End;

End.
// Fin HPC_201801_CXP


