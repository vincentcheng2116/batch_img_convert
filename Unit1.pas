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
  System.IOUtils

    ;

type
  TForm_Main = class(TForm)
    Edit1: TEdit;
    StatusBar1: TStatusBar;
    Memo1: TMemo;
    Button1: TButton;
    RadioGroup2: TRadioGroup;
    Edit_Jpg_compress_rate: TEdit;
    ListBox1: TListBox;
    Button_Convert: TButton;
    Label1: TLabel;
    Image1: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    Button_folder_select: TButton;
    RadioGroup1: TRadioGroup;
    FileOpenDialog1: TFileOpenDialog;
    CheckBox_over_write: TCheckBox;
    Button_recoversive_search: TButton;
    CheckBox_recursive: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button_ConvertClick(Sender: TObject);
    procedure Button_folder_selectClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure Button_recoversive_searchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Main: TForm_Main;

implementation

{$R *.dfm}

procedure TForm_Main.Button1Click(Sender: TObject);
var
  s: string;
  cnt: integer;

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

procedure TForm_Main.Button_recoversive_searchClick(Sender: TObject);
var
  S,dir1: string;
begin
  dir1:= ExtractFilePath(Application.ExeName);
  Memo1.Lines.Clear;
  for S in TDirectory.GetFiles(dir1, '*.bmp', TSearchOption.soAllDirectories) do
    Memo1.Lines.Add(S);
  Memo1.Lines.Add('finished');
end;

procedure TForm_Main.Button_ConvertClick(Sender: TObject);

var
  iCompression: integer;
  oJPG: TJPegImage;
  oBMP: TBitMap;
  i: integer;
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
                  new_file_name := copy(s, 1, pos(ext, s) - 1) + '.' +
                    lowercase(RadioGroup2.Items[RadioGroup2.ItemIndex]);
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
 s, s1: string;
begin
  ListBox1.Clear;
  with TFileOpenDialog.Create(nil) do
    try
      Title := 'Select Directory';
      Options := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem]; // YMMV
      OkButtonLabel := 'Select';
      DefaultFolder := ExtractFilePath(application.ExeName);
      FileName := DefaultFolder;
      if Execute then
        dir1 := (FileName);
    finally
      Free;
    end;
  s1 := dir1 + '\' + '*.' + RadioGroup1.Items[RadioGroup1.ItemIndex];
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
  if CheckBox_recursive.Checked then
  begin
  for S in TDirectory.GetFiles(dir1, '*.'+ RadioGroup1.Items[RadioGroup1.ItemIndex], TSearchOption.soAllDirectories) do
    ListBox1.Items.Add(S);
  //Showmessage('Finished!');

  end
  else
  begin
  for S in TDirectory.GetFiles(dir1, '*.'+ RadioGroup1.Items[RadioGroup1.ItemIndex], TSearchOption.soTopDirectoryOnly) do
    ListBox1.Items.Add(S);
  //Showmessage('Finished!');

  end;


end;

procedure TForm_Main.FormCreate(Sender: TObject);
begin
  OpenPictureDialog1.InitialDir := ExtractFilePath(application.ExeName);
end;

procedure TForm_Main.ListBox1Click(Sender: TObject);
var
  s: string;
begin
  s := ListBox1.Items[ListBox1.ItemIndex];

  if FileExists(s) then
    begin
      Load_IMG_File(s, Image1);
    end;

end;

procedure TForm_Main.ListBox1DblClick(Sender: TObject);
var
  s, ext, new_file_name: string;
  iCompression: integer;
begin
  iCompression := StrToIntDef(Edit_Jpg_compress_rate.Text, 0);
  s := ListBox1.Items[ListBox1.ItemIndex];
  if FileExists(s) then
    begin
      if MessageDlg('Convert [' + ExtractFileName(s) + '] file to ' + RadioGroup2.Items[RadioGroup2.ItemIndex] +
        ' format?', mtWarning, [mbYes, mbNo, mbCancel], 0) = mryes then
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

end.
