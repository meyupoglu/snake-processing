// Yilan ...

int windowHeight = 480;
int windowLength = 640;

int headY = windowLength/2;
int headX = windowHeight/2;

int boxDimension = 8;

void setup()
{
  size(windowLength, windowHeight);
  background(180, 180, 180);
}

void draw()
{
  // clear screen first
  background(180, 180, 180);
  
  // redraw the rectangle
  rect(headY,headX,boxDimension,boxDimension);
}

void keyPressed()
{
  if (key == CODED)
  {
    switch(keyCode)
    {
    case UP:
      {
        headX = headX - boxDimension;
        println("UP pressed");
        break;
      }
    case DOWN:
      {
        headX = headX + boxDimension;
        println("DOWNN pressed");
        break;
      }
    case RIGHT:
      {
        headY = headY + boxDimension;
        println("RIGHT pressed");
        break;
      }
    case LEFT:
      {
        headY = headY - boxDimension;
        println("LEFT pressed");
        break;
      }
    }
  }
  else if (key == 'q')
  {
    println("q pressed");
  }
}

