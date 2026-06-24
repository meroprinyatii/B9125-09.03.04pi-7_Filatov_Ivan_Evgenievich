type
dyn=^dynlist;
dynlist=record
  data:string;
  nextknot:dyn;
end;

procedure sozdynlist(s:string;var head:dyn);
var
  newknot:dyn;
  i:integer;
begin
  if head<>nil then writeln('Список под этим указателем уже создан.')
  else begin
  for i:=1 to length(s) do begin
    new(newknot);
    newknot^.data:=s[i];
    newknot^.nextknot:=nil;
    if head=nil then head:=newknot
    else begin
    newknot^.nextknot:=head;
    head:=newknot;
    end;
  end;
  end;
end;

procedure sozvstavdynlist(s:string;var head:dyn);
var
  newknot:dyn;
  i:integer;
begin 
    new(newknot);
    newknot^.data:=s;
    newknot^.nextknot:=nil;
    if head=nil then head:=newknot
    else begin
    newknot^.nextknot:=head;
    head:=newknot;
  end;
end;

procedure vivodynlist(var head:dyn);
var
  temp:dyn;
begin
  if head=nil then writeln('Списка не существует')
  else begin
  temp:=head;
  while temp<>nil do begin
    write(temp^.data);
    temp:=temp^.nextknot;
  end;
  end;
end;

procedure cleardynlist(var head:dyn);
var
  temp:dyn;
begin
  while head<>nil do begin
    temp:=head;
    head:=head^.nextknot;
    dispose(temp);
  end;
end;

procedure cleardynlistel(var head:dyn);
var
  temp:dyn;
begin
  if head<>nil then begin
    temp:=head;
    head:=head^.nextknot;
    dispose(temp);
  end;
end;

function proverka(s:string):boolean;
var 
  head:dyn;
  i:integer;
begin
  proverka:=true;
  head:=nil;
  for i:=1 to length(s) do begin
    if s[i]='(' then begin
      sozvstavdynlist(s[i],head)
    end;
    if s[i]=')' then begin
      if head=nil then proverka:=false
      else cleardynlistel(head)
    end;
  end;
  if head<>nil then proverka:=false;
  cleardynlist(head);
end;

function sortir(s:string;var head:dyn):string;
var
  i:integer;
  s1:string;
begin
  head:=nil;
  if proverka(s) then begin
    for i:=1 to length(s) do begin
    case s[i] of
      '0','1','2','3','4','5','6','7','8','9': s1:=s1+s[i];
      '(': sozvstavdynlist(s[i],head);
      '*','/': begin
        if head<>nil then s1:=s1+s[i]
        else sozvstavdynlist(s[i],head)
      end;
      
      '+','-': begin
        if head<>nil then s1:=s1+s[i]
        else sozvstavdynlist(s[i],head)
      end;
      ')': cleardynlistel(head)
    end;
  end;
  sortir:=s1;
  end;
end;

var
  f:textfile;
  s:string;
  head:dyn;
begin
  assign(f,'СТРОКАСИМВОЛОВ.txt');
  reset(f);
  while not eof(f) do read(f,s);
  writeln('Исходная строка: ',s);
  writeln(proverka(s));
  head:=nil;
  sozdynlist(s,head);
  write('Преобразованная строка: ');
  vivodynlist(head);
  cleardynlist(head);
  writeln();
  vivodynlist(head);
  writeln(head);
  close(f);
  writeln(sortir(s,head));
end.