int currentTime;
int previousTime;
int deltaTime;

ArrayList<Mover> flock;
int flockSize = 50;

Portal portal;
boolean portalOn;

void setup () {
  //fullScreen(P2D);
  size (800, 600);
  currentTime = millis();
  previousTime = millis();
  portalOn = false;
  
  flock = new ArrayList<Mover>();
  
}

void draw () {
  currentTime = millis();
  deltaTime = currentTime - previousTime;
  previousTime = currentTime;

  
  update(deltaTime);
  display();
}

/***
  The calculations should go here
*/
void update(int delta) {
  
  for (Mover m : flock) {
    m.flock(flock);
    m.update(delta);
  }
  
  if(portalOn)
    portal.checkCollision(flock);
    
}

/***
  The rendering should go here
*/
void display () {
  background(0);
  
  for (Mover m : flock) {
    m.display();
  }
  
  if(portalOn){
    portal.hole1.display();
    portal.hole2.display();
  }
}


void keyPressed() {
  switch (key) {
    case 'd':
      flock.get(0).debug = !flock.get(0).debug;
      break;
    case ' ':
      if(portalOn){
        portalOn = false;
        portal = null;
      } else {
         portal = new Portal();
         portalOn = true;
      }
      break;
    case 'r':
      flock.clear();
      portal = null;
      portalOn = false;
      break;
  }
}

void mousePressed(){
  if(flock.size() < flockSize){
    Mover m = new Mover(new PVector(random(0, width), random(0, height)), new PVector(random (-2, 2), random(-2, 2)));
    m.fillColor = color(random(255), random(255), random(255));
    flock.add(m);
  }
}
