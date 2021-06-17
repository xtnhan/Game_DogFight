class Bullet {

  float x;
  float y;
  float vx;
  float vy = 0;
  boolean bullethold = true;

  float flash;
  float flashinc;

  //Constructor

  Bullet (float xx, float yy) {

    x = xx;
    y = yy;
  }
  void draw () {
    fill(255, 255, 255);
    //noFill();
    stroke(1);
    rect (x - 5, y - 5, -30, 10);
    fill(189, 0, 41);
    triangle (x -30, y - 5, x - 30, y - 15, x - 20, y - 5);
    triangle (x -30, y + 5, x - 30, y + 15, x - 20, y + 5);
    fill(189, 0, 41);
    circle (x, y, 10);
    ellipse (x - 30, y, -20, 5);

    if (bullethold) {
    } else {
      fill(255, 200, 0);
      ellipse (x - 55, y, -25, 7);
    }
  }    

  void update (Gun g) { //Update vị trí của bullet dính vào Gun khi bullethold == true
    if (bullethold) {
      vy = 0;
      vx = 0;
      x = g.x + 30;
      y = g.y;


      g.r = 90;
      g.g = 114;
      g.b = 146;
    } else {

      x = x + vx;
      vy = vy + gravity;
      y = y + vy;
      vx = 10;
      g.r = 252;
      g.g = 177;
      g.b = 3;
    }


    if (x >= width || y >= height) {
      bullethold = true;
    } else {
      keyPressed  = false;
    }
  }


  void update (Monster m) {
    if (dist (x, y, m.x, m.y) <= 300 && bullethold == false) {
      
      m.w = m.w -m.playerdamage;
      
      flashinc = 10;
      flash = flash + flashinc;
      
      circle (m.x, m.y, flash);

      if (flash >= 400) {

        flashinc = 0;
        flash = 0;
        b1.x = 2000;
        b2.x = 2000;
      }
    }
  }

void update (Monster2 m) {
    if (dist (x, y, m.x, m.y) <= 300 && bullethold == false) {
      
      m.w = m.w -m.playerdamage;
      
      flashinc = 10;
      flash = flash + flashinc;
      
      circle (m.x, m.y, flash);

      if (flash >= 400) {

        flashinc = 0;
        flash = 0;
        b1.x = 2000;
        b2.x = 2000;
      }
    }
  }


  void shoot (Gun g) {
    bullethold = false;
    vy = -4;
  }
}
