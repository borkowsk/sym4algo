// Program został przeniesiony z Pascala do środowiska Processing (Java). 
// Struktura procedur, algorytmy generowania liczb oraz tworzenia i rysowania 
// histogramu zostały zachowane, a specyficzne dla starych środowisk pascalowych 
// rozwiązania (np. dzielenie przez zero w celach obsługi błędów) zastąpiono 
// standardowym mechanizmem wyciągania błędów w Java/Processing 
// (throw new RuntimeException).
// Tłumaczone z ALGO PASCAL-a za pomocą Gemini.
// @date 2026-10-09 (ostatnia modyfikacja)

int LastData = 10000;
int LastHist = 100;
float HistHeight = 500;

float[] TheData = new float[LastData];
int[] TheHist = new int[LastHist + 2]; // Dodatkowy element na "pierwszy za"

float TheMin, TheMax;

void setup() {
  size(800, 800);
  background(255);
  noLoop(); // Program wykonuje się jednorazowo w setup
  
  println("Różne losowania i ich statystyki");
  println("--------------------------------");

  // 1. Losowanie z zakresu <-4, 3>
  println("A. Losowanie z zakresu <-4,3>");
  RandomIntRange(TheData, LastData, -4, 3);
  float[] minMax = MinMax(TheData, LastData);
  TheMin = minMax[0];
  TheMax = minMax[1];
  
  fill(0, 128, 0);
  println("Min=" + nf(TheMin, 0, 0) + " Max=" + nf(TheMax, 0, 0));
  
  MakeHistogramInt(TheData, LastData, int(TheMin), int(TheMax), TheHist);
  DrawHistogram(TheHist, int(TheMax - TheMin + 1), color(0, 0, 255), 50, 50); text("A",50,50);

  // 2. Losowanie z zakresu <-5.5, 5.5>
  println("B. Losowanie z zakresu <-5.5,5.5>");
  RandomRange(TheData, LastData, -5.5, 5.5);
  minMax = MinMax(TheData, LastData);
  TheMin = minMax[0];
  TheMax = minMax[1];
  
  fill(0, 128, 0);
  println("Min=" + nf(TheMin, 0, 10) + " Max=" + nf(TheMax, 0, 10));
  
  MakeHistogram(TheData, LastData, TheMin, TheMax, TheHist, 10);
  DrawHistogram(TheHist, 10, color(0, 0, 255), 50, 200);  text("B",50,200);

  // 3. Losowanie 1/random
  println("C. Losowanie 1/random");
  RandomQuotient(TheData, LastData);
  minMax = MinMax(TheData, LastData);
  TheMin = minMax[0];
  TheMax = minMax[1];
  
  println("Min=" + nf(TheMin, 0, 10) + " Max=" + nf(TheMax, 0, 10));

  // 4. Suma 3 funkcji Random
  println("D. Suma 3 funkcji Random");
  RandomSumm(TheData, LastData, 3);
  minMax = MinMax(TheData, LastData);
  println("Min=" + nf(minMax[0], 0, 10) + " Max=" + nf(minMax[1], 0, 10));

  // 5. Suma 9 funkcji Random
  println("E. Suma 9 funkcji Random");
  RandomSumm(TheData, LastData, 9);
  minMax = MinMax(TheData, LastData);
  println("Min=" + nf(minMax[0], 0, 10) + " Max=" + nf(minMax[1], 0, 10));

  // 6. Rozkład pseudonormalny (9 funkcji Random)
  println("F. Rozkład pseudonormalny (9 funkcji Random) w zakresie <-5.5,5.5>");
  RandomPseudoNorm(TheData, LastData, 9, -5.5, 5.5);
  minMax = MinMax(TheData, LastData);
  TheMin = minMax[0];
  TheMax = minMax[1];
  
  println("Min=" + nf(TheMin, 0, 10) + " Max=" + nf(TheMax, 0, 10));
  
  MakeHistogram(TheData, LastData, TheMin, TheMax, TheHist, 10);
  DrawHistogram(TheHist, 10, color(0, 0, 255), 50, 390);  text("F",50,390);

  // 7. Rozkład ukośny (6 funkcji Random)
  println("G. Rozkład ukośny (6 funkcji Random) w zakresie <-5.5,5.5>");
  RandomProduct(TheData, LastData, 6, -5.5, 5.5);
  minMax = MinMax(TheData, LastData);
  TheMin = minMax[0];
  TheMax = minMax[1];
  
  println("Min=" + nf(TheMin, 0, 10) + " Max=" + nf(TheMax, 0, 10));
  
  MakeHistogram(TheData, LastData, TheMin, TheMax, TheHist, 10);
  DrawHistogram(TheHist, 10, color(0, 0, 255), 50, 570);  text("G",50,570);
}

void ErrorMsg(String message) {
  println(message);
  throw new RuntimeException(message);
}

void RandomIntRange(float[] Tab, int N, int ranges, int rangee) {
  if (ranges >= rangee) {
    ErrorMsg("Zakres losowania nieprawidłowy");
  }
  int r = rangee - ranges + 1;
  for (int i = 0; i < N; i++) {
    Tab[i] = ranges + floor(random(r));
  }
}

