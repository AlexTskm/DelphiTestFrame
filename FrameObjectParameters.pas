unit FrameObjectParameters;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UnitCommon;

type
  TFrameObject = class(TFrame, IParameterizedOperations)
  private
    { Private declarations }
  public
    { Public declarations }
// Выполняемые функции параметризованной операции
// Проверить функции параметризованной операции (Возвращает: <>0 ошибка)
  function  poCheck:longint;virtual;Abstract;
// Выполнить функцию параметризованной операции (Возвращает: <>0 ошибка)
  function  poExecute:longint;virtual;Abstract;
// Очистить параметры функции параметризованной операции
  procedure  poClearParameters;virtual;Abstract;
// Функция выдаёт результат работы poExecute
  function poGetResult: AnsiString;virtual;Abstract;

// Выдаёт название параметризованной операции
  function poGetNameParameters:AnsiString;virtual;Abstract;

  end;

implementation

{$R *.dfm}

end.
