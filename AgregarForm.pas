unit AgregarForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZAbstractTable,
  ZDataset, ZAbstractConnection, ZConnection;

type
  TfrmAgregar = class(TForm)
    btnAgregar: TButton;
    txtNombre: TEdit;
    cmbEstatus: TComboBox;
    lblnombre: TLabel;
    lbl_Estatus: TLabel; //Nuevo componente para editar
    procedure btnAgregarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    id: Integer;
    nombre: string;
    status: string;
    modificar: Boolean;

  end;

var
  frmAgregar: TfrmAgregar;

implementation

uses
  DataModule;

{$R *.dfm}

procedure TfrmAgregar.btnAgregarClick(Sender: TObject);
var
  StatusValor: string;
begin
  // 1. Conexión y Apertura de Tabla
  if not DataModule1.con1.Connected then
    DataModule1.con1.Connect;

  if not DataModule1.TblDatos.Active then
    DataModule1.TblDatos.Open;

  // 2. Obtener el valor del TComboBox usando el nuevo nombre
  // El texto seleccionado por el usuario será 'Activo' o 'Inactivo'
  StatusValor := cmbEstatus.Text;

  if modificar = true then
  begin
    DataModule1.TblDatos.Locate('id_academia', id, []);
    DataModule1.TblDatos.edit;
  end
  else
  begin
  // 3. Iniciar la inserción
    DataModule1.TblDatos.Append;
  end;
  // Asignar el nombre (usando el campo de entrada EditNombre)
  DataModule1.TblDatos.FieldByName('nombre_academia').AsString := txtNombre.Text;

  // Asignar el status
  DataModule1.TblDatos.FieldByName('academia_status').AsString := StatusValor;

  // 4. Mensaje Modificar o Guardar el nuevo registro
  try
    DataModule1.TblDatos.Post;
    if modificar = true then
      ShowMessage('Academia "' + txtNombre.Text + '" modificada con éxito')
    else
      ShowMessage('Academia "' + txtNombre.Text + '" agregada con éxito');

    // Limpiar campos y resetear el ComboBox
    txtNombre.Text := '';
    cmbEstatus.ItemIndex := 0; // O la opción que desees como predeterminada
    Close;

  except
    on E: Exception do
    begin
      ShowMessage('Error al guardar: ' + E.Message);
      DataModule1.TblDatos.Cancel;
    end;
  end;

end;

procedure TfrmAgregar.FormShow(Sender: TObject);
begin
  if modificar then
  begin
    self.Caption := 'Modificar';
    btnAgregar.Caption := 'Modificar';
    txtNombre.Text := nombre;
    if status = 'Activo' then
      cmbEstatus.ItemIndex := 0
    else
      cmbEstatus.ItemIndex := 1;
  end;
end;

end.

