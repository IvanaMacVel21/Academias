unit DataModule;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset;

type
  TDataModule1 = class(TDataModule)
    con1: TZConnection;
    TblDatos: TZTable;
    TblDatosid_academia: TZCardinalField;
    TblDatosnombre_academia: TZUnicodeStringField;
    TblDatosacademia_status: TZUnicodeStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
