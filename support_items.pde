class Medickit {
  float x;
  float y;
  float dx;
  float dy;
  float health = 90;
  boolean isCalled;
  boolean isCooldown;
  boolean isTaken;
  float timer = 1201;
  Medickit () {
    x = -100;
    y = 100;
    isCalled = false;
    isCooldown = true;
  }


  void draw () {

    //Medic icon

    fill(255, 255, 255);
    circle (314, 105, 60);
    noStroke();
    fill(133, 0, 0);
    rect(300, 100, 30, 10);
    rect(310, 90, 10, 30);
    fill(0, 0, 0);
    textSize(15);
    text ("Medic Kit - Press 1", 243, 160);





    fill(255, 255, 255);
    circle (x + 14, y + 5, 60);
    noStroke();
    fill(133, 0, 0);
    rect(x, y, 30, 10);
    rect(x + 10, y - 10, 10, 30);
    fill(0, 0, 0);
    textSize(15);
    text ("Medic Kit", x - 17, y +60);

    x = x + dx;
    y =  y + dy;

    if (isCooldown ==true && key == '1') {
      x = 1900;
      y = 500;
      dx = 5;
      dy = -5;
      isCalled = true;
      isCooldown = false;
      timer = 1201;
    }

    if (isCooldown ==false) {
      timer = timer - 1;

      if (timer >= 0) {
        text ("Cool down in " + timer, 400, 160);
      } else {
        isCooldown = true;
      }
    }



    if (x >= width || x <= 0) {
      dx = -dx;
    }

    if (y>= height || y <=0) {
      dy = -dy;
    }
  }


  void support (Player p) {
    if (dist(x, y, p.x, p.y) <= 200 ) {
      p.w = p.w + health;
      x = -100;
      isCalled = false;
      
    }
    if (p.w >=100) {
      p.w = 100;
    }
  
println("isCooldown:" + isCooldown + " isCalled: " + isCalled + " Key: " + key);
}
  
}
