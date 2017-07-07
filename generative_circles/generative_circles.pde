import processing.pdf.*;

int NUM_OF_ARCS = 1000;
int ARCS_PER_CIRCLE = 100;
int RADIOUS = 700;
float MAX_DELTA = 0.1;
float MAX_SHIFT = RADIOUS / 3;
float CIRCLE_MAX_OPACITY = 200;


void setup()
{
  // Got the values from mm -> px online converter with 72dpi
  size(1660, 821, PDF, "generative_circles.pdf");
  
  background(255);
  noStroke();
  
  for (int i = 0; i < NUM_OF_ARCS; i++)
  {
    float angle = random(TWO_PI);
    float delta = random(MAX_DELTA);
    float radious = random(RADIOUS);
    float shift = random(MAX_SHIFT);
    
    fill(random(255));
    drawArc(angle, delta, radious, shift);
    
    if (i % ARCS_PER_CIRCLE == 0)
    {
      radious = random(RADIOUS);
      fill(255, CIRCLE_MAX_OPACITY);
      ellipse(width / 2, height / 2, radious * 2, radious * 2); 
    }
  }
}


void drawArc(float angle, float delta, float radious, float shift)
{
  float a, b, c, d;

  a = width / 2 + cos(angle) * shift;
  b = height / 2 + sin(angle) * shift;
  c = d = radious * 2;
  arc(a, b, c, d, angle - delta, angle + delta);
}