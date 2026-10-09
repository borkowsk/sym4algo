// W Processingu pętla główna działa automatycznie wewnątrz funkcji draw(), 
// co pozwala wyeliminować sztuczne opóźnienia typu Delay(50) i zapętlenia 
// while not IsEvent. 
// Funkcja ellipseMode(CORNERS) umożliwia rysowanie elips dokładnie według 
// współrzędnych przeciwległych rogów, tak jak robiono to w starych procedurach 
// graficznych Pascala.
// Tłumaczone przez Gemini.
/// @date 2026-10-09 (ostatnia modyfikacja)
/// @note Ze względu na wystepowanie polskich liter w identyfikatorach
///       nie działa w processingu 3.x
final int Skok = 10;

void setup() {
  size(300, 300);
  ellipseMode(CORNERS); // Dopasowanie trybu rysowania elipsy do Pascala (x1, y1, x2, y2)
  frameRate(20);        // Zastępuje opóźnienie Delay(50) — około 20 klatek na sekundę
  
  // Pierwsze narysowanie "pawiego oczka"
  Narysuj(150, 150, 150, 10);
}

void draw() {
  // Pętla draw() wykonuje się w nieskończoność (odpowiednik: While not IsEvent w Pascalu)
  Zmień(150, 150, 150, 10);
}

void wylosuj_wypełnienie() {
  float r = random(256);
  float g = random(256);
  float b = random(256);
  fill(r, g, b);
}

void Narysuj(int x, int y, int r, int s) {
  for (int i = 1; i <= s; i++) {
    wylosuj_wypełnienie();
    // Odpowiednik Pascalowego: Ellipse(x-r+i*Skok, y-r+i*Skok*2, x+r-i*Skok, y+r)
    ellipse(x - r + i * Skok, y - r + i * Skok * 2, x + r - i * Skok, y + r);
  }
}

void Zmień(int x, int y, int r, int s) {
  // Ponowne przerysowanie warstw z nowymi losowymi kolorami
  for (int i = 1; i <= s; i++) {
    wylosuj_wypełnienie();
    ellipse(x - r + i * Skok, y - r + i * Skok * 2, x + r - i * Skok, y + r);
  }
}
