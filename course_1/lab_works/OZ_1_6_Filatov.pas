type
tdata=record
  day:1..31;
  month:1..12;
  year:2000..2025;
end;
var
  data:tdata;
  ins,os,ds,ms,ys,s2m,s2d:string;
  spacepos,code,i,tempday,tempyear,monthnum:integer;
  months:array[1..12] of string=('январь','февраль','март','апрель','май','июнь','июль','август','сентябрь','октябрь','ноябрь','декабрь');
begin
  code:=0;
  writeln('Введите дату в формате "день месяц год":');
  readln(ins);
  spacepos:=pos(' ',ins);
  if spacepos=0 then writeln('Некорректны ввёднные сведения1')
  else
  begin
    ds:=copy(ins,1,spacepos-1);
    delete(ins,1,spacepos);
    spacepos:=pos(' ',ins);
    if spacepos=0 then writeln('Некорректны ввёднные сведения2')
    else begin
      ms:=copy(ins,1,spacepos-1);
      delete(ins,1,spacepos);
      ys:=ins;
      if ys='' then writeln('Некорректны ввёднные сведения3')
      else
      begin
        val(ds,tempday,code);
        if (code<>0) or (tempday<1) or (tempday>31) then writeln('Некорректны ввёднные сведения4')
        else begin
          data.day:=tempday;
          monthnum:=0;
          for i:=1 to 12 do
            if ms=months[i] then monthnum:=i;
          if monthnum=0 then writeln('Некорректны ввёднные сведения5')
          else begin
            data.month:=monthnum;
            val(ys,tempyear,code);
            if (code<>0) or (tempyear < 2000) or (tempyear > 2025) then writeln('Некорректны ввёднные сведения6')
            else begin
              data.year:=tempyear;
              str(data.year,os);
              os+=':';
              if data.month<10 then os+='0';
              str(data.month,s2m);
              os:=os+s2m+':';
              if data.day<10 then os+='0';
              str(data.day,s2d);
              os+=s2d;
              writeln(os);
            end;
          end;
        end;
      end;
    end;
  end;
end.