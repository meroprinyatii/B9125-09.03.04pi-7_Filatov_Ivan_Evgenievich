const
k=9;
type
vector=array[1..k]of real;
matrix=array[1..k,1..k]of real;

procedure FillVec(var v:vector);
var
i:integer;
begin
for i:=1 to k do
v[i]:=random*10-5;
end;

procedure FillMat(var m:matrix);
var
i,j:integer;
begin
for i:=1 to k do
for j:=1 to k do
m[i,j]:=random*10-5;
end;

procedure PrintVec(v:vector;name:string);
var i:integer;
begin
write(name,': ');
for i:=1 to k do
write(v[i]:6:1);
writeln;
end;

procedure PrintMat(m:matrix;name:string);
var
i,j:integer;
begin
writeln(name,': ');
for i:=1 to k do
begin
for j:=1 to k do
write(m[i,j]:6:1);
writeln;
end;
end;

function Dot(v1,v2:vector):real;
var
i:integer;
s:real;
begin
s:=0;
for i:=1 to k do
s:=s+v1[i]*v2[i];
Dot:=s;
end;

function MatVec(m:matrix;v:vector):vector;
var
i,j:integer;
res:vector;
begin
for i:=1 to k do begin
res[i]:=0;
for j:=1 to k do
res[i]:=res[i]+m[i,j]*v[j];
end;
MatVec:=res;
end;

var
x,y,Ax,By,Cx:vector;
A,B,C:matrix;
num1,num2,denom,res:real;
begin
randomize;

FillVec(x);
FillVec(y);
FillMat(A);
FillMat(B);
FillMat(C);

PrintVec(x,'x');
PrintVec(y,'y');
PrintMat(a,'A');
PrintMat(b,'B');
PrintMat(c,'C');
writeln;

Ax:=MatVec(A,x);
By:=MatVec(B,y);
Cx:=MatVec(C,x);

num1:=Dot(Ax,By);
num2:=Dot(Cx,y);
denom:=Dot(x,By);

if abs(denom)=0 then
writeln('Ошибка: деление на ноль')
else
begin
res:=num1+num2/denom;
writeln('(Ax, By)=',num1:0:2);
writeln('(Cx, y)=',num2:0:2);
writeln('(x, By)=',denom:0:2);
writeln('Результат: ',res:0:2);
end;
end.