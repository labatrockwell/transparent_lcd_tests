import processing.core.*;
import java.util.*;
import org.json.*;

class TSPSPerson{
  PVector centroid = new PVector();
  PVector velocity = new PVector();
  ArrayList<PVector> contour = new ArrayList<PVector>();
  int myColor = Integer.MAX_VALUE;
  
  void update(JSONObject json){
    centroid.x = (float)json.getJSONObject("centroid").getDouble("x");
    centroid.y = (float)json.getJSONObject("centroid").getDouble("y");
    velocity.x = (float)json.getJSONObject("velocity").getDouble("x");
    velocity.y = (float)json.getJSONObject("velocity").getDouble("y");
    
    //I don't think contours are normalized
    //getJSONArray("contours").getJSONObject(0).getDouble("x")...
  }
  
  void draw(PApplet p){
    p.fill(myColor);
    p.noStroke();
    p.ellipse(centroid.x*p.width, centroid.y*p.height, 
        10 + Math.abs(velocity.x), 10 + Math.abs(velocity.y));
  }
}
