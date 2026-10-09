// Trzymanie się najbliższego sąsiada - symulacja agentów
// Przetłumaczone za pomocą Copilota z pliku:
// https://github.com/borkowsk/sym4algo/blob/main/Classes/5_particles/flock6agents.pas

final int INIT_R = 50;
final int NUM_AGENTS = 200;
final int CANVAS_WIDTH = 500;
final int CANVAS_HEIGHT = 500;

final float R_CONST = 0.1;    // Współczynnik losowej zmiany prędkości 0..1
final float V_CONST = 1;      // Współczynnik zbliżania prędkości 1..20
final float C_CONST = 1;      // Współczynnik zbliżania pozycji 1..20
final float ZA_DUZO = 1000000;

class Agent {
  float x, y;    // Pozycja
  float vx, vy;  // Prędkość
  
  Agent() {
    x = 0;
    y = 0;
    vx = 0;
    vy = 0;
  }
}

Agent[] world;
float[][] distances;    // Macierz odległości
int stepCount = 0;

void settings() {
  size(500, 500);
}

void setup() {
  background(200, 255, 255);
  world = new Agent[NUM_AGENTS];
  distances = new float[NUM_AGENTS][NUM_AGENTS];
  
  // Inicjalizacja pozycji
  if (INIT_R > 0) {
    randomPositionCircle(0, NUM_AGENTS - 1, CANVAS_WIDTH / 2, CANVAS_HEIGHT / 2, INIT_R);
  } else {
    randomPositionUniform(0, NUM_AGENTS - 1);
  }
  
  // Inicjalizacja prędkości
  randomVelocity(0, NUM_AGENTS - 1);
  
  // Rysowanie granicy obszaru dozwolonego
  stroke(0, 0, 0);
  strokeWeight(1);
  noFill();
  rect(0, 0, CANVAS_WIDTH, CANVAS_HEIGHT);
  
  drawAll(0, NUM_AGENTS - 1, 0, 0, 0);
}

void draw() {
  // Czyszczenie - rysowanie w jasnym kolorze
  drawAll(0, NUM_AGENTS - 1, 228, 228, 128);
  
  // Zmiana prędkości na podstawie najbliższego sąsiada
  velocityChange(0, NUM_AGENTS - 1);
  
  // Przesuwanie na podstawie prędkości
  velocityMove(0, NUM_AGENTS - 1);
  
  // Rysowanie na nowych pozycjach
  drawAll(0, NUM_AGENTS - 1, 255, 15, 15);
  
  // Inkrementacja kroku
  stepCount++;
  
  // Czyszczenie obszaru z tekstem
  fill(255);
  noStroke();
  rect(10, 5, 100, 14);
  
  // Rysowanie nowego tekstu
  textAlign(LEFT, TOP);
  fill(0);
  textSize(14);
  text(stepCount + " " + nf(meanDistance(0, NUM_AGENTS - 1), 1, 2), 10, 5);
}

// ===== INICJALIZACJA POZYCJI =====

// Inicjalizacja pozycji - równomiernie losowe w całym obszarze
void randomPositionUniform(int first, int last) {
  for (int i = first; i <= last; i++) {
    world[i] = new Agent();
    world[i].x = 1 + random(CANVAS_WIDTH - 1);
    world[i].y = 1 + random(CANVAS_HEIGHT - 1);
  }
}

// Inicjalizacja pozycji w kole o promieniu r
void randomPositionCircle(int first, int last, int centerX, int centerY, int radius) {
  for (int i = first; i <= last; i++) {
    world[i] = new Agent();
    int rr = int(random(radius));
    float angle = random(TWO_PI);
    world[i].x = round(centerX + sin(angle) * rr);
    world[i].y = round(centerY + cos(angle) * rr);
  }
}

// Inicjalizacja prędkości
void randomVelocity(int first, int last) {
  for (int i = first; i <= last; i++) {
    world[i].vx = R_CONST / 2 - random(1.0) * R_CONST;
    world[i].vy = R_CONST / 2 - random(1.0) * R_CONST;
  }
}

