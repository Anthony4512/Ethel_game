/*

    Anthony Mirely
    Game for Ethel (Ninja Ethel)
    
    girl (Ethel) image from http://orig11.deviantart.net/40ac/f/2012/050/5/8/tala_rpg_sprite_sheet_by_dragondude97-d4qbxq7.png
    
    grass image from http://sandbox.yoyogames.com/extras/image/name/san2/698/577698/original/2w4cktf.jpg
    
    scorpion image from https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=0ahUKEwjt3b7
    W8s3LAhXKKB4KHTRnDDEQjBwIBA&url=http%3A%2F%2Fwww.spriters-resource.com%2Fdownload%2F32496%2F&bvm=bv.117218890,d.
    dmo&psig=AFQjCNGRrT2kUUtADcDt6YWPNzo-_rX9Hw&ust=1458445001321995     (darkWolf)
    
    
    
    
*/


ArrayList <Bug> bugs = new ArrayList<Bug>();
int numBugs = 30;
PImage bg;

boolean keys[];
Player player;


void setup()
{
  size(600,600);
  frameRate(60);
  bg = loadImage("bkgd.jpg");
  for (int i=0; i<numBugs; i++)
  {
    bugs.add(new Bug());
  }
  
  keys = new boolean[128];
  player = new Player();
  
}

void draw()
{
  image(bg,0,0);
  for (int i=0; i<numBugs; i++)
  {
    bugs.get(i).drawBug();
  }
  
  ethelMove();
  player.drawPlayer();
}

void ethelMove()
{
  int xPlayer = 0;
  int yPlayer = 0;
  
  if (keys['w'] || keys['W'])
    yPlayer--;
  if (keys['s'] || keys['S'])
    yPlayer++;
  if (keys['a'] || keys['A'])
    xPlayer--;
  if (keys['d'] || keys['D'])
    xPlayer++;
    
  player.updatePlayer(xPlayer, yPlayer);
}

void keyPressed()
{
  keys[key] = true;
}

void keyReleased()
{
  keys[key] = false;
}