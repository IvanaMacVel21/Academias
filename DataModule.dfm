object DataModule1: TDataModule1
  Height = 480
  Width = 640
  object con1: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    Connected = True
    DisableSavepoints = False
    HostName = 'localhost'
    Port = 0
    Database = 'academias'
    User = ''
    Password = ''
    Protocol = 'mysql'
    LibraryLocation = 
      'C:\Users\Aux programador\Documents\Embarcadero\Studio\Projects\A' +
      'prendiendo Delphi\005_AcademiasBD\libmysql.dll'
    Left = 216
    Top = 168
  end
  object TblDatos: TZTable
    Connection = con1
    Active = True
    TableName = 'academias'
    Left = 280
    Top = 168
    object TblDatosid_academia: TZCardinalField
      DisplayWidth = 11
      FieldName = 'id_academia'
      ProviderFlags = [pfInKey]
      ReadOnly = True
      Required = True
    end
    object TblDatosnombre_academia: TZUnicodeStringField
      DisplayWidth = 32
      FieldName = 'nombre_academia'
      Size = 45
    end
    object TblDatosacademia_status: TZUnicodeStringField
      DisplayWidth = 20
      FieldName = 'academia_status'
      Required = True
      Size = 45
    end
  end
end
