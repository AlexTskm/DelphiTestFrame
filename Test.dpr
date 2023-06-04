program Test;

uses
  Vcl.Forms,
  UnitTest in 'UnitTest.pas' {MainForm},
  UnitCommon in 'UnitCommon.pas',
  FrameObjectParameters in 'FrameObjectParameters.pas' {FrameObject: TFrame},
  UnitIncTheDate in 'UnitIncTheDate.pas' {IncTheDate: TFrame},
  UnitSquare in 'UnitSquare.pas' {Square: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
