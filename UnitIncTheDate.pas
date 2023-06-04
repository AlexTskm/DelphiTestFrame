unit UnitIncTheDate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Samples.Spin, FrameObjectParameters, Vcl.Mask;

type
  TIncTheDate = class(TFrameObject)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    poIncrease: TSpinEdit;
    Panel3: TPanel;
    Label3: TLabel;
    poUnit: TComboBox;
    poData: TMaskEdit;
    procedure poDataExit(Sender: TObject);
  private
    { Private declarations }
    poResult: TDateTime;
    formatSettings : TFormatSettings; // �������������� ������
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  // ����������� ������� ����������������� ��������
  // ��������� ������� ����������������� �������� (����������: <>0 ������)
    function  poCheck:longint;override;
  // ��������� ������� ����������������� �������� (����������: <>0 ������)
    function  poExecute:longint;override;
  // �������� ��������� ������� ����������������� ��������
    procedure  poClearParameters;override;
  // ������� ����� ��������� ������ poExecute
    function poGetResult: AnsiString;override;

  // ����� �������� ����������������� ��������
    function poGetNameParameters:AnsiString;override;

  end;

implementation

uses System.DateUtils;

{$R *.dfm}

{ TIncTheDate }

constructor TIncTheDate.Create(AOwner: TComponent);
begin
  inherited;

  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, formatSettings);
  poClearParameters;
end;

function TIncTheDate.poCheck: longint;
var
 chData: string;
 chIncrease, chUnit: integer;
 setDat:TDateTime;
begin
try
 try
  chData:=poData.Text;
  chIncrease:=poIncrease.Value;
  chUnit:=poUnit.ItemIndex;
  // ��������� ����������� ����
  setDat:=RecodeDate(Date, 2021, 2, 28);
  poData.Text:=DateToStr(setDat, formatSettings);
  poIncrease.Value:=1;
  poUnit.ItemIndex:=0;

  Result:=poExecute;
  if Result<>0 then exit;
  // �������� ������������
  if (DayOf(poResult)<>1) or
     (MonthOf(poResult)<>3) or
     (YearOf(poResult)<>2021) then Result:=2;

 except
  Result:=-1;
 end;
finally
  poData.Text:=chData;
  poIncrease.Value:=chIncrease;
  poUnit.ItemIndex:=chUnit;
  poResult:=Date;
end;
end;

procedure TIncTheDate.poClearParameters;
begin
  inherited;
  poData.Text:=DateToStr(Date, formatSettings);
  poIncrease.Value:=0;
  poUnit.ItemIndex:=0;
  poResult:=Date;
end;

procedure TIncTheDate.poDataExit(Sender: TObject);
var
  setDat:TDateTime;
begin
 try
  setDat:=StrToDate(poData.Text, formatSettings);
 except
  poData.Text:=DateToStr(Date, formatSettings);
 end;
end;

function TIncTheDate.poExecute: longint;
begin
 Result:=0;
 poResult:=StrToDate(poData.Text, formatSettings);
 if poUnit.ItemIndex=0 then
 begin
// ����
   poResult:= IncDay(poResult, poIncrease.Value);
 end else
 if poUnit.ItemIndex=1 then
 begin
// �����
  poResult:= IncMonth(poResult, poIncrease.Value);
 end else
 if poUnit.ItemIndex=2 then
 begin
// ���
  poResult:= IncYear(poResult, poIncrease.Value);
 end else
  Result:=1;
end;

function TIncTheDate.poGetNameParameters: AnsiString;
begin
 Result:='���������� ����';
end;

function TIncTheDate.poGetResult: AnsiString;
begin
 Result:=DateToStr(poResult, formatSettings);
end;

end.
