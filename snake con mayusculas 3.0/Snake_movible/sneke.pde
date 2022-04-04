public class sneke {
  
  int[] x = new int[900];
  int[] y = new int[900];

  public sneke()
  {  
    for(int i = 0 ; i < 900 ; i++)
    {
        x[i] = 15;
        y[i] = 15;
    }
    
  }

  public int[] getX()
  {  
    return this.x;
  }
  
  public int[] getY()
  {  
    return this.y;
  }

  
  
  
  public void setX(int[] xP)
  {  
    this.x = xP;
  }
  
  public void setY(int[] yP)
  {  
    this.y = yP;
  }
  
  
}
