class Mbullet {
  float x;
  float y;
  float dx;
  boolean  attacking;
  float bulletspeed = -55;

  //Constructor

  Mbullet (float xx, float yy) {

    x = xx;
    y = yy;
    attacking = false;
  }

  void draw () {        
    x = x + dx;
    image(bullet, x, y);
  }

  void shoot (Monster2 m) {
    x = m.x -120;
    y = m.y + 80;
    dx = bulletspeed;
  }

  void bullethitplayer (Player p) {
if (dist (x,y,p.x,p.y) <= 80) {

p.w = p.w - 10;
}
  }
}
