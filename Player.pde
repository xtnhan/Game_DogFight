class Player { //<>//
  float x;
  float y;
  float radius;
  float  dy;
  float dx;
  float w = 100;


  float laserbeam;


  //Constructor


  Player (float xx, float yy, float radiuss) {
    x = xx;
    y = yy;
    radius = radiuss;
  }


  void draw () {

    x = x + dx;
    y = y + dy;
    stroke(1);


    //Health bar
    fill(133, 0, 0);
    rect (x - 70, y - 100, 100, 10);

    fill(33, 196, 0);
    rect (x - 70, y - 100, w, 10);
    noFill();

    //fill (0,0,0);
    imageMode(CENTER);

    image(img, x, y, 150, 150);
  }

  void laser_beam_effect(Monster m) {

    if (m2.w <= 100) {

      if (key == 'o') {
        noStroke();

        laserbeam = laserbeam + 200;
        fill (252, 198, 3);
        rect (x -25, y - 75, laserbeam, 150);
        image(img2, x + 50, y, 150, 150);

        if (m.y >= (y - 95) && m.y <= (y - 95 +150)) {
          m.dx = m.dx - m.dx;
        }

        if (keyPressed) {
          laserbeam = 0;
          m.dx = attackspeed;
        }
      }
    }
  }
  
  
  







  //Moving



  void move () {
    if (x <= 0 || x >= width || y <= 0 || y >= height) {
      still();
    }
    if (keyPressed && key == 'w') {
      up ();
    }

    if (keyPressed && key == 's') {
      down ();
    }
    if (keyPressed && key == 'a') {
      left ();
    }
    if (keyPressed && key == 'd') {
      right ();
    }
    if (keyPressed && key == ' ') {
      still();
    }
  }
  void up () {
    dy = 0;
    dy = -5;
  }

  void down () {
    dy = 0;    
    dy = 5;
  }

  void right () {
    dx = 0;    
    dx = 5;
  }
  void left () {
    dx = 0;
    dx = -5;
  }

  void still () {
    dx = 0;
    dy = 0;
  }
}
