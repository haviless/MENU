//Actualizaciones
//HPC_201801_CXP    29/01/2018 Cambio por Opciones de dietas de directorio
//                             Entrega a Control de Calidad

Program SisDema;

Uses
   Forms,
   Menu001 In 'Menu001.pas' {FMenu},
   Menu100 In 'Menu100.pas' {FMenuOpcion},
   Menu101 In 'Menu101.pas' {FOpcion},
   CambioPwd In 'CambioPwd.pas' {FCPassw},
   ACCDM In 'ACCDM.pas' {DMACC: TDataModule},
   ACC002 In 'ACC002.pas' {FMantAcceso},
   Menu020 In 'Menu020.pas' {FCtrlAcceso},
   ACC003 In 'ACC003.pas' {FMantOpcion},
   ACC020 In 'ACC020.pas' {FAccesoTablas};

{$R *.res}

Begin
   Application.Initialize;
   Application.CreateForm(TFMenu, FMenu);
   Application.CreateForm(TFMenuOpcion, FMenuOpcion);
   Application.CreateForm(TFOpcion, FOpcion);
   Application.Run;
End.

