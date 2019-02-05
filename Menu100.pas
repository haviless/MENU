Unit Menu100;
// Inicio Uso Estándares:   01/08/2011
// Unidad               :   Menu100
// Formulario           :   FMenuOpcion
// Fecha de Creación    :
// Autor                :   Equipo de Desarrollo
// Objetivo             :   Muestra las opciones de menú implementadas en el OASIS

// Actualizaciones      :
//HPP_201101_LOG   25/01/2011  Se agrega el punto de menú
//                             Adquisiciones SSGG/Consultas SG/Artículos x Prov SG
//HPP_201104_ACF   01/04/2011  Se agrega el punto de menú
//                             Activos Fijos/Procesos/Desactivación en Bloque
//HPP_201107_ACF   09/05/2011  Se agrega el punto de menú
//                             Activos Fijos/Procesos/Cambio de Cod Barras
//HPP_201105_LOG   22/06/2011  Se implementa la funcionalidad que permite invocar la ventana
//                             de registro de ordenes de pago
//HPC_201203_CXC   17/02/2012  Se implementa la funcionalidad que permite invocar a la ventana
//                             creada para importar el registro de ventas de los hoteles
//                             que usan el sistema CHESS
//HPC_201202_LOG   16/04/2012  Se modifica la opción Maestro de proveedores debido
//                             a que se creó el Paquete PRV00 que contiene
//                             la funcionalidad relacionada al maestro de proveedores
//HPC_201208_LOG   22/05/2012: Se implementó el control de versiones
//HPC_201201_PLA   27/04/2012  Se
//HPC_201210_LOG   03/07/2012:  Se implementó la opción de generación del Cuadro Comparativo
//HPC_201202_ALM   13/08/2012:  Se implementó el control de versiones en ALMSG
//HPC_201204_CXC   28/08/2012  Se implementó el control de versiones en CXC
//HPC_201207_CAJA  21/09/2012  Se implementó el control de versiones en CAJA
//HPC_201206_CNT   16/10/2012  Se implementó el control de versiones en Contabilidad
//HPC_201210_FAC   16/10/2012  Se implementó el control de versiones en Ventas
//HPC_201302_CXC   19/04/2013  Se agregó el punto de menú "PLE registro de ventas"
//                             en el módulo de cuentas por cobrar
//HPC_201309_FAC   05/07/2013  Se retira el ingreso por ADICION de las Proformas y Facturas
//HPC_201310_FAC   14/08/2013  cambia a mantenimiento único de Clientes
//HPC_201307_CXC   20/08/2013  cambia a mantenimiento único de Clientes
//HPC_201308_CAJA  20/08/2013  cambia a mantenimiento único de Clientes
//HPC_201304_LOG   10/08/2013  adiciona Registro de Servicios Institucionales a módulo de Logística
//HPC_201401_CXP   24/02/2014  Se implementó el control de versiones en Cuentas por Pagar
//HPC_201401_CAJA - Control y Apertura de Caja
//HPC_201403_ALM   18/09/2014 Se retira la opcion de Maestro de Proveedores, especificamente de Almacen de Servicios Generales
//HPC_201405_LOG   16/10/2014 Unificación de módulos de Adquisiciones
//                            Se comentaron las opciones de Menú que apuntaban a Adquisiciones de Ventas
//                            Se comentaron las opciones de Menú que apuntaban a Adquisiciones de SSGG
//                            Se modificó el archivo oaCFG.ini
//                            Por orden de respeta la codificación de opción asignada a Adquisiciones de Ventas
//                            Se invocan a los bpl y opciones de Adquisiciones de SSGG
//HPC_201404_ALM   24/10/2014 Unificación de módulos de Inventarios
//                            Se comentaron las opciones de Menú que apuntaban a Inventarios de Ventas
//                            Se comentaron las opciones de Menú que apuntaban a Inventarios de SSGG
//                            Se modificó el archivo oaCFG.ini
//                            Por orden de respeta la codificación de opción asignada a Inventarios de Ventas
//                            Se invocan a los bpl y opciones de Inventarios de SSGG
//HPC_201601_LOG    09/09/2016 Se agrega opción para adicionar, Modificar Texto de los Tickets
//HPC_201801_CXP    29/01/2018 Cambio por Opciones de dietas de directorio
//                             Entrega a Control de Calidad
//HPC_201802_MNU    19/03/2018 Opción nueva para Mantenimiento del Maestro de Clientes derivada de HPC_201801_CLI
//                  19/03/2018 Retiro de Opción anterior -3040204- del Maestro de Clientes en Módulo de Ventas
//                  19/03/2018 Retiro de Opción anterior -3050201- del Maestro de Clientes en Módulo de Cuentas por Cobrar
//
//HPC_201803_MNU    22/08/2018 Se adiciona la verificación de versión en Activos Fijos derivada de HPC_201801_ACF

//*********************************************************
Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, fcLabel, ExtCtrls, fcdbtreeview, DB, Wwdatsrc, DBClient,
   wwclient, IniFiles, wwdbedit, wwdbdatetimepicker, Wwdbspin, wwdblook,
   wwFrame, Wwdbdlg, Menus, StdCtrls, Buttons, wwriched, oaVariables;

Type
   TFMenuOpcion = Class(TForm)
      fcTVMenu: TfcDBTreeView;
      cdsMenu1: TwwClientDataSet;
      cdsMenu2: TwwClientDataSet;
      cdsMenu3: TwwClientDataSet;
      dsMenu1: TwwDataSource;
      dsMenu2: TwwDataSource;
      dsMenu3: TwwDataSource;
      pnlMenu: TPanel;
      Panel2: TPanel;
      sbCambioPassword: TSpeedButton;
      sbControlAccesos: TSpeedButton;
      Panel1: TPanel;
      Panel3: TPanel;
      imgSimbolo: TImage;
      fcLabel1: TfcLabel;
      Procedure FormCreate(Sender: TObject);
      Procedure sbControlAccesosClick(Sender: TObject);
      Procedure sbCambioPasswordClick(Sender: TObject);
      Procedure sbHelpClick(Sender: TObject);
      Procedure fcTVMenuDblClick(TreeView: TfcDBCustomTreeView;
         Node: TfcDBTreeNode; Button: TMouseButton; Shift: TShiftState; X,
         Y: Integer);
   Private
    { Private declarations }
      Function StrZero(wNumero: String; wLargo: Integer): String;
      Procedure ejecutaPrograma(cPaquete, cPrograma: String);
      Procedure PHelp(xCodigo: String);
      Procedure TipoOpcion;
   Public
    { Public declarations }
      dbereHelp: TwwDBRichEdit;
      inifile: TIniFile;
      xOpcion: String;
   End;

   TFormaPckProc = Procedure; stdcall;

Var
   FMenuOpcion: TFMenuOpcion;
   xOpcionMenu: String;

Implementation

{$R *.dfm}

Uses Menu101, CambioPwd, ACCDM, ACC002, menu020;

Function TFMenuOpcion.StrZero(wNumero: String; wLargo: Integer): String;
Var
   i: integer;
   s, xTemp: String;
Begin
   s := '';
   For i := 1 To wLargo Do
      s := s + '0';

   s := s + trim(wNumero);
   xTemp := copy(s, length(s) - (wLargo - 1), wLargo);
   result := xTemp;
End;

Procedure TFMenuOpcion.TipoOpcion;
Begin
   Try
      FOpcion := TFOpcion.Create(Self);
      FOpcion.ShowModal;
   Finally
      FOpcion.Free;
   End;
End;

Procedure TFMenuOpcion.FormCreate(Sender: TObject);
Var
   inifile: TIniFile;
   i: Integer;
   xOpcion: String;
Begin

   cdsMenu1.FieldDefs.Clear;
   cdsMenu1.FieldDefs.Add('NIVEL1', ftString, 2, False);
   cdsMenu1.FieldDefs.Add('OPCION', ftString, 2, False);
   cdsMenu1.FieldDefs.Add('CODIGO', ftString, 7, False);
   cdsMenu1.FieldDefs.Add('NOMBRE', ftString, 30, False);
   cdsMenu1.CreateDataSet;
   cdsMenu1.Open;
   cdsMenu1.EmptyDataSet;
   cdsMenu1.IndexFieldNames := 'NIVEL1';

   cdsMenu2.FieldDefs.Clear;
   cdsMenu2.FieldDefs.Add('NIVEL1', ftString, 2, False);
   cdsMenu2.FieldDefs.Add('NIVEL2', ftString, 2, False);
   cdsMenu2.FieldDefs.Add('OPCION', ftString, 2, False);
   cdsMenu2.FieldDefs.Add('CODIGO', ftString, 7, False);
   cdsMenu2.FieldDefs.Add('NOMBRE', ftString, 30, False);
   cdsMenu2.CreateDataSet;
   cdsMenu2.Open;
   cdsMenu2.EmptyDataSet;
   cdsMenu2.IndexFieldNames := 'NIVEL1;NIVEL2';

   cdsMenu2.MasterSource := dsMenu1;
   cdsMenu2.MasterFields := 'NIVEL1';

   cdsMenu3.FieldDefs.Clear;
   cdsMenu3.FieldDefs.Add('NIVEL1', ftString, 2, False);
   cdsMenu3.FieldDefs.Add('NIVEL2', ftString, 2, False);
   cdsMenu3.FieldDefs.Add('NIVEL3', ftString, 2, False);
   cdsMenu3.FieldDefs.Add('OPCION', ftString, 2, False);
   cdsMenu3.FieldDefs.Add('CODIGO', ftString, 7, False);
   cdsMenu3.FieldDefs.Add('NOMBRE', ftString, 30, False);
   cdsMenu3.CreateDataSet;
   cdsMenu3.Open;
   cdsMenu3.EmptyDataSet;
   cdsMenu3.IndexFieldNames := 'NIVEL1;NIVEL2;NIVEL3';

   cdsMenu3.MasterSource := dsMenu2;
   cdsMenu3.MasterFields := 'NIVEL1;NIVEL2';

   inifile := TIniFile.Create('C:\DemaExes\oaCFG.ini');
   For i := 0 To 2500 Do
   Begin
      xOpcion := IniFile.ReadString('MENU', 'OPCION_' + StrZero(IntToStr(i), 4), '');

      If xOpcion <> '' Then
      Begin
         If Copy(xOpcion, 1, 1) = '1' Then
         Begin
            cdsMenu1.Insert;
            cdsMenu1.FieldByname('NIVEL1').AsString := Copy(xOpcion, 2, 2);
            cdsMenu1.FieldByname('NOMBRE').AsString := Copy(xOpcion, 8, 30);
            cdsMenu1.FieldByname('CODIGO').AsString := Copy(xOpcion, 1, 7);
         End;
         If Copy(xOpcion, 1, 1) = '2' Then
         Begin
            cdsMenu2.Insert;
            cdsMenu2.FieldByname('NIVEL1').AsString := Copy(xOpcion, 2, 2);
            cdsMenu2.FieldByname('NIVEL2').AsString := Copy(xOpcion, 4, 2);
            cdsMenu2.FieldByname('NOMBRE').AsString := Copy(xOpcion, 8, 30);
            cdsMenu2.FieldByname('CODIGO').AsString := Copy(xOpcion, 1, 7);
         End;
         If Copy(xOpcion, 1, 1) = '3' Then
         Begin
            cdsMenu3.Insert;
            cdsMenu3.FieldByname('NIVEL1').AsString := Copy(xOpcion, 2, 2);
            cdsMenu3.FieldByname('NIVEL2').AsString := Copy(xOpcion, 4, 2);
            cdsMenu3.FieldByname('NIVEL3').AsString := Copy(xOpcion, 6, 2);
            cdsMenu3.FieldByname('NOMBRE').AsString := Copy(xOpcion, 8, 30);
            cdsMenu3.FieldByname('CODIGO').AsString := Copy(xOpcion, 1, 7);
         End;
      End;
   End;

   cdsMenu1.First;

