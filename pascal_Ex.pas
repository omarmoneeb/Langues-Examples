program PrimeAndSquareSublist;

uses
  SysUtils, Math;

function IsDivisible(n: Integer; divisor: Integer): Boolean;
var
  DivResult: Boolean;
begin
  if divisor = 1 then
    DivResult := False
  else if (n mod divisor) = 0 then
    DivResult := True
  else
    DivResult := IsDivisible(n, divisor - 1);
  IsDivisible := DivResult;
end;

function IsPrime(n: Integer): Boolean;
var
  PrimeResult: Boolean;
  i: Integer;
begin
  if n < 2 then
    PrimeResult := False
  else if n = 2 then
    PrimeResult := True
  else if (n mod 2) = 0 then
    PrimeResult := False
  else
  begin
    PrimeResult := True;
    for i := 3 to Trunc(Sqrt(n)) do
    begin
      if (n mod i) = 0 then
      begin
        PrimeResult := False;
        Break;
      end;
    end;
  end;
  IsPrime := PrimeResult;
end;

function IsPerfectSquare(n: Integer): Boolean;
var
  SqrtResult: Boolean;
  root: Integer;
begin
  if n <= 0 then
    SqrtResult := False
  else
  begin
    root := Trunc(Sqrt(n));
    SqrtResult := n = root * root;
  end;
  IsPerfectSquare := SqrtResult;
end;

function FindFirstPrime(arr: array of Integer; size: Integer): Integer;
var
  i, FirstPrimeIndex: Integer;
begin
  FirstPrimeIndex := -1;
  for i := 0 to size - 1 do
  begin
    if IsPrime(arr[i]) then
    begin
      FirstPrimeIndex := i;
      Break;
    end;
  end;
  FindFirstPrime := FirstPrimeIndex;
end;

function FindLastSquare(arr: array of Integer; size: Integer): Integer;
var
  i, LastSquareIndex: Integer;
begin
  LastSquareIndex := -1;
  for i := size - 1 downto 0 do
  begin
    if IsPerfectSquare(arr[i]) then
    begin
      LastSquareIndex := i;
      Break;
    end;
  end;
  FindLastSquare := LastSquareIndex;
end;
function Cube(n: Integer):LongInt;
begin
	Cube := n * n * n;
end;

var
  L: array of Integer;
  size, i, firstPrimeIdx, lastSquareIdx: Integer;
begin
  Write('Enter the size of the array: ');
  ReadLn(size);
  SetLength(L, size);

  WriteLn('Enter ', size, ' numbers for the array:');
  for i := 0 to size - 1 do
    ReadLn(L[i]);

  firstPrimeIdx := FindFirstPrime(L, size);
  lastSquareIdx := FindLastSquare(L, size);

  if (firstPrimeIdx <> -1) and (lastSquareIdx <> -1) and (firstPrimeIdx < lastSquareIdx) then
  begin
    WriteLn('Sublist S contains: ');
    Write(L[firstPrimeIdx], ' ');
    for i := firstPrimeIdx + 1 to lastSquareIdx - 1 do
    begin
      Write(Cube(L[i]), ' ');
    end;
    WriteLn(L[lastSquareIdx]); // Print the last perfect square
  end
  else
  begin
    WriteLn('No valid sublist can be formed.');
  end;
end.
