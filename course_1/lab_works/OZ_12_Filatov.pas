const
n=10;
m=15;
var
  mat:array[1..n,1..m] of integer;
  i,j,k,maxi,mini,rando:integer;
  sedlo,sedlo2:boolean;
begin
  randomize;
  rando:=random(1000000);
  for i:=1 to n do begin
    for j:=1 to m do begin
      mat[i,j]:=random(-rando,rando)
    end;
  end;
  for i:=1 to n do begin
    mini:=mat[i,1];
    maxi:=mat[i,1];
    for j:=2 to m do begin 
      if mat[i,j]<mini then
        mini:=mat[i,j];
      if mat[i,j]>maxi then
        maxi:=mat[i,j];
    end;
  end;
  for j:=1 to m do begin
    if mat[i,j]=mini then begin
      sedlo:=true;
      k:=1;
      while (k<=n) and sedlo do begin
        if mat[k,j]>mat[i,j] then //naibolshii v stolbce
          sedlo:=false
        else
          k:=k+1
      end;
  if sedlo=true then
    writeln('Koordinati tochki1=','[',i,',',j,']');
  end;
  if mat[i,j]=maxi then begin
    sedlo2:=true;
    k:=1;
    while (k<=n) and sedlo2 do begin
      if mat[k,j]<mat[i,j] then //naimensii v stolbce
        sedlo2:=false;
      k:=k+1;
    end;
  if sedlo2=true then
    writeln('Koordinati tochki2=','[',i,',',j,']');
  end;
  end;
  writeln('МАТРИЦА:');
  for i:=1 to n do begin
    for j:=1 to m do begin
      write(mat[i,j]:9);
      end;
      writeln;
      end;
end.