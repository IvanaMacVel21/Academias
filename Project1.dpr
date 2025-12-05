program Project1;

uses
  Vcl.Forms,
  AcademiasBD in 'AcademiasBD.pas' {FrmListaAcademias},
  AgregarFormObjeto in 'AgregarFormObjeto.pas' {frmAgregarObjeto},
  DataModule in 'DataModule.pas' {DataModule1: TDataModule},
  Academia in 'Academia.pas',
  AgregarForm in 'AgregarForm.pas' {frmAgregar};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmListaAcademias, FrmListaAcademias);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmAgregar, frmAgregar);
  Application.Run;
end.
