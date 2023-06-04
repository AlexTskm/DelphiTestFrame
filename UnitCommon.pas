unit UnitCommon;

interface

uses
  Forms, Dialogs, Classes, Controls, StdCtrls, SysUtils;

type

// Интерфейс IParameterizedOperations
// Содержит параметры, функции параметризованной операции
IParameterizedOperations = Interface(IInterface)
// Выполняемые функции параметризованной операции
// Проверить функции параметризованной операции (Возвращает: <>0 ошибка)
  function  poCheck:longint;
// Выполнить функцию параметризованной операции (Возвращает: <>0 ошибка)
  function  poExecute:longint;
// Очистить параметры функции параметризованной операции
  procedure  poClearParameters;
// Функция выдаёт результат работы poExecute
  function poGetResult: AnsiString;

// Выдаёт название параметризованной операции
  function poGetNameParameters:AnsiString;
end;

implementation

end.
