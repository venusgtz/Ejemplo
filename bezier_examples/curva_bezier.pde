class CurvaBezier{
  float t_;
  float [] x_;
  float [] y_;
  float dt_;
  int N;
  float x1_, y1_;
  float x2_, y2_;
  float x3_, y3_;
  float x4_, y4_;
  float x5_, y5_;
  float x6_, y6_;

  //PVector p1_, p2_, p3_, p4_;
  // Constructor   
  CurvaBezier(float x1,float y1,
              float x2,float y2,
              float x3,float y3,
              float x4,float y4,
              float x5,float y5,
              float x6,float y6)
  {
    x1_= x1; 
    y1_= y1; 
 
    x2_= x2; 
    y2_= y2; 
    
    x3_= x3; 
    y3_= y3; 
    
    x4_= x4; 
    y4_= y4; 
    
    x5_= x5; 
    y5_= y5; 
    
    x6_= x6;
    y6_= y6;

    dt_ = 0.001;
    N =  (int)( 1.0 / dt_);
    x_ = new float[N];
    y_ = new float[N];

    Eval();
  }

  CurvaBezier(float x1,float y1,
              float x2,float y2,
              float x3,float y3,
              float x4,float y4,
              float x5,float y5,
              float x6,float y6,
              float dt)
  {
  
    x1_= x1; 
    y1_= y1; 
 
    x2_= x2; 
    y2_= y2; 
    
    x3_= x3; 
    y3_= y3; 
    
    x4_= x4; 
    y4_= y4;
    
    x5_= x5; 
    y5_= y5; 

    x6_= x6;
    y6_= y6;
    
    dt_ = dt;
    N = (int)( 1.0 / dt_);
    x_ = new float[N];
    y_ = new float[N];
    
    Eval();
  }

  void Draw()
  {
   beginShape();
    for (int k = 0; k < N; k++) {
      vertex(x_[k], y_[k]);
    }
   //endShape(CLOSE);
   endShape();
  }

  void Eval()
  {
    for(int k=0; k<N ; k++)
    {
      t_ = k * dt_;
      
      float a = (1 - t_)*(1 - t_)*(1 - t_);
      float b = 3*t_*(1 - t_)*(1 - t_);
      float c = 3*t_*t_*(1 - t_);
      float d = t_*t_*t_;

      x_[k] = a*x1_ + b*x2_ + c*x3_ + d*x4_ +  d*x5_;  
      y_[k] = a*y1_ + b*y2_ + c*y3_ + d*y4_ + d*y5_;

//      println(x_[k]+" "+y_[k]);
    }
  }




}