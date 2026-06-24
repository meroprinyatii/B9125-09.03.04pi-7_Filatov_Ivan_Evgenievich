function schet(s:string):integer;
var
  dopusk:set of char;
  i,count:integer;
begin
  count:=0;
  dopusk:=['+','-','*','0','1','2','3','4','5','6','7','8','9'];
  for i:=1 to length(s) do
    if s[i] in dopusk then inc(count);
  schet:=count;
end;
var
 s: string;
begin
  writeln('Демонстрация работы функции schet');
  writeln('Функция подсчитывает количество цифр и знаков "+", "-", "*" в строке.');
  writeln;
  write('Введите произвольную строку: ');
  readln(s);
  writeln('Количество цифр и знаков в строке: ', schet(s));
end.