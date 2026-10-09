// Model epidemii kataru w sieci społecznej.
/// Przetłumaczony z ALGO PASCAL-a za pomocą Gemini
/// @date 2026-10-09 (...)

class Node {
  float x, y;
  int state;

  Node(float x, float y, int state) {
    this.x = x;
    this.y = y;
    this.state = state;
  }
}

// STAŁE
final int LAST = 20;            // Ile węzłów
final float E_RATIO = 0.25;     // Ile połączeń istnieje realnie
final int INTENSITY = 50;       // Last*n - Ile możliwości interakcji każdego dnia
final int DURATION = 7;         // Czas trwania infekcji
final int IMMUNITY = 31;        // Czas istnienia odporności
final boolean WEIGHTED = false; // Czy połączenia ważone?

final int RADIUS = 10;          // Rozmiar węzła w wizualizacji
final int VIEW_WIDTH = 400;     // Bok ekranu
final boolean IS_RING = true;   // Czy węzły ułożone w kółko?

// ZMIENNE GLOBALNE
Node[] nodes = new Node[LAST + 1];                  // Tablica węzłów (indeksowanie 1..LAST)
float[][] edges = new float[LAST + 1][LAST + 1];     // Tablica połączeń
int step = 0;
int infectedCount = 0;
int immuneCount = 0;

void setup() {
  size(400, 400);
  ellipseMode(CORNERS);
  frameRate(2); // Odpowiednik Delay(500) - 2 klatki na sekundę

  cleanArrays();

  if (IS_RING) {
    ringPositions();
  } else {
    randomPosition();
  }

  if (WEIGHTED) {
    weightedEdges();
  } else {
    randomEdges(E_RATIO);
  }

  // Wprowadzenie infekcji
  nodes[1].state = 1;
}

void draw() {
  background(255);

  calculateStat();
  
  // Wypisywanie statystyk na konsoli
  println("day: " + step + " inf: " + infectedCount + " imm: " + immuneCount);

  viewGraph();

  // Sprawdzanie warunku zakończenia epidemii
  if (infectedCount == 0 && step > 0) {
    println("Koniec epidemii!");
    noLoop(); // Zatrzymaj pętlę draw()
    return;
  }

  // Nowy stan
  step++;
  timeSlice();
}

void cleanArrays() {
  // Czyszczenie struktur danych
  for (int i = 1; i <= LAST; i++) {
    nodes[i] = new Node(0, 0, 0);
    for (int j = 1; j <= LAST; j++) {
      edges[i][j] = 0;
    }
  }
}

void randomPosition() {
  // Nadawanie węzłom losowych pozycji
  for (int i = 1; i <= LAST; i++) {
    nodes[i].x = random(1.0);
    nodes[i].y = random(1.0);
  }
}

void ringPositions() {
  // Nadawanie węzłom pozycji na okręgu
  for (int i = 1; i <= LAST; i++) {
    float alpha = ((2 * TWO_PI) / LAST) * i;
    nodes[i].x = 0.5 + cos(alpha) / 2.2;
    nodes[i].y = 0.5 + sin(alpha) / 2.2;
  }
}

void randomEdges(float ratio) {
  // Losowe połączenia o pełnej sile
  for (int i = 2; i <= LAST; i++) {
    for (int j = 1; j < i; j++) {
      if (random(1.0) < ratio) {
        edges[i][j] = 1.0;
      }
    }
  }
}

void weightedEdges() {
  // Ważone połączenia z małym prawdopodobieństwem dużej wagi
  for (int i = 2; i <= LAST; i++) {
    for (int j = 1; j < i; j++) {
      float r = random(1.0);
      edges[i][j] = r * r * r;
    }
  }
}

