class Car {
  PVector position;
  float   rotation;
  float   vel_wheel;
  
  PImage body;    
  PImage head;    
  PImage wheel_1;  
  PImage wheel_2;
  
  Car(String character)
  {
    switch(character) {
      case "orc":   Load("sprites/orc/");   break;
      case "girl":  Load("sprites/girl/");  break;
      case "truck": Load("sprites/truck/"); break;
      case "calavera": Load("sprites/calavera/"); break;
      default: break;
    }  
    rotation = 0.0;
    position= new PVector(0,0);
    vel_wheel=1;
  }

  void Load(String path)
  {
    body   = loadImage(path + "body.png"); 
    head   = loadImage(path + "head.png");  
    wheel_1= loadImage(path + "wheel_1.png");  
    wheel_2= loadImage(path + "wheel_2.png");
  }

  void Rotate(float theta)
  {
    rotation+=theta;
  }

  void Translate(float x, float y)
  {
    position.x+=x; 
    position.y+=y; 
  }

  void SetPosition(float x, float y)
  {
    position.x=x; 
    position.y=y; 
  }

  void SetRotation(float theta)
  {
    rotation=theta;
  }
  
  void Draw()
  {
    vel_wheel+=0.1;
    pushMatrix();
    {   
    translate(position.x, position.y);
    rotate(rotation);
    scale(0.2);
        DrawBody();
        DrawHead();
        DrawWheel1();
        DrawWheel2();
    }
    popMatrix();
  }
  
  void DrawBody()
  {
    pushMatrix();
    { 
      translate(-body.width/2.0,-body.height/2.0); 
      image(body,0,0); 
    } 
    popMatrix();
  }

  void DrawHead()
  {
    pushMatrix();
    { 
      translate(-body.width/2.0+20,-body.height/2.0-200); 
      image(head,0,0); 
    } 
    popMatrix();
  
  }
  
  void DrawWheel1()
  {
    pushMatrix();
    { 
      translate(-body.width/2.0+200,-body.height/2.0+186); 
      rotate(vel_wheel);
      image(wheel_1,-wheel_1.width/2.0,-wheel_1.height/2.0); 
    } 
    popMatrix();
  }
  
  void DrawWheel2()
  {
    pushMatrix();
    { 
      translate(-body.width/2.0+400,-body.height/2.0+186); 
      rotate(vel_wheel);
      image(wheel_2,-wheel_2.width/2.0,-wheel_2.height/2.0); 
    } 
    popMatrix();
  }
}
