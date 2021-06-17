class Monster {

  float r;
  float g;
  float b;


  float x;
  float y;
  float dy;
  float dx;

  float randx; //Get random number
  float randy;//Get random number

  float size;
  float sizeinc;
  float  w;

  int phase;


  boolean attacking;
  boolean die;

  float playerdamage = 2;
  float monsterdamage = 3;
  Monster (float xx, float yy, float rr, float gg, float bb, float ww) {

    x = xx;
    y = yy;
    r = rr;
    g = gg;
    b = bb;
    w = ww;
    die = false;
    attacking = false;
  }



  void draw () {


    //Health bar
    fill(133, 0, 0);
    rect (x, y - 200, 250, 20);

    fill(33, 196, 0);
    rect (x, y - 200, w, 20);




    noStroke();
    fill(r, g, b);
    circle (x, y, 100);
    circle (x+100, y, 140);
    circle (x+200, y, 130);
    circle (x + 50, y - 70, 120);
    circle (x+150, y - 70, 120);

    noFill();
    stroke(1);
    bezier(x, y, x + 50, y + 50, x + 50, y + 50, x + 200, y);



    circle (x + 40, y - 70, 30);
    circle (x + 40 + 50, y - 70, 30);

    fill(0, 0, 0);
    circle (x + 35 + 50, y - 68, 20);
    circle (x + 35, y - 68, 20);
    noStroke();
  }

  void killplayer (Player p) {

    if (dist (x, y, p.x, p.y) <= 200) {
      p.w = p.w - monsterdamage;
    }

    if (p.w <= 0) {
      p.dy = 0;
      p.dy = 20;
    }
  }

  void update () {
    x = x + dx;
    y = y + dy;

    if (m2.w <= 125 && w == 250) { //     Appear when  health bar reduces to 1/2
      die = false;
      dx = -5;
    }
    if (x <= 1600) {

      dx = 0;
      size = size + sizeinc;
      circle (x, y, size);
      sizeinc = 5;
    }

    if (size >=100) { //Trigger of attacking state 
      attacking = true;
      sizeinc = 0;
      size = 0;
    }

    if (attacking == true && size >=95 && size <= 97) {  //Trigger -controlled by Trigger circle - choosing direction for attacking

      phase = int( random (1, 8));
    }


    //Attack - Phase 1
    if (phase == 1) {
      dx = attackspeed;
      dy = 2;
    }
    //Attack - Phase 2
    if (phase == 2) {
      dx = attackspeed;
      dy = -2;
    }
    //Attack - Phase 3
    if (phase == 3) {
      dx = attackspeed;
      dy = 4;
    }
    //Attack - Phase 4
    if (phase == 4) {
      dx = attackspeed;
      dy = -4;
    }

    //Attack - Phase 5
    if (phase == 5) {
      dx = attackspeed;
      dy = 6;
    }
    //Attack - Phase 6
    if (phase == 6) {
      dx = attackspeed;
      dy = -6;
    }
    //Attack - Phase 7
    if (phase == 7) {
      dx = attackspeed;
      dy = 8;
    }
    //Attack - Phase 8
    if (phase == 8) {
      dx = attackspeed;
      dy = -8;
    }

    if (die == false) {
      //Get back in Position
      if (x <= 0 && x <= -300 || y <=0 || y >= height) {
        phase = 0;
        attacking = false;
        dx = 0;
        dy =0;
        size = 0;
        sizeinc = 0;
        x = 2300;
        y = random(200, 800);
        dx = -5;

        if (x == 1700) {
          dx = 0; //Stop
          sizeinc = random (0.1, 0.5); //Trigger
        }
      }
    } else {
      x = 2400;
      dx = 0;
      dy = 0;
    }

    //Monster dies

    if (w <= 0) {
      die = true;
      w = 0;
      dx = 0;
      dy = 0;

      dy = 10;
      size = 0;
      sizeinc = 0;
      x = 9999;
      


      if (die == true && x >= 2300) {
        dx = 0;
        dy =0;
        size = 0;
        sizeinc = 0;
        y = random(200, 800);
        //dx = -5;


        r = 255;
        g = 255;
        b = 255;
        y = random (100, 900);
        w = 250;
      }
    }
  }
}
