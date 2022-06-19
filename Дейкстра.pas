const a: array[1..6,1..6] of integer =((0,12,0,10,0,22),(12,0,4,22,0,0),(0,4,0,17,9,0),(10,22,17,0,11,15),(0,0,9,11,0,6),(22,0,0,15,6,0));
begin
  var b: array[1..6] of integer; // массив кратчайших значений
  for var i: integer:=2 to 6 do
    b[i]:=Integer.MaxValue; // присвоение бесконечностей всем вершинам, кроме первой
  for var i: integer:=1 to 6 do
    for var j: integer:=i to 6 do
    begin
      if a[i,j]<>0 then b[j]:=min((b[i]+a[i,j]),b[j]) // нахождение кратчайшего пути по алгоритму Дейкстры
    end;
  println(b);
  var c: array[1..6,1..6] of boolean;
  for var i: integer:=1 to 6 do
    for var j: integer:=1 to 6 do
      if a[i,j]<>0 then c[i,j]:=True; // построение матрицы смежности
  var d: array[1..6,1..21] of boolean;
  var k: byte:=1;
  for var i: integer:=1 to 6 do // построение матрицы инцидентности
    for var j: integer:=i to 6 do
    begin
      if c[i,j] then
      begin
        d[i,k]:=True;
        d[j,k]:=True;
        inc(k);
      end
    end;
  dec(k);
  println(k,'связей в графе');
  for var i: integer:=1 to 6 do // вывод матрицы инцидентности без нулевых столбцов
  begin
    for var j: integer:=1 to k do
      if d[i,j] then print('1') else print('0');
    println
  end
end.