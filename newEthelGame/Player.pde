
class Player
{
  float x, y;
  PImage ninjaSprite;
  PImage temp;
  PImage[][] movement;
  boolean isMoving;
  int currentDirection;
  float currentFrame;
  
  final int DOWN = 0, LEFT = 1, RIGHT = 2, UP = 3;

  
  Player()
  {
    x = 200;
    y = 200;
    setupSprite();
    isMoving = false;
    currentDirection = 1;
    currentFrame = 0;
  }
  
  void setupSprite()
  {
    ninjaSprite = loadImage("girl2.png");
    movement = new PImage [4][4];
    for(int i = 0; i < 4; i++)
    {
      movement[0][i] = ninjaSprite.get(16+32*i, 11, 28, 50);
      movement[1][i] = ninjaSprite.get(16+32*i, 60, 28, 50);
      movement[2][i] = ninjaSprite.get(16+32*i, 109, 28, 50);
      movement[3][i] = ninjaSprite.get(16+32*i, 158, 28, 50);
      
      
    }
  }
  
  void drawPlayer()
  {
    for(int i = 0; i < 4; i++)
    {
      if (isMoving)
      {
        image(movement[currentDirection][1+int(currentFrame)],x,y);
      }
      else
        image(movement[currentDirection][0],x,y);
      
    }
  }
  
  void updatePlayer(int xPlayer, int yPlayer)
  {
    currentFrame = (currentFrame + 0.2) % 3;
    isMoving = true;
    
    if(xPlayer == 0 && yPlayer == 0)
    {
      isMoving = false;
    }
    else if(xPlayer == -1)
    {
      currentDirection = LEFT;
    }
    else if(xPlayer == 1)
    {
      currentDirection = RIGHT;
    }
    else if(yPlayer == -1)
    {
      currentDirection = UP;
    }
    else if(yPlayer == 1)
    {
      currentDirection = DOWN;
    }
    
    x += xPlayer;
    y += yPlayer;
    
    if (isPlayerOff(x, y))
    {
      x -= xPlayer;
      y -= yPlayer;
    }
  }
  
  boolean isPlayerOff(float x, float y)
  {
    if (x <0 || x > width-28 || y < 0 || y > height-50)
    {
      return true;
    }
    return false;
  }
  
  
  
  
}