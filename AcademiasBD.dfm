object FrmListaAcademias: TFrmListaAcademias
  Left = 0
  Top = 0
  Caption = 'Academias'
  ClientHeight = 452
  ClientWidth = 624
  Color = clBackground
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  DesignSize = (
    624
    452)
  TextHeight = 15
  object lblTitulo: TLabel
    Left = 0
    Top = 0
    Width = 624
    Height = 433
    Align = alClient
    Alignment = taCenter
    Caption = 'Academias'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Roboto Bk'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 174
    ExplicitHeight = 42
  end
  object datos: TDBGrid
    AlignWithMargins = True
    Left = 23
    Top = 64
    Width = 593
    Height = 249
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object btnVerTabla: TButton
    Left = 533
    Top = 402
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Ver tabla'
    TabOrder = 1
    OnClick = btnVerTablaClick
  end
  object btnModificar: TButton
    Left = 124
    Top = 345
    Width = 69
    Height = 30
    Anchors = [akLeft, akBottom]
    Caption = 'Modificar'
    ImageAlignment = iaBottom
    TabOrder = 2
    OnClick = btnModificarClick
  end
  object btnBorrar: TButton
    AlignWithMargins = True
    Left = 228
    Top = 344
    Width = 69
    Height = 31
    Anchors = [akLeft, akBottom]
    Caption = 'Borrar'
    ImageAlignment = iaBottom
    TabOrder = 3
    OnClick = btnBorrarClick
  end
  object btnAgregar: TButton
    Left = 8
    Top = 345
    Width = 81
    Height = 28
    Anchors = [akLeft, akBottom]
    Caption = 'Agregar'
    ImageAlignment = iaBottom
    TabOrder = 4
    OnClick = btnAgregarClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 433
    Width = 624
    Height = 19
    Panels = <>
  end
  object btnAgregarObj: TButton
    Left = 8
    Top = 399
    Width = 81
    Height = 28
    Anchors = [akLeft, akBottom]
    Caption = 'Agregar'
    ImageAlignment = iaBottom
    TabOrder = 6
    OnClick = btnAgregarObjClick
  end
  object btnModificarObj: TButton
    Left = 124
    Top = 397
    Width = 69
    Height = 30
    Anchors = [akLeft, akBottom]
    Caption = 'Modificar'
    ImageAlignment = iaBottom
    TabOrder = 7
    OnClick = btnModificarObjClick
  end
  object btnBorrarObj: TButton
    AlignWithMargins = True
    Left = 228
    Top = 396
    Width = 69
    Height = 31
    Anchors = [akLeft, akBottom]
    Caption = 'Borrar'
    ImageAlignment = iaBottom
    TabOrder = 8
    OnClick = btnBorrarObjClick
  end
  object DataSource: TDataSource
    DataSet = DataModule1.TblDatos
    Left = 424
    Top = 352
  end
end
