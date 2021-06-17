

class Bomb {
  float x;
  float y;
  float dx;
  float dy;
  //Constructor
  boolean  attacking;
  
  float playerdamage = 0.5;
  float monsterdamage = 3;

  //Explosion
  float size;
  ;
  float sizeinc;

  Bomb (float xx, float yy) {

    x = xx;
    y = yy;
    attacking = false;
  }

  void draw () {


    x = x + dx;
    y = y + dy;
    imageMode(CENTER);    

    image(bomb, x, y);
  }

  void shoot (Monster2 m) {

    //Drop missile
    dy = 5;
    attacking = true;
  }


void killplayer2 (Player p) {
//Hit target

      if (dist (x, y, p.x, p.y) <= 100) {

        fill(252, 186, 3);
        //noStroke();

        size = 0;
        sizeinc = 200;
        size = size + sizeinc;

        noStroke();
        circle (p.x -90, p.y, size);
        circle (p.x + 90, p.y, size);
        circle (p.x, p.y, size);
        circle (p.x + 45, p.y - 45, size);
        circle (p.x - 45, p.y - 4, size);
        stroke(1);
        
        
       p.w = p.w - monsterdamage;
      }
        //Locking target

      if (p.y >= y) {
        dy = 3;
      } 
      if (p.y <= y) {
        dy = -3;
      }



}
  void update (Monster2 m) {


    //Bomb dropping Begin
    if (attacking == false) {
      x = m.x;
      y = m.y;
    }
    if (y >= (m.y + 135) || y <= (m.y- 135)) { //Shoot when bomb loading finishes
      dy = 0; 
      dx = -10;
    }
      


    if (x <=0) { //Reset 1st position
      attacking = false;
      x = m.x;
      y = m.y + 50;
      dx = 0;
      dy = 0;
    }
    
}



  //Bomb dropping End

}
