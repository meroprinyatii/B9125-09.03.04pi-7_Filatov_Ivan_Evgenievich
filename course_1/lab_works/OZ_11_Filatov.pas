const
  n=10;
var
  i, j, sum, magichSum: integer;
  mat: array[1..n,1..n] of integer;
  used: array[1..n*n] of boolean;
  valid: boolean;
begin
  randomize;
  for i := 1 to n do
    for j := 1 to n do
      mat[i,j]:=random(1,n*n);
  valid := True;
  // Проверка уникальности чисел 1..N*N
  while valid=true do
    begin
  for i := 1 to N * N do
    used[i] := False;
  for i := 1 to n do
    for j := 1 to n do
      if (mat[i, j] >= 1) and (mat[i, j] <= N * N) and not used[mat[i, j]] then
        used[mat[i, j]] := True
      else
        valid := False;
      end;
  magichSum := N * (N * N + 1) div 2;
  while valid=true do
    begin
  for i := 1 to N do
  begin
    sum := 0;
    for j := 1 to N do
      sum := sum + mat[i, j];
    if sum <> magichSum then
      valid := False;
    end;
  end;
  while valid=true do
    begin
  for j := 1 to N do
  begin
    sum := 0;
    for i := 1 to N do
      sum := sum + mat[i, j];
    if sum <> magichSum then
      valid := False;
    end;
  end;
  while valid=true do
    begin
  sum := 0;
  for i := 1 to N do
    sum := sum + mat[i, i];
  if sum <> magichSum then
    valid := False;
  end;
  while valid=true do
    begin
  sum := 0;
  for i := 1 to N do
    sum := sum + mat[i, N - i + 1];
  if sum <> magichSum then
    valid := False;
  end;
  if valid then
    WriteLn('ДА, ЯВЛЯЕТСЯ')
  else
    WriteLn('НЕТ, НЕ ЯВЛЯЕТСЯ');
  writeln('MATRICA');
  for i:=1 to n do
  begin
    for j:=1 to n do
    begin
      write(mat[i,j]:6);
    end;
    writeln;
  end;
end.