End;

Procedure TFMenuOpcion.PHelp(xCodigo: String);
Begin

   If FileExists('C:\DemaExes\Help\' + xCodigo + '.RTF') Then
   Begin

   End
   Else
   Begin

      ShowMessage('No Existe Help');
   End;

End;

Procedure TFMenuOpcion.EjecutaPrograma(cPaquete, cPrograma: String);
Var
   PackageModule: THandle;
   FormaPckProc: TFormaPckProc;
Begin
  // Se carga Variable de Opción para verificar
   FVariables.w_Var_sObjetoNombr := FMenuOpcion.fcTVMenu.ActiveDataSet.FieldByName('CODIGO').AsString;

   PackageModule := LoadPackage(cPaquete);
   Try
      @FormaPckProc := GetProcAddress(PackageModule, PChar(cPrograma));
      If Not (@FormaPckProc = Nil) Then
         FormaPckProc;
   Finally
    // UnloadPackage(PackageModule);
   End;
End;

Procedure TFMenuOpcion.sbControlAccesosClick(Sender: TObject);
Begin
   DMACC := TDMACC.Create(self);
   If DMACC.sClose = '1' Then
   Begin
      DMACC.Free;
      DMACC := Nil;
      Exit;
   End;

   Try
      FCtrlAcceso := TFCtrlAcceso.create(self);
      FCtrlAcceso.Showmodal;
   Finally
      If (DMACC.cAccesoSistema = 'N') Or (DMACC.cAccesoSistema = '') Then
      Begin
         DMACC.Free;
         DMACC := Nil;
      End;
      FCtrlAcceso.Free;
   End;
End;

Procedure TFMenuOpcion.sbCambioPasswordClick(Sender: TObject);
Begin
   If (DMACC = Nil) Then
   Begin
      DMACC := TDMACC.Create(self);
      If DMACC.sClose = '1' Then
      Begin
         DMACC.Free;
         DMACC := Nil;
         Exit;
      End;
   End;
   Try
      FCPassw := TFCPassw.create(self);
      FCPassw.ShowModal;
   Finally
      FCPassw.Free;
      DMACC.Free;
   End;

End;

Procedure TFMenuOpcion.sbHelpClick(Sender: TObject);
Begin
   PHelp('0000000');
End;

Procedure TFMenuOpcion.fcTVMenuDblClick(TreeView: TfcDBCustomTreeView;
   Node: TfcDBTreeNode; Button: TMouseButton; Shift: TShiftState; X,
   Y: Integer);
Begin

////////////////////////////////////////////////////////////
// ADQUISICIONES
////////////////////////////////////////////////////////////
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010101' Then // Parámetros
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk01.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk01.bpl', 'ADParametros');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010102' Then // Lista de Precios
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk01.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk01.bpl', 'ADListaPrecios');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010103' Then // Enviar Lista de Precios
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk01.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk01.bpl', 'ADEnviaListaPrecios');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010104' Then // Texto Tickets Ingreso
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk01.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk01.bpl', 'ADTextoTicketsIngreso');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010201' Then // Maestro de Artículos
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk02.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk02.bpl', 'ADArticulosMant');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010202' Then // Maestro de Proveedores
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModuloProv');
      EjecutaPrograma('PROVPK00.bpl', 'ADVerificaVersion');
      EjecutaPrograma('PROVPK00.bpl', 'fg_ListarProv');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010203' Then // Maestro de Servicios
   Begin
      EjecutaPrograma('LOGSGPk02.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk02.bpl', 'ADMaestroServicio');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010301' Then // Requerimiento de Usuario
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk03.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk03.bpl', 'ADRequerimientos');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010302' Then // Transferencia de Req.
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk03.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk03.bpl', 'ADTransfRequerimiento');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010303' Then // Requisiciones
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk03.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPkRequis.bpl', 'ADRequisiciones');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010304' Then // Solicitud de Cotizaciones
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk03.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk03.bpl', 'ADSolicitudCotizaciones');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010305' Then // Cuadro Comparativo
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk03.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk03.bpl', 'ADCuadroComparativo');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010306' Then // Proformas Directas
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk03.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk03.bpl', 'ADGeneraProformasAut');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010307' Then // Registro de Proformas
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk03.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk03.bpl', 'ADRegistroProformas');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010308' Then // Evaluación de Proformas Art.Almacén
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk03.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk03.bpl', 'ADEvalProfAlmacen');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010309' Then // Evaluación de Proformas x Servicios
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk03.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk03.bpl', 'ADEvalProfServicio');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010310' Then // Evaluación de Proformas x Activo Fijo
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk03.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk03.bpl', 'ADEvalProfActFijo');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010311' Then // Ordenes de Compra
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPkOCompra.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPkOCompra.bpl', 'ADOrdenesdeCompra');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010312' Then // Seguimiento/Visado de Requisiciones
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPkRequis.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPkRequis.bpl', 'ADSeguimRequisicion');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010313' Then // Seguimiento/Visado de O.Compra
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPkOCompra.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPkOCompra.bpl', 'ADSeguimOCompra');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010314' Then // Req. Aut. por Punto de Reposición
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk03.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk03.bpl', 'ADReqAutxPtoReposicion');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010315' Then // Registro de Orden de pago
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPkOCompra.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPkOCompra.bpl', 'ADOrdenPago');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010316' Then // Recibos de Servicios
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPkOCompra.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPkOCompra.bpl', 'ADMovimientoServicio');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010317' Then // Ordenes de Trabajo
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPkOCompra.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPkOCompra.bpl', 'ADRegistraOrdenesTrabajo');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010401' Then // Depura Requisiciones pendientes
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk04.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk04.bpl', 'ADDepuraRequisPendientes');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010402' Then // Depura Ordenes de Compra
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk04.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk04.bpl', 'ADDepuraOrdCompra');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010501' Then // O. Compra  Pendientes por Artículo
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk05.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk05.bpl', 'ADOCompraPendxArt');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010502' Then // Requisiciones Pendientes por Artículo
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk05.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk05.bpl', 'ADRequisicionesPendxArt');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010503' Then // Facturas x Pagar
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk05.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk05.bpl', 'ADFactxPagar');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010504' Then // Articulos x Proveedor
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk05.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk05.bpl', 'ADArtxProveedor');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010505' Then // Artículos x Prov SSGG
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk05.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk05.bpl', 'ADArtxProveedor_1');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010506' Then // Proveedor x Articulos
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk05.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk05.bpl', 'ADProveedorxArt');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010507' Then // Consumo por Años
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk05.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk05.bpl', 'ADConsumoxAnos');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010508' Then // Proveedores por Rubro
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk05.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk05.bpl', 'ADProveedoresxRubro');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010509' Then // Requerimientos Pendientes
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk05.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk05.bpl', 'ADRequerimientosPend');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3010510' Then // Detalle de O.Compra
   Begin
      EjecutaPrograma('LOGSGPk00.bpl', 'ADDataModulo');
      EjecutaPrograma('LOGSGPk05.bpl', 'ADVerificaVersion');
      EjecutaPrograma('LOGSGPk05.bpl', 'ADDetalleOCompra');
   End;

////////////////////////////////////////////////////////////
// INVENTARIOS (ALMACENES)   SERVICIOS GENERALES
////////////////////////////////////////////////////////////

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020101' Then // Parámetros
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk00.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk01.bpl', 'INParametros');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020201' Then // Maestro de Artículos
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk02.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk02.bpl', 'INMaestroArticulos');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020202' Then // Parámetros de Reposición
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk02.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk02.bpl', 'INParametrosReposicion');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020203' Then // Ubicación de Artículo
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk02.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk02.bpl', 'INUbicacionArticulo');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020204' Then // Articulos por reponer
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk02.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk02.bpl', 'INArticulosreponer');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020301' Then // Nota de Ingreso
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk03.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk03.bpl', 'INNotadeIngreso');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020302' Then // Nota de Salida
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk03.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk03.bpl', 'INNotadeSalida');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020303' Then // Apertura / Cierre Operativo
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk03.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk03.bpl', 'INAperturaCierre');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020304' Then // Apertura Anual
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk03.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk03.bpl', 'INAperturaAnual');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020305' Then // Requisiciones
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk03.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk03.bpl', 'INRequisicion');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020306' Then // Requisiciones Automáticas
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk03.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk03.bpl', 'INRequisicionAut');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020307' Then // Procesar Stock
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk03.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk03.bpl', 'INProcesoSaldos');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020308' Then // Guia de Remisión
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk03.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk03.bpl', 'INGuiaRemision');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020309' Then // Revalorización por N/Cre
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk03.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk03.bpl', 'INRevalorizaNCre');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020401' Then // Consulta del Kardex
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk04.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk04.bpl', 'INKardex');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020402' Then // Consulta de saldos por stock
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk04.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk04.bpl', 'INSaldoStock');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020403' Then // Consulta de detalle de movimiento por almacén
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk04.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk04.bpl', 'INDetalleMovAlm');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020404' Then // Consulta de consulta artículos
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk04.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk04.bpl', 'INConsultaArticulos');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020405' Then // Consulta de consumo por centro de costo
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk04.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk04.bpl', 'INConsumoCCosto');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020406' Then // Consulta de consumo por artículos
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk04.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk04.bpl', 'INConsumoxArticulos');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020407' Then // Consulta de consumo por años
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk04.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk04.bpl', 'INConsumoxAnos');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020408' Then // Consulta de orden de despacho
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk04.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk04.bpl', 'INOrdenDespacho');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020409' Then // Consulta de artículo por lote
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk04.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk04.bpl', 'INArticuloxLote');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020410' Then // Consulta de Consumo Anual por C.Costo
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk04.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk04.bpl', 'INConsumoAnualCCos');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020411' Then // Consulta de Movimiento de Artículos
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk04.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk04.bpl', 'INMovimientoArticulos');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020412' Then // Consulta de Movimientos por Tipo Transacción
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk04.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk04.bpl', 'INMovTipoTransaccion');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020501' Then // Toma de Inventario Físico
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk05.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk05.bpl', 'INTomaInv');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020503' Then // Digita Inventario Fisico
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk05.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk05.bpl', 'INRegistroInv');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3020601' Then // Contabilización
   Begin
      EjecutaPrograma('ALMSGPk00.bpl', 'INDataModulo');
      EjecutaPrograma('ALMSGPk06.bpl', 'INVerificaVersion'); //verifica versión pbl
      EjecutaPrograma('ALMSGPk06.bpl', 'INContabiliza');
   End;

/////////////////////////////////////
/////////////////////////////////////
//   Obligaciones Ppor Pagar       //
/////////////////////////////////////
/////////////////////////////////////

// Parámetros
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030101' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk01.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk01.bpl', 'OPReferencias');
   End;

