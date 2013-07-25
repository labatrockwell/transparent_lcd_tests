import spacebrew.*;
import java.util.*;
import java.util.concurrent.LinkedBlockingQueue;

String server="localhost";
String name="givemeabettername";
String description ="This is an example client which .... It also listens to...";

Spacebrew spacebrewConnection;

ArrayList<TSPSPerson> people = new ArrayList<TSPSPerson>();
Map<Integer, Integer> pids = new HashMap<Integer, Integer>();
LinkedBlockingQueue<org.json.JSONObject> msgQueue = new LinkedBlockingQueue<org.json.JSONObject>();

void setup() {
  size(1920/2, 1200/2);
  
  spacebrewConnection = new Spacebrew( this );
  
  // add each thing you publish to
  // spacebrewConnection.addPublish( "buttonPress", buttonSend ); 

  // add each thing you subscribe to
  // spacebrewConnection.addSubscribe( "color", "range" );
  
  spacebrewConnection.addSubscribe("fuck", "mymessage", "tspsperson");
  
  // connect!
  spacebrewConnection.connect("ws://"+server+":9000", name, description );
  
}

void draw() {
  while(true){
    org.json.JSONObject j = msgQueue.poll();
    if (j == null){
      break;
    }
    handleMsg(j);
  }
  
  background(0);
  fill(255);
  for(TSPSPerson p : people){
    p.draw(this);
  }
}

//void mousePressed() {
//  spacebrewConnection.send( "buttonPress", buttonSend);
//}

void onRangeMessage( String name, int value ){
  println("got int message "+name +" : "+ value);
  //  // check name by using equals
  //  if (name.equals("color") == true) {
  //      currentColor = value;
  //  }
}

void onBooleanMessage( String name, boolean value ){
  println("got bool message "+name +" : "+ value);  
}

void onStringMessage( String name, String value ){
  println("got string message "+name +" : "+ value);  
}

void handleMsg(org.json.JSONObject value){
  try{
    String type = value.getString("type");
    TSPSPersonType eType;
    try{
      eType = TSPSPersonType.valueOf(type);
    } catch (Exception e){
      println("unrecognized tspsperson type: " + type);
      return;
    }
    
    int id = value.getInt("id");
    int index;
    switch(eType){
      case personEntered:
        index = pids.size();
        pids.put(id, index);
        people.add(new TSPSPerson());
        break;
      case personUpdated:
        if (!pids.containsKey(id)){
          return;
        }
        index = pids.get(id);
        people.get(index).update(value);
        break;
      case personLeft:
        if (!pids.containsKey(id)){
          return;
        }
        index = pids.remove(id);
        for(int key : pids.keySet()){
          int currI = pids.get(key);
          if (currI > index){
            pids.put(key, currI - 1);
          }
        }
        people.remove(index);
        break;
    }
  }catch(Exception e){
    println(e);
  }
}

void mymessage(org.json.JSONObject value){
  try{
    msgQueue.put(value);
  }catch(InterruptedException ie){
    println(ie);
  }
}
