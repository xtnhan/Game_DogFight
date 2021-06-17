class Monster2 {

  float x;
  float y;
  float dy = 5;
  boolean attacking;
  float w = 250;
  float playerdamage = 0.5;
  float monsterdamage = 3;
  boolean die;
  //Constructor

  Monster2 (float xx, float yy) {
    x=  xx;
    y = yy;
    attacking = false;
    die = false;
  }



  void draw () {
    imageMode(CENTER);    
    image(monster, x, y);

    //Health bar
    stroke(1);
    fill(133, 0, 0);
    rect (x - 150, y - 200, 250, 20);

    fill(33, 196, 0);
    rect (x - 150, y - 200, w, 20);
    




  }

  void shoot (Mbullet b) {


   
      b.shoot(this);
   
  }

  void shoot (Bomb b) {
    b.shoot(this);
  }



  void update () { //Monster moving

    y = y + dy;


    if ((y - 100) <= 0 || (y + 100) >= height) {
      dy = -dy;
    }
    
    
    if (w <=0) {
    
    w  = 0;
    die = true;
    }
    
    if (die == true) {
    
    dy = 10;
    }
 
}
 void update (Player p) {
 
 if (abs (y -(p.y - 50)) <= 10) {
    image(muzzle, x - 120, y + 80);
    shoot(b4);
    shoot(b3);
  }
 } 
}