// Proveedores
   // Maestro de Proveedores
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030201' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModuloProv');
      EjecutaPrograma('CXPPk01.bpl', 'OPVerificaVersion');
      EjecutaPrograma('PROVPK00.bpl', 'fg_ListarProv');
   End;

   // Agentes de Retencion y Buenos Contribuyentes
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030202' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'CXPDataModulo');
      EjecutaPrograma('CXPPk01.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk05.bpl', 'OPActualizaAgentesRetencion');
   End;

   // Recodificación del Proveedor
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030203' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk01.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk05.bpl', 'OPRecodificacionProveedor');
      //ConfiguraForma( Screen.ActiveForm );
   End;

   // Proveedores Notificados por la Sunat
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030204' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk02.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk02.bpl', 'OPNotificadoSunat');
   End;

   // Proveedores Agentes de retencion de Sunat
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030205' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk02.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk02.bpl', 'OPAgentesSunat');
   End;

// Transacciones

   // Provisiones
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030301' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk02.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk02.bpl', 'OPProvisionMant');
   End;

   // Nota de Credito de Obligaciones por Pagar
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030302' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk02.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk02.bpl', 'OPNCreditoMant');
   End;

   // Letras por Pagar
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030303' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk02.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk02.bpl', 'OPLetrasMant');
   End;

   // Prestamo de Terceros
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030304' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk02.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk02.bpl', 'OPPTercerosMant');
   End;

   // Compensacion
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030305' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk02.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk02.bpl', 'OPCompensacionMant');
   End;

   // Aplica Abonos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030306' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk02.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk02.bpl', 'OPAplicaAbonosMant');
   End;

   // Intermediacion
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030307' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk02.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk02.bpl', 'OPIntermediacionMant');
   End;

   // Orden de Pago
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030308' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk02.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk02.bpl', 'OPOrdenDePago');
   End;

   // Retenciones
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030309' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk02.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk02.bpl', 'OPRetenciones');
   End;

// Inicio HPC_201801_CXP
// Opciones de Dieta de Directorio
   // Dietas - Cargos de Directorio
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030310' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk02.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk02.bpl', 'OPCargosDirectorio');
   End;

   // Dietas - Cargos de Directorio
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030311' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk02.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk02.bpl', 'OPPlantillaDietas');
   End;

   // Dietas - Cargos de Directorio
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030312' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk02.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk02.bpl', 'OPPlanillaDietas');
   End;
// Fin HPC_201801_CXP

// Procesos

   // Transferencia de´Recibos de Honorarios de 4ta Categoría al PDT
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030401' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk01.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk05.bpl', 'OPTransferenciaPDT');
   End;

   // Transferencia de Provisiones efectuadas a COA
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030402' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk01.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk05.bpl', 'OPTransferenciaCOA');
   End;

   // Transferencia de Provisiones afectas para la DAOT
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030403' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk01.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk05.bpl', 'OPTransferenciaDAOT');
   End;

   // Cierre Operativo
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030404' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk01.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk05.bpl', 'OPCierreOperativo');
   End;

// INFORMES

   // Registro de Compras
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030501' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk04.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk04.bpl', 'OPRegistroCompras');
   End;

   // Registro de Letras
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030502' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk04.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk04.bpl', 'OPRegistroLetras');
   End;

   // Cuenta Corriente de Proveedores
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030503' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk02.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk02.bpl', 'OPCuentaCorriente');
   End;

   // Comprobantes Contabilizados
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030504' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk04.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk04.bpl', 'OPComprobantesContabilizados');
   End;

   // Comprobantes Ingresados
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030505' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk04.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk04.bpl', 'OPComprobantesIngresados');
   End;

   // Mov.x Concepto y C.Costo
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030506' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk04.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk04.bpl', 'OPMovimientosCptoCCosto');
   End;

   // Movimientos por Proveedor
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030507' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk04.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk04.bpl', 'OPMovimientosPorProveedor');
   End;

   // Letras Provisionadas
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030508' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk04.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk04.bpl', 'OPLetrasProvisionadas');
   End;

   // Detalle de Provisiones (CXP302)
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030509' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk02.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk02.bpl', 'OPDetalleProvisiones');
   End;

   // Letras Pendientes
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030510' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk02.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk02.bpl', 'OPLetrasPendientes');
   End;

   // Compras Mensuales - Cuadro Mensual de Compras
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030511' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk04.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk04.bpl', 'OPComprasMensuales');
   End;

   // Documentos por Proveedor
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030512' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk02.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk02.bpl', 'OPDocumentosProveedor');
   End;

   // Retenciones 4ta.Categoría
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3030513' Then
   Begin
      EjecutaPrograma('CXPPk00.bpl', 'OPDataModulo');
      EjecutaPrograma('CXPPk02.bpl', 'OPVerificaVersion');
      EjecutaPrograma('CXPPk02.bpl', 'OPRetenciones4ta');
   End;

////////////////////////////////////////////////////////////
// VENTAS
////////////////////////////////////////////////////////////
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040101' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk01.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk01.bpl', 'VEReferencias');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040102' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk01.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk01.bpl', 'VETCambio');
   End;

   // PROFORMAS
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040201' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk02.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk02.bpl', 'VEProforma');
   End;

   // FACTURACION
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040202' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk02.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk02.bpl', 'VEFacturaSG');
   End;

// Lista de Precios para Vendedores
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040203' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk02.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk02.bpl', 'VELPrecio');
   End;

// Inicio HPC_201802_MNU
// Retiro de Opción anterior -3040204- del Maestro de Clientes
{
   // MAESTRO DE CLIENTES
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040204' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk00.bpl', 'VEDataModuloClie');
      EjecutaPrograma('FACPk02.bpl', 'VEVerificaVersion');
      EjecutaPrograma('MaestroClientesPk00.bpl', 'fg_FiltroClientes');
   End;
}
// Fin HPC_201802_MNU

// DESCARGA DEPOSITOS EN BANCO
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040205' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk02.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk02.bpl', 'VEDescargaDepositos');
   End;

// DESCARGA DEPOSITOS EN BANCO
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040206' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk02.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk02.bpl', 'VEActualizaDatos');
   End;

// ENTREGA DE OBSEQUIOS
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040207' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk02.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk02.bpl', 'VEEntregaObsequios');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040301' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk03.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk03.bpl', 'VEConsultaxCliente');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040302' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk03.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk03.bpl', 'VEConsultaPorArticulos');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040303' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk03.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk03.bpl', 'VEConsultaArticulosVendidos');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040304' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk03.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk03.bpl', 'VEDocumentosEmitidos');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040305' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk03.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk03.bpl', 'VEResumenVentaxVendedor');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040306' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk03.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk03.bpl', 'VEResumenVentaxVencimiento');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040307' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk03.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk03.bpl', 'VEResumenVentaNacionalImportado');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040308' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk03.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk03.bpl', 'VEResumenVentaNetaLinea');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040309' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk03.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk03.bpl', 'VEComprasAcumuladasCliente');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040310' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk03.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk03.bpl', 'VEComisiones');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040311' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk03.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk03.bpl', 'VECostoDeVentas');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040312' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk03.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk03.bpl', 'VEVentasLineaComercial');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040313' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk03.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk03.bpl', 'VEVentasConcesiones');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040314' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk03.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk03.bpl', 'VEVentaPorArticulos');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040315' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk03.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk03.bpl', 'VEVentaPorUsuario');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040316' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk03.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk03.bpl', 'VEVentaUtilidad');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040317' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk03.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk03.bpl', 'VESeguimientoCompra');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040318' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk03.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk03.bpl', 'VEInscripcionIIForo');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040319' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk03.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk03.bpl', 'VEVentaPorTienda');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3040320' Then
   Begin
      EjecutaPrograma('FACPk00.bpl', 'VEDataModulo');
      EjecutaPrograma('FACPk03.bpl', 'VEVerificaVersion');
      EjecutaPrograma('FACPk03.bpl', 'VEVentaAreaCompras');
   End;

// Inicio HPC_201802_MNU
// Opción nueva para Mantenimiento del Maestro de Clientes
////////////////////////////////////////////////////////////
// MAESTRO DE CLIENTES
////////////////////////////////////////////////////////////
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3170101' Then
   Begin
      EjecutaPrograma('MaestroClientes.bpl', 'CLIDataModulo');
      EjecutaPrograma('MaestroClientes.bpl', 'CLIVerificaVersion');
      EjecutaPrograma('MaestroClientes.bpl', 'CLIMaestroClientes');
   End;
// Fin Inicio HPC_201802_MNU

////////////////////////////////////////////////////////////
// CUENTAS POR COBRAR
////////////////////////////////////////////////////////////
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050101' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk01.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk01.bpl', 'CCReferencias');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050102' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk01.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk01.bpl', 'CCDinamicaDocs');
   End;

