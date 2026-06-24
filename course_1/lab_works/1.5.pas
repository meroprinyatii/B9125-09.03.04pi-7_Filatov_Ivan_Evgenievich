type
studentinfo=record
  surname:string[30];
  zachetnumber:string[10];
  ocenka:0..5;
end;
dataexz=record
  den:1..31;
  mesyac:1..12;
  god:1990..2026;
end;
vedomost=record
  disciplina:string[50];
  nomergruppi:string[15];
  data:dataexz;
  students:array [1..25] of studentinfo; 
end;
var

begin

end.
