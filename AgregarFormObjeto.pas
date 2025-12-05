unit AgregarFormObjeto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZAbstractTable,
  ZDataset, ZAbstractConnection, ZConnection;

type
  tfrmAgregarObjeto = class(TForm)
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
    modificar: Boolean;

  end;

var
  frmAgregarObjeto: tfrmAgregarObjeto;

implementation

uses
  DataModule, Academia;

{$R *.dfm}
//AGREGAR O MODIFICAR ACADEMIA
procedure tfrmAgregarObjeto.btnAgregarClick(Sender: TObject);
var
  myObj: TAcademia;
begin
  //Agregar academia
  if modificar = false then
  begin
    myObj := TAcademia.Create(id);
    myObj.Nombre := txtNombre.text;
    myObj.Status := cmbEstatus.text;
    if myObj.Save = true then
      ShowMessage('Academia "' + txtNombre.Text + '" agregada con éxito')
    else


  end
  else
  //Modificar academia
  begin
    //myObj := TAcademia.Save;
    DataModule1.TblDatos.Locate('id_academia', id, []);
    DataModule1.TblDatos.edit;
    ShowMessage('Academia "' + txtNombre.Text + '" modificada con éxito');
  end
end;

//MOSTRAR ACADEMIA
procedure tfrmAgregarObjeto.FormShow(Sender: TObject);
var
  myObj: TAcademia;
begin
  if modificar = true then
  begin
  self.Caption := 'Modificar';
  btnAgregar.Caption := 'Modificar';
  end;

  if id > 0 then
  begin
    myObj := TAcademia.Create(id);
    txtNombre.text := myObj.Nombre;
    cmbEstatus.Text := myObj.Status;
  end;
end;

end.