// Inicio HPC_201802_MNU
// Retiro de Opción anterior -3050201- del Maestro de Clientes
{
// Maestro de Clientes
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050201' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModuloClie');
      EjecutaPrograma('CXCPk02.bpl', 'CCVerificaVersion');
      EjecutaPrograma('MaestroClientesPk00.bpl', 'fg_FiltroClientes');
   End;
}
// Fin HPC_201802_MNU

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050202' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk02.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk02.bpl', 'CCProvisionMant');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050203' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk02.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk02.bpl', 'CCNotaDeCreditoMant');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050204' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk02.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk02.bpl', 'CCAnticipoMant');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050205' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk02.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk02.bpl', 'CCAplicacionDeAbono');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050206' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk02.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk02.bpl', 'CCContabilizacionDeAplicaciones');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050207' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk02.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk02.bpl', 'CCCanjexLetrasMant');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050208' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk02.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk02.bpl', 'CCRenovacionDeLetrasMant');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050209' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk02.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk02.bpl', 'CCGestionDeLetras');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050210' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk02.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk02.bpl', 'CCDinamicaContableDeLetrasMant');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050211' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk02.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk02.bpl', 'CCContabilizacionDeLetrasMant');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050212' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk02.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk02.bpl', 'CCPlanillaDeBancosMant');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050213' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk02.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk02.bpl', 'CCNotaDeCobranzaMant');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050214' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk02.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk02.bpl', 'CCCierreOperativo');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050215' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk02.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk02.bpl', 'ImportarRVChess');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050301' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk03.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk03.bpl', 'CCRegistroDeVentas');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050302' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk03.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk03.bpl', 'CCRegistroDeLetras');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050303' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk03.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk03.bpl', 'CCCuentaCorriente');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050304' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk03.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk03.bpl', 'CCMovimientosxEstadoDoc');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050305' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk03.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk03.bpl', 'CCClientesConSaldos');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050306' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk03.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk03.bpl', 'CCMovimientoxCliente');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050307' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk03.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk03.bpl', 'CCChequesDiferidos');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050308' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk03.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk03.bpl', 'CCTransferenciaAlDaot');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050309' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk03.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk03.bpl', 'CCConsistenciaVentas');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3050310' Then
   Begin
      EjecutaPrograma('CXCPk00.bpl', 'CCDataModulo');
      EjecutaPrograma('CXCPk03.bpl', 'CCVerificaVersion');
      EjecutaPrograma('CXCPk03.bpl', 'CCPleRegVentas');
   End;

   /////////////////////
   //  Tesoreria      //
   /////////////////////

   // Referencias
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060101' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk01.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk01.bpl', 'TEReferencias');
   End;

   // Tipo de Cambio
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060102' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk01.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk01.bpl', 'TETipoCambio');
   End;

   // Ingresos a Caja
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060201' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk02.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk02.bpl', 'TEIngresosCajaMant');
   End;

   //  Cobranzas CXC
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060202' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk02.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk02.bpl', 'TECobranzasCXCMant');
   End;

   // Egresos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060203' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk02.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk02.bpl', 'TEEgresosMant');
   End;

   // Rendicion de Cuenta
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060204' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk02.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk02.bpl', 'TERendicionCuentaMant');
   End;

   // Fondo Fijo
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060205' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk02.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk02.bpl', 'TEFondoFijoMant');
   End;

   // Control de Cheques
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060206' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk02.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk02.bpl', 'TEControlChequesMant');
   End;

   // Cheques Anulados
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060207' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk02.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk02.bpl', 'TEChequesAnuladosMant');
   End;

   // Compra Venta de Moneda Extranjera
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060208' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk02.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk02.bpl', 'TECompraVentaDolaresMant');
   End;

   // Transferencia Caja
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060209' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk02.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk02.bpl', 'TETransferenciasMant');
   End;

   // Movimiento de Bancos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060210' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk02.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk02.bpl', 'TEMovimientoBancosMant');
   End;

   // Conciliacion Bancaria
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060211' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk02.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk02.bpl', 'TEConciliacionMant');
   End;

   // Pago de Notas de Abono por Cobrar
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060212' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk02.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk02.bpl', 'TEPagoNotasAbonoMant');
   End;

   // Orden de Pago
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060213' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk02.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk02.bpl', 'TEOrdenDePago');
   End;

   // Cobranza de Tarjetas de Crédito
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060214' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk02.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk02.bpl', 'TETarjetaCredito');
   End;

   // Pago de Detracciones
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060215' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk02.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk02.bpl', 'TEPagoDetraccion');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060401' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk04.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk04.bpl', 'TELibroBancosGenerico');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060402' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk04.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk04.bpl', 'TELibroBancosIndividual');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060403' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk04.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk04.bpl', 'TESaldoBancos');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060404' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk04.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk04.bpl', 'TESaldoTelefonico');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060405' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk04.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk04.bpl', 'TEChequesDiferidos');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060406' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk04.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk04.bpl', 'TEMovimientosCaja');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060407' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk04.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk04.bpl', 'TESaldosCaja');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060408' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk04.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk04.bpl', 'TEResumenConcepto');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060409' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk04.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk04.bpl', 'TERetenciones');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060410' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk04.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk04.bpl', 'TEPagosProveedor');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060411' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk04.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk04.bpl', 'TEConsultaIngresos');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060412' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk04.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk04.bpl', 'TEConsultaCheques');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060301' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk02.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk02.bpl', 'TEContabilizacionIngresos');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060302' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk05.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk05.bpl', 'TECierreMensual');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060303' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk05.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk05.bpl', 'TECierreMensual');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3060304' Then
   Begin
      EjecutaPrograma('BANPk00.bpl', 'TEDataModulo');
      EjecutaPrograma('BANPk05.bpl', 'TEVerificaVersion');
      EjecutaPrograma('BANPk05.bpl', 'TEAperturaDiaria');
   End;

   ///////////////////////////
   ///////////////////////////
   //      Contabilidad     //
   ///////////////////////////
   ///////////////////////////

   // Referencias
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070101' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk01.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk01.bpl', 'CNReferencias');
   End;

   // Centro de Costo
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070102' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk01.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk01.bpl', 'CNCentroCostoMant');
   End;

   // Plan de Cuentas
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070103' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk01.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk01.bpl', 'CNPlanCuentasMant');
   End;

   // Comprobantes
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070201' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk02.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk02.bpl', 'CNComprobantesMant');
   End;

   // Diferencia de Cambio
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070202' Then
   Begin
      If DMACC.VerificaAccesoOpcion(TreeView.ActiveDataSet.FieldByName('CODIGO').AsString) Then
      Begin
         EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
         EjecutaPrograma('CNTPk02.bpl', 'CNVerificaVersion');
         EjecutaPrograma('CNTPk02.bpl', 'CNDiferenciaCambio');
      End
      Else
         ShowMessage('Ud. No tiene accesos a esta Opción');
   End;

   // Cierre Operativo
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070203' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk02.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk02.bpl', 'CNCierrePeriodo');
   End;

   // Cierre Operativo
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070204' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk02.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk02.bpl', 'CNAjusteInflacion');
   End;

   // Transferencias Contables
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070205' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk02.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk02.bpl', 'CNTransferenciaDema');
   End;

   // Consolidado
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070206' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk02.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk02.bpl', 'CNConsolidado');
   End;

   // Apertura
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070207' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk02.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk02.bpl', 'CNApertura');
   End;

   // Cierre de Ano
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070208' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk02.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk02.bpl', 'CNCierreAno');
   End;

   // Actualizacion
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070209' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk02.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk02.bpl', 'CNActualizacion');
   End;

   // Oficios y Rendiciones de Ofides
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070210' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk02.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk02.bpl', 'CNTOficios');
   End;

   // Telecredito
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070211' Then
   Begin
      ShowMessage('Opción en Desuso');
   End;

   // Diario General
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070401' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk03.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk03.bpl', 'CNDiarioGeneral');
   End;

   // Analisis Auxiliar
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070402' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk03.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk03.bpl', 'CNAnalisisAuxiliar');
   End;

   // Mayor
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070403' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk03.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk03.bpl', 'CNMayor');
   End;

   // Analisis Centro de Costo
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070404' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk03.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk03.bpl', 'CNAnalisisCentroCosto');
   End;

   // Balance de Comprobacion
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070405' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk03.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk03.bpl', 'CNBalanceComprobacion');
   End;

   // Balance de Comprobacion General
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070406' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk03.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk03.bpl', 'CNBalanceComprobacionGeneral');
   End;

   // Mayor Auxiliar
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070407' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk03.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk03.bpl', 'CNMayorAuxiliar');
   End;

   // Analisis de Cuenta
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070408' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk03.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk03.bpl', 'CNAnalisisCuenta');
   End;

   // Hoja de Trabajo
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070409' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk03.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk03.bpl', 'CNHojaTrabajo');
   End;

   // Resumen General por Cuenta
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070410' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk03.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk03.bpl', 'CNResumenGeneralCuenta');
   End;

   // Detalle de Contabilidad
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070411' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk03.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk03.bpl', 'CNDetalleContabilidadMant');
   End;

   // Mayor Auxiliar Detallado
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070412' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk03.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk03.bpl', 'CNMayorAuxiliarDetallado');
   End;

   // Saldo de Cuentas
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070413' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk03.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk03.bpl', 'CNSaldoCuentasMant');
   End;

   // Historico de Ajuste
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070414' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk03.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk03.bpl', 'CNHistoricoAjusteMant');
   End;

   // Inventarios y Balance
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3070415' Then
   Begin
      EjecutaPrograma('CNTPk00.bpl', 'CNDataModulo');
      EjecutaPrograma('CNTPk03.bpl', 'CNVerificaVersion');
      EjecutaPrograma('CNTPk03.bpl', 'CNInventariosyBalances');
   End;

