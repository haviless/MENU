// Actualizaciones
//HPC_201801_CXP    29/01/2018 Entrega a Control de Calidad

// Inicio HPC_201801_CXP
// Entrega a Control de Calidad

Unit ACC003;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, Mask, ExtCtrls, wwclient, MConnect,
   variants, Grids, Wwdbigrd, Wwdbgrid;

Type
   TFMantOpcion = Class(TForm)
      Label1: TLabel;
      meDescriptivo: TMaskEdit;
      Label2: TLabel;
      meCondicion: TMaskEdit;
      bbtnCancela: TBitBtn;
      bbtnCambia: TBitBtn;
      Label3: TLabel;
      meGrupo: TMaskEdit;
      meObjeto: TMaskEdit;
      meForma: TMaskEdit;
      imgOff: TImage;
      ImgOn: TImage;
      Procedure CreaAccesos;
      Procedure bbtnCambiaClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure bbtnCancelaClick(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
   Private
    { Private declarations }
      wComponente: TControl;
      Procedure AccesosUsuarios(xxModulo, xxTipo, xxForma: String);
      Procedure ColorButtons(xForm: TForm);
      Function BuscaObjeto(Const xNombre: String; xForm: TForm): TControl;
      Function BuscaTSpeedButton(Const xNombre: String; xForm: TForm): TSpeedButton;
   Public
    { Public declarations }
      sGrupoTmp: String;
      sObjetoDescr: String;
      sObjetoForma: String;
      sObjetoNombr: String;
      sModulo: String;
      wFPrincipal: TForm;
      Procedure ControlTran;
      Procedure AplicaDatos(wCDS: TwwClientDataSet; wNomArch: String);
   End;

Var
   FMantOpcion: TFMantOpcion;
   xExiste: Boolean;
   ErrorCount: integer;

Implementation

Uses ACC002, ACCDM;

{$R *.DFM}

Procedure TFMantOpcion.CreaAccesos;
Begin
   FMantAcceso := TFMantAcceso.Create(Self);
   With FMantAcceso Do
   Try
      ShowModal;
   Finally
      Free;
   End;
End;

Procedure TFMantOpcion.bbtnCambiaClick(Sender: TObject);
Begin
   meGrupo.Text := sGrupoTmp;
   meDescriptivo.Text := sObjetoDescr;
   meForma.Text := sObjetoForma;
   meObjeto.Text := sObjetoNombr;
   If xExiste Then
      dmacc.cdsGrupos.Delete
   Else
   Begin
      dmacc.cdsGrupos.Insert;
      dmacc.cdsGrupos.FieldByName('GRUPOID').AsString := sGrupoTmp;
      dmacc.cdsGrupos.FieldByName('MODULOID').AsString := sModulo;
      dmacc.cdsGrupos.FieldByName('TIPO').AsString := Copy(sObjetoNombr, 5, 1);

      dmacc.cdsGrupos.FieldByName('OBJETO').AsString := sObjetoNombr;
      dmacc.cdsGrupos.FieldByName('FORMA').AsString := sObjetoForma;
      dmacc.cdsGrupos.FieldByName('DESCRIPTIVO').AsString := sObjetoDescr;
   End;
   dmacc.cdsGrupos.ApplyUpdates(-1);
   close;
End;

Procedure TFMantOpcion.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFMantOpcion.bbtnCancelaClick(Sender: TObject);
Begin
   dmacc.cdsGrupos.CancelUpdates;
   close;
End;

Procedure TFMantOpcion.AplicaDatos(wCDS: TwwClientDataSet; wNomArch: String);
Var
   Results, OwnerData: OleVariant;
Begin
   ErrorCount := 0;
   If (wCDS.Modified) Or (wCDS.changeCount > 0) Then
   Begin
      If VarIsEmpty(wCDS.Delta) Then Exit;
      wCDS.CheckBrowseMode;
      Results := dmacc.DCOM1.AppServer.AS_ApplyUpdates(wCDS.ProviderName, wCDS.Delta, -1, ErrorCount, OwnerData);
      wCDS.Reconcile(Results);
      If ErrorCount <> 0 Then
      Begin
         ShowMessage('Avise a su Proveedor de Software (Acceso a Botones)');
      End
   End;
End;

Procedure TFMantOpcion.ControlTran;
Begin
End;

Procedure TFMantOpcion.FormActivate(Sender: TObject);
Begin
   meGrupo.Text := sGrupoTmp;
   meDescriptivo.Text := sObjetoDescr;
   meForma.Text := sObjetoForma;
   meObjeto.Text := sObjetoNombr;

   dmacc.cdsGrupos.RecordCount;
   dmacc.cdsGrupos.IndexFieldNames := 'GRUPOID;MODULOID;TIPO;OBJETO';
   dmacc.cdsMGrupo.FieldByName('GRUPOID').AsString;
   dmacc.cdsGrupos.Filtered := true;

   dmacc.cdsGrupos.Setkey;
   dmacc.cdsGrupos.FieldByName('GRUPOID').AsString := sGrupoTmp;
   dmacc.cdsGrupos.FieldByName('MODULOID').AsString := sModulo;
   dmacc.cdsGrupos.FieldByName('TIPO').AsString := Copy(sObjetoNombr, 5, 1);
   dmacc.cdsGrupos.FieldByName('OBJETO').AsString := sObjetoNombr;
   If dmacc.cdsGrupos.Gotokey Then
   Begin
      xExiste := True;
      meCondicion.Font.Color := clRed;
      imgOff.Visible := True;
      imgOn.Visible := False;
      meCondicion.Text := 'Opcion Inactiva';
   End
   Else
   Begin
      xExiste := False;
      imgOff.Visible := False;
      imgOn.Visible := True;
      meCondicion.Font.Color := clBlue;
      meCondicion.Text := 'Opción Activa';
   End;

End;

Procedure TFMantOpcion.AccesosUsuarios(xxModulo, xxTipo, xxForma: String);
Begin

   dmacc.cdsGrupos.Filter := '';
   If xxTipo = '1' Then
   Begin
      // Regresar el Color
      ColorButtons(wFPrincipal);

      dmacc.cdsGrupos.Filter := 'GrupoID=' + '''' + dmacc.cdsMGrupo.FieldByName('GRUPOID').AsString + '''' + ' and '
         + 'ModuloID=' + '''' + xxModulo + '''' + ' and '
         + 'Tipo=' + '''' + xxTipo + '''';
      dmacc.cdsGrupos.Filtered := True;
      dmacc.cdsGrupos.First;
      While Not dmacc.cdsGrupos.Eof Do
      Begin
         wComponente := BuscaObjeto(dmacc.cdsGrupos.FieldByName('OBJETO').AsString, wFPrincipal);
         If wComponente.ClassName = 'TSpeedButton' Then
            BuscaTSpeedButton(dmacc.cdsGrupos.FieldByName('OBJETO').AsString, wFPrincipal).Font.Color := clGray;

         dmacc.cdsGrupos.Next;
      End;
   End;

   If xxTipo = '2' Then
   Begin
      dmacc.cdsGrupos.Filter := 'GrupoID=' + '''' + dmacc.cdsMGrupo.FieldByName('GRUPOID').AsString + '''' + ' and '
         + 'ModuloID=' + '''' + xxModulo + '''' + ' and '
         + 'Forma=' + '''' + xxForma + '''' + ' and '
         + 'Tipo=' + '''' + xxTipo + '''';
      dmacc.cdsGrupos.Filtered := True;
      dmacc.cdsGrupos.First;
      While Not dmacc.cdsGrupos.Eof Do
      Begin
         wComponente := BuscaObjeto(dmacc.cdsGrupos.FieldByName('OBJETO').AsString, wFPrincipal);
         If (wComponente.Name = 'Z2bbtnModifica') Or
            (wComponente.Name = 'Z2bbtnConsulta') Then
            wComponente.Enabled := False
         Else
         Begin
            wComponente.Visible := False;
         End;
         dmacc.cdsGrupos.Next;
      End;
   End;
End;

Procedure TFMantOpcion.ColorButtons(xForm: TForm);
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

Function TFMantOpcion.BuscaObjeto(Const xNombre: String; xForm: TForm): TControl;
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

Function TFMantOpcion.BuscaTSpeedButton(Const xNombre: String; xForm: TForm): TSpeedButton;
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

End.
// Fin HPC_201801_CXP


