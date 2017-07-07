import processing.pdf.*;

float NOISE_SCALE = 3;
float NOISE_STRENGTH = 15;
int NUM_OF_LINES = 3000;
int LINE_LENGTH = 100;


void setup() {
  // Got the values from mm -> px online converter with 72dpi
  size(1660, 821, PDF, "generative_waves.pdf");
  
  background(255);
  strokeWeight(0.001);
  stroke(0, 0, 256);
  
  for (int i = 0; i < NUM_OF_LINES; i++)
  {
    float x1, x2;
    float y1, y2;
    x1 = x2 = random(width);
    y1 = y2 = random(height);
    for (int j = 0; j < LINE_LENGTH; j++)
    {
      float x1Old = x1;
      float y1Old = y1;
      float x2Old = x2;
      float y2Old = y2;
      float angle1 = noise(x1 / width * NOISE_SCALE, y1 / height * NOISE_SCALE) * NOISE_STRENGTH;
      float angle2 = noise(x2 / width * NOISE_SCALE, y2 / height * NOISE_SCALE) * NOISE_STRENGTH;
      x1 += cos(angle1);
      y1 += sin(angle1);
      x2 -= cos(angle2);
      y2 -= sin(angle2);
      line(x1Old, y1Old, x1, y1);
      line(x2Old, y2Old, x2, y2);
    }
    
  }
}