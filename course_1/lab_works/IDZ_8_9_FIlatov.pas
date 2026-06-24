type
  TConductivity=(Conductor,Semiconductor,Insulator);
  TSubstance=record
    Name: string;
    Weight: real;
    Cond: TConductivity;
  end;

var
  Substances: array[1..100] of TSubstance;
  count: integer;
  validCond: set of TConductivity;
  
  inputFileName,outputFileName: string;
  inputFile,outputFile: text;
  line,name,weightStr,condStr: string;
  parts: array of string;
  weight: real;
  error,weightOk,condOk: boolean;
  cond: TConductivity;
  
  conductors: array[1..100] of TSubstance;
  condcount,i,j: integer;
  temp: TSubstance;

function TryStrToConductivity(s:string; var c:TConductivity):boolean;
begin
  s:=LowerCase(s);
  if s='проводник' then 
    begin 
      c:=Conductor; 
      Result:=true;
    end
  else if s='полупроводник' then 
    begin 
      c:=Semiconductor; 
      Result:=true;
    end
  else if s='изолятор' then 
    begin 
      c:=Insulator; 
      Result:=true; 
    end
  else Result:=false;
end;

begin
  validCond:=[Conductor,Semiconductor,Insulator];
  inputFileName:='input.txt';
  outputFileName:='output.txt';
  
  Assign(inputFile, inputFileName);
  Reset(inputFile);
  count:=0;
  error:=false;
  if EOF(inputFile) then writeln('Ошибка: файл пуст')
  else 
  begin
    while not EOF(inputFile) and not error do
      begin
        readln(inputFile, line);
        if line<>'' then
        begin
          parts:=line.split(' ');
          if Length(parts)=3 then
          begin
            name:=parts[0].trim;
            weightStr:=parts[1].trim;
            condStr:=parts[2].trim;
            
            weightOk := TryStrToFloat(weightStr, weight);
            condOk := TryStrToConductivity(condStr, cond);
            
            if weightOk and (weight > 0) and condOk and (cond in validCond) then
            begin
              if count<100 then
              begin
                count:=count+1;
                Substances[count].Name:=name;
                Substances[count].Weight:=weight;
                Substances[count].Cond:=cond;
              end
              else
              begin
                error:=true;
                Writeln('Ошибка: превышен лимит 100 записей');
              end;
            end
            else
            begin
              error:=true;
              if not weightOk then writeln('Ошибка: удельный вес не число: ', weightStr)
              else if weight<=0 then writeln('Ошибка: удельный вес должен быть положительным: ', weight)
              else if not condOk then writeln('Ошибка: недопустимая проводимость: ', condStr)
              else if not (cond in validCond) then writeln('Ошибка: значение проводимости вне допустимого множества: ', condStr);
            end;
          end
          else 
          begin
            error:=true;
            Writeln('Ошибка формата строки (ожидается: название вес проводимость): ', line);
          end;
        end;
      end;
      close(inputFile);
      
      if not error then
      begin
        Writeln('Полупроводники:');
        for i:=1 to count do
          if Substances[i].Cond=Semiconductor then writeln(Substances[i].Name, ', удельный вес: ', Substances[i].Weight:0:2, ' Н/м^3');
        
        condcount:=0;
        for i:=1 to count do
          if Substances[i].Cond=Conductor then
          begin
            condcount:=condcount+1;
            conductors[condcount]:=Substances[i];
          end;
        
        for i:=1 to condcount-1 do
          for j:=i+1 to condcount do
            if conductors[i].Weight<conductors[j].Weight then
            begin
              temp:=conductors[i];
              conductors[i]:=conductors[j];
              conductors[j]:=temp;
            end;
        writeln;
        writeln('Проводники, упорядоченные по убыванию удельного веса:');
        for i:=1 to condcount do writeln(conductors[i].Name, ', удельный вес: ', conductors[i].Weight:0:2, ' Н/м^3');
        
        // Запись результатов в файл
        assign(outputFile, outputFileName);
        rewrite(outputFile);
        writeln(outputFile, 'Полупроводники:');
        for i:=1 to count do if Substances[i].Cond=Semiconductor then writeln(outputFile, Substances[i].Name, ', удельный вес: ', Substances[i].Weight:0:2, ' Н/м^3');
        writeln(outputFile);
        writeln(outputFile, 'Проводники, упорядоченные по убыванию удельного веса:');
        for i:=1 to condcount do writeln(outputFile, conductors[i].Name, ', удельный вес: ', conductors[i].Weight:0:2, ' Н/м^3');
        close(outputFile);
        
        writeln;
        writeln('Обработка завершена. Результаты сохранены в файл ', outputFileName);
      end;
    end;
end.
  