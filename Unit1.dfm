object Form_Main: TForm_Main
  Left = 0
  Top = 0
  Caption = 'Batch Images Converter'
  ClientHeight = 1250
  ClientWidth = 1071
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  DesignSize = (
    1071
    1250)
  TextHeight = 20
  object Splitter1: TSplitter
    Left = 0
    Top = 131
    Width = 1071
    Height = 10
    Cursor = crVSplit
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 381
    Width = 1071
    Height = 10
    Cursor = crVSplit
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    ExplicitTop = 151
  end
  object Splitter3: TSplitter
    Left = 0
    Top = 688
    Width = 1071
    Height = 10
    Cursor = crVSplit
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    ExplicitLeft = 9
    ExplicitTop = 650
  end
  object Bevel2: TBevel
    Left = 0
    Top = 0
    Width = 1071
    Height = 131
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    ExplicitTop = 10
  end
  object Edit1: TEdit
    Left = 120
    Top = 9
    Width = 935
    Height = 28
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Text = 'Edit1'
    ExplicitWidth = 931
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 1232
    Width = 1071
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
    ExplicitTop = 1227
    ExplicitWidth = 1067
  end
  object Memo1: TMemo
    Left = 0
    Top = 391
    Width = 1071
    Height = 297
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
    ExplicitWidth = 1067
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
  object ListBox1: TListBox
    Left = 0
    Top = 141
    Width = 1071
    Height = 240
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    ItemHeight = 20
    MultiSelect = True
    PopupMenu = PopupMenu1
    TabOrder = 4
    OnClick = ListBox1Click
    OnDblClick = ListBox1DblClick
    OnKeyUp = ListBox1KeyUp
    ExplicitWidth = 1067
  end
  object Button_folder_select: TButton
    Left = 9
    Top = 54
    Width = 103
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Folder Select'
    TabOrder = 5
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
    TabOrder = 6
    OnClick = RadioGroup1Click
  end
  object CheckBox_recursive: TCheckBox
    Left = 9
    Top = 87
    Width = 98
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Recursive'
    Checked = True
    State = cbChecked
    TabOrder = 7
    OnClick = Search_changed
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 777
    Width = 1071
    Height = 455
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    TabOrder = 8
    OnMouseWheel = ScrollBox1MouseWheel
    object Image1: TImage
      Left = 4
      Top = 4
      Width = 197
      Height = 197
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      AutoSize = True
      DragMode = dmAutomatic
      OnDragOver = Image1DragOver
      OnMouseDown = Image1MouseDown
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 698
    Width = 1071
    Height = 79
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    TabOrder = 9
    ExplicitWidth = 1067
    object Label1: TLabel
      Left = 596
      Top = 8
      Width = 120
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'JPG compress rate'
    end
    object Label_rate: TLabel
      Left = 740
      Top = 51
      Width = 68
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Label_rate'
    end
    object Label_size: TLabel
      Left = 830
      Top = 51
      Width = 67
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Label_size'
      OnClick = Label_sizeClick
    end
    object Button_Convert: TButton
      Left = 9
      Top = 8
      Width = 131
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Convert to: '
      TabOrder = 0
      OnClick = Button_ConvertClick
    end
    object Edit_Jpg_compress_rate: TEdit
      Left = 724
      Top = 8
      Width = 52
      Height = 28
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 1
      Text = '90'
    end
    object CheckBox_over_write: TCheckBox
      Left = 784
      Top = 8
      Width = 98
      Height = 18
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Over Write'
      TabOrder = 2
    end
    object RadioGroup2: TRadioGroup
      Left = 148
      Top = 8
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
      TabOrder = 3
    end
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
  object PopupMenu1: TPopupMenu
    Left = 616
    Top = 184
    object PopupMenu_delete: TMenuItem
      Caption = 'Delete'
      OnClick = PopupMenu_deleteClick
    end
    object showinExplorer1: TMenuItem
      Caption = 'Show in Explorer'
      OnClick = showinExplorer1Click
    end
    object Permanentdelete1: TMenuItem
      Caption = 'Permanent delete'
      OnClick = Permanentdelete1Click
    end
  end
end
