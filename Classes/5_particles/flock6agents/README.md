# Flock 6 agents
## @date 2026-10-09 (translacja na Processing)

## Trzymanie się najbliższego sąsiada — model agentów z macierzą odległości.

Opis programu:
- każda cząstka ma pozycję (x, y) i wektor prędkości (vx, vy),
- w każdej iteracji agent szuka najbliższego sąsiada,
- na tej podstawie zmienia własną prędkość:
  - upodabnia się do sąsiada prędkością,
  - przesuwa się w jego kierunku,
  - dodatkowo otrzymuje małą losową perturbację,
- dzięki temu cała populacja tworzy lokalne skupiska i zachowuje się bardziej „inteligentnie" niż w prostszych modelach agregacji.

Główne elementy modelu:
- `randomPositionCircle` — inicjalizacja w kole o zadanym promieniu,
- `randomVelocity` — losowa inicjalizacja wektorów prędkości,
- `calculateDistances` — obliczenie macierzy odległości między wszystkimi agentami,
- `findNearest` — znalezienie najbliższego sąsiada,
- `velocityChange` — modyfikacja prędkości na podstawie najbliższego sąsiada,
- `velocityMove` — przesuwanie agentów zgodnie z wektorem prędkości,
- `meanDistance` — średnia odległość między parami agentów, używana do śledzenia stopnia skupienia.

Parametry do eksperymentów:
- `INIT_R` — promień początkowego koła (0 = losowe rozmieszczenie),
- `R_CONST` — losowość ruchu i prędkości,
- `V_CONST` — siła wyrównywania prędkości do najbliższego sąsiada,
- `C_CONST` — siła przyciągania do sąsiada.

W porównaniu do prostych modeli Flock1/Flock4, ta wersja jest bardziej „sieciowa" i „lokalna": każdy agent działa na podstawie informacji o najbliższym sąsiedzie, a nie tylko losowej jednej cząstce lub losowego sygnału. To daje bardziej uporządkowaną, choć nadal złożoną dynamikę zgromadzenia.

Pliki:
- `../flock6agents.pas` — oryginalna wersja w Pascalu,
- `flock6agents.pde` — wersja w języku Processing.

#### Opis wykonany przez Copilot