////////////////////////////////////////////////////////////
//  ACTIVOS FIJOS
////////////////////////////////////////////////////////////
    //////////// PARAMETROS  //////////////
   // Parametros
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3080101' Then
   Begin
      EjecutaPrograma('oaAFPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('oaAFPk01.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('oaAFPk01.bpl', 'AFParametros');
   End;

    //////////// MAESTROS  //////////////
   // Maestro de Activos Fijos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3080201' Then
   Begin
      EjecutaPrograma('oaAFPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('oaAFPk02.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('oaAFPk02.bpl', 'AFMaestroActivoFijoMant');
   End;
   // Tipos de Activo
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3080202' Then
   Begin
      EjecutaPrograma('oaAFPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('oaAFPk02.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('oaAFPk02.bpl', 'AFTiposActivoMant');
   End;

    //////////// PROCESOS  //////////////
   // Depreciacion y Ajuste
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3080301' Then
   Begin
      EjecutaPrograma('oaAFPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('oaAFPk03.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('oaAFPk03.bpl', 'AFDepreciacionAjuste');
   End;
   // Cierre de Depreciacion
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3080302' Then
   Begin
      EjecutaPrograma('oaAFPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('oaAFPk03.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('oaAFPk03.bpl', 'AFCierreDepreciacion');
   End;
   // Contabiliza Depreciacion
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3080303' Then
   Begin
      EjecutaPrograma('oaAFPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('oaAFPk03.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('oaAFPk03.bpl', 'AFContabilizaDepreciacion');
   End;
   // Contabiliza REI
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3080304' Then
   Begin
      EjecutaPrograma('oaAFPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('oaAFPk03.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('oaAFPk03.bpl', 'AFContabilizaREI');
   End;
   // Cierre Operativo
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3080305' Then
   Begin
      EjecutaPrograma('oaAFPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('oaAFPk03.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('oaAFPk03.bpl', 'AFCierreOperativo');
   End;
   // Reclasificacion Contable
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3080306' Then
   Begin
      EjecutaPrograma('oaAFPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('oaAFPk03.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('oaAFPk03.bpl', 'AFReclasificacionContable');
   End;
   // Ajuste Anual de Activos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3080307' Then
   Begin
      EjecutaPrograma('oaAFPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('oaAFPk03.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('oaAFPk03.bpl', 'AFAjusteAnualActivos');
   End;
   // Recupera Texto
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3080308' Then
   Begin
      EjecutaPrograma('oaAFPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('oaAFPk03.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('oaAFPk03.bpl', 'AFRecuperaTexto');
   End;
   // Inicializa Depreciacion
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3080309' Then
   Begin
      EjecutaPrograma('oaAFPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('oaAFPk03.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('oaAFPk03.bpl', 'AFInicializaDepreciacion');
   End;
   // Limite de Reexpresion
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3080310' Then
   Begin
      EjecutaPrograma('oaAFPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('oaAFPk03.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('oaAFPk03.bpl', 'AFLimiteReexpresion');
   End;
   // Elimina Depreciacion y Ajuste
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3080311' Then
   Begin
      EjecutaPrograma('oaAFPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('oaAFPk03.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('oaAFPk03.bpl', 'AFEliminaDepreciacionAjuste');
   End;
    //////////// INFORMES  //////////////
   // Depreciacion Preliminar
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3080401' Then
   Begin
      EjecutaPrograma('oaAFPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('oaAFPk04.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('oaAFPk04.bpl', 'AFDepreciacionPreliminar');
   End;
   // Depreciacion Definitiva
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3080402' Then
   Begin
      EjecutaPrograma('oaAFPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('oaAFPk04.bpl', 'AFVeificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('oaAFPk04.bpl', 'AFDepreciacionDefinitiva');
   End;
   // Resumen Ajuste y Depreciacion
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3080403' Then
   Begin
      EjecutaPrograma('oaAFPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('oaAFPk04.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('oaAFPk04.bpl', 'AFResumenAjusteDepreciacion');
   End;
   // Legalizacion de Activos Fijos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3080404' Then
   Begin
      EjecutaPrograma('oaAFPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('oaAFPk04.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('oaAFPk04.bpl', 'LegalizacionActivosFijos');
   End;
    //////////// INVENTARIOS FISICOS  //////////////
   // Depreciacion Preliminar
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3080501' Then
   Begin
      EjecutaPrograma('oaAFPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('oaAFPk05.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('oaAFPk05.bpl', 'AFInventarioFisico');
   End;

   ////////////////////////////////
   ////////////////////////////////
   //      PLANILLAS DE PAGO     //
   ////////////////////////////////
   ////////////////////////////////

//////////////  PLANILLAS - REFERENCIAS - oaPLpk01 - oaPL1000.pas
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090101' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk01.bpl', 'PLParametros');
   End;

//////////////  PLANILLAS - MAESTRO DE TRABAJADORES - PLPk02 - oaPL2000.pas

   // Maestro de Trabajadores
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090201' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk02.bpl', 'PLMaestroTrab');
   End;

// DerechoHabientes
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090202' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk02.bpl', 'PLDerechoHabientes');
   End;

// Horas Semanales por Trabajador
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090203' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk02.bpl', 'PLHorasSemanales');
   End;

//////////////  PLANILLAS - SITUACIONES - PLPk03 - oaPL2100.pas
   // Situaciones - Cambio Masivo
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090301' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk03.bpl', 'PLSituacCambioMasivo');
   End;

   // Situaciones - Genera Situación Mensual
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090302' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk03.bpl', 'PLSituacGenSitMensual');
   End;

//////////////  PLANILLAS - VACACIONES - PLPk04 - oaPL2200.pas
   // Vacaciones - Generación de Rol Vacacional
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090401' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk04.bpl', 'PLVacacGeneraRol');
   End;

   // Vacaciones - Actualización de ROL Vacacional
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090402' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk04.bpl', 'PLVacacActualizaRol');
   End;

   // Vacaciones - Retorno de Vacaciones
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090403' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk04.bpl', 'PLVacacRetornaVac');
   End;

   // Vacaciones - Aprueba Rol de Vacaciones
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090404' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk04.bpl', 'PLVacacApruebaRol');
   End;

   // Vacaciones - Aplica Rol de Vacaciones
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090405' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk04.bpl', 'PLVacacAplicaRol');
   End;

   // Vacaciones - Elimina Aprobación/aplicación Rol de Vacaciones
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090406' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk04.bpl', 'PLVacacEliminaProc');
   End;

   // Vacaciones - Goce de Vacaciones
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090407' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk04.bpl', 'PLVacacPedidoGoce');
   End;

   // Vacaciones - Memo de Vacaciones
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090408' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk04.bpl', 'PLVacacMemo');
   End;

   // Vacaciones - Convenios de Vacaciones
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090409' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk04.bpl', 'PLVacacConvenio');
   End;

//////////////  PLANILLAS - MAESTRO DE RUBROS - PLPk05 - oaPL3000.pas
   // Maestro de Rubros
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090501' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk05.bpl', 'PLMaestroRubros');
   End;

//////////////  PLANILLAS - DETALLE DEL TRABAJADOR - PLPk06 - oaPL4000.pas
// DETALLE DEL TRABAJADOR Actualiza Detalle x Rubro
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090601' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk06.bpl', 'PLDetalleActualizaxRubro');
   End;

// DETALLE DEL TRABAJADOR Activa Detalle por Trabajador
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090602' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk06.bpl', 'PLActualizaDetalleTrabajador');
   End;

// DETALLE DEL TRABAJADOR Activa/Desactiva Rubros
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090603' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk06.bpl', 'PLDetalleActivaDesactiva');
   End;

// DETALLE DEL TRABAJADOR Actualiza Mto./Cant en Gral.
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090604' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk06.bpl', 'PLDetalleActualizaMtoCant');
   End;

// DETALLE DEL TRABAJADOR Actualiza Tipo Cálculo
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090605' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk06.bpl', 'PLDetalleActualizaTipoCalc');
   End;

// DETALLE DEL TRABAJADOR Aumento/Disminución
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090606' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk06.bpl', 'PLDetalleAumentoDisminucion');
   End;

// DETALLE DEL TRABAJADOR Asignación/Eliminación
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090607' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk06.bpl', 'PLDetalleAsignaEliminacion');
   End;

// DETALLE DEL TRABAJADOR Rubros Tipo Horario
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090608' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk06.bpl', 'PLDetalleRubrosTipoHorario');
   End;

// DETALLE DEL TRABAJADOR Relación de Inasistencias
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090609' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk06.bpl', 'PLDetalleRelacionInasistencias');
   End;

// DETALLE DEL TRABAJADOR Monto Total x Rubro Detalle
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090610' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk06.bpl', 'PLDetalleCalculaMontoTotal');
   End;

// DETALLE DEL TRABAJADOR Rubro Dependiente Relación
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090611' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk06.bpl', 'PLDetalleRubroDependeRelacion');
   End;

// DETALLE DEL TRABAJADOR Copia Detalle de Trabajador
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090612' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk06.bpl', 'PLDetalleCopiaDetalleTrabajador');
   End;

// DETALLE DEL TRABAJADOR Copia Rubros de otra Plla.
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090613' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk06.bpl', 'PLDetalleCopiaRubrosOtraPlla');
   End;

// DETALLE DEL TRABAJADOR Relación Descanso Médico
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090614' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk06.bpl', 'PLDetalleRelacDescansoMedico');
   End;

// DETALLE DEL TRABAJADOR Rubros de Detalle
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090615' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk06.bpl', 'PLDetalleReporteRubrosDetalle');
   End;

// DETALLE DEL TRABAJADOR Relación Percibos Fijos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090616' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk06.bpl', 'PLDetalleReportePercibosFijos');
   End;

// DETALLE DEL TRABAJADOR Promedio de Rubros
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090617' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk06.bpl', 'PLDetallePromedioMovRubro');
   End;

//////////////  PLANILLAS - RUBROS AFECTOS - PLPk07 - oaPL4100.pas
   // Relación de Rubros Afectos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090701' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk07.bpl', 'PLRelacRubrosAfectos');
   End;

   // Relación de Rubros en Resumen
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090702' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk07.bpl', 'PLRelacRubrosenResumen');
   End;

//////////////  PLANILLAS - DETALLE DE PRESTAMOS - PLPk08 - oaPL4200.pas
   // Solicitud de Préstamos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090801' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk08.bpl', 'PLSoliPrestamo');
   End;

   // Actualiza Préstamos por Trabajador
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090802' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk08.bpl', 'PLDetCtaCteActxTrab');
   End;

   // Actualiza Préstamos por Rubro
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090803' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk08.bpl', 'PLDetCtaCteActxRubro');
   End;

   // Reporte de Saldos de Préstamos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090804' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk08.bpl', 'PLDetCtaCteSaldos');
   End;

   // Amortización Externa sobre Préstamos del Trabajador
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090805' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk08.bpl', 'PLDetCtaCteAmortExt');
   End;

