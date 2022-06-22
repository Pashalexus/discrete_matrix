const n = 7; // константу можно менять в зависимости от числа вершин графа
var c: array[1..n, 1..n] of Boolean;
var d: array[1..n, 1..n*n+n] of ShortInt;
begin
  println('                  Министерство науки и высшего образования РФ                  ');
  println('                         ФГБОУ ВО РГРТУ им. В.Ф.Уткина                         ');
  println('                                Кафедра САПР ВС                                ');
  println('                                  Рязань 2022                                  ');
  println('Программа по переводу матрицы смежности графа в матрицу инцидентности и обратно');
  for var i: integer:=1 to n do
    for var j: integer:=1 to n do
    begin // ввод матрицы смежности
      print('c [',i,',',j,'] =');
      var m:=ReadInteger();
      if (m=1) then c[i,j]:=True;
      if (m=0) then c[i,j]:=False
    end;
  var k: byte; // номер столбца матрицы инцидентности
  for var i: integer:=1 to n do
    for var j: integer:=1 to n do
    begin // вычисление матрицы инцидентности
      if c[i,j] and (i=j) then // петли
      begin
        inc(k);
        d[i,k]:=2
      end
      else if c[i,j] and c[j,i] and (i<j) then
      begin // рёбра
        inc(k);
        d[i,k]:=1;
        d[j,k]:=1
      end;
      if c[i,j] and not c[j,i] then
      begin // дуги
        inc(k);
        d[i,k]:=1;
        d[j,k]:=-1
      end
    end;
  for var i: integer:=1 to n do
  begin
    for var j: integer:=1 to k do
    begin // печать матрицы инцидентности
      if d[i,j]>=0 then write(' ');
      print(d[i,j]);
    end;
    println
  end;
  println;
  for var i: integer:=1 to n do
    for var j: integer:=1 to n do
      c[i,j]:=False; // зануление матрицы смежности
  for var i:Integer:=1 to n do
    for var j:Integer:=1 to n do
      for var k1:Integer:=1 to k do
      begin // перевычисление матрицы смежности
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
  for var i: integer:=1 to n do // печать восстановленной матрицы смежности
  begin
    for var j: integer:=1 to n do
      if c[i,j] then print('1') else print('0');
    println
  end
end.
