// 主要过程：
// 1.创建种群  2.选择  3.繁殖
import controlP5.*;

Population pop;

ControlP5 cp5;

int num = 5;  // 种群中个体数量
float w;

void setup() {
  size(800, 300);
  smooth();

  // 创建一个突变率为1%，种群数量为num的种群
  pop = new Population(0.01, num);
  w = width/num;
  cp5 = new ControlP5(this);
  cp5.addButton("bA")
    .setValue(0.25)
    .setPosition(35, 85)
    .setSize(30, 10);
  cp5.addButton("bB")
    .setValue(0.25)
    .setPosition(35+w, 85)
    .setSize(30, 10);
  cp5.addButton("bC")
    .setValue(0.25)
    .setPosition(35+2*w, 85)
    .setSize(30, 10);
  cp5.addButton("bD")
    .setValue(0.25)
    .setPosition(35+3*w, 85)
    .setSize(30, 10);
  cp5.addButton("bE")
    .setValue(0.25)
    .setPosition(35+4*w, 85)
    .setSize(30, 10);
  cp5.addButton("love")
    .setValue(0)
    .setPosition(1, 85)
    .setSize(30, 10);
}

void draw() {
  background(255);  
  //stroke(0);
  // 展示最新一代
  pop.display();
  //noLoop();
  fill(0);
  for (int i = 0; i < num; i++) {
    text(pop.cfbb[i].getFitness(), 30+i*w, 120);
  }
}

void controlEvent(ControlEvent theEvent) {
}

// 选择
void bA(float theValue) {
  pop.cfbb[0].addFitness(theValue);
}
void bB(float theValue) {
  pop.cfbb[1].addFitness(theValue);
}
void bC(float theValue) {
  pop.cfbb[2].addFitness(theValue);
}
void bD(float theValue) {
  pop.cfbb[3].addFitness(theValue);
}
void bE(float theValue) {
  pop.cfbb[4].addFitness(theValue);
}

// 繁殖
void love(float theValue) {
  pop.selection();
  pop.reproduction();
}
