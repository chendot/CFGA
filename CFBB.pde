// 单体物种‘CFBB’，包含DNA序列，适应度因子fitness，变现形态

class CFBB {

  DNA dna;          // Face's DNA
  float fitness;    // How good is this face?
  float x, y;       // Position on screen
  int wh = 70;      // Size of square enclosing face
  //boolean rolloverOn; // Are we rolling over this face?

  // 基因对应表现型
  // 生长角度
  float theta;
  // 生长长度
  float len;
  // 递归深度
  int depth;
  // 粗细
  float quality = 1;

  CFBB() {
    //len = 60;
    //depth = 5;
  }

  CFBB(DNA dna_, float x_, float y_) {
    dna = dna_;
    x = x_; 
    y = y_;
    fitness = 1;
    len = map(dna.genes[0], 0, 1, 1, 40);  // 起始枝条长度
    theta = map(dna.genes[1], 0, 1, 0, PI/2);
    depth = int(map(dna.genes[2], 0, 1, 3, 10));
  }

  // 生物体外在表现
  void display() {
    pushMatrix();
    translate(x, y);
    this.grow(len, depth);
    popMatrix();
  }

  // 
  void grow(float len_, int depth_) {
    //theta = random(PI/3);
    strokeWeight(1);
    line(0, 0, 0, -len_);
    translate(0, -len_);
    depth_--;
    len_ *= 0.8;

    if (depth_ > 0) {
      pushMatrix();    
      rotate(theta);   
      grow(len_, depth_);       
      popMatrix();    

      pushMatrix();
      rotate(-theta);
      grow(len_, depth_);
      popMatrix();
    }
  }

  // 繁殖
  CFBB crossover(CFBB partner) {
    CFBB child = new CFBB();
    child.dna = this.dna.crossover(partner.dna);
    return child;
  }

  float getFitness() {
    return fitness;
  }

  DNA getDNA() {
    return dna;
  }

  // Increment fitness if mouse is rolling over face
  void rollover(int mx, int my) {
    //if (r.contains(mx, my)) {
    //  rolloverOn = true;
    //  fitness += 0.25;
    //} else {
    //  rolloverOn = false;
    //}
  }
}
