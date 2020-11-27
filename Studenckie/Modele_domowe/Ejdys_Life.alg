Program Life; 
{ gra w ¿ycie o parametrach 23/2
 Program symuluj¹cy grê w ¿ycie, wraz z rêcznym ustawianiem komórek
danego modelu nie by³o zaimplementowanego w algo, jedynie pseudolife 1D
W implementacji znajduje siê prosty mechanizm koñczenia programu,
gdy pojawiaj¹ siê elementy statyczne (np. 4 komórki tworz¹ce kwadrat),
albo gdy liczba ¿ywych komórek spada na planszy do 0
Aby rozpocz¹æ nale¿y ustawiæ przy pomocy myszki pocz¹tkowy stan uk³adu
a nastêpnie nacisn¹æ dowolny klawisz z klawiatury} 

const 
   size = 40; 
   cellSize = 10; 
   delayms = 20; 
var 
   cells: array[0..size, 0..size] of boolean; 
   cellsNext: array[0..size, 0..size] of boolean; 
   k, x, y:integer; 
   go:boolean; 

procedure init(); 

var 
   x, y:integer; 
Begin 
  for x := 0 to size do 
    for y := 0 to size do 
      begin 
        cells[y, x] := false; 
        cellsNext[y, x] := false; 
      end; 
End; 

procedure draw(); 

var 
   x, y:integer; 
begin 
  for x := 0 to size do 
    for y := 0 to size do 
      begin 
        if cells[y, x] = true then 
          begin 
            pen(1,255,255,255); 
            brush(1, 0, 0, 255); 
          end 
        else 
          begin 
            pen(1,0,0,0); 
            brush(1, 255, 255, 255); 
          end; 
        rectangle(x * cellSize + 1 , y * cellSize + 1, (x + 1) * cellSize , (y + 1) * cellSize); 
      end; 
end; 

function neighboorhood(y:integer; x:integer):integer; 

var 
   count:integer; 
   N, E, W, S:boolean; 
begin 
  count := 0; 
  if y - 1 >= 0 then 
    N := true 
  else 
    N := false; 
  if y + 1 <= size then 
    S := true 
  else 
    S := false; 
  if x - 1 >= 0 then 
    W := true 
  else 
    W := false; 
  if x + 1 <= size then 
    E := true 
  else 
    E := false; 
  {
  NW N NE
  
  W  .  E
  
  SW S SE
  } 
  if N and W then 
    if cells[y - 1, x - 1] then 
      count := count + 1; 
  if N then 
    if cells[y - 1, x] then 
      count := count + 1; 
  if N and E then 
    if cells[y - 1, x + 1] then 
      count := count + 1; 
  {} 
  if W then 
    if cells[y, x - 1] then 
      count := count + 1; 
  if E then 
    if cells[y, x + 1] then 
      count := count + 1; 
  {} 
  if S and W then 
    if cells[y + 1, x - 1] then 
      count := count + 1; 
  if S then 
    if cells[y + 1, x] then 
      count := count + 1; 
  if S and E then 
    if cells[y + 1, x + 1] then 
      count := count + 1; 
  neighboorhood := count; 
end; 


function step():integer; 

var 
   x, y, tmp, counter, xor:integer; 
Begin 
  counter := 0; 
  xor := 0; 
  for x := 0 to size do 
    for y := 0 to size do 
      begin 
        tmp := neighboorhood(y, x); 
        if cells[y, x] and ((tmp = 2) or (tmp = 3)) then 
          begin 
            cellsNext[y, x] := true ; 
            counter := counter + 1; 
          end 
        else 
          if not cells[y, x] and (tmp = 3) then 
            cellsNext[y, x] := true 
          else 
            cellsNext[y, x] := false; 
      end; 
  for x := 0 to size do 
    for y := 0 to size do 
      begin 
        if cells[y, x] <> cellsNext[y, x] then 
          xor := xor + 1; 
        cells[y, x] := cellsNext[y, x]; 
      end; 
  if xor <> 0 then 
    step := counter 
  else 
    step := 0; 
End; 

procedure run(); 

var 
   stop:boolean; 
   stepNumber:integer; 
begin 
  stepNumber := 0; 
  stop := false; 
  repeat 
    stop := (step = 0); 
    draw; 
    writeln(stepNumber); 
    stepNumber := stepNumber + 1; 
    delay(delayms); 
  until stop; 
end; 

Begin 
  init; 
  draw; 
  go := false; 
  repeat 
    repeat 
      if not go then 
        Event(k, x, y); 
      if not go and (k = 2) and ( (x div cellSize) <= size) and ( (y div cellSize) <= size) then 
        begin 
          cells[y div cellSize, x div cellSize] := not cells[y div cellSize, x div cellSize]; 
          draw; 
        end 
      else 
        if k = 1 then 
          begin 
            go := true; 
          end; 
    until go; 
    if go then 
      run; 
  until go or IsEvent; 
end.