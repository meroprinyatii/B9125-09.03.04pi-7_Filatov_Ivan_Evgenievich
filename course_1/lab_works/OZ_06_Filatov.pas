var
  N,D,x,x_previous,eps: real;
begin
  write('Введите N:');
  readln(N);
  write('Введите D (≠0):');
  readln(D);
  write('Введите eps:');
  readln(eps);
  if D = 0 then begin
    writeln('Ошибка: D не может быть 0');
    exit;
  end;
  if abs(D)<1 then
    x:=1
  else
    x:=1/abs(D);
  repeat
    x_previous:=x;
    x:=x*(2-D*x);
  until abs(x-x_previous)<eps;
  writeln('N/D=',(N * x):0:10);
end.