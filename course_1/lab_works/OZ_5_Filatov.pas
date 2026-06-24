function expon(x,eps:real):real;
var
  s,a:real;
  n:integer;
begin
  S := 1.0;
  a := 1.0;
  n := 1;
  while Abs(a) > eps do
  begin
    a := a * x / n;
    S := S + a;
    n := n + 1;
  end;
  expon:=s;
end;

function cosi(x,eps:real):real;
var
  s,a,x2:real;
  n:integer;
begin
  x2 := x * x;
  S := 1.0;    
  a := 1.0;   
  n := 1;       
  while Abs(a) > eps do
  begin
    a := a * (-x2) / (2 * n * (2 * n - 1)); 
    S := S + a;                            
    n := n + 1;
  end;
  cosi:=s;
end;

function lognat(x,eps:real):real;
var
  s,a:real;
  n:integer;
begin
  S := 0.0;
  a := x;  
  n := 1;   
  while Abs(a) > eps do
  begin
    S := S + a;  
    n := n + 1;            
    a := a * (-x) * (n - 1) / n;
  end;
  lognat:=s;
end;

var
  x, eps: real;
begin
  Write('Введите x: ');
  ReadLn(x);
  Write('Введите eps: ');
  ReadLn(eps);
  if (x>1) or (x<-1) then
  begin
    writeln('e^', x, ' = ', (expon(x,eps)):0:10);
    writeln('cos(', x:0:2, ') = ', (cosi(x,eps)):0:10);
  end
  else
    begin
    writeln('e^', x, ' = ', (expon(x,eps)):0:10);
    writeln('cos(', x:0:2, ') = ', (cosi(x,eps)):0:10);
    writeLn('ln(1 + ', x:0:6, ') = ', (lognat(x,eps)):0:10);
    end;
end.