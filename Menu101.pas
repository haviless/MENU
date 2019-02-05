// Actualizaciones
//HPC_201801_CXP    29/01/2018 Entrega a Control de Calidad

// Inicio HPC_201801_CXP
// Entrega a Control de Calidad
Unit Menu101;

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, fcButton, fcImgBtn, ExtCtrls, fcClearPanel, fcButtonGroup,
   fcShapeBtn;

Type
   TFOpcion = Class(TForm)
      fcShapeBtn1: TfcShapeBtn;
      fcShapeBtn2: TfcShapeBtn;
      fcShapeBtn3: TfcShapeBtn;
      fcShapeBtn4: TfcShapeBtn;
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormShow(Sender: TObject);
      Procedure fcShapeBtn1Click(Sender: TObject);
      Procedure fcShapeBtn2Click(Sender: TObject);
      Procedure fcShapeBtn3Click(Sender: TObject);
      Procedure fcShapeBtn4Click(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FOpcion: TFOpcion;

Implementation

{$R *.dfm}

Uses Menu100;

Procedure TFOpcion.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   FOpcion.Visible := False;
   Action := caFree;
End;

Procedure TFOpcion.FormShow(Sender: TObject);
Begin
   xOpcionMenu := '';
End;

Procedure TFOpcion.fcShapeBtn1Click(Sender: TObject);
Begin
   xOpcionMenu := 'C';
   Close;
End;

Procedure TFOpcion.fcShapeBtn2Click(Sender: TObject);
Begin
   xOpcionMenu := 'I';
   Close;
End;

Procedure TFOpcion.fcShapeBtn3Click(Sender: TObject);
Begin
   xOpcionMenu := 'H';
   Close;
End;

Procedure TFOpcion.fcShapeBtn4Click(Sender: TObject);
Begin
   xOpcionMenu := 'X';
   Close;
End;

End.
// Fin HPC_201801_CXP

