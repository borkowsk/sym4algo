# Flock 1
## @date 2026-10-09 (translacja na Processing)

## Prosta symulacja agregacji / zbijania się "stada" cząstek.

Opis programu:
- na początku cząstki są rozmieszczone losowo w obszarze roboczym,
- w każdej iteracji każda cząstka wykonuje mały losowy ruch,
- następnie zbliża się do jednej losowo wybranej innej cząstki,
- dzięki temu cała grupa stopniowo się konsoliduje i tworzy gęstą, skupioną „kulę”.

Główne elementy modelu:
- `RandomPosition1` — losowa inicjalizacja w całym obszarze,
- `RandomPosition2` — inicjalizacja w kole o zadanym promieniu,
- `RandomMove` — losowe przemieszczanie cząstek,
- `FlockConsolidation` — zbliżanie do losowo wybranej cząstki,
- `MeanDistance` — średnia odległość między losowo wybranymi parami cząstek, używana do śledzenia stopnia skupienia stada.

W praktyce program pokazuje, jak bardzo prosta zasada lokalnego zbliżania może prowadzić do globalnej agregacji całej populacji.

To rozwiązanie jest zbliżone do prostych modeli flockingu / swarming, ale nie jest klasycznym modelem Boids. Brakuje tu bardziej zaawansowanych reguł separacji, kohezji i alignment, ale logika jest czytelna i dobrze nadaje się do edukacyjnej demonstracji.

Pliki:
- `../flock1.pas` — oryginalna wersja w Pascalu,
- `Flock1.pde` — wersja w języku Processing.

#### Opis wykonany przez Copilot
