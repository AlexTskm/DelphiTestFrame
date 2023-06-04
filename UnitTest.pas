unit UnitTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    btnCheck: TButton;
    btnExecute: TButton;
    btnClearParameters: TButton;
    btnExit: TButton;
    GroupBox1: TGroupBox;
    cbAction: TComboBox;
    Panel2: TPanel;
    Label1: TLabel;
    outResult: TLabel;
    GroupBox2: TGroupBox;
    procedure FormCreate(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnCheckClick(Sender: TObject);
    procedure cbActionChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnExecuteClick(Sender: TObject);
    procedure btnClearParametersClick(Sender: TObject);
  private
    { Private declarations }
    ObjectParameters: TList;
    procedure Error(sError: string);       // Выводит сообщение об ошибке
    procedure pMessage(sMess: string);     // Выводит сообщение
    procedure CheckActivButton;            // Делает активными или не активными кнопки действия

  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses FrameObjectParameters, UnitIncTheDate, UnitSquare;

{$R *.dfm}

procedure TMainForm.btnCheckClick(Sender: TObject);
var
 Frame: TFrameObject;
begin
 if not Assigned(ObjectParameters) then exit;
 Frame:=ObjectParameters.Items[cbAction.ItemIndex];
 if not Assigned(Frame) then
 begin
  Error('Ошибка. Нет параметризованной операции.');
  exit;
 end;

    if Frame.poCheck<>0 then
      Error('Ошибка проверки функции параметризованной операции.')
    else
     pMessage('Успешно выполнена проверка функции параметризованной операции ');
end;

procedure TMainForm.btnClearParametersClick(Sender: TObject);
var
 Frame: TFrameObject;
begin
 if not Assigned(ObjectParameters) then exit;
 Frame:=ObjectParameters.Items[cbAction.ItemIndex];
 if not Assigned(Frame) then
 begin
  Error('Ошибка. Нет параметризованной операции.');
  exit;
 end;

  Frame.poClearParameters;
  outResult.Caption:='';
end;

procedure TMainForm.btnExecuteClick(Sender: TObject);
var
 Frame: TFrameObject;
begin
 if not Assigned(ObjectParameters) then exit;
 Frame:=ObjectParameters.Items[cbAction.ItemIndex];
 if not Assigned(Frame) then
 begin
  Error('Ошибка. Нет параметризованной операции.');
  exit;
 end;

  if Frame.poExecute<>0 then
    Error('Ошибка выполнения функции параметризованной операции.')
  else
   pMessage('Успешно выполнена функция параметризованной операции ');
  outResult.Caption:=Frame.poGetResult;
end;

procedure TMainForm.btnExitClick(Sender: TObject);
begin
  self.Close;
end;

procedure TMainForm.cbActionChange(Sender: TObject);
var
 i:integer;
 Frame: TFrameObject;
begin
// Установим активным объект параметризованных операций
if not Assigned(ObjectParameters) then exit;
if ObjectParameters.Count<>cbAction.Items.Count then exit;
try
// выведем его параметры
 CheckActivButton;
// Делаем невидимыми все параметры(лучше, конечно делать невидимым только предыдущий, для этого примера это не принципиально)
  for i := 0 to cbAction.Items.Count-1 do
    if i<>cbAction.ItemIndex then
    begin
     Frame:=ObjectParameters.Items[i];
     Frame.Visible:=false;
    end;
  Frame:=ObjectParameters.Items[cbAction.ItemIndex];
  Frame.Visible:=true;
except
 Error('Ошибка активации параметрической операции');
end;
end;

procedure TMainForm.CheckActivButton;
begin
 if cbAction.ItemIndex>=0 then
 begin
  btnCheck.Enabled:=true;
  btnExecute.Enabled:=true;
  btnClearParameters.Enabled:=true;
 end else
 begin
  btnCheck.Enabled:=false;
  btnExecute.Enabled:=false;
  btnClearParameters.Enabled:=false;
 end;
end;

procedure TMainForm.Error(sError: string);
begin
 outResult.Font.Color:= clRed;
 outResult.Caption:=sError;
 self.Repaint;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
 Frame: TFrameObject;
begin
// Устанавливаем минимальные размеры формы
 self.Constraints.MinWidth:= Panel1.Left + btnExit.Left + btnExit.ClientWidth + (self.Width - self.ClientWidth);
 self.Constraints.MinHeight:= 300;
 ObjectParameters:=TList.Create;

 // Создаём объект TIncTheDate
 Frame:=TIncTheDate.Create(GroupBox2);
 Frame.Parent:=GroupBox2;
 Frame.Align:=alClient;
 Frame.Visible:=true;
 cbAction.Items.Add(Frame.poGetNameParameters);
 ObjectParameters.Add(Frame);

 // Создаём объект TSquare
 Frame:=TSquare.Create(GroupBox2);
 Frame.Parent:=GroupBox2;
 Frame.Align:=alClient;
 Frame.Visible:=false;
 cbAction.Items.Add(Frame.poGetNameParameters);
 ObjectParameters.Add(Frame);

 cbAction.ItemIndex:=0;
 CheckActivButton;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
 if Assigned(ObjectParameters) then
    ObjectParameters.Free;
end;

procedure TMainForm.pMessage(sMess: string);
begin
 outResult.Font.Color:= clWindowText;
 outResult.Caption:=sMess;
 self.Repaint;
end;

end.


