unit UnitCommon;

interface

uses
  Forms, Dialogs, Classes, Controls, StdCtrls, SysUtils;

type

// ��������� IParameterizedOperations
// �������� ���������, ������� ����������������� ��������
IParameterizedOperations = Interface(IInterface)
// ����������� ������� ����������������� ��������
// ��������� ������� ����������������� �������� (����������: <>0 ������)
  function  poCheck:longint;
// ��������� ������� ����������������� �������� (����������: <>0 ������)
  function  poExecute:longint;
// �������� ��������� ������� ����������������� ��������
  procedure  poClearParameters;
// ������� ����� ��������� ������ poExecute
  function poGetResult: AnsiString;

// ����� �������� ����������������� ��������
  function poGetNameParameters:AnsiString;
end;

implementation

end.
