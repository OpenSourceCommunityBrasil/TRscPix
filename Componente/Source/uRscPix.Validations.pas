{=======================================}
{             RSC SISTEMAS              }
{        SOLUÇÕES TECNOLÓGICAS          }
{         rscsistemas.com.br            }
{          +55 92 4141-2737             }
{      contato@rscsistemas.com.br       }
{                                       }
{ Desenvolvidor por:                    }
{   Roniery Santos Cardoso              }
{     ronierys2@hotmail.com             }
{     +55 92 984391279                  }
{                                       }
{                                       }
{ Versão Original RSC SISTEMAS          }
{ Versão: 3.0.0                         }
{                                       }
{ Faça uma  doação:                     }
{ Pix - Email: ronierys2@hotmail.com    }
{ Banco: NuBank                         }
{                                       }
{                                       }
{                                       }
{ Componente TRscPix                    }
{ Componente OpenSource                 }
{ license Apache-2.0                    }
{                                       }
{=======================================}

unit uRscPix.Validations;

interface

uses                                
  System.SysUtils
  ,System.RegularExpressions


  ,Vcl.Dialogs


  ,uRscPix.funcoes;





  function IsCNPJ(CNPJ: string): boolean;
  function IsCPF(CPF: string): boolean;
  function IsEMail(aStr: string): boolean;
  function IsCelular(aCelNumber: string): boolean;



implementation



function IsCelular(aCelNumber: string): boolean;
var
  ipRegExp, vFone: string;
begin
  Result := False;

  { Recuperando somente os numeros }
  vFone :=  Copy(aCelNumber, 1, 1)  +  GetStrNumber(aCelNumber);
  try
    ipRegExp := '^\+[1-9]{2}[1-9]{2}(?:[6-9]|9[1-9])[0-9]{3}[0-9]{4}$';
    if TRegEx.IsMatch(vFone, ipRegExp) then
      Result := True;
  except
    on E: Exception do
      ShowMessage(E.ClassName + ' : ' + E.Message);
  end;
end;

function isCNPJ(CNPJ: string): boolean;
var
  dig13, dig14: string;
  sm, i, r, peso: integer;
begin
  CNPJ  :=  GetStrNumber(CNPJ);
  // length - retorna o tamanho da string do CNPJ (CNPJ é um número formado por 14 dígitos)
  if ((CNPJ = '00000000000000') or (CNPJ = '11111111111111') or
    (CNPJ = '22222222222222') or (CNPJ = '33333333333333') or
    (CNPJ = '44444444444444') or (CNPJ = '55555555555555') or
    (CNPJ = '66666666666666') or (CNPJ = '77777777777777') or
    (CNPJ = '88888888888888') or (CNPJ = '99999999999999') or
    (length(CNPJ) <> 14)) then
  begin
    isCNPJ := False;
    exit;
  end;

  // "try" - protege o código para eventuais erros de conversão de tipo através da função "StrToInt"
  try
    { *-- Cálculo do 1o. Digito Verificador --* }
    sm := 0;
    peso := 2;
    for i := 12 downto 1 do
    begin
      // StrToInt converte o i-ésimo caractere do CNPJ em um número
      sm := sm + (StrToInt(CNPJ[i]) * peso);
      peso := peso + 1;
      if (peso = 10) then
        peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1)) then
      dig13 := '0'
    else
      str((11 - r): 1, dig13);
    // converte um número no respectivo caractere numérico

    { *-- Cálculo do 2o. Digito Verificador --* }
    sm := 0;
    peso := 2;
    for i := 13 downto 1 do
    begin
      sm := sm + (StrToInt(CNPJ[i]) * peso);
      peso := peso + 1;
      if (peso = 10) then
        peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1)) then
      dig14 := '0'
    else
      str((11 - r): 1, dig14);

    { Verifica se os digitos calculados conferem com os digitos informados. }
    if ((dig13 = CNPJ[13]) and (dig14 = CNPJ[14])) then
      isCNPJ := True
    else
      isCNPJ := False;
  except
    on E: Exception do
    begin
      ShowMessage(E.ClassName + ' : ' + E.Message);
      isCNPJ := False
    end;
  end;
end;

function isCPF(CPF: string): boolean;
var
  dig10, dig11: string;
  S, i, r, peso: integer;
begin
  CPF  :=  GetStrNumber(CPF);
  // length - retorna o tamanho da string (CPF é um número formado por 11 dígitos)
  if ((CPF = '00000000000') or (CPF = '11111111111') or (CPF = '22222222222') or
    (CPF = '33333333333') or (CPF = '44444444444') or (CPF = '55555555555') or
    (CPF = '66666666666') or (CPF = '77777777777') or (CPF = '88888888888') or
    (CPF = '99999999999') or (length(CPF) <> 11)) then
  begin
    isCPF := False;
    exit;
  end;

  // try - protege o código para eventuais erros de conversão de tipo na função StrToInt
  try
    { *-- Cálculo do 1o. Digito Verificador --* }
    S := 0;
    peso := 10;
    for i := 1 to 9 do
    begin
      // StrToInt converte o i-ésimo caractere do CPF em um número
      S := S + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (S mod 11);
    if ((r = 10) or (r = 11)) then
      dig10 := '0'
    else
      str(r: 1, dig10); // converte um número no respectivo caractere numérico

    { *-- Cálculo do 2o. Digito Verificador --* }
    S := 0;
    peso := 11;
    for i := 1 to 10 do
    begin
      S := S + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (S mod 11);
    if ((r = 10) or (r = 11)) then
      dig11 := '0'
    else
      str(r: 1, dig11);

    { Verifica se os digitos calculados conferem com os digitos informados. }
    if ((dig10 = CPF[10]) and (dig11 = CPF[11])) then
      isCPF := True
    else
      isCPF := False;
  except
    on E: Exception do
    begin
      ShowMessage(E.ClassName + ' : ' + E.Message);
      isCPF := False
    end;
  end;
end;

function isEMail(aStr: string): boolean;
begin
  aStr := trim(UpperCase(aStr));
  try
    if Pos('@', aStr) > 1 then
    begin
      Delete(aStr, 1, Pos('@', aStr));
      Result := (length(aStr) > 0) and (Pos('.', aStr) > 2);
    end
    else
      Result := False;
  except
    on E: Exception do
    begin
      ShowMessage(E.ClassName + ' : ' + E.Message);
      Result := False
    end;
  end;
end;

end.
