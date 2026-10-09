/// Przetłumaczone za pomoca Gemini.
/// @date 2026-10-09 (...)

int N = 250; // Iteration count
int START = 400; // Divided by DIVISOR gives the start of r range
int FINAL = 800; // Divided by DIVISOR gives the end of r range
float DIVISOR = 200.0;

float x; // System state
float r1, r2; // Control parameters
float a, s, minVal, maxVal, ln2; // Statistics variables

void setup() {
  size(540, 420); // Window sized to fit matrix (401x401) and legend
  background(255);
  noSmooth();
  noLoop(); // Single execution setup

  ln2 = log(2);
  minVal = 100000;
  maxVal = -100000;

  for (int k = START; k <= FINAL; k++) {
    for (int j = START; j <= FINAL; j++) {
      s = 0; // Sum of logarithms for mean calculation
      x = random(1.0);
      r1 = k / DIVISOR;
      r2 = j / DIVISOR;

      for (int i = 1; i <= N; i++) {
        if (i % 2 == 0) { // Iteration calculation
          x = r1 * x * (1 - x);
          a = abs(r1 - 2 * r1 * x);
          if (a > 0) {
            s += log(a) / ln2;
          }
        } else {
          x = r2 * x * (1 - x);
          a = abs(r2 - 2 * r2 * x);
          if (a > 0) {
            s += log(a) / ln2;
          }
        }
      }

      s = s / N;
      if (s > maxVal) maxVal = s;
      if (s < minVal) minVal = s;

      // Draw averaged value pixel
      setColor(s);
      point(k - START, j - START);
    }
  }

  // LEGEND
  for (int k = 0; k <= FINAL - START; k++) {
    x = minVal + (float)k / (FINAL - START) * (maxVal - minVal);
    // Draw legend color scale
    setColor(x);
    line(FINAL - START + 50, k, FINAL - START + 80, k);
  }

  fill(0);
  textSize(12);
  text(nf(minVal, 0, 4), FINAL - START + 82, 12);
  text(nf(maxVal, 0, 4), FINAL - START + 82, FINAL - START + 10);
}

void setColor(float v) {
  if (v > 0) { // Map v to color (positive values)
    stroke(round(v * 255), round(v * 50), 0);
  } else { // Map v to color (negative values)
    stroke(0, round(-v * 25), round(-v * 255));
  }
}
