var c: array[1..7, 1..7] of Boolean;
var d: array[1..7, 1..14] of ShortInt;
begin
  println('                  Министерство науки и высшего образования РФ                  ');
  println('                         ФГБОУ ВО РГРТУ им. В.Ф.Уткина                         ');
  println('                                Кафедра САПР ВС                                ');
  println('                                  Рязань 2022                                  ');
  println('Программа по переводу матрицы смежности графа в матрицу инцидентности и обратно');
  for var i: integer:=1 to 7 do
    for var j: integer:=1 to 7 do
    begin // ввод матрицы смежности
      print('c [',i,',',j,'] =');
      var m:=ReadInteger();
      if (m=1) then c[i,j]:=True;
      if (m=0) then c[i,j]:=False
    end;
  var k: byte:=1; // номер столбца матрицы инцидентности
  for var i: integer:=1 to 7 do
    for var j: integer:=1 to 7 do
    begin // вычисление матрицы смежности
      if c[i,j] and (i=j) then
      begin // петли
        d[i,k]:=2;
        inc(k);
      end
      else if c[i,j] and c[j,i] and (i<j) then
      begin // рёбра
        d[i,k]:=1;
        d[j,k]:=1;
        inc(k);
      end;
      if c[i,j] and not c[j,i] then
      begin // дуги
        d[i,k]:=-1;
        d[j,k]:=1;
        inc(k);
      end
    end;
  for var i: integer:=1 to 7 do
  begin
    for var j: integer:=1 to 14 do
    begin // печать матрицы смежности
      if d[i,j]>=0 then write(' ');
      print(d[i,j]);
    end;
    println
  end;
  println;
  for var i: integer:=1 to 7 do
    for var j: integer:=1 to 7 do
      c[i,j]:=False; // зануление матрицы смежности
  for var i:Integer:=1 to 7 do
    for var j:Integer:=1 to 7 do
      for k:=1 to 14 do
      begin // вычисление матрицы инцидентности
        if (d[i,k]=2) then // петли
          c[i,i]:=True
        else if (d[i,k]=1) and (d[j,k]=1) and (i<>j) then // рёбра
        begin
          c[i,j]:=True;
          c[j,i]:=True
        end
        else if (d[i,k]=1) and (d[j,k]=-1) and (i<>j) then // дуги
          c[j,i]:=True
      end;
  for var i: integer:=1 to 7 do // печать восстановленной матрицы смежности
  begin
    for var j: integer:=1 to 7 do
      if c[i,j] then print('1') else print('0');
    println
  end
end.