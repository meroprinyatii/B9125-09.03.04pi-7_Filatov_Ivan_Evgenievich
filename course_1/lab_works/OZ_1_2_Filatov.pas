function russian2(s:string):boolean;
var
  dopusk:set of char; //('а'..'я','А'..'Я','Ё','ё',' ');
  i:integer;
  flag:boolean;
begin
  dopusk:=['а'..'я','А'..'Я','Ё','ё',' '];
  if s='' then russian2:=false
  else begin
    flag:=true;
    for i:=1 to length(s) do begin
      if not(s[i] in dopusk) then flag:=false;
      end;
    russian2:=flag;
  end;
end;

procedure FIOinput(text:string;var FIO:string);
begin
  repeat
    write(text);
    readln(FIO);
    if russian2(FIO)=false then writeln('Введены некорректные значения');
  until russian2(FIO)=true;
end;

var
  lastName,firstName,patronymic: string;
begin
  writeln('Введите фамилию, имя и отчество на русском языке.');
  FIOinput('Фамилия: ',lastName);
  FIOinput('Имя: ',firstName);
  FIOinput('Отчество: ',patronymic);
  
  writeln;
  writeln('Введённые данные:');
  writeln('Фамилия: ',lastName);
  writeln('Имя: ',firstName);
  writeln('Отчество: ',patronymic);
end.