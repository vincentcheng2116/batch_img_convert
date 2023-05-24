program batch_img_convert;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form_Main},
  Vcl.Themes,
  Vcl.Styles,
  Unit_Image_process in '..\..\..\..\mycompDelphi11\TDE_COMMON\Unit_Image_process.pas',
  About in '..\..\..\..\mycompDelphi11\TDE_COMMON\About.pas' {AboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Sky');
  Application.CreateForm(TForm_Main, Form_Main);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
