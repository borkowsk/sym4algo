# Particles 1
## @date 2026-10-09 (translacja na Processing)

## Prosty model losowego ruchu cząstek.

Opis programu:
- cząstki są inicjalizowane w losowych pozycjach w obszarze roboczym,
- w każdej iteracji każda cząstka wykonuje mały losowy ruch (w zakresie od `-MAX_MOVE/2` do `+MAX_MOVE/2` pikseli),
- cząstka porusza się niezależnie od innych — brak żadnych interakcji między nimi,
- historia ruchu jest rysowana na tle (stare pozycje są usuwane białym kolorem, nowe pozycje czarnym),
- na ekranie wyświetlany jest numer bieżącego kroku.

Główne elementy modelu:
- `randomPosition` — losowa inicjalizacja pozycji cząstek,
- `randomMove` — losowe przesuwanie każdej cząstki,
- `drawAll` — rysowanie cząstek w zadanym kolorze.

Parametry do eksperymentów:
- `NUM_PARTICLES` — liczba cząstek (domyślnie 100),
- `MAX_MOVE` — maksymalny zasięg losowego ruchu w jednym kroku (domyślnie 11),
- `CANVAS_WIDTH` / `CANVAS_HEIGHT` — rozmiar obszaru roboczego (500 x 500).

To jest najbardziej elementarny model w serii — cząstki poruszają się zupełnie niezależnie i losowo, bez żadnych reguł agregacji, unikania kolizji czy interakcji z innymi agentami. Jest to punkt wyjścia do bardziej zaawansowanych symulacji.

Pliki:
- `../particles1.pas` — oryginalna wersja w Pascalu,
- `particles1.pde` — wersja w języku Processing.

#### Opis wykonany przez Copilot
