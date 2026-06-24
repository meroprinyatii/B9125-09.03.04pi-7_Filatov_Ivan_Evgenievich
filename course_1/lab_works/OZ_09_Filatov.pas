const
n=3;
var
  matrix:array[1..n,1..n] of integer;
  i,j:integer;
begin
writeln('ВВЕДИТЕ ЭЛЕМЕНТЫ МАТРИЦЫ ПОСТРОЧНО.');
  for i:=1 to n do begin
    for j:=1 to n do
      readln(matrix[i,j]);
      end;
      for i:=1 to n do begin
    for j:=1 to n do begin
      write(matrix[i,j]:3);
      writeln
    end;
    end;
end.
