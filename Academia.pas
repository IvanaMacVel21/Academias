unit Academia;

interface

uses
  SysUtils, ZDataset, Classes, DataModule, DB;

type
  TAcademia = class
  private
    pId: Integer;
    pNombre: string;
    pStatus: string;
    pTiempoInicio: Integer;
    pTiempoFin: Integer;
  public
    property Id: Integer read pId;
    property Nombre: string read pNombre write pNombre;
    property Status: string read pStatus write pStatus;

    constructor Create(myId: Integer = 0);
    destructor Free;

    procedure Initialize;
    function Save: Boolean;   //Edit
    function Load: Boolean;   //Lectura
    //function Add
    //function Delete();
  end;

implementation

constructor TAcademia.Create(myId: Integer = 0);
begin
  pId := myId;
  if (pId > 0) then
  begin
    if not Load then
      Initialize;
  end
  else
    Initialize;
end;

procedure TAcademia.Initialize;
begin
  pNombre := '';
  pTiempoInicio := 0;
  pTiempoFin := 0;
  pStatus := 'Activo';
end;

destructor TAcademia.Free;
begin
  if Self <> nil then
    inherited Destroy;
end;

function TAcademia.Load: Boolean;
var
  qry: TZQuery;
begin
  qry := TZQuery.Create(nil);
  try
    qry.Connection := DataModule1.con1;
    qry.SQL.Text := 'SELECT * FROM academias WHERE id_academia= :id_academia';
    qry.ParamByName('id_academia').AsInteger := pId;
    qry.Open;

    if not qry.IsEmpty then
    begin
      pId := qry.FieldByName('id_academia').AsInteger;
      pNombre := qry.FieldByName('nombre_academia').AsString;
      pStatus := qry.FieldByName('academia_status').AsString;
    end;
    Result := True;
  finally
    qry.Free;
  end;
end;

function TAcademia.Save: Boolean;
var
  qry: TZQuery;
begin
  qry := TZQuery.Create(nil);
  try
    qry.Connection := DataModule1.con1;

    if pId > 0 then
    begin
      qry.SQL.Text := 'SELECT * FROM academias WHERE id_academia= :id_academia';
      qry.ParamByName('id_academia').AsInteger := pId;
      qry.Open;
      if not qry.IsEmpty then
      begin
        qry.Edit;
        qry.FieldByName('nombre_academia').AsString := pNombre;
        qry.FieldByName('academia_status').AsString := pStatus;

        qry.Post;
      end;
    end
    else
    begin
      qry.SQL.Text := 'SELECT * FROM academias LIMIT 1';
      qry.Open;
      qry.Insert;
      qry.FieldByName('nombre_academia').AsString := pNombre;
      qry.FieldByName('academia_status').AsString := pStatus;
      qry.Post;

      qry.SQL.Text := 'SELECT MAX(id_academia) AS id_academia FROM academias';
      qry.Open;
      pId := qry.FieldByName('id_academia').AsInteger;
      Load;
    end;

    Result := True;
  finally
    qry.Free;
  end;
end;

end.


