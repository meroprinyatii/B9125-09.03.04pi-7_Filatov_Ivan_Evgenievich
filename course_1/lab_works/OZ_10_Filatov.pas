const
  EPS=1e-6;
  n=10;
var
  matrix:array[1..n, 1..n] of real;
  i,j,k:integer;
  sum:real;
  isOrth:boolean;
begin
  randomize;
 for i:=1 to n do begin
    for j:=1 to n do
      matrix[i,j]:=random(1000)-500;
    end;
  writeln('Введенная матрица:');
  for i:=1 to n do begin
    for j:=1 to n do
      write(matrix[i, j]:8);
    writeln;
  end;
  isOrth:=true;
  while isOrth=true do begin
  for i := 1 to n do begin
    for j := 1 to n do begin
      sum := 0;
      for k := 1 to n do
        sum := sum + matrix[i, k] * matrix[j, k];
      if i = j then begin
        if abs(sum-1.0) > EPS then begin
          isOrth:=false;
        end;
      end
      else begin
        if abs(sum) > EPS then begin
          isOrth := false;
        end;
      end;
    end;
  end;
  writeln;
  if isOrth then
    writeln('Результат: Матрица является ортонормированной')
  else
    writeln('Результат: Матрица НЕ является ортонормированной');
end;
end.