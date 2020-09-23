class Portal{
  
  class Hole extends GraphicObject{
   
    float r;
    
    Hole(){
      
      this.r = 25;
      location = new PVector();
      velocity = new PVector();
      acceleration = new PVector();
      location.x = random(width - (this.r * 2)) + this.r;
      location.y = random(height - (this.r * 2)) + this.r;
      fillColor = color(255,255,255);
      
    }
    
    void update(float deltaTime){
    
    
    }
  
    void display(){
    
      fill(fillColor);
      ellipse(location.x, location.y, (this.r * 2), (this.r * 2));
    
    }
    
  }
  
  Hole hole1;
  Hole hole2;
  
  Portal(){
   
    this.hole1 = new Hole();
    this.hole2 = new Hole();
    
  }
  
  void checkCollision(ArrayList<Mover> flock){
   
    for (Mover m : flock) {
      
      //If collides hole1
      if(hole1.r + m.r > PVector.dist(hole1.location, m.location)){
        m.location = new PVector(hole2.location.x, hole2.location.y);
        m.location.add(new PVector(m.velocity.x, m.velocity.y).normalize().mult(hole2.r + m.r));
      }
      
      //If collides hole2
      if(hole2.r + m.r > PVector.dist(hole2.location, m.location)){
        m.location = new PVector(hole1.location.x, hole1.location.y);
        m.location.add(new PVector(m.velocity.x, m.velocity.y).normalize().mult(hole1.r + m.r));
      }
    }
  }
  
}
