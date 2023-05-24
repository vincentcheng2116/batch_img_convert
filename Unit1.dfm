object Form_Main: TForm_Main
  Left = 0
  Top = 0
  Caption = 'Batch Images Converter'
  ClientHeight = 1000
  ClientWidth = 857
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    857
    1000)
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 0
    Top = 105
    Width = 857
    Height = 8
    Cursor = crVSplit
    Align = alTop
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 305
    Width = 857
    Height = 8
    Cursor = crVSplit
    Align = alTop
  end
  object Splitter3: TSplitter
    Left = 0
    Top = 550
    Width = 857
    Height = 8
    Cursor = crVSplit
    Align = alTop
  end
  object Bevel2: TBevel
    Left = 0
    Top = 0
    Width = 857
    Height = 105
    Align = alTop
  end
  object SpeedButton1: TSpeedButton
    Left = 815
    Top = 8
    Width = 34
    Height = 33
    Anchors = [akTop, akRight]
    Caption = '?'
    OnClick = SpeedButton1Click
  end
  object Edit1: TEdit
    Left = 96
    Top = 7
    Width = 713
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Text = 'Edit1'
    ExplicitWidth = 709
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 986
    Width = 857
    Height = 14
    Panels = <
      item
        Width = 160
      end
      item
        Width = 160
      end
      item
        Width = 160
      end
      item
        Width = 160
      end
      item
        Width = 160
      end>
    ExplicitTop = 974
    ExplicitWidth = 853
  end
  object Memo1: TMemo
    Left = 0
    Top = 313
    Width = 857
    Height = 237
    Align = alTop
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
    ExplicitWidth = 853
  end
  object Button1: TButton
    Left = 7
    Top = 7
    Width = 83
    Height = 20
    Caption = 'Files Select'
    TabOrder = 3
    OnClick = Button1Click
  end
  object ListBox1: TListBox
    Left = 0
    Top = 113
    Width = 857
    Height = 192
    Align = alTop
    ItemHeight = 15
    MultiSelect = True
    PopupMenu = PopupMenu1
    TabOrder = 4
    OnClick = ListBox1Click
    OnDblClick = ListBox1DblClick
    OnKeyUp = ListBox1KeyUp
    ExplicitWidth = 853
  end
  object Button_folder_select: TButton
    Left = 7
    Top = 43
    Width = 83
    Height = 20
    Caption = 'Folder Select'
    TabOrder = 5
    OnClick = Button_folder_selectClick
  end
  object RadioGroup1: TRadioGroup
    Left = 96
    Top = 34
    Width = 321
    Height = 56
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
    Left = 7
    Top = 70
    Width = 79
    Height = 20
    Caption = 'Recursive'
    Checked = True
    State = cbChecked
    TabOrder = 7
    OnClick = Search_changed
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 622
    Width = 857
    Height = 364
    Align = alClient
    TabOrder = 8
    OnMouseWheel = ScrollBox1MouseWheel
    ExplicitWidth = 853
    ExplicitHeight = 352
    object Image1: TImage
      Left = 3
      Top = 3
      Width = 158
      Height = 158
      AutoSize = True
      DragMode = dmAutomatic
      OnDragOver = Image1DragOver
      OnMouseDown = Image1MouseDown
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 558
    Width = 857
    Height = 64
    Align = alTop
    TabOrder = 9
    ExplicitWidth = 853
    object Label1: TLabel
      Left = 477
      Top = 6
      Width = 96
      Height = 15
      Caption = 'JPG compress rate'
    end
    object Label_rate: TLabel
      Left = 592
      Top = 41
      Width = 53
      Height = 15
      Caption = 'Label_rate'
    end
    object Label_size: TLabel
      Left = 664
      Top = 41
      Width = 52
      Height = 15
      Caption = 'Label_size'
      OnClick = Label_sizeClick
    end
    object Button_Convert: TButton
      Left = 7
      Top = 6
      Width = 105
      Height = 20
      Caption = 'Convert to: '
      TabOrder = 0
      OnClick = Button_ConvertClick
    end
    object Edit_Jpg_compress_rate: TEdit
      Left = 579
      Top = 6
      Width = 42
      Height = 23
      TabOrder = 1
      Text = '90'
    end
    object CheckBox_over_write: TCheckBox
      Left = 627
      Top = 6
      Width = 79
      Height = 15
      Caption = 'Over Write'
      TabOrder = 2
    end
    object RadioGroup2: TRadioGroup
      Left = 118
      Top = 6
      Width = 336
      Height = 37
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
      Caption = 'Delete (remove for list)'
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
