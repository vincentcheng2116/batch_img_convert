// {$DEFINE DEBUG}
{$IFDEF DEBUG}
{$ENDIF}
unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Vcl.Imaging.GIFImg, Vcl.ExtDlgs,
  Unit_Image_process,
  System.Types,
  System.IOUtils,
  Winapi.shellapi,
  inifiles,
  math, Vcl.Menus

    ;

type
  TForm_Main = class(TForm)
    Edit1: TEdit;
    StatusBar1: TStatusBar;
    Memo1: TMemo;
    Button1: TButton;
    ListBox1: TListBox;
    OpenPictureDialog1: TOpenPictureDialog;
    Button_folder_select: TButton;
    RadioGroup1: TRadioGroup;
    FileOpenDialog1: TFileOpenDialog;
    CheckBox_recursive: TCheckBox;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Bevel2: TBevel;
    Panel1: TPanel;
    Button_Convert: TButton;
    Label1: TLabel;
    Edit_Jpg_compress_rate: TEdit;
    CheckBox_over_write: TCheckBox;
    RadioGroup2: TRadioGroup;
    Label_rate: TLabel;
    Label_size: TLabel;
    PopupMenu1: TPopupMenu;
    PopupMenu_delete: TMenuItem;
    showinExplorer1: TMenuItem;
    Permanentdelete1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button_ConvertClick(Sender: TObject);
    procedure Button_folder_selectClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure Image1DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure ScrollBox1MouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Search_changed(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure showinExplorer1Click(Sender: TObject);
    procedure PopupMenu_deleteClick(Sender: TObject);
    procedure ListBox1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Permanentdelete1Click(Sender: TObject);
  private
    procedure List_files_by_keyword(dir1: string; ext1: string; recursive1: Boolean; var ListBox1: TListBox);
    { Private declarations }
  private
    originalPanelWindowProc: TWndMethod;
    procedure PanelWindowProc(var Msg: TMessage);
    procedure PanelDropFile(var Msg: TWMDROPFILES);
    procedure CreateWnd; override;
    procedure show_image_rate_on_label_rate;
    procedure show_image1_size_on_label_size;

  public
    { Public declarations }
  end;

var
  Form_Main: TForm_Main;
  org: TPoint;

implementation

{$R *.dfm}

procedure TForm_Main.Button1Click(Sender: TObject);
var
  s: string;
  cnt: Integer;

begin
  ListBox1.Clear;
  // FileOpenDialog1.DefaultExtension:=lowercase(radioGroup1.Items[radioGroup1.ItemIndex]);
  if OpenPictureDialog1.Execute then
    begin

      for cnt := 0 to OpenPictureDialog1.files.Count - 1 do
        begin
          s := OpenPictureDialog1.files[cnt];
          ListBox1.Items.Add(s);
        end;
      Edit1.Text := ExtractFilePath(s);

    end;

end;

procedure TForm_Main.Button_ConvertClick(Sender: TObject);

var
  iCompression: Integer;
  oJPG: TJPegImage;
  oBMP: TBitMap;
  i: Integer;
  s, ext: string;
  new_file_name: string;
  // jpg_rate:integer;
begin
  iCompression := StrToIntDef(Edit_Jpg_compress_rate.Text, 0);
  if iCompression = 0 then
    begin
      Edit_Jpg_compress_rate.Text := '100';
      iCompression := 100;
    end;
  {
    oJPG := TJPegImage.Create;
    oJPG.LoadFromFile(AInFile);
    oBMP := TBitMap.Create;
    oBMP.Assign(oJPG);

    // Do the Compression and Save New File
    oJPG.CompressionQuality := iCompression;
    oJPG.Compress;
    oJPG.SaveToFile(AOutFile);

    // Clean Up
    oJPG.Free;
    oBMP.Free;
  }
  if ListBox1.SelCount > 1 then
    begin
      for i := 0 to ListBox1.Items.Count - 1 do
        begin
          if ListBox1.Selected[i] then
            begin
              s := ListBox1.Items[i];
              if FileExists(s) then
                begin
                  ext := ExtractFileExt(s);
                  Load_IMG_File(s, Image1);
                  Image1.Refresh;
{$IFDEF DEBUG}
                  sleep(500);
{$ENDIF}
                  new_file_name := copy(s, 1, pos(ext, s) - 1) + '.' + lowercase(RadioGroup2.Items[RadioGroup2.ItemIndex]);
                  if FileExists(new_file_name) then
                    begin
                      Memo1.Lines.Add('file already exist: ' + new_file_name);
                      if CheckBox_over_write.Checked then
                        begin
                          Save_img_diff_format(new_file_name, Image1, iCompression);
                          Memo1.Lines[Memo1.Lines.Count - 1] := Memo1.Lines[Memo1.Lines.Count - 1] + ' -->over write ';
                        end;
                    end
                  else
                    begin
                      Save_img_diff_format(new_file_name, Image1, iCompression);
                      Memo1.Lines.Add(new_file_name);
                    end;

                end;

            end;
        end;
    end
  else
    begin
      // convert all

      for i := 0 to ListBox1.Items.Count - 1 do
        begin
          s := ListBox1.Items[i];
          if FileExists(s) then
            begin
              ext := ExtractFileExt(s);
              Load_IMG_File(s, Image1);
              Image1.Refresh;
{$IFDEF DEBUG}
              sleep(500);
{$ENDIF}
              new_file_name := copy(s, 1, pos(ext, s) - 1) + '.' + lowercase(RadioGroup2.Items[RadioGroup2.ItemIndex]);

              if FileExists(new_file_name) then
                begin
                  Memo1.Lines.Add('file already exist: ' + new_file_name);
                  if CheckBox_over_write.Checked then
                    begin
                      Save_img_diff_format(new_file_name, Image1, iCompression);
                      Memo1.Lines[Memo1.Lines.Count - 1] := Memo1.Lines[Memo1.Lines.Count - 1] + ' -->over write ';

                    end;
                end
              else
                begin
                  Save_img_diff_format(new_file_name, Image1, iCompression);
                  Memo1.Lines.Add(new_file_name);
                end;

            end;
        end;

    end;

  // convert selected file

  Memo1.Lines.Add('finished!');

end;

procedure TForm_Main.Button_folder_selectClick(Sender: TObject);
var
  dir1: string;
  SR: TSearchRec;
  s1: string;
  ext1: string;
  recursive1: Boolean;
begin
  ListBox1.Clear;
  with TFileOpenDialog.Create(nil) do
    try
      Title := 'Select Directory';
      Options := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem]; // YMMV
      OkButtonLabel := 'Select';
      DefaultFolder := ExtractFilePath(Application.ExeName);
      FileName := DefaultFolder;
      if Execute then
        dir1 := (FileName);
    finally
      Free;
    end;

  recursive1 := CheckBox_recursive.Checked;
  ext1 := '*.' + RadioGroup1.Items[RadioGroup1.ItemIndex];
  s1 := dir1 + '\' + ext1;
  // s1:=dir1+'\' + '*';
  Edit1.Text := (s1);

  {
    if FindFirst(s1, faAnyFile, SR) = 0 then
    begin
    repeat
    if (SR.Attr <> faDirectory) then
    begin
    ListBox1.Items.Add(dir1 + '\' + SR.Name);
    end;
    until FindNext(SR) <> 0;
    FindClose(SR);
    end;
  }
  Memo1.Lines.Clear;
  List_files_by_keyword(dir1, ext1, recursive1, ListBox1);

end;

procedure TForm_Main.FormClose(Sender: TObject; var Action: TCloseAction);
var
  appINI: TIniFile;
begin
  // appINI := TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini')) ;
  appINI := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini')); // working also on fireMonkey

  try
    appINI.WriteString('File', 'Last', Edit1.Text);
    appINI.WriteDate('User', 'Date', Date);

    appINI.WriteBool('File', 'recursive', CheckBox_recursive.Checked);
    with appINI, Form_Main do
      begin
        WriteInteger('Placement', 'Top', Top);
        WriteInteger('Placement', 'Left', Left);
        WriteInteger('Placement', 'Width', Width);
        WriteInteger('Placement', 'Height', Height);
      end;
  finally
    appINI.Free;
  end;
end;

procedure TForm_Main.FormCreate(Sender: TObject);
var
  appINI: TIniFile;
  LastUser: string;
  LastDate: TDateTime;
  s0, s1: string;
begin

  // reload latest position / size
  // appINI := TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini')) ;
  appINI := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini')); // working also on fireMonkey

  try // if no last user return an empty string
    Edit1.Text := appINI.Readstring('File', 'Last', Edit1.Text);

    CheckBox_recursive.Checked := appINI.readBool('File', 'recursive', CheckBox_recursive.Checked);

    if pos('*.', Edit1.Text) > 0 then
      begin
        // try to search file by this condition
        s0 := ExtractFilePath(Edit1.Text);
        s1 := ExtractFileName(Edit1.Text);
{$IFDEF DEBUG}
        MessageDlg('s0= ' + s0 + #13 + #10 + 's1= ' + s1, mtInformation, [mbOK], 0);
{$ENDIF}
        List_files_by_keyword(s0, s1, CheckBox_recursive.Checked, ListBox1);
      end;

    LastDate := appINI.ReadDate('User', 'Date', Date); // show the message
    // ShowMessage('This program was previously used by ' + LastUser + ' on ' + DateToStr(LastDate));
    Top := appINI.ReadInteger('Placement', 'Top', Top);
    Left := appINI.ReadInteger('Placement', 'Left', Left);
    Width := appINI.ReadInteger('Placement', 'Width', Width);
    Height := appINI.ReadInteger('Placement', 'Height', Height);

    {
      Screen.WorkAreaRect;
      Screen.WorkAreaHeight;
      Screen.WorkAreaLeft;
      Screen.WorkAreaTop;
      Screen.WorkAreaWidth;
      Screen.DesktopRect;
      Screen.DesktopTop;
      Screen.DesktopLeft;
      Screen.DesktopHeight;
      Screen.DesktopWidth;
    }
    Left := max(0, Left);
    if Left + Width > Screen.DesktopWidth then
      begin
        Left := max(0, Screen.DesktopWidth - Width);
      end;
    if Top + Height > Screen.DesktopHeight then
      begin
        Top := max(0, Screen.DesktopHeight - Height);
      end;
    Width := min(Width, Screen.DesktopWidth - Left);
    Height := min(Height, Screen.DesktopHeight - Top);

  finally
    appINI.Free;
  end;

  OpenPictureDialog1.InitialDir := ExtractFilePath(Application.ExeName);

  originalPanelWindowProc := Form_Main.WindowProc;
  Form_Main.WindowProc := PanelWindowProc;
  DragAcceptFiles(Form_Main.Handle, true);

end;

procedure TForm_Main.Image1DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var
  delta: TPoint;
begin
  if dsDragEnter = State then
    begin
      // marking org point
      org := point(X, Y);
    end;
  delta.X := org.X - X;
  delta.Y := org.Y - Y;
  ((Sender as TImage).Parent as TScrollBox).HorzScrollBar.Position := ((Sender as TImage).Parent as TScrollBox).HorzScrollBar.Position + delta.X;
  ((Sender as TImage).Parent as TScrollBox).VertScrollBar.Position := ((Sender as TImage).Parent as TScrollBox).VertScrollBar.Position + delta.Y;

end;

procedure TForm_Main.Image1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pos1: TPoint;
begin
  // pos1:= point(x+ScrollBox1.left,y+ScrollBox1.top);
  if (ssMiddle in Shift) then
    begin
      // ZoomTo(currentpoint.X, currentpoint.Y, 0);
      // zoom 1:1
      // Image_scrollBox_Zoom(Image1, 0, currentpoint);
      Image_scrollBox_Zoom2(Image1, 0, pos1);
      show_image_rate_on_label_rate;
      show_image1_size_on_label_size;

      // pos1 := ClientToScreen(pos1);
      // pos1.X := pos1.X - ScrollBox1.HorzScrollBar.Position;
      // pos1.Y := pos1.Y - ScrollBox1.VertScrollBar.Position;

      // SetCursorPos(pos1.X, pos1.Y);

    end;

end;

procedure TForm_Main.show_image_rate_on_label_rate;
begin
  // update rate to label_rate
  if Image1.Picture.bitmap.Width > 0 then
    Label_rate.Caption := Format('%3.2f%%', [Image1.Width / Image1.Picture.bitmap.Width * 100]);
end;

procedure TForm_Main.showinExplorer1Click(Sender: TObject);
begin
  ShellExecute(0, nil, 'explorer.exe', pchar('/select,' + ListBox1.Items[ListBox1.ItemIndex]), nil, SW_SHOWNORMAL)
end;

procedure TForm_Main.show_image1_size_on_label_size;
begin
  Label_size.Caption := Format('Size: %4d*%4d', [Image1.Picture.Width, Image1.Picture.Height]);
end;

procedure TForm_Main.ListBox1Click(Sender: TObject);
var
  s: string;
begin
  s := ListBox1.Items[ListBox1.ItemIndex];

  if FileExists(s) then
    begin
      Load_IMG_File(s, Image1);
      show_image_rate_on_label_rate;
      show_image1_size_on_label_size;

    end;

end;

procedure TForm_Main.ListBox1DblClick(Sender: TObject);
var
  s, ext, new_file_name: string;
  iCompression: Integer;
begin
  iCompression := StrToIntDef(Edit_Jpg_compress_rate.Text, 0);
  s := ListBox1.Items[ListBox1.ItemIndex];
  if FileExists(s) then
    begin
      if MessageDlg('Convert [' + ExtractFileName(s) + '] file to ' + RadioGroup2.Items[RadioGroup2.ItemIndex] + ' format?', mtWarning, [mbYes, mbNo, mbCancel], 0) = mryes then
        begin
          // convert
          Memo1.Lines.Add('convert one file ');

          ext := ExtractFileExt(s);
          new_file_name := copy(s, 1, pos(ext, s) - 1) + '.' + lowercase(RadioGroup2.Items[RadioGroup2.ItemIndex]);
          if FileExists(new_file_name) then
            begin
              Memo1.Lines.Add('file already exist: ' + new_file_name);
              if CheckBox_over_write.Checked then
                begin
                  Save_img_diff_format(new_file_name, Image1, iCompression);
                  Memo1.Lines[Memo1.Lines.Count - 1] := Memo1.Lines[Memo1.Lines.Count - 1] + ' -->over write ';
                end;
            end
          else
            begin
              Save_img_diff_format(new_file_name, Image1, iCompression);
              Memo1.Lines.Add(new_file_name);
            end;
        end;
    end;

end;

procedure TForm_Main.ListBox1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  i: Integer;
  s: String;
begin
  StatusBar1.Panels[0].Text := inttostr(Key);

  if ssShift in Shift then
    begin
      case Key of
        46:
          begin
            if (MessageDlg('Permanent delete?', mtConfirmation, [mbYes, mbCancel], 0) = mryes) then
              begin

                for i := 0 to ListBox1.Items.Count - 1 do
                  begin
                    if ListBox1.Selected[i] then
                      begin
                        s := ListBox1.Items[i];
                        Memo1.Lines.Add('Permanent delete: ' + s);
                        DeleteFile(s);
                      end;

                  end;

                PopupMenu_deleteClick(self);
              end;

          end;

      end;

    end
  else
    begin
      case Key of
        46:
          PopupMenu_deleteClick(self);

      end;

    end;

end;

procedure TForm_Main.PanelDropFile(var Msg: TWMDROPFILES);
var
  numFiles: longint;
  buffer: array [0 .. MAX_PATH] of Char;
  file_ansi: AnsiString;
  buffer2: array [0 .. MAX_PATH] of AnsiChar;
  delta: TPoint;
  file_cnt: Integer;
begin
  numFiles := DragQueryFile(Msg.Drop, $FFFFFFFF, nil, 0);
  if numFiles <= 0 then
    begin
      exit;
    end;

  for file_cnt := 0 to numFiles - 1 do
    begin
      DragQueryFile(Msg.Drop, file_cnt, @buffer, SizeOf(buffer));
      file_ansi := (buffer);
      ListBox1.Items.Add(file_ansi);

      if file_cnt = (numFiles - 1) then
        begin
          DragQueryFile(Msg.Drop, file_cnt, @buffer, SizeOf(buffer));
          try
            file_ansi := (buffer);
            // load image file here
            Image1.AutoSize := true;
            Image1.Picture.LoadFromFile(file_ansi);
            // image1_to_bitmap(self);
            image_to_bitmap(Image1);
            Image1.AutoSize := false;
            // moving := false;
            delta := point(0, 0);
            // Image_scrollBox_Zoom(Image1, 0, delta.X,delta.Y);
            // mapping_image_Transparent(Image1, Image2);

          except
            on EInvalidGraphic do
              ShowMessage('Unsupported image file!');
          end;

        end;
    end;

end;

procedure TForm_Main.PanelWindowProc(var Msg: TMessage);
begin
  if Msg.Msg = WM_DROPFILES then
    PanelDropFile(TWMDROPFILES(Msg))
  else
    originalPanelWindowProc(Msg);
end;

procedure TForm_Main.Permanentdelete1Click(Sender: TObject);
var
  Key: Word;
  shift1: TShiftState;
begin
  Key := 46;
  shift1 := [ssShift];
  ListBox1KeyUp(self, Key, shift1);
end;

procedure TForm_Main.PopupMenu_deleteClick(Sender: TObject);
begin
  ListBox1.DeleteSelected;
end;

procedure TForm_Main.RadioGroup1Click(Sender: TObject);
var
  s0, s1: string;

begin
  s0 := ExtractFilePath(Edit1.Text);
  s1 := '*.' + RadioGroup1.Items[RadioGroup1.ItemIndex];
  Edit1.Text := s0 + s1;
  Search_changed(self);
end;

procedure TForm_Main.Search_changed(Sender: TObject);
var
  s0, s1: string;

begin
  ListBox1.Clear;
  if pos('*.', Edit1.Text) > 0 then
    begin
      // try to search file by this condition
      s0 := ExtractFilePath(Edit1.Text);
      s1 := ExtractFileName(Edit1.Text);
{$IFDEF DEBUG}
      MessageDlg('s0= ' + s0 + #13 + #10 + 's1= ' + s1, mtInformation, [mbOK], 0);
{$ENDIF}
      List_files_by_keyword(s0, s1, CheckBox_recursive.Checked, ListBox1);
    end;

end;

procedure TForm_Main.ScrollBox1MouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  pos1: TPoint;

begin
  pos1 := ScreenToClient(MousePos);
  // delphi 10.4 vs 11.2
  pos1.X := pos1.X + ScrollBox1.HorzScrollBar.Position - ScrollBox1.Left;
  pos1.Y := pos1.Y + ScrollBox1.VertScrollBar.Position - ScrollBox1.Top;

  if (ssLeft in Shift) and (ssright in Shift) then
    begin

      Image_scrollBox_Zoom2(Image1, 0, pos1);
      exit;
    end
  else
    begin
      if WheelDelta < 0 then
        begin
          Image_scrollBox_Zoom2(Image1, 0.8, pos1);

        end;
      if WheelDelta > 0 then
        begin
          Image_scrollBox_Zoom2(Image1, 1.2, pos1);
        end;

    end;

  pos1.X := pos1.X - ScrollBox1.HorzScrollBar.Position; // + scrollbox1.Left ;
  pos1.Y := pos1.Y - ScrollBox1.VertScrollBar.Position; // + scrollbox1.top;
  pos1 := ClientToScreen(pos1);

  SetCursorPos(pos1.X + ScrollBox1.Left, ScrollBox1.Top + pos1.Y);
  Handled := true;

{$IFDEF DEBUG}
  // ListBox1.items.Add('scrolling')

{$ENDIF}
end;

procedure TForm_Main.CreateWnd;
begin

  inherited;
  DragAcceptFiles(Handle, true);
end;

procedure TForm_Main.List_files_by_keyword(dir1: string; ext1: string; recursive1: Boolean; var ListBox1: TListBox);
var
  s: string;
begin
  if recursive1 then
    begin
      for s in TDirectory.GetFiles(dir1, ext1, TSearchOption.soAllDirectories) do
        ListBox1.Items.Add(s);
    end
  else
    begin
      for s in TDirectory.GetFiles(dir1, ext1, TSearchOption.soTopDirectoryOnly) do
        ListBox1.Items.Add(s);
    end;
end;

end.
