import processing.pdf.*;

float NOISE_SCALE = 3;
float NOISE_STRENGTH = 13;
int NUM_OF_LINES = 3000;
int LINE_LENGTH = 100;
int BATCHES = 5;
int lines_per_batch = NUM_OF_LINES / BATCHES;


void setup() {
  // Got the values from mm -> px online converter with 72dpi
  size(1660, 821);
  
  for (int b = 0; b < BATCHES; b++)
  {
    beginRecord(PDF, "generative" + b + ".pdf");
    drawWaves(lines_per_batch);
    endRecord();
  }
  
  // Once more for preview
  drawWaves(NUM_OF_LINES);
}


void drawWaves(int num_of_lines)
{
  background(255);
  strokeWeight(0.001);
  stroke(0, 0, 256);

  for (int i = 0; i < num_of_lines; i++)
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