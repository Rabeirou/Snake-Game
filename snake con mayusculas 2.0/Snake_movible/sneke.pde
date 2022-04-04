public class sneke {
  
  int[] x = new int[900];
  int[] y = new int[900];

  public sneke(){  
    for(int i = 1 ; i < 900 ; i++){
      x[i] = -1;
      y[i] = -1;
    }
    x[0] = 15;
    y[0] = 15;
  }

  public int[] getX(){  
    return this.x;
  }
  
  public int[] getY(){  
    return this.y;
  }
  
  public void setX(int[] xP){  
    this.x = xP;
  }
  
  public void setY(int[] yP){  
    this.y = yP;
  }
  
}
