// Organism name CFBB, with properties as DNA, fitness

class CFBB {

  DNA dna;          // Face's DNA
  float fitness;    // How good is this face?
  float x, y;       // Position on screen
  int wh = 70;      // Size of square enclosing face
  float yoff = 0;
  
  // 基因对应表现型

  float theta;  // 生长角度
  float slen;    // 初始生长长度
  float tlen;   // 每轮生长长度系数
  int depth;    // 递归深度
  float p;  // 每一级角度变化率
  // 粗细
  float quality = 1;

  CFBB() {
  }

  CFBB(DNA dna_, float x_, float y_) {
    dna = dna_;
    x = x_; 
    y = y_;
    fitness = 1;
    slen = map(dna.genes[0], 0, 1, 10, 30);  // 起始枝条长度
    //slen = 20;
    //theta = map(dna.genes[1], 0, 1, 0, PI/2);
    //theta = dna.genes[1];
    depth = int(map(dna.genes[2], 0, 1, 3, 10));
    tlen = dna.genes[3];
  }

  // 生物体外在表现
  void display() {
    yoff += 0.005;
    pushMatrix();
    translate(x, y);
    this.grow(slen, depth, 0);
    popMatrix();
  }

  void grow(float len_, int depth_, float xoff) {
    //theta = map(dna.genes[1], 0, 1, 0, PI/2);
    //theta *= map(p, 0, 1, 0, 2);
    strokeWeight(1);
    line(0, 0, 0, -len_);
    translate(0, -len_);
    depth_--;
    len_ *= tlen;
    
    xoff += 0.1;
    
    if (depth_ > 0) {
      theta = map(noise(xoff, yoff), 0, 1, -PI/2, PI/2);
      pushMatrix();    
      rotate(theta);   
      grow(len_, depth_, xoff);       
      popMatrix();    

      pushMatrix();
      rotate(-theta);
      grow(len_, depth_, xoff);
      popMatrix();
    }
  }

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

  void addFitness(float s) {
    fitness += s;
  }
}
