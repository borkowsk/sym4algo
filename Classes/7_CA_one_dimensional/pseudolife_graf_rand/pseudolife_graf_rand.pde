// Program naśladuje w jednowymiarowym automacie komórkowym Life Conwaya (ale słabo mu to wychodzi).
/// Przetłumaczony za pomoca Gemini
/// @date 2026-10-09 (...)

final int ARRAY_SIZE = 301;  // Rozmiar tablicy - Musi być większe niż 1 i nieparzyste
final int MAX_STEPS = 750;   // Ile kroków można wykonać 
final boolean IS_RANDOM = true;
final float PROBABILITY = 0.45;

int[] world = new int[ARRAY_SIZE + 1];     // Indeksowanie 1..ARRAY_SIZE
int[] newWorld = new int[ARRAY_SIZE + 1];  // Indeksowanie 1..ARRAY_SIZE

void settings(){
    size(ARRAY_SIZE+2,MAX_STEPS+50);
    noSmooth();
}

void setup() {
  background(255);

  resetWorld();
  // Żeby nie komplikować inicjacja w kodzie
  // world[1] = 1;
  world[(ARRAY_SIZE + 1) / 2] = 1;
  
  if (IS_RANDOM) {
    randomizeWorld();
  }
  
  textAlign(LEFT,TOP);fill(0);
  text("Automat: jednowymiarowe \"Życie\" o " + ARRAY_SIZE + " komórkach",5,0);
  println("Automat: jednowymiarowe \"Życie\" o " + ARRAY_SIZE + " komórkach");
}

int step=1;
void draw(){
  if(step <= MAX_STEPS){
    drawCurrentState();
    printStateToCanvas(25 + step);
    stepSimulation();
    copyWorldState();
    step++;
  }
  else if(step==MAX_STEPS+1)
  {
    println();
    println("Dziękuje i polecam się na przyszłość");
    textAlign(LEFT,BOTTOM);fill(0);
    text("Zrobione",5,height-5);
    step++;
  }
}

void resetWorld() {
  // Wyzerowanie "Swiata" aktualnego
  for (int i = 1; i <= ARRAY_SIZE; i++) {
    world[i] = 0;
  }
}

void randomizeWorld() {
  // Wylosowanie "Swiata" aktualnego
  for (int i = 1; i <= ARRAY_SIZE; i++) {
    if (random(1.0) < PROBABILITY) {
      world[i] = 0;
    } else {
      world[i] = 1;
    }
  }
}

void printStateToCanvas(int lineY) {
  // Wypisywanie na okno
  for (int i = 1; i <= ARRAY_SIZE; i++) {
    if (world[i] == 0) {
      stroke(0, 0, 0);
    } else {
      stroke(255, 0, 0);
    }
    point(i, lineY);
  }
}

void drawCurrentState() {
  // Wypisywanie na okno
  for (int i = 1; i <= ARRAY_SIZE; i++) {
    if (world[i] == 0) {
      stroke(0, 0, 1);
    } else {
      stroke(255, 255, 0);
    }
    line(i, 15, i, 24);
  }
}

void copyWorldState() {
  // Przepisywanie z "NowySwiat" na "Swiat" aktualny
  for (int i = 1; i <= ARRAY_SIZE; i++) {
    world[i] = newWorld[i];
  }
}

void stepSimulation() {
  // Własciwy krok modelu
  int i, j, k; //< indeks lewej, środkowej i prawej komorki
  int neighborCount; //< licznik żywych sąsiadów.

  for (j = 1; j <= ARRAY_SIZE; j++) {
    neighborCount = 0;
    i = j - 1;
    k = j + 1;

    if ((i > 0) && (world[i] > 0)) {
      neighborCount++;
    }
    if ((k <= ARRAY_SIZE) && (world[k] > 0)) {
      neighborCount++;
    }

    // Komórka staje sie lub pozostaje żywa tylko gdy ma dokładnie jednego zywego sąsiada.
    if (neighborCount == 1) {
      newWorld[j] = 1;
    } else {
      newWorld[j] = 0;
    }
  }
}
