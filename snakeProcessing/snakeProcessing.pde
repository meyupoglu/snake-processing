/*
	Mustafa Eyupoglu - January 2014
 */

int maximumLength = 200;

int windowHeight = 480;
int windowLength = 640;

int headY = windowLength/2;
int headX = windowHeight/2;

int boxDimension = 9;
int boxDrawOffset = (boxDimension-1)/2;

int snakeLength = 10;
int[][] snakeLocations = new int[200][2];

int lastKey = UP;
int newKey;

void setup()
{
  size(windowLength, windowHeight);
  background(180, 180, 180);

  for (int i=0;i<snakeLength;i++)
  {  
    snakeLocations[i][0] = (windowHeight/2) + (i*boxDimension);
    snakeLocations[i][1] = (windowLength/2);
  }
}

void draw()
{
  // clear screen first
  background(180, 180, 180);

  // shift the snake
  for (int i=0;i<snakeLength-1;i++)
  {  
    snakeLocations[snakeLength-i-1][0] = snakeLocations[snakeLength-i-2][0];
    snakeLocations[snakeLength-i-1][1] = snakeLocations[snakeLength-i-2][1];
  }

  // decide what to do with the head
  switch(lastKey)
  {
  case UP:
    {
      snakeLocations[0][0] = snakeLocations[1][0] - boxDimension;
      snakeLocations[0][1] = snakeLocations[1][1];
      break;
    }
  case DOWN:
    {
      snakeLocations[0][0] = snakeLocations[1][0] + boxDimension;
      snakeLocations[0][1] = snakeLocations[1][1];
      break;
    }
  case RIGHT:
    {
      snakeLocations[0][0] = snakeLocations[1][0];
      snakeLocations[0][1] = snakeLocations[1][1] + boxDimension;
      println("RIGHT pressed");
      break;
    }
  case LEFT:
    {
      snakeLocations[0][0] = snakeLocations[1][0];
      snakeLocations[0][1] = snakeLocations[1][1] - boxDimension;
      break;
    }
  }


  // draw the snake
  for (int i=0;i<snakeLength;i++)
  {  
    rect(snakeLocations[i][1]-boxDrawOffset, snakeLocations[i][0]-boxDrawOffset, boxDimension, boxDimension);
  }

  delay(100);
}

void keyPressed()
{
  if (key == CODED)
  {
    switch(keyCode)
    {
    case UP:
      {
        if (lastKey != DOWN)
          lastKey = UP;        
        println("UP pressed");
        break;
      }
    case DOWN:
      {
        if (lastKey != UP)
          lastKey = DOWN;        
        println("DOWNN pressed");
        break;
      }
    case RIGHT:
      {
        if (lastKey != LEFT)
          lastKey = RIGHT;        
        println("RIGHT pressed");
        break;
      }
    case LEFT:
      {
        if (lastKey != RIGHT)
          lastKey = LEFT;        
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

