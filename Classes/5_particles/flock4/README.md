# Flock 4
## @date 2026-10-09 (translacja na Processing)

## Bardziej zaawansowana symulacja flockingu z modelowaniem prędkości.

Opis programu:
- każda cząstka ma pozycję (x, y) i prędkość (vx, vy),
- w każdej iteracji każda cząstka zmienia swoją prędkość na podstawie zbliżenia do losowo wybranej innej cząstki,
- zmiana prędkości ma dwie składowe:
  - wyrównywanie prędkości (`V_CONST`) — zbliżanie się prędkościami,
  - zbliżanie pozycji (`C_CONST`) — zmiana prędkości w kierunku celu,
- dodatkowo prędkość jest losowo perturbowana (`R_CONST`) — aby uniknąć zbyt regularnych ruchów,
- cząstki podzielone są na dwie grupy (rysowane w różnych kolorach: żółty i różowy) dla lepszej wizualizacji.

Główne elementy modelu:
- `randomPositionCircle` — inicjalizacja w kole o zadanym promieniu,
- `randomVelocity` — losowa inicjalizacja wektorów prędkości,
- `velocityMove` — przesuwanie cząstek na podstawie ich prędkości,
- `velocityChange` — zmiana prędkości na podstawie oddalości do losowo wybranej cząstki,
- `meanDistance` — średnia odległość między losowo wybranymi parami, śledzenie stopnia skupienia.

Parametry do eksperymentów:
- `INIT_R` — promień początkowego koła (0 = losowe rozmieszczenie),
- `R_CONST` — losowość ruchu (większa = bardziej chaotyczne),
- `V_CONST` — siła wyrównywania prędkości (większa = szybsze wyrównanie),
- `C_CONST` — siła zbliżania się (większa = szybsze skupianie).

W porównaniu do Flock1, model jest znacznie bardziej realistyczny i zbliżony do klasycznego modelu Boids, choć nieco uproszczony. 
Obserwując dwie grupy cząstek, można zobaczyć interesujące dynamiki: najpierw chaos i rozproszenie, potem stopniowe grupowanie się.

Pliki:
- `../flock4.pas` — oryginalna wersja w Pascalu,
- `Flock4.pde` — wersja w języku Processing.

#### Opis wykonany przez Copilot