void viewGraph() {
  // PROCEDURA WIZUALIZACJI GRAFU

  // Najpierw rysuje krawędzie, a potem przykrywa centra węzłów "talerzykami"
  // Krawędzie:
  for (int i = 2; i <= LAST; i++) {
    for (int j = 1; j < i; j++) {
      if (edges[i][j] > 0) {
        int x1 = rescale(nodes[i].x, 0, 1, VIEW_WIDTH);
        int y1 = rescale(nodes[i].y, 0, 1, VIEW_WIDTH);
        int x2 = rescale(nodes[j].x, 0, 1, VIEW_WIDTH);
        int y2 = rescale(nodes[j].y, 0, 1, VIEW_WIDTH);
        
        setEdgeColor(edges[i][j], 0, 1);
        strokeWeight(2);
        line(x1, y1, x2, y2);
      }
    }
  }

  // Węzły:
  strokeWeight(1);
  for (int i = 1; i <= LAST; i++) {
    int x1 = rescale(nodes[i].x, 0, 1, VIEW_WIDTH);
    int y1 = rescale(nodes[i].y, 0, 1, VIEW_WIDTH);
    x1 = x1 - RADIUS;
    y1 = y1 - RADIUS;
    int x2 = x1 + 2 * RADIUS;
    int y2 = y1 + 2 * RADIUS;
    
    setNodeFill(nodes[i].state);
    ellipse(x1, y1, x2, y2);
  }
}

void setEdgeColor(float v, float minVal, float maxVal) {
  // Podprocedura: Kolor krawędzi - szary, zależny od wagi
  v = (v - minVal) / (maxVal - minVal);
  v = v * 255;
  stroke(round(255 - v));
}

void setNodeFill(int v) {
  // Podprocedura: Kolor węzła zależny od stanu
  if (v == 0) {
    fill(0, 0, 155);
    stroke(0, 0, 155);
  } else if (v < DURATION) {
    v = round(255 - (float)(v - 1) / (DURATION - 1) * 155);
    fill(v, 0, 0);
    stroke(v, 0, 0);
  } else {
    v = round(255 - (float)(v - DURATION) / (DURATION + IMMUNITY - DURATION) * 155);
    fill(0, v, 0);
    stroke(0, v, 0);
  }
}

int rescale(float v, float minVal, float maxVal, int imax) {
  // Podprocedura a właściwie funkcja reskalująca dane
  v = (v - minVal) / (maxVal - minVal);
  return round(imax * v);
}

void smallStep() {
  // Pojedyncza interakcja pomiędzy węzłami
  int i = 1 + int(random(LAST));
  int j;

  // Losowanie 2. partnera różnego od 1
  do {
    j = 1 + int(random(LAST));
  } while (i == j);

  // Przestawianie partnerów bo połączenia są symetryczne
  if (i < j) {
    int temp = i;
    i = j;
    j = temp;
  }

  float w = edges[i][j];

  // Infekcja z j na i
  if (w > 0) {
    if ((nodes[i].state == 0) && (nodes[j].state > 0) && (nodes[j].state < DURATION) && (random(1.0) < w)) {
      nodes[i].state = 1;
    }
  } else { // ...i z i na j
    if ((nodes[j].state == 0) && (nodes[i].state > 0) && (nodes[i].state < DURATION) && (random(1.0) < w)) {
      nodes[j].state = 1;
    }
  }
}

void timeSlice() {
  // Upływ czasu - synchroniczna zmiana stanów, infekcja losowa
  for (int i = 1; i <= LAST; i++) {
    if (nodes[i].state > 0) {
      nodes[i].state = (nodes[i].state + 1) % (DURATION + IMMUNITY);
    }
  }

  // Infekcja
  for (int i = 1; i <= INTENSITY; i++) {
    smallStep();
  }
}

void calculateStat() {
  // Obliczanie statystyki
  infectedCount = 0;
  immuneCount = 0;

  for (int i = 1; i <= LAST; i++) {
    if (nodes[i].state > 0) {
      if (nodes[i].state < DURATION) {
        infectedCount++;
      } else {
        immuneCount++;
      }
    }
  }
}
