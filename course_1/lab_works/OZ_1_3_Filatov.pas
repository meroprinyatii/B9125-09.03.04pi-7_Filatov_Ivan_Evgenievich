const
PunctList:array[1..11] of char=('.',',','!','?',':',';','"',#39,'(',')','-');
var
  s:string;
  PunctSet,GlasnSet,RescuePunct:set of char;
  i,digits,letters,glasn,soglasn:integer;
  chara:char;
begin
  digits:=0;
  letters:=0;
  glasn:=0;
  soglasn:=0;
  RescuePunct:=[];
  PunctSet:=['.', ',', '!', '?', ':', ';', '"', #39, '(', ')', '-'];
  GlasnSet:=['A','E','I','O','U','a','e','i','o','u'];
  
  writeln('Введите строку, содержащую латинские буквы, цифры и знаки препинания:');
  readln(s);
  for i:=1 to length(s) do begin
    chara:=s[i];
    if chara in ['0'..'9'] then inc(digits)
    else
      if chara in ['A'..'Z','a'..'z'] then begin
      inc(letters);
      if chara in GlasnSet then inc(glasn)
      else inc(soglasn)
      end
      else
        if chara in PunctSet then RescuePunct+=[chara];
    end;
  
  writeln;
  writeln('Результаты анализа:');
  writeln('Цифр: ', digits);
  writeln('Букв: ', letters);
  
  if digits>letters then writeln('Цифр больше, чем букв')
  else if letters>digits then writeln('Букв больше, чем цифр')
  else writeln('Количество цифр и букв одинаково');
  
  writeln('Гласных букв: ', glasn);
  writeln('Согласных букв: ', soglasn);
  
  write('Знаки препинания в строке: ');
  if RescuePunct=[] then
    writeln('Отсутствуют')
  else begin
    for i := 1 to 11 do
      if PunctList[i] in RescuePunct then write(PunctList[i], ' | ');
    writeln;
  end;
end.