class Gun {
  float pos;
  float radius;
  float x;
  float y;
  float vx;
  float vy;
  boolean bullethold = true;


  float r = 90;
  float g =  114;
  float b = 146;
  


  //Constructor

  Gun (float xx, float yy, float poss, float radiuss) {
    x = xx;
    y = yy;
    radius = radiuss;
    pos = poss;
  }
  void draw () {
    //noFill();

    fill(r, g, b);
    circle (x, y, 30);
  }

  void update (Player p) {

    if (bullethold) {//Update vị trí của gun dính vào Player khi bullethold == true
      x = p.x - 30;
      y = p.y + pos;
    }
  }

  void shoot (Bullet b) {  
    b.shoot (this); //Ra lệnh cho Bullet chạy code shoot - this - thông số trong bullet shoot
  }
}