//////////////  PLANILLAS - INICIALIZACION - PLPk09 - oaPL5000.pas
   // Inicialización Global de Movimientos de Boleta
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090901' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk09.bpl', 'PLInicializacionGlobal');
   End;

   // Inicialización de Movimientos por Trabajador
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090902' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk09.bpl', 'PLInicializacionxTrab');
   End;

   // Eliminación de Movimientos por Trabajador
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3090903' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk09.bpl', 'PLInicializacionElimina');
   End;

//////////////  PLANILLAS - ADELANTO QUINCENAL - PLPk10 - oaPL5100.pas
   // Generación de Quincena
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091001' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk10.bpl', 'PLQuincenaGeneracion');
   End;

   // Actualizacion Quincena
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091002' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk10.bpl', 'PLQuincenaActualiza');
   End;

   // Reporte de Quincena
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091003' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk10.bpl', 'PLQuincenaReporte');
   End;

   // Transferencia de Adelanto de Quincena a Obligaciones por Pagar
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091004' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk10.bpl', 'PLQuincenaTransfOblig');
   End;

   // Genera Archivo para Bancos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091005' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk10.bpl', 'PLQuincenaArchBanco');
   End;

//////////////  PLANILLAS - INASISTENCIAS - PLPk11 - oaPL5200.pas
   // Por Periodo
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091101' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk11.bpl', 'PLInasistxPeriodo');
   End;

   // Por Trabajador
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091102' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk11.bpl', 'PLInasistxTrab');
   End;

   // Genera Inasist.Mes
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091103' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk11.bpl', 'PLInasistxGeneraHistoria');
   End;

   // Rep.Inasistencias
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091104' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk11.bpl', 'PLInasistReporte');
   End;

   // Reg.Asistencias
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091105' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk11.bpl', 'PLRegAsistencia');
   End;

//////////////  PLANILLAS - MOV. GANANCIAS Y DESCUENTOS - PLPk12 - oaPL5300.pas
   // Act. x Rubro
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091201' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk12.bpl', 'PLMovGyDActualizaxRubro');
   End;

   // Act. x Trabajador
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091202' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk12.bpl', 'PLMovGyDActualizaxTrab');
   End;

   // Activa/Desactiva
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091203' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk12.bpl', 'PLMovGyDActivaDesactiva');
   End;

   // Monto/Cantidad
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091204' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk12.bpl', 'PLMovGyDMontoCantidad');
   End;

   // Consulta Movs. x Rubro
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091205' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk12.bpl', 'PLMovGyDConsultaxRubro');
   End;

   // Otros Ingresos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091206' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk12.bpl', 'PLMovGyDOtrosIngresos');
   End;

   // PreCalcula
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091207' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk12.bpl', 'PLMovGyDPrecalcula');
   End;

   // Importa Movimientos desde Txt
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091208' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk12.bpl', 'PLImportaMovGyDTxT');
   End;

//////////////  PLANILLAS - MOV.PRÉSTAMOS - PLPk13 - oaPL5400.pas
   // Act. x Rubro
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091301' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk13.bpl', 'PLMovCtaCteActualizaxRubro');
   End;

   // Act. x Trabajador
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091302' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk13.bpl', 'PLMovCtaCteActualizaxTrab');
   End;

   // Consulta Movs.de Préstamos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091303' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk13.bpl', 'PLMovCtaCteConsultaxRubro');
   End;

//////////////  PLANILLAS - MOV.ADELANTOS - PLPk14 - oaPL5500.pas
   // Genera Adelantos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091401' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk14.bpl', 'PLAdelantosGenera');
   End;

   // Adelantos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091402' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk14.bpl', 'PLAdelantos');
   End;

   // Reporte
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091403' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk14.bpl', 'PLAdelantosReporte');
   End;

   // Transferencia a Oblig.
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091404' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk14.bpl', 'PLAdelantosTransfOblig');
   End;

   // Genera Archivo para Bancos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091405' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk14.bpl', 'PLAdelantosArchBanco');
   End;

//////////////  PLANILLAS - PROCESOS - PLPk15 - oaPL6000.pas
   // Cálculo de Boletas
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091501' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk15.bpl', 'PLProcesosCalculoPlanilla');
   End;

   // Cierre de Planillas
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091502' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk15.bpl', 'PLProcesosCierrePlanilla');
   End;

   // Asientos Contables
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091503' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk15.bpl', 'PLProcesosAsientosPlanilla');
   End;

   // Ajuste de Boletas
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091504' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk15.bpl', 'PLProcesosAjusteBoletas');
   End;

   // Transferencia a Oblig.
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091505' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk15.bpl', 'PLProcesosTransfPllaOblig');
   End;

   // Genera Arch.para Banco
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091506' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk15.bpl', 'PLProcesosPllaArchivoBanco');
   End;

   // Regenera Acumulados
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091507' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk15.bpl', 'PLProcesosRegeneraAcumPlla');
   End;

   // Redistribución
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091508' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk15.bpl', 'PLProcesosRedistribucion');
   End;

   // Cambia Cía/T.Planilla
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091509' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk15.bpl', 'PLProcesosCambiaTipoPlla');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
   End;

//////////////  PLANILLAS - REPORTES PLAN.PAGO - PLPk16 - oaPL7000.pas
   // Emisión Boleta Pago
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091601' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk16.bpl', 'PLRepPllaBoletas');
   End;

   // Resumen Planilla
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091602' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk16.bpl', 'PLRepPllaResumen');
   End;

   // Resumen x Rubro
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091603' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk16.bpl', 'PLRepPllaResumxRubro');
   End;

   // Planilla 4ta.Cat.
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091604' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk16.bpl', 'PLRepPlla4taCategoria');
   End;

   // Resumen Area Pago
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091605' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk16.bpl', 'PLRepPllaResumxAreaPago');
   End;

   // Perc.Fijos+Variables
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091606' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk16.bpl', 'PLRepPllaPercFijosyVariab');
   End;

   // Planillón
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091607' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk16.bpl', 'PLRepPllaPlanillon');
   End;

   // Asiento Filial Imptos.
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091608' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk16.bpl', 'PLAsientoFilialImpto');
   End;

   // Copia CDS Asiento Filial
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091609' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk16.bpl', 'PLAsientoFilialCds');
   End;

//////////////  PLANILLAS - RESÚMENES MENSUALES - PLPk17 - oaPL7100.pas
   // Resumen Mensual
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091701' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk17.bpl', 'PLResMensRepMensual');
   End;

   // Acum. Ganancias y Ret.
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091702' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk17.bpl', 'PLResMensAcumGanyRet');
   End;

   // Reporte para EsSalud
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091703' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk17.bpl', 'PLResMensEsSalud');
   End;

//////////////  PLANILLAS - OTROS REPORTES - PLPk18 - oaPL7200.pas
   // Certificados de 5ta.Cat
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091801' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk18.bpl', 'PLOtrosRepCertif5ta');
   End;

   // Certificados de 4ta.Cat
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091802' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk18.bpl', 'PLOtrosRepCertif4ta');
   End;

   // Certificados x Rubro
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091803' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk18.bpl', 'PLOtrosRepCertifxRubro');
   End;

   // Prom. Gratificaciones
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091804' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk18.bpl', 'PLOtrosRepPromGratif');
   End;

   // Detalle de Gratificaciones
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091805' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk18.bpl', 'PLOtrosRepGratif');
   End;

   // Seguro de Vida Ley
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091806' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk18.bpl', 'PLOtrosRepSeguros');
   End;

//////////////  PLANILLAS - CTS - PLPk19 - oaPL8000.pas

   // Generación
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091901' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk19.bpl', 'PLCTSGeneracion');
   End;

   // Base Indemnizable
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091902' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk19.bpl', 'PLCTSActualizacion');
   End;

   // Actualización de Pago
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091903' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk19.bpl', 'PLCTSActTCambio');
   End;

   // Reportes CTS
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091904' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk19.bpl', 'PLCTSReportes');
   End;

   // Cierre
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091905' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk19.bpl', 'PLCTSCierre');
   End;

   // Certificados
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091906' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk19.bpl', 'PLCTSCertificados');
   End;

   // Asientos Contables
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091907' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk19.bpl', 'PLCTSAsientosCont');
   End;

   // Transferencia a Oblig.
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091908' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk19.bpl', 'PLCTSTransfOblig');
   End;

   // Genera Archivo para Bancos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3091909' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk19.bpl', 'PLCTSArchBanco');
   End;

//////////////  PLANILLAS - AFP - PLPk20 - oaPL8100.pas
   // Generación
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092001' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk20.bpl', 'PLAFPGeneracion');
   End;

   // Actualización
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092002' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk20.bpl', 'PLAFPActualizacion');
   End;

   // Rep.Planilla
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092003' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk20.bpl', 'PLAFPRepPlanilla');
   End;

   // Resumen
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092004' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk20.bpl', 'PLAFPResumen');
   End;

   // Aportes Mensuales
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092005' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk20.bpl', 'PLAFPAportesMensuales');
   End;

   // Rep.Detallado
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092006' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk20.bpl', 'PLAFPRepDetallado');
   End;

   // Liquidación Anual
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092007' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk20.bpl', 'PLAFPLiquidAnual');
   End;

   // Certificado Retenciones
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092008' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk20.bpl', 'PLAFPCertificado');
   End;

   // Genera AFPNet
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092009' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk20.bpl', 'PLAFPGeneraAFPNet');
   End;

//////////////  PLANILLAS - PDT - PLPk21 - oaPL8200.pas
   // Generación
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092101' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk21.bpl', 'PLPDTGeneracion');
   End;

   // Descuentos de Ley
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092102' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk21.bpl', 'PLPDTDctosLey');
   End;

   // Actualización
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092103' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk21.bpl', 'PLPDTActualizacion');
   End;

   // Reporte
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092104' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk21.bpl', 'PLPDTReporte');
   End;

   // Genera Arch.Texto
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092105' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk21.bpl', 'PLPDTGenArchExportacion');
   End;

//////////////  PLANILLAS - LIQUIDACIONES - PLPk22 - oaPL9000.pas
   // Cálculo
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092201' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk22.bpl', 'PLLiqTrabCalculo');
   End;

   // Actualización
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092202' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk22.bpl', 'PLLiqTrabActualiza');
   End;

   // Reporte
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092203' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk22.bpl', 'PLLiqTrabReporte');
   End;

   // Asientos Contables
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092204' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk22.bpl', 'PLLiqTrabAsiento');
   End;

   // Transferencia a Oblig.
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092205' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk22.bpl', 'PLLiqTrabTransOblig');
   End;

   // Carta para Banco
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092206' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk22.bpl', 'PLLiqTrabCartaBanco');
   End;