// ===== RYSOWANIE =====

// Rysowanie punktów w zadanym kolorze
void drawAll(int first, int last, int r, int g, int b) {
  stroke(r, g, b);
  for (int i = first; i <= last; i++) {
    point(round(world[i].x), round(world[i].y));
  }
}

// ===== WALIDACJA =====

// Sprawdzanie czy punkt jest w obszarze dozwolonym
boolean inside(float x, float y) {
  return (0 < x) && (x < CANVAS_WIDTH) && (0 < y) && (y < CANVAS_HEIGHT);
}

// ===== MATEMATYKA =====

// Zwraca -1 jeśli ujemne, 1 jeśli dodatnie i 0 jeśli 0
int sign(float x) {
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

// Przesuwanie na podstawie prędkości
void velocityMove(int first, int last) {
  for (int i = first; i <= last; i++) {
    float dx = world[i].vx;
    float dy = world[i].vy;
    
    if (inside(world[i].x + dx, world[i].y + dy)) {
      world[i].x = world[i].x + dx;
      world[i].y = world[i].y + dy;
    }
  }
}

// Obliczanie macierzy odległości między wszystkimi agentami
void calculateDistances() {
  for (int i = 0; i < NUM_AGENTS; i++) {
    // Na przekątnej duże liczby - łatwiej będzie szukać najbliższego
    distances[i][i] = ZA_DUZO;
    
    // Obliczanie i zapisywanie macierzy odległości
    for (int j = i + 1; j < NUM_AGENTS; j++) {
      distances[i][j] = distance(world[i].x, world[i].y, world[j].x, world[j].y);
      distances[j][i] = distances[i][j];
    }
  }
}

// Znalezienie indeksu najbliższego agenta
// Zwraca indeks i zapisuje odległość w minDist
int findNearest(int i, float[] minDist) {
  minDist[0] = ZA_DUZO;
  int nearest = 0;
  
  for (int j = 0; j < NUM_AGENTS; j++) {
    if (distances[i][j] < minDist[0]) {
      minDist[0] = distances[i][j];
      nearest = j;
    }
  }
  
  return nearest;
}

// Zmiana prędkości - inteligentne i losowe modyfikacje wektorów prędkości
void velocityChange(int first, int last) {
  // Obliczenie wszystkich odległości
  calculateDistances();
  
  // Modyfikacja świata w oparciu o macierz odległości
  float[] minDist = new float[1];
  
  for (int i = first; i <= last; i++) {
    // Odnalezienie najbliższego sąsiada
    int p = findNearest(i, minDist);
    float d = minDist[0];
    
    // Upodobnienie prędkości agenta i do agenta p
    world[i].vx = world[i].vx - V_CONST * d * sign((int)(world[i].vx - world[p].vx));
    world[i].vy = world[i].vy - V_CONST * d * sign((int)(world[i].vy - world[p].vy));
    
    // Przyblizenie agenta i do agenta p
    world[i].vx = world[i].vx - C_CONST * d * sign((int)(world[i].x - world[p].x));
    world[i].vy = world[i].vy - C_CONST * d * sign((int)(world[i].y - world[p].y));
    
    // Losowa modyfikacja prędkości
    world[i].vx = world[i].vx + R_CONST * (0.5 - random(1.0));
    world[i].vy = world[i].vy + R_CONST * (0.5 - random(1.0));
  }
}

// ===== STATYSTYKI =====

// Średnia odległość wszystkich agentów
float meanDistance(int first, int last) {
  float sumDistance = 0.0;
  int count = 0;
  
  for (int i = first; i <= last; i++) {
    for (int j = i + 1; j <= last; j++) {
      float dist = distance(world[i].x, world[i].y, world[j].x, world[j].y);
      sumDistance += dist;
      count++;
    }
  }
  
  if (count > 0) {
    return sumDistance / count;
  } else {
    return -9999;
  }
}
