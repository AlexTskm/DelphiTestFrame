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
    procedure Error(sError: string);       // ������� ��������� �� ������
    procedure pMessage(sMess: string);     // ������� ���������
    procedure CheckActivButton;            // ������ ��������� ��� �� ��������� ������ ��������

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
  Error('������. ��� ����������������� ��������.');
  exit;
 end;

    if Frame.poCheck<>0 then
      Error('������ �������� ������� ����������������� ��������.')
    else
     pMessage('������� ��������� �������� ������� ����������������� �������� ');
end;

procedure TMainForm.btnClearParametersClick(Sender: TObject);
var
 Frame: TFrameObject;
begin
 if not Assigned(ObjectParameters) then exit;
 Frame:=ObjectParameters.Items[cbAction.ItemIndex];
 if not Assigned(Frame) then
 begin
  Error('������. ��� ����������������� ��������.');
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
  Error('������. ��� ����������������� ��������.');
  exit;
 end;

  if Frame.poExecute<>0 then
    Error('������ ���������� ������� ����������������� ��������.')
  else
   pMessage('������� ��������� ������� ����������������� �������� ');
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
// ��������� �������� ������ ����������������� ��������
if not Assigned(ObjectParameters) then exit;
if ObjectParameters.Count<>cbAction.Items.Count then exit;
try
// ������� ��� ���������
 CheckActivButton;
// ������ ���������� ��� ���������(�����, ������� ������ ��������� ������ ����������, ��� ����� ������� ��� �� �������������)
  for i := 0 to cbAction.Items.Count-1 do
    if i<>cbAction.ItemIndex then
    begin
     Frame:=ObjectParameters.Items[i];
     Frame.Visible:=false;
    end;
  Frame:=ObjectParameters.Items[cbAction.ItemIndex];
  Frame.Visible:=true;
except
 Error('������ ��������� ��������������� ��������');
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
// ������������� ����������� ������� �����
 self.Constraints.MinWidth:= Panel1.Left + btnExit.Left + btnExit.ClientWidth + (self.Width - self.ClientWidth);
 self.Constraints.MinHeight:= 300;
 ObjectParameters:=TList.Create;

 // ������ ������ TIncTheDate
 Frame:=TIncTheDate.Create(GroupBox2);
 Frame.Parent:=GroupBox2;
 Frame.Align:=alClient;
 Frame.Visible:=true;
 cbAction.Items.Add(Frame.poGetNameParameters);
 ObjectParameters.Add(Frame);

 // ������ ������ TSquare
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


