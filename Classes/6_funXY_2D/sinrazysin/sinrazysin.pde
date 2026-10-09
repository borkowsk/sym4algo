// 3D Function visualization: cos(x)*cos(y) mapped to color

int START = 0;   // Divided by DIVISOR gives the start of range
int FINAL = 500; // Divided by DIVISOR gives the end of range
float DIVISOR = 50.0; //50;500;etc...

float x, y; // Parameters for function
float z;    // State calculated by function

void setup() {
  size(501, 501);
  background(255);
  noLoop(); // Single execution

  for (int k = START; k <= FINAL; k++) {       // Loop over X
    for (int j = START; j <= FINAL; j++) {    // Inner loop over Y
      x = k / DIVISOR; // Convert integer index to float
      y = j / DIVISOR;

      // Function calculation
      z = sin(x) * sin (y);
      //z = cos(x) * cos(y); 

      // Color mapping based on z value
      if (z > 0) {
        stroke(round(z * 255), round(z * 255), 0);
      } else {
        stroke(0, round(-z * 255), round(-z * 255));
        // Alternative coloring for negative values:
        // stroke(0, round(255 + z * 255), round(255 + z * 255));
      }

      point(k - START, j - START); // Drawing the point
    }
  }
}
