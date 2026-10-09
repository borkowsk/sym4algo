// Losowy ruch cząstek
// Przetłumaczone za pomocą Copilota z pliku:
// https://github.com/borkowsk/sym4algo/blob/main/Classes/5_particles/particles1.pas
//
// Ważne:
// - historia ruchu ma być zachowana na tle okna,
// - tekst ma być usuwany tylko w małym obszarze,
// - textAlign(LEFT, TOP) jest ustawione, aby zachować podobny efekt do ALGO/Pascal.

final int NUM_PARTICLES = 100;
final int CANVAS_WIDTH = 500;
final int CANVAS_HEIGHT = 500;
final int MAX_MOVE = 11;

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
  randomPosition(0, NUM_PARTICLES - 1);
  
  drawAll(0, NUM_PARTICLES - 1, 0, 0, 0);
}

void draw() {
  // Czyszczenie - rysowanie w białym kolorze (efekt usunięcia poprzedniego położenia)
  drawAll(0, NUM_PARTICLES - 1, 255, 255, 255);
  
  // Losowe przesuwanie
  randomMove(0, NUM_PARTICLES - 1);
  
  // Rysowanie na nowych pozycjach
  drawAll(0, NUM_PARTICLES - 1, 0, 0, 0);
  
  // Inkrementacja kroku
  stepCount++;
  
  // Czyszczenie obszaru z tekstem
  fill(255);
  noStroke();
  rect(10, 5, 80, 15);
  
  // Rysowanie nowego tekstu
  textAlign(LEFT, TOP);
  fill(0);
  textSize(14);
  text("Step: " + stepCount, 10, 5);
  
  // Opóźnienie (analogicznie do delay(80) w oryginalnym kodzie)
  frameRate(12);
}

// ===== INICJALIZACJA POZYCJI =====

// Losowa inicjalizacja pozycji
void randomPosition(int first, int last) {
  for (int i = first; i <= last; i++) {
    world[i] = new Particle();
    world[i].x = int(random(CANVAS_WIDTH));
    world[i].y = int(random(CANVAS_HEIGHT));
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

// ===== RUCH =====

// Losowe przesuwanie cząstek
void randomMove(int first, int last) {
  for (int i = first; i <= last; i++) {
    int dx = MAX_MOVE / 2 - int(random(MAX_MOVE));
    int dy = MAX_MOVE / 2 - int(random(MAX_MOVE));
    
    world[i].x = world[i].x + dx;
    world[i].y = world[i].y + dy;
  }
}
