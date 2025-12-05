unit AcademiasBD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZAbstractTable,
  ZDataset, ZAbstractConnection, ZConnection, Vcl.Grids, Vcl.DBGrids,
  Vcl.ToolWin, Vcl.ComCtrls;

type
  TFrmListaAcademias = class(TForm)
    DataSource: TDataSource;
    datos: TDBGrid;
    btnVerTabla: TButton;
    btnModificar: TButton;
    btnBorrar: TButton;
    btnAgregar: TButton;
    StatusBar1: TStatusBar;
    lblTitulo: TLabel;
    btnAgregarObj: TButton;
    btnModificarObj: TButton;
    btnBorrarObj: TButton;
    procedure btnVerTablaClick(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnAgregarObjClick(Sender: TObject);
    procedure btnModificarObjClick(Sender: TObject);
    procedure btnBorrarObjClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmListaAcademias: TFrmListaAcademias;

implementation

uses
  AgregarForm, DataModule, AgregarFormObjeto;

{$R *.dfm}

procedure TFrmListaAcademias.btnAgregarObjClick(Sender: TObject);
begin
   with TfrmAgregarObjeto.Create(self) do
  begin
    id := 0;
    ShowModal;
    Release;
    btnVerTabla.Click;
  end;
end;

procedure TFrmListaAcademias.btnBorrarClick(Sender: TObject);
var
  Resultado: Integer;
  NombreAcademia: string;
begin
  if DataModule1.TblDatos.Active and (not DataModule1.TblDatos.IsEmpty) then
  begin
    NombreAcademia := DataModule1.TblDatos.FieldByName('nombre_academia').AsString;

    Resultado := MessageDlg('¿Está seguro de que desea eliminar la academia: "' + NombreAcademia + '" ?', mtConfirmation, [mbYes, mbNo], 0);

    if Resultado = mrYes then
    begin
      try
        DataModule1.TblDatos.Delete; // Elimina el registro
        ShowMessage('La academia "' + NombreAcademia + '" ha sido eliminada.');
      except
        on E: Exception do
        begin
          ShowMessage('Error al eliminar: "' + E.Message + '"');
        end;
      end;
    end;
  end
  else
    ShowMessage('Primero debe seleccionar una academia para borrar.');
end;

procedure TFrmListaAcademias.btnBorrarObjClick(Sender: TObject);
begin
     //
end;

procedure TFrmListaAcademias.btnVerTablaClick(Sender: TObject);
begin
  // 1. Conectar a la base de datos si no está activa
  if not DataModule1.con1.Connected then
  begin
    DataModule1.con1.Connect;
  end;

  // 2. Cerrar la tabla (si está abierta)
  // Esto es crucial para forzar la recarga de los datos
  if DataModule1.TblDatos.Active then
    DataModule1.TblDatos.Close;

  // 3. Abrir la tabla para cargar los datos en el TDBGrid
  // Este paso recarga todos los datos nuevos de la BD
  DataModule1.TblDatos.Open;
end;

procedure TFrmListaAcademias.btnAgregarClick(Sender: TObject);
begin
  with TfrmAgregar.Create(self) do
  begin
    modificar := false;
    ShowModal;
    Release;
    btnVerTabla.Click;
  end;
end;

procedure TFrmListaAcademias.btnModificarClick(Sender: TObject);
begin
  with TfrmAgregar.Create(owner) do
  begin
    id := datos.DataSource.DataSet.FieldByName('id_academia').AsInteger;
    nombre := datos.DataSource.DataSet.FieldByName('nombre_academia').AsString;
    status := datos.DataSource.DataSet.FieldByName('academia_status').AsString;
    modificar := true;
    ShowModal;
    Release;
    btnVerTabla.Click;
  end;
end;

procedure TFrmListaAcademias.btnModificarObjClick(Sender: TObject);
begin
  with TfrmAgregarObjeto.Create(self) do
  begin
    modificar := true;
    id := datos.DataSource.DataSet.FieldByName('id_academia').AsInteger;
    ShowModal;
    Release;
    btnVerTabla.Click;
  end;
end;

end.

