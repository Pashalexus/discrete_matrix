const n = 7; // 
var c: array[1..n, 1..n] of Boolean;
var d: array[1..n, 1..n*n+n] of ShortInt;
begin
  println('                  Министерство науки и высшего образования РФ                  ');
  println('                         ФГБОУ ВО РГРТУ им. В.Ф.Уткина                         ');
  println('                                Кафедра САПР ВС                                ');
  println('                                  Рязань 2022                                  ');
  println('Программа по переводу матрицы инцидентности графа в матрицу смежности и обратно');
  var k: byte:=0; // номер столбца матрицы инцидентности
  var boo: boolean:=True;
  for var j: integer:=1 to n*n+n do // ввод матрицы инцидентности
  begin
    for var i: integer:=1 to n do
    begin
      inc(k);
      print('d [',i,',',j,'] =');
      d[i,j]:=ReadInteger();
      if (d[i,j]=3) then boo:=False;
      if not boo then break; // при вводе "тройки" происходит прерывание
    end;
    if not boo then break
  end;
  for var i:Integer:=1 to n do
    for var j:Integer:=1 to n do
      for var k1:Integer:=1 to k do
      begin // вычисление матрицы смежности
        if (d[i,k1]=2) then // петли
          c[i,i]:=True
        else if (d[i,k1]=1) and (d[j,k1]=1) and (i<>j) then // рёбра
        begin
          c[i,j]:=True;
          c[j,i]:=True
        end
        else if (d[i,k1]=-1) and (d[j,k1]=1) and (i<>j) then // дуги
          c[j,i]:=True
      end;
  for var i: integer:=1 to n do // печать матрицы смежности
  begin
    for var j: integer:=1 to n do
      if c[i,j] then print('1') else print('0');
    println
  end;
  for var i: integer:=1 to n do // зануление матрицы инцидентности
    for var j: integer:=1 to k do
      d[i,j]:=0;
  k:=0;
  for var i: integer:=1 to n do
    for var j: integer:=1 to n do
    begin // перевычисление матрицы инцидентности
      if c[i,j] and (i=j) then
      begin // петли
        inc(k);
        d[i,k]:=2;
      end
      else if c[i,j] and c[j,i] and (i<j) then
      begin // рёбра
        inc(k);
        d[i,k]:=1;
        d[j,k]:=1
      end;
      if not c[i,j] and c[j,i] then
      begin // дуги
        inc(k);
        d[i,k]:=-1;
        d[j,k]:=1
      end
    end;
  for var i: integer:=1 to n do
  begin
    for var j: integer:=1 to k do
    begin // печать восстановленной матрицы инцидентности
      if d[i,j]>=0 then write(' ');
      print(d[i,j]);
    end;
    println
  end
end.
