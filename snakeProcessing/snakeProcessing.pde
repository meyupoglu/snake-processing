/*
	Mustafa Eyupoglu - January 2014
 */

int maximumLength = 200;

int tileCountX = 50;
int tileCountY = 50;
int tileSize = 11;

int windowHeight = tileCountY * tileSize;
int windowLength = tileCountX * tileSize;

int headY = windowLength/2;
int headX = windowHeight/2;

int boxDimension = tileSize;
int boxDrawOffset = (boxDimension-1)/2;

int snakeLength = 10;
int[][] snakeLocations = new int[200][2];

int lastKey = UP;
int newKey;

int foodX;
int foodY;

boolean newFood = false;

void setup()
{
  size(windowLength, windowHeight);
  background(180, 180, 180);

  for (int i=0;i<snakeLength;i++)
  {  
    snakeLocations[i][0] = (windowHeight/2) + (i*boxDimension);
    snakeLocations[i][1] = (windowLength/2);
  }

  // generate the initial food
  foodX = int(random(1, tileCountX-1));
  foodY = int(random(1, tileCountY-1));
}

void draw()
{
  // clear screen first
  background(180, 180, 180);

  // generate the food if neccessary
  if (newFood)
  {
    newFood = false;
    foodX = int(random(1, tileCountX-1));
    foodY = int(random(1, tileCountY-1));
  }

  // red color for the food
  fill(255, 0, 0);
  rect((foodX * tileSize) - boxDrawOffset, (foodY * tileSize) - boxDrawOffset, boxDimension, boxDimension);

  // back to the background color
  fill(280, 280, 280);

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
      break;
    }
  case LEFT:
    {
      snakeLocations[0][0] = snakeLocations[1][0];
      snakeLocations[0][1] = snakeLocations[1][1] - boxDimension;
      break;
    }
  }

  // check if we hit the food
  if ((snakeLocations[0][1] == ((foodX * tileSize))) && (snakeLocations[0][0] == ((foodY * tileSize))))
  {
    newFood = true;
    snakeLength = snakeLength + 1;

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
        break;
      }
    case LEFT:
      {
        snakeLocations[0][0] = snakeLocations[1][0];
        snakeLocations[0][1] = snakeLocations[1][1] - boxDimension;
        break;
      }
    }
  }

  // draw the snake
  for (int i=0;i<snakeLength;i++)
  {  
    rect(snakeLocations[i][1]-boxDrawOffset, snakeLocations[i][0]-boxDrawOffset, boxDimension, boxDimension);
  }

  delay(75);
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
        // println("UP pressed");
        break;
      }
    case DOWN:
      {
        if (lastKey != UP)
          lastKey = DOWN;        
        // println("DOWNN pressed");
        break;
      }
    case RIGHT:
      {
        if (lastKey != LEFT)
          lastKey = RIGHT;        
        // println("RIGHT pressed");
        break;
      }
    case LEFT:
      {
        if (lastKey != RIGHT)
          lastKey = LEFT;        
        // println("LEFT pressed");
        break;
      }
    }
  }
  else if (key == 'q')
  {
    println("q pressed");
  }
}

