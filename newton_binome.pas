// Newton Binome
function fact(n: integer): biginteger;
begin
  fact := 1;
  if (n > 1) then fact := fact(n-1)*n
end;
begin
  var m: integer := ReadInteger();
  var a: array of biginteger := new biginteger[m+1];
  for var i: integer := 0 to m do
    a[i] := fact(m) div (fact(i) * fact(m-i));
  println(a);
  println(fact(m))
end.

