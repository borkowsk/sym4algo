// Zbliżanie się i upodabnianie prędkości - wersja bardziej zaawansowana niż Flock1
// Przetłumaczone za pomocą Copilota z pliku:
// https://github.com/borkowsk/sym4algo/blob/main/Classes/5_particles/flock4.pas

final int INIT_R = 250;    // Promień początkowego koła
final int NUM_PARTICLES = 600;
final int CANVAS_WIDTH = 500;
final int CANVAS_HEIGHT = 500;
final float MAX_MOVE = 0.9;    // Współczynnik losowej zmiany prędkości 0..1
final float R_CONST = 0.5;     // Współczynnik losowości 1..20
final float V_CONST = 15;      // Współczynnik zbliżania prędkości 1..20
final float C_CONST = 15;      // Współczynnik zbliżania pozycji

class Particle {
  float x, y;    // Pozycja
  float vx, vy;  // Prędkość
  
  Particle() {
    x = 0;
    y = 0;
    vx = 0;
    vy = 0;
  }
  
  Particle(float x, float y, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
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
  
  // Inicjalizacja prędkości
  randomVelocity(0, NUM_PARTICLES - 1);
  
  // Rysowanie granicy obszaru dozwolonego
  stroke(0, 0, 0);
  strokeWeight(1);
  noFill();
  rect(0, 0, CANVAS_WIDTH, CANVAS_HEIGHT);
  
  drawAll(0, NUM_PARTICLES - 1, 0, 0, 0);
}

void draw() {
  // Czyszczenie - rysowanie w jasnym kolorze (pierwsza połowa - żółty, druga - różowy)
  drawAll(0, NUM_PARTICLES / 2 - 1, 250, 255, 0);
  drawAll(NUM_PARTICLES / 2, NUM_PARTICLES - 1, 255, 200, 250);
  
  // Zmiana prędkości
  velocityChange(0, NUM_PARTICLES / 2 - 1);
  velocityChange(NUM_PARTICLES / 2, NUM_PARTICLES - 1);
  
  // Przesuwanie na podstawie prędkości
  velocityMove(0, NUM_PARTICLES - 1);
  
  // Rysowanie na nowych pozycjach
  drawAll(0, NUM_PARTICLES / 2 - 1, 25, 25, 0);
  drawAll(NUM_PARTICLES / 2, NUM_PARTICLES - 1, 50, 0, 50);
  
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
    world[i].x = 1 + random(CANVAS_WIDTH - 1);
    world[i].y = 1 + random(CANVAS_HEIGHT - 1);
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

// Inicjalizacja prędkości
void randomVelocity(int first, int last) {
  for (int i = first; i <= last; i++) {
    world[i].vx = MAX_MOVE / 2 - random(MAX_MOVE);
    world[i].vy = MAX_MOVE / 2 - random(MAX_MOVE);
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

// Zmiana prędkości - zbliżanie się i upodabnianie prędkości
void velocityChange(int first, int last) {
  int range = last - first;
  
  for (int i = first; i <= last; i++) {
    // Wylosowanie cząsteczki do zbliżenia
    int targetIdx = first + int(random(range + 1));
    
    // Obliczenie odległości
    float d = distance(world[i].x, world[i].y, world[targetIdx].x, world[targetIdx].y);
    
    if (d > 0) {
      // Upodobnienie prędkości cząsteczki i do cząsteczki targetIdx
      world[i].vx = world[i].vx - V_CONST / d * sign((int)(world[i].vx - world[targetIdx].vx));
      world[i].vy = world[i].vy - V_CONST / d * sign((int)(world[i].vy - world[targetIdx].vy));
      
      // Przyblizenie cząsteczki i do cząsteczki targetIdx
      world[i].vx = world[i].vx - C_CONST / d * sign((int)(world[i].x - world[targetIdx].x));
      world[i].vy = world[i].vy - C_CONST / d * sign((int)(world[i].y - world[targetIdx].y));
    }
    
    // Losowa modyfikacja prędkości
    world[i].vx = world[i].vx + R_CONST * (0.5 - random(1.0));
    world[i].vy = world[i].vy + R_CONST * (0.5 - random(1.0));
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
