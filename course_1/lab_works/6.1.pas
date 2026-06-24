type
dyn=^dynlist;
dynlist=record
  up:dyn;
  data:string;
  right:dyn;
  left:dyn;
end;

function IsOperator(const ch:char):boolean;
begin
  IsOperator:=(ch='+') or (ch='-') or (ch='*') or (ch='/');
end;

function IsDigit(const ch:char):boolean;
begin
  IsDigit:=(ch>='0') and (ch<='9');
end;

function CheckExpression(const str:string):boolean;
var
  balance, i: integer;
  res: boolean;
begin
  res:=true;
  balance:=0;
  if length(str)=0 then res:=false
  else
  begin
    i:=1;
    while (i<=length(str)) and res do
    begin
      if not (IsDigit(str[i]) or IsOperator(str[i]) or (str[i] = '(') or (str[i] = ')')) then res:=false
      else if str[i] = '(' then inc(balance)
      else if str[i] = ')' then dec(balance);
      if balance<0 then res:=false;
      inc(i);
    end;
    if balance<>0 then res:=false;
    if length(str)=0 then res:=false;
    CheckExpression:=res;
  end;
end;

function BinaryTree(const str:string):dyn;
var
  start,temp,cur:dyn;
  numStr:string;
  i:integer;
begin
  new(start);
  start^.up:=nil;
  start^.left:=nil;
  start^.right:=nil;
  start^.data:='';
  cur:=start;
  i:=1;
  while i<=length(str) do
  begin
    if str[i]='(' then 
    begin
      new(temp);
      temp^.data:='';
      temp^.left:=nil;
      temp^.right:=nil;
      temp^.up:=cur;
      cur^.left:=temp;
      cur:=temp;
      inc(i);
    end
    else if IsDigit(str[i]) then
    begin
      numStr:='';
      while (i<=length(str)) and (IsDigit(str[i])) do
      begin
        numStr:=numStr+str[i];
        inc(i);
      end;
      cur^.data:=numStr;
      if cur^.up<>nil then cur:=cur^.up;
    end
    else if IsOperator(str[i]) then 
    begin
      cur^.data:=str[i];
      new(temp);
      temp^.data:='';
      temp^.right:=nil;
      temp^.left:=nil;
      temp^.up:=cur;
      cur^.right:=temp;
      cur:=temp;
      inc(i);
    end
    else if str[i]=' ' then inc(i)
    else if str[i]=')' then 
    begin
      if cur^.up<>nil then cur:=cur^.up;
      inc(i);
    end;
  end;
  BinaryTree:=start;
end;

procedure PreOrder(const head:dyn);
begin
  if head<>nil then 
  begin
    if head^.data<>'' then write(head^.data);
    PreOrder(head^.left);
    PreOrder(head^.right);
  end;
end;

procedure PostOrder(const head:dyn);
begin
  if head<>nil then 
  begin
    PostOrder(head^.left);
    PostOrder(head^.right);
    if head^.data<>'' then write(head^.data);
  end;
end;

procedure InOrder(head: dyn);
begin
  if head<>nil then 
  begin
    InOrder(head^.left);
    if head^.data<>'' then write(head^.data);
    InOrder(head^.right);
  end;
end;

procedure WritePreOrder(head:dyn; var f:text);
begin
  if head<>nil then
  begin
    if head^.data<>'' then write(f, head^.data);
    WritePreOrder(head^.left, f);
    WritePreOrder(head^.right, f);
  end;
end;

procedure WritePostOrder(head:dyn; var f:text);
begin
  if head<>nil then
  begin
    WritePostOrder(head^.left, f);
    WritePostOrder(head^.right, f);
    if head^.data<>'' then write(f, head^.data);
  end;
end;

procedure WriteInOrder(head:dyn; var f:text);
begin
  if head<>nil then
  begin
    WriteInOrder(head^.left, f);
    if head^.data<>'' then write(f, head^.data);
    WriteInOrder(head^.right, f);
  end;
end;

procedure PrintTreeRotated(head:dyn; level:integer);
var
  i:integer;
begin
  if head<>nil then
  begin
    PrintTreeRotated(head^.right, level+1);
    for i:=1 to level do write('    ');
    if head^.data <> '' then writeln(head^.data)
    else writeln('·');
    PrintTreeRotated(head^.left, level+1);
  end;
end;


procedure FreeTree(head: dyn);
begin
  if head<>nil then
  begin
    FreeTree(head^.left);
    FreeTree(head^.right);
    dispose(head);
  end;
end;

var
  f:text;
  str:string;
  head,root:dyn;
begin
  readln(str); //((4*2)-(6/2))
  if not CheckExpression(str) then writeln('Ошибка: некорректное выражение (недопустимые символы или неверные скобки)')
  else
  begin
    head:=BinaryTree(str);
    if (head^.data='') and (head^.left<>nil) then root:=head^.left
    else root:=head;
    
    writeln('Дерево выражения (повёрнутое, корень слева):');
    PrintTreeRotated(root, 0);
    writeln;
  
    assign(f, 'output.txt');
    rewrite(f);
  
    write(f, 'Прямой обход (префиксный): ');
    WritePreOrder(root, f);
    writeln(f);
  
    write(f, 'Симметрический обход (инфиксный): ');
    WriteInOrder(root, f);
    writeln(f);
  
    write(f, 'Обратный обход (постфиксный): ');
    WritePostOrder(root, f);
    writeln(f);
  
    close(f);
    writeln('Результаты обходов записаны в файл output.txt');
  
    FreeTree(head);
  end;
end.
  