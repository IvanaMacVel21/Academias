object frmAgregar: TfrmAgregar
  AlignWithMargins = True
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  BorderWidth = 2
  Caption = 'Agregar'
  ClientHeight = 180
  ClientWidth = 388
  Color = clMistyrose
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object lblnombre: TLabel
    Left = 56
    Top = 37
    Width = 98
    Height = 15
    Caption = 'Nombre academia'
  end
  object lbl_Estatus: TLabel
    Left = 56
    Top = 105
    Width = 40
    Height = 15
    Caption = 'Estatus:'
  end
  object btnAgregar: TButton
    Left = 264
    Top = 121
    Width = 81
    Height = 28
    Caption = 'Agregar'
    TabOrder = 0
    OnClick = btnAgregarClick
  end
  object txtNombre: TEdit
    Left = 56
    Top = 59
    Width = 180
    Height = 23
    TabOrder = 1
  end
  object cmbEstatus: TComboBox
    Left = 56
    Top = 126
    Width = 83
    Height = 23
    Style = csDropDownList
    TabOrder = 2
    Items.Strings = (
      'Activo'
      'Inactivo')
  end
end
