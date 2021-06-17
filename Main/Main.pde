float attackspeed = -20;
PImage img;
PImage img2;


PImage monster;
PImage bullet;
PImage bomb;
PImage muzzle;

float shooting_timer;



Monster2 m2 = new Monster2 (1500, 500);
Bomb b3 = new Bomb (9990, 550);
Mbullet b4 = new Mbullet (9999, 600);

//Player 1
Player p1 = new Player (100, 500, 100);


Gun g1 = new Gun (100, 400, -55, 30);
Bullet b1 = new Bullet (0, 0);

Gun g2 = new Gun (100, 700, 55, 30);
Bullet b2 = new Bullet (0, 0);

Monster m1 = new Monster (2300, 400, 255, 255, 255, 250);

Medickit mk = new Medickit (500, 500);

float gravity = 0.1;

void setup () {
  frameRate (60);
  size(1920, 1000);

  img = loadImage("starship.png");
  img2 = loadImage("gun1.png");
  monster = loadImage("monster.png");
  bullet = loadImage("bullet.png");
  muzzle = loadImage("muzzle.png");
  bomb = loadImage("bomb.png");
}

void draw () {
  background(65, 190, 255);

  m1.draw();
  m1.update();
  m1.killplayer(p1);


  p1.laser_beam_effect(m1);
  p1.draw ();
  p1.move();



  g1.draw();
  g1.update(p1);



  g2.draw();
  g2.update(p1);

  b2.draw();
  b2.update(g2);
  b2.update(m1);


  mk.draw();
  mk.support (p1);


  b3.draw();
  b3.update(m2);
  b3.killplayer2(p1);


  m2.draw();
  m2.update();
  m2.update(p1);

  b4.draw();
  b4.bullethitplayer (p1);



  b1.draw();
  b1.update(g1);
  b1.update(m1);
  b1.update(m2);

  update();

  println(frameCount);
}

void update() {



  
  
  
  
}

void keyPressed () {
  p1.move();
  if (key == 'k' ||key == 'K') {

    g1.shoot(b1);
  }
  if (key == 'l'||key == 'L') {

    g2.shoot(b2);
  }
}
