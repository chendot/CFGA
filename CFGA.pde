// 主要过程：
// 1.创建种群  2.选择  3.繁殖
import controlP5.*;

Population pop;

ControlP5 cp5;

void setup() {
  size(800, 300);
  smooth();

  // 创建一个突变率为1%，种群数量为5的种群
  pop = new Population(0.01, 5);

  cp5 = new ControlP5(this);
  cp5.addButton("bA")
    .setValue(0)
    .setPosition(35, 85)
    .setSize(30, 10);
}

void draw() {
  background(255);  
  //stroke(0);
  // 展示最新一代
  pop.display();
  // 选择

  // 繁殖

  //noLoop();
  
}

void controlEvent(ControlEvent theEvent) {
  //println(theEvent.getController().getName());
}

void bA(int theValue) {
  println("a button event from colorA: "+theValue);
  text("sdfd", 30, 100);
}
