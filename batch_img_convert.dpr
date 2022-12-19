program batch_img_convert;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form_Main},
  About in '..\..\..\..\mycompDelphi10\TDE_COMMON\About.pas' {AboutBox},
  Unit_Image_process in '..\..\..\..\mycompDelphi10\TDE_COMMON\Unit_Image_process.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Sky');
  Application.CreateForm(TForm_Main, Form_Main);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
