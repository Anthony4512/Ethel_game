
class Bug
{
  //Members
  float x, y;
  PVector speed;
  PImage img;

  
  
  //Constructor
  Bug()
  {
    x = random(10,490);
    y = random(10,490);    
    speed = new PVector(random(-0.8, 0.8), random(-0.8, 0.8));
    img = loadImage("scorpion.png");
  }
  
  //Methods
  void drawBug()
  {
    moveBug();
    pushMatrix();
    translate(x + img.width/2, y + img.height/2);
    rotate(speed.heading() + PI/2);
    translate(-img.width/2, -img.height/2);
    image(img,0,0);
    popMatrix();
  }
  
  void moveBug()
  {
    float testMove = random(0,1);
    if (testMove < 0.1)
    {
      speed.rotate(random(-0.3,0.3));
    }
    
    if (testMove > 0.97)
    {
      speed.rotate(random(-1, 1));
    }
    x += speed.x;
    y += speed.y;
    
    if(touchedScreenEdge() == true)
    {
      x -= speed.x;
      y -= speed.y;
      speed.rotate(random(-2,2));
    }
    
  }
  
  boolean touchedScreenEdge()
  {    
    if(x < 0 || x > width - 25 || 
       y < 0 || y > height - 25)
       return true;
    return false;
  }
  
}