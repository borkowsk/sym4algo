// Tłumaczenie programu na Processing (Java) z uwzględnieniem konwersji 
// polskojęzycznych identyfikatorów na ich angielskie odpowiedniki.   
// Zapis do pliku dziennika (log) został zrealizowany za pomocą klasy PrintWriter, 
// co jest standardowym rozwiązaniem w środowisku Processing.
/// Tłumaczenie za pomocą Gemini.
/// @date 2026-10-09 (...)

import java.io.PrintWriter;

int INIT_R = 0;
int LAST = 500;
int VIEW_WIDTH = 500;
int VIEW_HEIGHT = 500;
int MAX_MOVE = 5;
String LOG_NAME = "Particles5r0.log";

class Particle {
  int x, y;
  
  Particle(int x, int y) {
    this.x = x;
    this.y = y;
  }
}

Particle[] theWorld = new Particle[LAST + 1]; // Indeksowanie 1..LAST dla zachowania logiki Pascala

int step = 0;
float mDist;
PrintWriter logFile;

void setup() {
  size(501, 501);
  frameRate(30);
  
  // Otwarcie pliku dziennika
  logFile = createWriter(LOG_NAME);
  logFile.println("Symulacja dyfundujących cząsteczek");
  logFile.println("N;Init_R;Max_Move");
  logFile.println(LAST + ";" + INIT_R + ";" + MAX_MOVE);
  logFile.println();
  logFile.println("Step;MeanDist");
  logFile.flush();

  // Rysowanie obramowania obszaru
  stroke(0);
  noFill();
  rect(0, 0, VIEW_WIDTH, VIEW_HEIGHT);

  // Zaznaczenie rogu obszaru
  stroke(255, 50, 50);
  point(VIEW_WIDTH, VIEW_HEIGHT);

  // Inicjalizacja tablicy obiektów
  for (int i = 0; i <= LAST; i++) {
    theWorld[i] = new Particle(0, 0);
  }

  // Inicjalizacja pozycji cząsteczek
  if (INIT_R > 0) {
    randomPosition2(1, LAST, theWorld, VIEW_WIDTH / 2, VIEW_HEIGHT / 2, INIT_R);
  } else {
    randomPosition1(1, LAST, theWorld);
  }
  
  drawAll(1, LAST, theWorld, color(0, 0, 0));
}

// Zamknięcie pliku po zakończeniu działania programu
void exit() {
  if (logFile != null) {
    logFile.flush();
    logFile.close();
  }
  super.exit();
}

void draw() {
  // Czyszczenie poprzednich pozycji
  drawAll(1, LAST, theWorld, color(200, 255, 255));
  
  // Przemieszczenie cząsteczek
  randomMove(1, LAST, theWorld);
  
  // Rysowanie na nowych pozycjach
  drawAll(1, LAST, theWorld, color(0, 0, 0));
  
  // Aktualizacja statystyk
  step++;
  mDist = meanDistance(1, LAST, theWorld, LAST / 10);
  
  // Wyświetlanie informacji na konsoli oraz zapis do pliku
  println(step + " " + nf(mDist, 0, 2));
  logFile.println(step + ";" + mDist);
  logFile.flush();
}

void randomPosition1(int first, int last, Particle[] world) {
  for (int i = first; i <= last; i++) {
    world[i].x = 1 + int(random(VIEW_WIDTH - 1));
    world[i].y = 1 + int(random(VIEW_HEIGHT - 1));
  }
}

void randomPosition2(int first, int last, Particle[] world, int x, int y, int r) {
  for (int i = first; i <= last; i++) {
    int rr = int(random(r));
    float alpha = random(1.0) * 2 * TWO_PI;
    world[i].x = round(x + sin(alpha) * rr);
    world[i].y = round(y + cos(alpha) * rr);
  }
}

void drawAll(int first, int last, Particle[] world, color c) {
  stroke(c);
  for (int i = first; i <= last; i++) {
    point(world[i].x, world[i].y);
  }
}

boolean isInside(int x, int y) {
  return (0 < x) && (x < VIEW_WIDTH) && (0 < y) && (y < VIEW_HEIGHT);
}

void randomMove(int first, int last, Particle[] world) {
  for (int i = first; i <= last; i++) {
    int dx = (MAX_MOVE / 2) - int(random(MAX_MOVE));
    int dy = (MAX_MOVE / 2) - int(random(MAX_MOVE));
    
    if (isInside(world[i].x + dx, world[i].y + dy)) {
      world[i].x += dx;
      world[i].y += dy;
    }
  }
}

float distance(float x1, float y1, float x2, float y2) {
  return sqrt(sqr(x1 - x2) + sqr(y1 - y2));
}

float sqr(float val) {
  return val * val;
}

float meanDistance(int first, int last, Particle[] world, int sampleCount) {
  int span = last - first;
  float sum = 0;
  
  for (int k = 1; k <= sampleCount; k++) {
    int p1 = first + int(random(span));
    int p2 = first + int(random(span));
    
    float dist = distance(world[p1].x, world[p1].y, world[p2].x, world[p2].y);
    sum += dist;
  }
  
  return (sampleCount > 0) ? (sum / sampleCount) : -9999;
}