/// PLANILLAS - PDT - RTPS - PLANILLAS ELECTRONICAS
   // PDT - RTPS - Establecimientos Propios
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092301' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSEstablecimientos');
   End;

   // PDT - RTPS - Emp.a quienes destaco
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092302' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSEmpDestaco');
   End;

   // PDT - RTPS - Emp.que me destacan
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092303' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSEmpDestacan');
   End;

   // PDT - RTPS - Trab-Pens-Prest.Serv-Terceros
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092304' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSTrabajadores1');
   End;

   // PDT - RTPS - Datos del Trabajador
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092305' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSTrabajadores2');
   End;

   // PDT - RTPS - Trab-Datos Pensionista
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092306' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSPensionistas');
   End;

   // PDT - RTPS - Trab-Datos 4ta Categoría
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092307' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSTrabDatos4ta');
   End;

   // PDT - RTPS - Suspens 4ta categoria
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092308' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSSuspension4ta');
   End;

   // PDT - RTPS - Trab-Datos-Mod.Formativa
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092309' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSDatosModFormativa');
   End;

   // PDT - RTPS - Trab-Datos-Pers.Terceros
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092310' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSPerTerceros');
   End;

   // PDT - RTPS - Periodos Laborales
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092311' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSPeriodosLaborales');
   End;

   // PDT - RTPS - Otros Empleadores
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092312' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSOtrosEmpleadores');
   End;

   // PDT - RTPS - Derecho habientes
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092313' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSDerechoHabientes');
   End;

   // PDT - RTPS - Jornada Laboral x Trabajador
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092314' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSJornadaLaboral');
   End;

   // PDT - RTPS - Días Subsidiados
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092315' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSDiasSubsidiados');
   End;

   // PDT - RTPS - Otros Días No Subsidiados
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092316' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSDiasNoSubsidiados');
   End;

   // PDT - RTPS - Trabajadores x Establecimientos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092317' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSEstablecimientosxTrabajador');
   End;

   // PDT - RTPS - Remuneración del Trabajador
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092318' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSRemuneracion');
   End;

   // PDT - RTPS - Remuneración del Pensionista
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092319' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSRemPens');
   End;

   // PDT - RTPS - Comprobantes 4ta.Prest.Servicios
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092320' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSComprobantesPS4ta');
   End;

   // PDT - RTPS - Comprobantes Mod.Formativa
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092321' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSComprobantesPSModFor');
   End;

   // PDT - RTPS - Personal de Terceros
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092322' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSPersTercSCTR');
   End;

   // PDT - RTPS - Rubros Relacionados
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092401' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSPersTercSCTR');
   End;

   // PDT - RTPS - Copia Rubros Relacionados
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092402' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSCopiaRubros');
   End;

   // PDT - RTPS - Comprobantes P.S.4ta Cat.
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092403' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSComprobantes4ta');
   End;

   // PDT - RTPS - Bajas
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3092404' Then
   Begin
      EjecutaPrograma('PLPk00.bpl', 'PLDataModulo');
      EjecutaPrograma('PLPk0A.bpl', 'PLPideTipoPlanilla');
      EjecutaPrograma('PLPk25.bpl', 'PLRTPSBajas');
   End;

////////////////////////////////////////////////////////////
// EVALUACION DE RECURSOS HUMANOS
////////////////////////////////////////////////////////////
    //////////// PARAMETROS  //////////////oaRH1000
   // Parametros
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100101' Then
   Begin
      EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
      EjecutaPrograma('oaRHPk01.bpl', 'RHParametros');
   End;

   // Plantilla Perfil de Puestos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100102' Then
   Begin
      If xOpcionMenu = 'I' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk01.bpl', 'RHPlantPerfilPuesto');
      End;

      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk01.bpl', 'RHPlantPerfilPuestosMant');
      End;
   End;

   // Plantilla Aspectos Generales
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100103' Then
   Begin
      If xOpcionMenu = 'I' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk01.bpl', 'RHPlantAspectosGenerales');
      End;

      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk01.bpl', 'RHPlantAspectosGeneralesMant');
      End;
   End;

   // Plantilla Evaluacion de Desmpeño
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100104' Then
   Begin
      If xOpcionMenu = 'I' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk01.bpl', 'RHPlantEvaluacionDesempeno');
      End;

      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk01.bpl', 'RHPlantEvaluacionDesempenoMant');
      End;
   End;

   // Categorias
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100105' Then
   Begin
      If xOpcionMenu = 'I' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk01.bpl', 'RHCategorias');
      End;

      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk01.bpl', 'RHCategoriasMant');
      End;
   End;

    //////////// PUESTOS  //////////////

   // Definicion de Puestos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100201' Then
   Begin
      If xOpcionMenu = 'I' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk02.bpl', 'RHDefinicionPuestos');
      End;

      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk02.bpl', 'RHDefinicionPuestosMant');
      End;
   End;

   // Perfil de Puestos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100202' Then
   Begin
      If xOpcionMenu = 'I' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk02.bpl', 'RHPerfilPuestos');
      End;

      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk02.bpl', 'RHPerfilPuestosMant');
      End;
   End;

   // Escala Salarial
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100203' Then
   Begin
      If xOpcionMenu = 'I' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk02.bpl', 'RHEscalaSalarial');
      End;

      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk02.bpl', 'RHEscalaSalarialMant');
      End;
   End;

    //////////// POSTULANTES  //////////////

   // Hoja de Requerimiento
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100301' Then
   Begin
      If xOpcionMenu = 'I' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk03.bpl', 'RHHojaRequerimiento');
      End;

      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk03.bpl', 'RHHojaRequerimientoMant');
      End;
   End;

   // Solicitud de Empleo
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100302' Then
   Begin
      If xOpcionMenu = 'I' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk03.bpl', 'RHSolicitudEmpleo');
      End;

      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk03.bpl', 'RHSolicitudEmpleoMant');
      End;
   End;

   // Aprobacion de Solicitud
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100303' Then
   Begin
      If xOpcionMenu = 'I' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk03.bpl', 'RHAprobacionSolicitud');
      End;

      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk03.bpl', 'RHAprobacionSolicitudMant');
      End;
   End;

    //////////// PERSONAL  //////////////

   // Personal Nuevo
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100401' Then
   Begin
      If xOpcionMenu = 'I' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk04.bpl', 'RHPersonalNuevo');
      End;

      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk04.bpl', 'RHPersonalNuevoMant');
      End;
   End;

   // Aspectos Generales
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100402' Then
   Begin
      If xOpcionMenu = 'I' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk04.bpl', 'RHAspectosGenerales');
      End;

      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk04.bpl', 'RHAspectosGeneralesMant');
      End;
   End;

   // Renovacion de Contratos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100403' Then
   Begin
      If xOpcionMenu = 'I' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk04.bpl', 'RHRenovacionContratos');
      End;

      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk04.bpl', 'RHRenovacionContratosMant');
      End;
   End;

   // Modificaciones
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100404' Then
   Begin
      If xOpcionMenu = 'I' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk04.bpl', 'RHModificaciones');
      End;

      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk04.bpl', 'RHModificacionesMant');
      End;
   End;

    //////////// DESEMPEÑO  //////////////

   // Evaluacion de Desempeño
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100501' Then
   Begin
      If xOpcionMenu = 'I' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk05.bpl', 'RHEvaluacionDesempeno');
      End;

      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk05.bpl', 'RHEvaluacionDesempenoMant');
      End;
   End;

   // Aprobacion de Evaluacion de Desempeño
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100502' Then
   Begin
      If xOpcionMenu = 'I' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk05.bpl', 'RHAprobacionEvaluacion');
      End;

      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk05.bpl', 'RHAprobacionEvaluacionMant');
      End;
   End;

   // Meritos y Demeritos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100503' Then
   Begin
      If xOpcionMenu = 'I' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk05.bpl', 'RHMeritosDemeritos');
      End;

      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk05.bpl', 'RHMeritosDemeritosMant');
      End;
   End;

    //////////// PLATAFORMA EDUCATIVA  //////////////

   // Rol de Cursos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100601' Then
   Begin
      If xOpcionMenu = 'I' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk06.bpl', 'RHRolCursos');
      End;

      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk06.bpl', 'RHRolCursosMant');
      End;
   End;

   // Seleccion y Calificacion
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100602' Then
   Begin
      If xOpcionMenu = 'I' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk06.bpl', 'RHSeleccionCalificacion');
      End;

      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk06.bpl', 'RHSeleccionCalificacionMant');
      End;
   End;

    //////////// INFORMES  //////////////

   // Expediente
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100701' Then
   Begin
      If xOpcionMenu = 'I' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk07.bpl', 'RHExpediente');
      End;

      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk07.bpl', 'RHExpedienteMant');
      End;
   End;

   // Escala Salarial Informe
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100702' Then
   Begin
      If xOpcionMenu = 'I' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk07.bpl', 'RHEscalaSalarialI');
      End;

      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk07.bpl', 'RHEscalaSalarialIMant');
      End;
   End;

   // Evaluacion de Desempeño Informe
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100703' Then
   Begin
      If xOpcionMenu = 'I' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk07.bpl', 'RHEvaluacionDesempenoI');
      End;

      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk07.bpl', 'RHEvaluacionDesempenoIMant');
      End;
   End;

   // Contratos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100704' Then
   Begin
      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk07.bpl', 'RHContratosMant');
      End;
   End;

    // Rotación de Personal
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100705' Then
   Begin
      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk07.bpl', 'RHRotacionPersonalMant');
      End;
   End;

    // Seleccion de Personal
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3100706' Then
   Begin
      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaRHPk00.bpl', 'RHDataModulo');
         EjecutaPrograma('oaRHPk07.bpl', 'RHSeleccPersonalMant');
      End;
   End;

   ///////////////////////////
   ///////////////////////////
   //     Presupuestos      //
   ///////////////////////////
   ///////////////////////////

   // Referencias
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3110101' Then
   Begin
      EjecutaPrograma('oaPRPk00.bpl', 'PRDataModulo');
      EjecutaPrograma('oaPRPk01.bpl', 'PRReferencias');
   End;

   // Centro de Costo
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3110201' Then
   Begin
      If xOpcionMenu = 'I' Then
      Begin
         EjecutaPrograma('oaPRPk00.bpl', 'PRDataModulo');
         EjecutaPrograma('oaPRPk02.bpl', 'PRPlanPartidas');
      End;

      If xOpcionMenu = 'C' Then
      Begin
         EjecutaPrograma('oaPRPk00.bpl', 'PRDataModulo');
         EjecutaPrograma('oaPRPk02.bpl', 'PRPlanPartidasMant');
      End;
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3110202' Then
   Begin
      EjecutaPrograma('oaPRPk00.bpl', 'PRDataModulo');
      EjecutaPrograma('oaPRPk02.bpl', 'PRRequerimientoUsuarioMant');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3110203' Then
   Begin
      EjecutaPrograma('oaPRPk00.bpl', 'PRDataModulo');
      EjecutaPrograma('oaPRPk02.bpl', 'PRAprobacionPresupuestoMant');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3110204' Then
   Begin
      EjecutaPrograma('oaPRPk00.bpl', 'PRDataModulo');
      EjecutaPrograma('oaPRPk02.bpl', 'PRModificacionPresupuestoMant');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3110205' Then
   Begin
      EjecutaPrograma('oaPRPk00.bpl', 'PRDataModulo');
      EjecutaPrograma('oaPRPk02.bpl', 'PRAprobacionModPresupuestoMant');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3110301' Then
   Begin
      EjecutaPrograma('oaPRPk00.bpl', 'PRDataModulo');
      EjecutaPrograma('oaPRPk03.bpl', 'PRImportarPlan');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3110302' Then
   Begin
      EjecutaPrograma('oaPRPk00.bpl', 'PRDataModulo');
      EjecutaPrograma('oaPRPk03.bpl', 'PRTransferirSaldos');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3110303' Then
   Begin
      EjecutaPrograma('oaPRPk00.bpl', 'PRDataModulo');
      EjecutaPrograma('oaPRPk03.bpl', 'PREjecutarPresupuesto');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3110304' Then
   Begin
      EjecutaPrograma('oaPRPk00.bpl', 'PRDataModulo');
      EjecutaPrograma('oaPRPk03.bpl', 'PRExportaContabilidadTexto');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3110305' Then
   Begin
      EjecutaPrograma('oaPRPk00.bpl', 'PRDataModulo');
      EjecutaPrograma('oaPRPk03.bpl', 'PRImportarArchivoDBF');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3110306' Then
   Begin
      EjecutaPrograma('oaPRPk00.bpl', 'PRDataModulo');
      EjecutaPrograma('oaPRPk03.bpl', 'PRConsolidacion');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3110401' Then
   Begin
      EjecutaPrograma('oaPRPk00.bpl', 'PRDataModulo');
      EjecutaPrograma('oaPRPk04.bpl', 'PRConsultaCentroCosto');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3110402' Then
   Begin
      EjecutaPrograma('oaPRPk00.bpl', 'PRDataModulo');
      EjecutaPrograma('oaPRPk04.bpl', 'PRConsultaPartidaPresupuestal');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3110403' Then
   Begin
      EjecutaPrograma('oaPRPk00.bpl', 'PRDataModulo');
      EjecutaPrograma('oaPRPk04.bpl', 'PRConsultaPeriodo');
   End;
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3110404' Then
   Begin
      EjecutaPrograma('oaPRPk00.bpl', 'PRDataModulo');
      EjecutaPrograma('oaPRPk04.bpl', 'PRConsultaPresupuesto');
   End;

