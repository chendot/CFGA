// 主要过程：
// 1.创建种群  2.选择  3.繁殖

Population pop;

void setup() {
  size(800, 300);
  smooth();

  // 创建一个突变率为1%，种群数量为5的种群
  pop = new Population(0.01, 5);
}

void draw() {
  background(255);  
  //stroke(0);
  // 展示最新一代
  pop.display();
  // 选择
  
  // 繁殖
  
 
  noLoop();
}
