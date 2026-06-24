const
  razm1 = 9;
  razm2 = 9;
type
  mat = array[1..razm1, 1..razm2] of real;

function maxim(a,b:real):real;
begin
  if a>b then maxim:=a
  else maxim:=b;
end;

function min3(a,b,c:real):real;
begin
  if (a<=b) and (a<=c) then min3:=a
  else 
  begin
    if (b<=a) and (b<=c) then min3:=b
    else min3:=c;
  end;
end;

procedure ZapolnMat(var matrix:mat);
var
  i,j:integer;
begin
  for i:=1 to razm1 do
    for j:=1 to razm2 do
      matrix[i,j]:=random*10000-5000;
end;

procedure Vivod(matrix:mat);
var
  i,j:integer;
begin
  for i:=1 to razm1 do
  begin
    for j:=1 to razm2 do
      write(matrix[i,j]:10:2);
    writeln;
  end;
end;

function PoiskNormi(matrix:mat):real;
var
  i,j:integer;
  maxi:real;
begin
  maxi:=abs(matrix[1, 1]);
  for i:=1 to razm1 do
    for j:=1 to razm2 do
      maxi:=maxim(maxi,abs(matrix[i, j]));
  PoiskNormi:=maxi;
end;

procedure NaimNorma(matrix1, matrix2, matrix3: mat);
begin
  if PoiskNormi(matrix1)=min3(PoiskNormi(matrix1),PoiskNormi(matrix2),PoiskNormi(matrix3)) then
    writeln((PoiskNormi(matrix1)):0:2, ' MATRIX1')
  else 
    if PoiskNormi(matrix2)=min3(PoiskNormi(matrix1),PoiskNormi(matrix2),PoiskNormi(matrix3)) then writeln((PoiskNormi(matrix2)):0:2, ' MATRIX2')
    else writeln((PoiskNormi(matrix3)):0:2, ' MATRIX3');
end;

var
  matrix1,matrix2,matrix3:mat;
begin
  randomize;
  ZapolnMat(matrix1);
  writeln('Matrix 1:');
  Vivod(matrix1);
  writeln('NORMA MATRICA1 ', PoiskNormi(matrix1):0:2);
  writeln;

  ZapolnMat(matrix2);
  writeln('Matrix 2:');
  Vivod(matrix2);
  writeln('NORMA MATRICA2 ', PoiskNormi(matrix2):0:2);
  writeln;
  
  ZapolnMat(matrix3);
  writeln('Matrix 3:');
  Vivod(matrix3);
  writeln('NORMA MATRICA3 ', PoiskNormi(matrix3):0:2);
  writeln;
  
  writeln('Matrix with minimum norm:');
  NaimNorma(matrix1, matrix2, matrix3);
end.