/////////////////////////////
//  Información Gerencial  //
/////////////////////////////

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3120101' Then
   Begin
      EjecutaPrograma('ACoPk00.bpl', 'ACDataModulo');
      EjecutaPrograma('ACoPk02.bpl', 'ACAnaliticoContable');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3120201' Then
   Begin
      EjecutaPrograma('oaAPPk00.bpl', 'APDataModulo');
      EjecutaPrograma('oaAPPk02.bpl', 'APAnaliticoPresupuestal');
   End;
//   me1.Text:=IntToStr(Screen.FormCount);

/////////////////////////
//  Diccionario de Datos//
/////////////////////////

    //////////// Parametros  //////////////
   // Ubigeo
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3130101' Then
   Begin
      EjecutaPrograma('oaDDPk00.bpl', 'DDDataModulo');
      EjecutaPrograma('oaDDPk01.bpl', 'DDUbigeoMant');
   End;

    //////////// Reglas de Negocio  //////////////
   // Reglas
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3130201' Then
   Begin
      EjecutaPrograma('oaDDPk00.bpl', 'DDDataModulo');
      EjecutaPrograma('oaDDPk02.bpl', 'DDReglasNegocioMant');
   End;

    //////////// Diccionario  //////////////
   // Configuracion
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3130301' Then
   Begin
      EjecutaPrograma('oaDDPk00.bpl', 'DDDataModulo');
      EjecutaPrograma('oaDDPk03.bpl', 'DDConfiguracion');
   End;

   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3130302' Then
   Begin
      EjecutaPrograma('oaDDPk00.bpl', 'DDDataModulo');
      EjecutaPrograma('oaDDPk03.bpl', 'DDConsultaDiccionarioMant');
   End;

////////////////////////////////////////////////////////////
//  ACTIVOS FIJOS        -      SERVICIOS GENERALES
////////////////////////////////////////////////////////////
    //////////// PARAMETROS  //////////////
   // Parametros
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3160101' Then
   Begin
      EjecutaPrograma('ACFSGPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('ACFSGPk01.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('ACFSGPk01.bpl', 'AFParametros');
   End;

    //////////// MAESTROS  //////////////
   // Maestro de Activos Fijos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3160201' Then
   Begin
      EjecutaPrograma('ACFSGPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('ACFSGPk02.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('ACFSGPk02.bpl', 'AFControlOperativoMant');
   End;
   // Control Contabla
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3160202' Then
   Begin
      EjecutaPrograma('ACFSGPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('ACFSGPk02.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('ACFSGPk02.bpl', 'AFMaestroActivoFijoMant');
   End;
   // Tipos de Activo
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3160203' Then
   Begin
      EjecutaPrograma('ACFSGPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('ACFSGPk02.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('ACFSGPk02.bpl', 'AFTiposActivoMant');
   End;

    //////////// PROCESOS  //////////////
   // Inicializa Depreciacion
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3160301' Then
   Begin
      EjecutaPrograma('ACFSGPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('ACFSGPk03.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('ACFSGPk03.bpl', 'AFInicializaDepreciacion');
   End;
   // Depreciacion y Ajuste
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3160302' Then
   Begin
      EjecutaPrograma('ACFSGPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('ACFSGPk03.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('ACFSGPk03.bpl', 'AFDepreciacionAjuste');
   End;
   // Cierre de Depreciacion
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3160303' Then
   Begin
      EjecutaPrograma('ACFSGPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('ACFSGPk03.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('ACFSGPk03.bpl', 'AFCierreDepreciacion');
   End;
   // Contabiliza Depreciacion
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3160304' Then
   Begin
      EjecutaPrograma('ACFSGPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('ACFSGPk03.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('ACFSGPk03.bpl', 'AFContabilizaDepreciacion');
   End;
   // Cierre Operativo
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3160305' Then
   Begin
      EjecutaPrograma('ACFSGPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('ACFSGPk03.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('ACFSGPk03.bpl', 'AFCopiaCds');
   End;
   // Reclasificacion Contable
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3160306' Then
   Begin
      EjecutaPrograma('ACFSGPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('ACFSGPk03.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('ACFSGPk03.bpl', 'AFEliminaDepreciacionAjuste');
   End;
   // Ajuste Anual de Activos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3160307' Then
   Begin
      EjecutaPrograma('ACFSGPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('ACFSGPk03.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('ACFSGPk03.bpl', 'AFActCenCos');
   End;

   // Recupera Texto
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3160308' Then
   Begin
      EjecutaPrograma('ACFSGPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('ACFSGPk03.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('ACFSGPk03.bpl', 'AFRecuperaTexto');
   End;
   // Contabiliza REI
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3160309' Then
   Begin
      EjecutaPrograma('ACFSGPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('ACFSGPk03.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('ACFSGPk03.bpl', 'AFContabilizaREI');
   End;
   // Limite de Reexpresion
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3160310' Then
   Begin
      EjecutaPrograma('ACFSGPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('ACFSGPk03.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('ACFSGPk03.bpl', 'AFLimiteReexpresion');
   End;
   // Elimina Depreciacion y Ajuste
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3160311' Then
   Begin
      EjecutaPrograma('ACFSGPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('ACFSGPk03.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('ACFSGPk03.bpl', 'AFEliminaDepreciacionAjuste');
   End;

   // Registra solicitud de desactivacion
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3160312' Then
   Begin
      EjecutaPrograma('ACFSGPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('ACFSGPk03.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('ACFSGPk03.bpl', 'AFSolicitudDesactivacion');
   End;

   // Registra solicitud de cambio de Código de Barras
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3160313' Then
   Begin
      EjecutaPrograma('ACFSGPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('ACFSGPk03.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('ACFSGPk03.bpl', 'AFCambioCodbarras');
   End;

    //////////// INFORMES  //////////////
   // Depreciacion Preliminar
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3160401' Then
   Begin
      EjecutaPrograma('ACFSGPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('ACFSGPk04.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('ACFSGPk04.bpl', 'AFDepreciacionPreliminar');
   End;
   // Depreciacion Definitiva
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3160402' Then
   Begin
      EjecutaPrograma('ACFSGPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('ACFSGPk04.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('ACFSGPk04.bpl', 'AFDepreciacionDefinitiva');
   End;
   // Resumen Ajuste y Depreciacion
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3160403' Then
   Begin
      EjecutaPrograma('ACFSGPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('ACFSGPk04.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('ACFSGPk04.bpl', 'AFResumenAjusteDepreciacion');
   End;
   // Legalizacion de Activos Fijos
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3160404' Then
   Begin
      EjecutaPrograma('ACFSGPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('ACFSGPk04.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('ACFSGPk04.bpl', 'LegalizacionActivosFijos');
   End;
    //////////// INVENTARIOS FISICOS  //////////////
   // Depreciacion Preliminar
   If TreeView.ActiveDataSet.FieldByName('CODIGO').AsString = '3160501' Then
   Begin
      EjecutaPrograma('ACFSGPk00.bpl', 'AFDataModulo');
// Inicio HPC_201803_MNU
// Se implementa la versión del Activo Fijo
      EjecutaPrograma('ACFSGPk05.bpl', 'AFVerificaVersion');
// Fin HPC_201803_MNU
      EjecutaPrograma('ACFSGPk05.bpl', 'AFInventarioFisico');
   End;

   Screen.Cursor := crDefault;
End;

End.

