unit UnitSquare;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FrameObjectParameters,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TSquare = class(TFrameObject)
    Panel1: TPanel;
    Label1: TLabel;
    poDataSquare: TEdit;
    procedure poDataSquareExit(Sender: TObject);
  private
    { Private declarations }
    poResult: double;
    formatSettings : TFormatSettings; // форматирование данных
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  // Выполняемые функции параметризованной операции
  // Проверить функции параметризованной операции (Возвращает: <>0 ошибка)
    function  poCheck:longint;override;
  // Выполнить функцию параметризованной операции (Возвращает: <>0 ошибка)
    function  poExecute:longint;override;
  // Очистить параметры функции параметризованной операции
    procedure  poClearParameters;override;
  // Функция выдаёт результат работы poExecute
    function poGetResult: AnsiString;override;

  // Выдаёт название параметризованной операции
    function poGetNameParameters:AnsiString;override;
  end;

implementation

{$R *.dfm}

{ TFrame1 }

constructor TSquare.Create(AOwner: TComponent);
begin
  inherited;

  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, formatSettings);
  poClearParameters;
end;

procedure TSquare.poDataSquareExit(Sender: TObject);
var
 d : double;
begin
try
  d:=StrToFloat(poDataSquare.Text, formatSettings);
except
  poDataSquare.Text:='1';
end;
end;

function TSquare.poCheck: longint;
var
 sp : string;
 chDataSquare   : double;
begin
try
 try
  sp := poDataSquare.Text;
  chDataSquare:=25;
  poDataSquare.Text:=FloatToStr(chDataSquare, formatSettings);
  // Установим проверочные данные

  Result:=poExecute;
  if Result<>0 then exit;
  // Проверим правильность
  if (poResult<>5) then Result:=2;

 except
  Result:=-1;
 end;
finally
  poDataSquare.Text:=sp;
end;
end;

procedure TSquare.poClearParameters;
begin
  inherited;
  poDataSquare.Text:='1';
  poResult:=1;
end;

function TSquare.poExecute: longint;
begin
Result:=0;
 try
   poResult:=Sqrt(StrToFloat(poDataSquare.Text, formatSettings));
 except
  Result:=-1;
 end;
end;

function TSquare.poGetNameParameters: AnsiString;
begin
 Result:='Извлечение квадратного корня';
end;

function TSquare.poGetResult: AnsiString;
begin
 Result:=FloatToStr(poResult, formatSettings);
end;

end.
