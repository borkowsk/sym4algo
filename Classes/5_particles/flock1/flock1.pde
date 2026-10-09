// Zbijanie się stada w kulę przez zbliżanie do jednej losowej cząstki.
// Przetłumaczone za pomocą Copilota z pliku:
// https://github.com/borkowsk/sym4algo/blob/main/Classes/5_particles/flock1.pas

final int INIT_R = 0;
final int NUM_PARTICLES = 200;
final int CANVAS_WIDTH = 500;
final int CANVAS_HEIGHT = 500;
final int MAX_MOVE = 5;

class Particle {
  int x, y;
  
  Particle() {
    x = 0;
    y = 0;
  }
  
  Particle(int x, int y) {
    this.x = x;
    this.y = y;
  }
}

Particle[] world;
int stepCount = 0;

void settings() {
  size(500, 500);
}

void setup() {
  background(200, 255, 255);
  world = new Particle[NUM_PARTICLES];
  
  // Inicjalizacja pozycji
  if (INIT_R > 0) {
    randomPositionCircle(0, NUM_PARTICLES - 1, CANVAS_WIDTH / 2, CANVAS_HEIGHT / 2, INIT_R);
  } else {
    randomPositionUniform(0, NUM_PARTICLES - 1);
  }
  
  // Rysowanie granicy obszaru dozwolonego
  stroke(255, 50, 50);
  strokeWeight(1);
  noFill();
  rect(0, 0, CANVAS_WIDTH, CANVAS_HEIGHT);
  
  // Rysowanie punktu w rogu
  stroke(255, 50, 50);
  point(CANVAS_WIDTH - 1, CANVAS_HEIGHT - 1);
  
  drawAll(0, NUM_PARTICLES - 1, 0, 0, 0);
}

void draw() {
  // Czyszczenie - rysowanie w jasnym kolorze
  drawAll(0, NUM_PARTICLES - 1, 200, 255, 255);
  
  // Przesuwanie
  randomMove(0, NUM_PARTICLES - 1);
  flockConsolidation(0, NUM_PARTICLES - 1);
  
  // Rysowanie na nowych pozycjach
  drawAll(0, NUM_PARTICLES - 1, 0, 0, 0);
  
  // Inkrementacja kroku
  stepCount++;
  
  // czyścimy obszar z tekstem
  fill(255);
  noStroke();
  rect(10, 20, 100, 14);
  // I dajemy nowy opis
  textAlign(LEFT,TOP);
  fill(0);
  textSize(14);
  text(stepCount + " " + nf(meanDistance(0, NUM_PARTICLES - 1, NUM_PARTICLES / 10), 1, 2), 10, 20);
}

// ===== INICJALIZACJA POZYCJI =====

// Inicjalizacja pozycji - równomiernie losowe w całym obszarze
void randomPositionUniform(int first, int last) {
  for (int i = first; i <= last; i++) {
    world[i] = new Particle();
    world[i].x = 1 + int(random(CANVAS_WIDTH - 1));
    world[i].y = 1 + int(random(CANVAS_HEIGHT - 1));
  }
}

// Inicjalizacja pozycji w kole o promieniu r
void randomPositionCircle(int first, int last, int centerX, int centerY, int radius) {
  for (int i = first; i <= last; i++) {
    world[i] = new Particle();
    int rr = int(random(radius));
    float angle = random(TWO_PI);
    world[i].x = round(centerX + sin(angle) * rr);
    world[i].y = round(centerY + cos(angle) * rr);
  }
}

// ===== RYSOWANIE =====

// Rysowanie punktów w zadanym kolorze
void drawAll(int first, int last, int r, int g, int b) {
  stroke(r, g, b);
  for (int i = first; i <= last; i++) {
    point(world[i].x, world[i].y);
  }
}

// ===== WALIDACJA =====

// Sprawdzanie czy punkt jest w obszarze dozwolonym
boolean inside(int x, int y) {
  return (0 < x) && (x < CANVAS_WIDTH) && (0 < y) && (y < CANVAS_HEIGHT);
}

// ===== MATEMATYKA =====

// Zwraca -1 jeśli ujemne, 1 jeśli dodatnie i 0 jeśli 0
int sign(int x) {
  if (x < 0) {
    return -1;
  } else if (x > 0) {
    return 1;
  } else {
    return 0;
  }
}

// Obliczanie odległości między dwoma punktami
float distance(float x1, float y1, float x2, float y2) {
  return sqrt(sq(x1 - x2) + sq(y1 - y2));
}

// ===== RUCH =====

// Losowe przemieszczanie
void randomMove(int first, int last) {
  for (int i = first; i <= last; i++) {
    int dx = MAX_MOVE / 2 - int(random(MAX_MOVE));
    int dy = MAX_MOVE / 2 - int(random(MAX_MOVE));
    
    if (inside(world[i].x + dx, world[i].y + dy)) {
      world[i].x = world[i].x + dx;
      world[i].y = world[i].y + dy;
    }
  }
}

// Zbijanie się stada - każda cząstka zbliża się do losowo wybranej innej
void flockConsolidation(int first, int last) {
  int range = last - first;
  
  for (int i = first; i <= last; i++) {
    // Wylosowanie cząsteczki do zbliżenia
    int targetIdx = first + int(random(range + 1));
    
    // Przyblizenie cząsteczki i do cząsteczki targetIdx
    world[i].x = world[i].x - sign(world[i].x - world[targetIdx].x);
    world[i].y = world[i].y - sign(world[i].y - world[targetIdx].y);
  }
}

// ===== STATYSTYKI =====

// Losowa próba odległości - średnia odległość w losowych parach
float meanDistance(int first, int last, int numSamples) {
  int range = last - first;
  float sumDistance = 0.0;
  
  for (int k = 0; k < numSamples; k++) {
    // Wylosowanie cząsteczek do pomiaru
    int p1 = first + int(random(range + 1));
    int p2 = first + int(random(range + 1));
    
    // Policzenie odległości
    float dist = distance(world[p1].x, world[p1].y, world[p2].x, world[p2].y);
    sumDistance = sumDistance + dist;
  }
  
  if (numSamples > 0) {
    return sumDistance / numSamples;
  } else {
    return -9999;
  }
}
