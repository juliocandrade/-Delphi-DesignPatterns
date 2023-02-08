unit FactoryMethod.Fabrica.Transporte;

interface

uses
  FactoryMethod.Interfaces;

type
  TFabricaTransporte = class(TInterfacedObject, iFabricaTransportes)
  private
  public
    class function New : iFabricaTransportes;
    function CriarTransporte(value: string) : iTransporte;
  end;
implementation

uses
  System.SysUtils,
  FactoryMethod.Transporte.Aeroviario,
  FactoryMethod.Transporte.Aquaviario,
  FactoryMethod.Transporte.Rodoviario;

{ TFabricaTransporte }

function TFabricaTransporte.CriarTransporte(Value: string): iTransporte;
begin
  if Value = 'Aerovi�rio' then
    Result := TTransporteAeroviario.New
  else if Value = 'Aquavi�rio' then
    Result := TTransporteAquaviario.New
  else if Value = 'Rodovi�rio' then
    Result := TTRansporteRodoviario.New
  else
    raise Exception.Create('Transporte Inv�lido');

end;

class function TFabricaTransporte.New: iFabricaTransportes;
begin
  Result := Self.Create;
end;

end.
