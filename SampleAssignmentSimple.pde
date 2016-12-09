import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam Cam;
Star sun;
Table table;

void setup() {

  table = loadTable("XYZ.csv", "header");
  size(1000, 750, P3D);

  Cam = new PeasyCam(this, 0);
  sun = new Star(0, 0, 0, 0);
  sun.setStar();
}

void draw() {

  background(0);

  noStroke();
  lights();
  sun.show();

  fill(181, 15, 93);
  sphere(5);
  stroke(255);
  noFill();
  ellipse(0, 0, 1000, 1000);
}

class Star {

  int[][] colors = {  
    {65, 99, 97}, 
    {181, 15, 93}, 
    {116, 70, 110}, 
    {255, 201, 33}, 
    {160, 255, 255}
  };

  Star[] stars;
  int id;
  float posX;
  float posY;
  float posZ;


  Star(int i, float x, float y, float z) {
    id = i;
    posX = x;
    posY = y;
    posZ = z;
  }

  void setStar() { 

    stars = new Star[table.getRowCount()];
    println(table.getRowCount());

    for (TableRow row : table.rows()) {

      int id = row.getInt("id");
      float x = row.getInt("x");
      float y = row.getInt("y");
      float z = row.getInt("z");

      stars[id] = new Star(id, x, y, z);
    }
  }

  int getId() {
    return id;
  }
  float getX() {
    return posX;
  }
  float getY() {
    return posY;
  }
  float getZ() {
    return posZ;
  }

  void show() {
    pushMatrix();
    noStroke();
    stroke(255);
    //line(0, 0, 0, v.x, v.y, v.z);
    //line(0, 0, 0, p.x, p.y, p.z);

    //int rand = int(random(4));
    //fill(colors[rand][0], colors[rand][1], colors[rand][2]);

    fill(255, 90);

    //int colorId = getId() % 5;
    //fill(colors[colorId][0], colors[colorId][1], colors[colorId][2], 90);

    translate(5 * getX(), 5 * getY(), 5 * getZ());
    noStroke();
    sphere(5);
    //ellipse(0, 0, radius*2, radius*2);

    if (stars != null) {
      for (int i = 0; i < stars.length; i++) {
        stars[i].show();
      }
    }
    popMatrix();
  }

  //void show() {
  //  for (int i = 0; i < stars.length; i++) {
  //    translate(stars[i].getX(), stars[i].getY(), stars[i].getZ());
  //    println(stars[i].getId(), stars[i].getX(), stars[i].getY(), stars[i].getZ());
  //    fill(255);
  //    sphere(500);
  //  }
  //}
}
