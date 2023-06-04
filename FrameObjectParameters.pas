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
// ����������� ������� ����������������� ��������
// ��������� ������� ����������������� �������� (����������: <>0 ������)
  function  poCheck:longint;virtual;Abstract;
// ��������� ������� ����������������� �������� (����������: <>0 ������)
  function  poExecute:longint;virtual;Abstract;
// �������� ��������� ������� ����������������� ��������
  procedure  poClearParameters;virtual;Abstract;
// ������� ����� ��������� ������ poExecute
  function poGetResult: AnsiString;virtual;Abstract;

// ����� �������� ����������������� ��������
  function poGetNameParameters:AnsiString;virtual;Abstract;

  end;

implementation

{$R *.dfm}

end.