void RandomRange(float[] Tab, int N, float ranges, float rangee) {
  if (ranges >= rangee) {
    ErrorMsg("Zakres losowania nieprawidłowy");
  }
  float r = rangee - ranges;
  for (int i = 0; i < N; i++) {
    Tab[i] = ranges + random(1.0) * r;
  }
}

void RandomQuotient(float[] Tab, int N) {
  float REALLAST = 0.000000000000000000001;
  for (int i = 0; i < N; i++) {
    Tab[i] = 1.0 / (random(1.0) + REALLAST);
  }
}

void RandomSumm(float[] Tab, int N, int S) {
  for (int i = 0; i < N; i++) {
    float summ = 0;
    for (int j = 0; j < S; j++) {
      summ += random(1.0);
    }
    Tab[i] = summ;
  }
}

void RandomPseudoNorm(float[] Tab, int N, int S, float ranges, float rangee) {
  if (ranges >= rangee) {
    ErrorMsg("Zakres losowania nieprawidłowy");
  }
  float r = (rangee - ranges) / S;
  for (int i = 0; i < N; i++) {
    float summ = 0;
    for (int j = 0; j < S; j++) {
      summ += random(1.0);
    }
    Tab[i] = ranges + summ * r;
  }
}

void RandomProduct(float[] Tab, int N, int S, float ranges, float rangee) {
  if (ranges >= rangee) {
    ErrorMsg("Zakres losowania nieprawidłowy");
  }
  float r = rangee - ranges;
  for (int i = 0; i < N; i++) {
    float product = 1.0;
    for (int j = 0; j < S; j++) {
      product *= random(1.0);
    }
    Tab[i] = ranges + product * r;
  }
}

float[] MinMax(float[] Tab, int N) {
  float minVal = Float.MAX_VALUE;
  float maxVal = -Float.MAX_VALUE;
  for (int i = 0; i < N; i++) {
    if (Tab[i] < minVal) minVal = Tab[i];
    if (Tab[i] > maxVal) maxVal = Tab[i];
  }
  return new float[]{minVal, maxVal};
}

float Mean(float[] Tab, int N) {
  float s = 0;
  for (int i = 0; i < N; i++) {
    s += Tab[i];
  }
  return (N > 0) ? (s / N) : -9999;
}

void MakeHistogramInt(float[] Tab, int N, int Min, int Max, int[] Hist) {
  for (int i = 0; i < Hist.length; i++) Hist[i] = 0;
  for (int i = 0; i < N; i++) {
    int a = floor(Tab[i]);
    if (a <= Max) {
      a = a - Min + 1;
      if (a >= 1 && a <= LastHist) {
        Hist[a]++;
      }
    }
  }
}

void MakeHistogram(float[] Tab, int N, float Min, float Max, int[] Hist, int NofR) {
  for (int i = 0; i < Hist.length; i++) Hist[i] = 0;
  for (int i = 0; i < N; i++) {
    float x = (Tab[i] - Min) / (Max - Min);
    int a;
    if (x >= 1) {
      a = NofR;
    } else {
      a = floor(x * NofR + 1);
    }
    if (a >= 1 && a <= LastHist) {
      Hist[a]++;
    }
  }
}

void MakeHistogramTrick(float[] Tab, int N, float Min, float Max, int[] Hist, int NofR) {
  for (int i = 0; i < Hist.length; i++) Hist[i] = 0;
  float s = (Max - Min) * 1.000000000000001;
  for (int i = 0; i < N; i++) {
    float x = (Tab[i] - Min) / s;
    int a = floor(x * NofR + 1);
    if (a >= 1 && a <= LastHist) {
      Hist[a]++;
    }
  }
}

void MakeHistogramRound(float[] Tab, int N, float Min, float Max, int[] Hist, int NofR) {
  for (int i = 0; i < Hist.length; i++) Hist[i] = 0;
  for (int i = 0; i < N; i++) {
    float x = (Tab[i] - Min) / (Max - Min);
    int a = 1 + round(x * (NofR - 1));
    if (a >= 1 && a <= LastHist) {
      Hist[a]++;
    }
  }
}

void WriteHistogram(int[] Hist, int NofR) {
  for (int i = 1; i <= NofR; i++) {
    println(Hist[i]);
  }
  println("Pierwszy za = " + Hist[NofR + 1]);
}

void DrawHistogram(int[] Hist, int NofR, color barColor, float startX, float startY) {
  stroke(0);
  fill(barColor);
  
  float currentY = startY;
  for (int i = 1; i <= NofR; i++) {
    int n = Hist[i];
    float barWidth = (n * HistHeight) / LastData;
    
    rect(startX, currentY, barWidth, 15);
    
    fill(0);
    textSize(10);
    text(Hist[i], startX + barWidth + 5, currentY + 12);
    fill(barColor);
    
    currentY += 16;
  }
  println("Pierwszy za = " + Hist[NofR + 1]);
}
