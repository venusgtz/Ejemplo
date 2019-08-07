CurvaBezier curva;
Car orco;

  float x1, y1;
  float x2, y2;
  float x3, y3;
  float x4, y4;
  float x5, y5;
  float x6, y6;


void setup()
{

  size(700,300);
  noFill();
  orco = new Car("girl");
  
  x1 = 80;  y1 = 100;
  x2 = 300;  y2 = 35;
  x3 = 250; y3 = 250;
  x4 = 200; y4 = 200;
  x5 = 400; y5 = 2;
  x6 = 650; y5 = 15;
   
  //curva = new CurvaBezier(30, 20,  80, 5,  150, 75,  150, 1500);
  
 curva = new CurvaBezier(x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6);
  // curva = new CurvaBezier(30, 20,  80, 5,  80, 75,  30, 75,0.006);
}

void draw()
{

  background(153, 153, 0);
  curva.Draw();
  orco.Draw();

 stroke(255, 102, 0);
 line(x1, y1, x2, y2, x5, y5);
 line(x3, y3, x4, y4, x6, y6);
 stroke(0, 0, 0);
  int ind = frameCount % curva.N;
  int ind2 = ind+1;
  
  if(ind2!=curva.N)
  {
    float dx = curva.x_[ind2] - curva.x_[ind];
    float dy = curva.y_[ind2] - curva.y_[ind];
    
    float theta = atan2(dy,dx);
    orco.SetRotation(theta);
    orco.SetPosition(curva.x_[ind],curva.y_[ind]); 
//    println(x[ind]+" "+y[ind]+" "+theta);
  }
}

// Usar rand
//
//
//
// noFill();
// stroke(255, 102, 0);
// line(30, 20, 80, 5);
// line(80, 75, 30, 75);
// stroke(0, 0, 0);
// bezier(30, 20,  80, 5,  80, 75,  30, 75);
// 
// bezier(x1,y1,x2,y2,x3,y3,x4,y4);