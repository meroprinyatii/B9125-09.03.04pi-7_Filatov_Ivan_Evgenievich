type
dyn=^dynlist;
dynlist=record
  data:integer;
  nextknot:dyn;
end;

procedure cleardynqueue(var head,tail:dyn);
var
  temp:dyn;
begin
  while head<>nil do begin
    temp:=head;
    head:=head^.nextknot;
    dispose(temp);
  end;
  tail:=nil;
end;

procedure vivodynqueue(var head:dyn);
var
  temp:dyn;
begin
  if head=nil then writeln('Очередь пуста')
  else begin
  temp:=head;
  while temp<>nil do begin
    write('[',temp^.data,']');
    temp:=temp^.nextknot;
  end;
  writeln;
  end;
end;

procedure deldatadynqueue(var head,tail:dyn);
var
  temp,prev:dyn;
  dat:integer;
  found:boolean;
begin
  if head=nil then
    writeln('Очередь пуста, удаление невозможно.')
  else begin
    write('Введите значение ID, клиента с которым требуется удалить: ');
    readln(dat);
    found:=false;
    if head^.data=dat then begin
      temp:=head;
      head:=head^.nextknot;
      if head=nil then tail:=nil;
      dispose(temp);
      found:=true;
    end
    else begin
      prev:=head;
      while (prev<>nil) and (prev^.nextknot<>nil) and not found do begin
        if prev^.nextknot^.data=dat then begin
          temp:=prev^.nextknot;
          prev^.nextknot:=temp^.nextknot;
          if temp=tail then tail:=prev;
          dispose(temp);
          found:=true;
        end
        else prev:=prev^.nextknot;
      end;
    end;
    if not found then writeln('Клиент со значением ID ', dat, ' не найден.');
  end;
end;

procedure ocheredvhod(var head,tail:dyn);
var
  newknot:dyn;
  id:integer;
begin
  new(newknot);
  id:=random(1000);
  newknot^.data:=id;
  newknot^.nextknot:=nil;
  if head=nil then head:=newknot
  else tail^.nextknot:=newknot;
  tail:=newknot;
  writeln('Клиент под ID: ',id,' зарегестрирован в живую очередь');
end;

procedure ocheredvihod(var head,tail:dyn);
var
  temp:dyn;
  id:integer;
begin
  if head=nil then writeln('Queue is already empty')
  else begin
    id:=head^.data;
    temp:=head;
    head:=head^.nextknot;
    if head=nil then begin
      tail:=nil;
      writeln('Queue became empty');
    end;
    dispose(temp);
    writeln('Клиент под ID: ',id,' обслужен');
  end;
end;

var
  head,tail:dyn;
  v:integer;
begin
  head:=nil;
  tail:=nil;
  random;
  repeat
    writeln('------------------------------------------------|');
    writeln('Введите желаемое действие: ');
    writeln('1) - добавить клиента в очередь');
    writeln('2) - завершить обслуживание клиента');
    writeln('3) - вывести очередь');
    writeln('4) - удалить клиента с известным ID из очереди');
    writeln('5) - завершить работу');
    write('Ваш вариант: ');
    readln(v);
    if (v<1) or (v>5) then writeln('Такого варианта не существует');
  
  case v of
    1: ocheredvhod(head,tail);
    2: ocheredvihod(head,tail);
    3: vivodynqueue(head);
    4: deldatadynqueue(head,tail);
    5: cleardynqueue(head,tail);
  end;
  until v=5;
end.