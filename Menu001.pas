// Actualizaciones
//HPC_201801_CXP    29/01/2018 Entrega a Control de Calidad

// Inicio HPC_201801_CXP
// Entrega a Control de Calidad
Unit Menu001;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
   Dialogs, DB, Wwdatsrc, DBClient, wwclient, fcdbtreeview, IniFiles,
   ComCtrls, fcLabel, ExtCtrls, MConnect, StdCtrls, Buttons, fcpanel, oaVariables;

Type
   TFMenu = Class(TForm)
      cdsMenu1: TwwClientDataSet;
      cdsMenu2: TwwClientDataSet;
      cdsMenu3: TwwClientDataSet;
      dsMenu1: TwwDataSource;
      dsMenu2: TwwDataSource;
      dsMenu3: TwwDataSource;
      fcLabel2: TfcLabel;
      fcLabel3: TfcLabel;
      Image1: TImage;
      Image2: TImage;
      Image3: TImage;
      Image4: TImage;
      Image5: TImage;
      Image6: TImage;
      Image7: TImage;
      Image8: TImage;
      Image9: TImage;
      Image10: TImage;
      Image11: TImage;
      Image12: TImage;
      Image13: TImage;
      Image14: TImage;
      Image15: TImage;
      Image16: TImage;
      Image17: TImage;
      Image18: TImage;
      Image19: TImage;
      Image20: TImage;
      Image21: TImage;
      Image22: TImage;
      Image23: TImage;
      Image24: TImage;
      sbHelp: TSpeedButton;
      fcLabel1: TfcLabel;
      imgSimbolo: TImage;
      Procedure FormCreate(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
      Procedure EjecutaPrograma(cPaquete, cPrograma: String);
      Function StrZero(wNumero: String; wLargo: Integer): String;
      Procedure AppMessage(Var Msg: TMsg; Var Handled: Boolean);
   End;

   TFormaPckProc = Procedure; stdcall;

Var
   FMenu: TFMenu;

Implementation

Uses Menu100, ACC002, ACCDM, ACC003, ACC020;

{$R *.dfm}

Procedure TFMenu.AppMessage(Var Msg: TMsg; Var Handled: Boolean);
Begin
   If Msg.message = WM_KEYDOWN Then
   Begin

      If (Msg.wParam = VK_F3) Then
      Begin
//
      End;
      If (Msg.wParam = VK_F4) Then
      Begin
//
      End;

      If (Msg.wParam = VK_F5) Then
      Begin
         If DMACC <> Nil Then
         Begin
            If Not Assigned(FMantAcceso) Then
            Begin
               ShowMessage('Debe seleccionar un grupo y modulo');
               Exit;
            End;
            If FMantAcceso.sGrupoTmp = '' Then
            Begin
               ShowMessage('Debe seleccionar un grupo');
               Exit;
            End;
            FMantOpcion := TFMantOpcion.create(self);
            FMantOpcion.sModulo := FMantAcceso.sModulo;
            FMantOpcion.sGrupoTmp := FMantAcceso.sGrupoTmp;
            FMantOpcion.sObjetoDescr := FMenuOpcion.fcTVMenu.ActiveDataSet.FieldByName('NOMBRE').AsString;
            FMantOpcion.sObjetoForma := 'fMenu';
            FMantOpcion.sObjetoNombr := FMenuOpcion.fcTVMenu.ActiveDataSet.FieldByName('CODIGO').AsString;
            FMantOpcion.ShowModal;
         End;

      End;

      If (Msg.wParam = VK_F11) Then
      Begin
         If DMACC <> Nil Then
         Begin
            If Not Assigned(FAccesoTablas) Then
               FAccesoTablas := TFAccesoTablas.create(self);
            FAccesoTablas.ShowModal;
         End;
      End;
      If (Msg.wParam = VK_F12) Then
      Begin
         If DMACC <> Nil Then
         Begin
            If Not Assigned(FMantAcceso) Then
               FMantAcceso := TFMantAcceso.create(self);
            FMantAcceso.ShowModal;
         End;
      End;
   End;
End;

Procedure TFMenu.EjecutaPrograma(cPaquete, cPrograma: String);
Var
   PackageModule: THandle;
   FormaPckProc: TFormaPckProc;
Begin
   PackageModule := LoadPackage(cPaquete);
   Try
      @FormaPckProc := GetProcAddress(PackageModule, PChar(cPrograma));
      If Not (@FormaPckProc = Nil) Then
         FormaPckProc;
   Finally
   End;
End;

Function TFMenu.StrZero(wNumero: String; wLargo: Integer): String;
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

Procedure TFMenu.FormCreate(Sender: TObject);
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
   FVariables := TFVariables.Create(Self);

End;

Procedure TFMenu.FormActivate(Sender: TObject);
Begin
   Application.OnMessage := AppMessage;

   If ThousandSeparator <> ',' Then
   Begin
      ShowMessage('El separador de Miles debe ser una COMA (,) ...');
      Application.Terminate;
   End;
   If DecimalSeparator <> '.' Then
   Begin
      ShowMessage('El separador DECIMAL debe ser un PUNTO (.) ...');
      Application.Terminate;
   End;
End;

End.
// Fin HPC_201801_CXP

