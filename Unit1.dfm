object Form_Main: TForm_Main
  Left = 0
  Top = 0
  Caption = 'Batch Images Converter'
  ClientHeight = 1135
  ClientWidth = 1075
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  PixelsPerInch = 120
  DesignSize = (
    1075
    1135)
  TextHeight = 20
  object Label1: TLabel
    Left = 589
    Top = 726
    Width = 120
    Height = 20
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'JPG compress rate'
  end
  object Image1: TImage
    Left = 9
    Top = 767
    Width = 131
    Height = 131
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    AutoSize = True
  end
  object Edit1: TEdit
    Left = 120
    Top = 9
    Width = 945
    Height = 28
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Text = 'Edit1'
    ExplicitWidth = 774
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 1117
    Width = 1075
    Height = 18
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Panels = <
      item
        Width = 200
      end
      item
        Width = 200
      end
      item
        Width = 200
      end
      item
        Width = 200
      end
      item
        Width = 200
      end>
    ExplicitTop = 1116
    ExplicitWidth = 904
  end
  object Memo1: TMemo
    Left = 9
    Top = 400
    Width = 1057
    Height = 297
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akLeft, akTop, akRight]
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Button1: TButton
    Left = 9
    Top = 9
    Width = 103
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Files Select'
    TabOrder = 3
    OnClick = Button1Click
  end
  object RadioGroup2: TRadioGroup
    Left = 161
    Top = 705
    Width = 420
    Height = 46
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'File_format_to'
    Columns = 5
    ItemIndex = 1
    Items.Strings = (
      'BMP'
      'JPG'
      'PNG'
      'GIF'
      'TIFF')
    TabOrder = 4
  end
  object Edit_Jpg_compress_rate: TEdit
    Left = 717
    Top = 723
    Width = 52
    Height = 28
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 5
    Text = '90'
  end
  object ListBox1: TListBox
    Left = 9
    Top = 120
    Width = 1057
    Height = 272
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 20
    MultiSelect = True
    TabOrder = 6
    OnClick = ListBox1Click
    OnDblClick = ListBox1DblClick
  end
  object Button_Convert: TButton
    Left = 9
    Top = 705
    Width = 131
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Convert to: '
    TabOrder = 7
    OnClick = Button_ConvertClick
  end
  object Button_folder_select: TButton
    Left = 9
    Top = 57
    Width = 103
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Folder Select'
    TabOrder = 8
    OnClick = Button_folder_selectClick
  end
  object RadioGroup1: TRadioGroup
    Left = 120
    Top = 42
    Width = 401
    Height = 70
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'File_format'
    Columns = 5
    ItemIndex = 0
    Items.Strings = (
      'BMP'
      'JPG'
      'PNG'
      'GIF'
      'TIFF')
    TabOrder = 9
  end
  object CheckBox_over_write: TCheckBox
    Left = 777
    Top = 728
    Width = 98
    Height = 18
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Over Write'
    TabOrder = 10
  end
  object Button_recoversive_search: TButton
    Left = 161
    Top = 767
    Width = 240
    Height = 31
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Button_recoversive_search'
    TabOrder = 11
    Visible = False
    OnClick = Button_recoversive_searchClick
  end
  object CheckBox_recursive: TCheckBox
    Left = 9
    Top = 90
    Width = 98
    Height = 18
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Recursive'
    Checked = True
    State = cbChecked
    TabOrder = 12
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 
      'All (*.gif;*.jpg;*.jpeg;*.png;*.bmp;*.ico;*.tif;*.tiff)|*.gif;*.' +
      'jpg;*.jpeg;*.png;*.bmp;*.ico;*.tif;*.tiff|GIF Image (*.gif)|*.gi' +
      'f|JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|' +
      'Portable Network Graphics (*.png)|*.png|Bitmaps (*.bmp)|*.bmp|Ic' +
      'ons (*.ico)|*.ico|TIFF Images (*.tif)|*.tif|TIFF Images (*.tiff)' +
      '|*.tiff'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 352
    Top = 456
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 104
    Top = 120
  end
end
