// Genetic algorithm test
// 1.Create population  
// 2.Eliminate through selection or competition  
// 3.Reproduce according to selected genes pool
import controlP5.*;

Population pop;

ControlP5 cp5;

int num = 10;      // Number of CFBB in the population
float w;           // Size 
float yPos = 150;  //

void setup() {
  size(800, 300);
  smooth();
  w = width/num;

  // Create a population with 1% rate of mutation
  pop = new Population(0.01, num);

  cp5 = new ControlP5(this);
  for (int i = 0; i < num; i++) {
    cp5.addButton("B"+i)
      .setId(i)
      //.setValue(0.25)
      .setPosition(35+i*w, yPos)
      .setSize(30, 10);
  }

  cp5.addButton("love")
    //.setValue(0)
    .setPosition(1, height-50)
    .setSize(50, 20);
}

void draw() {
  background(255);  
  //stroke(0);
  pop.display();
  //noLoop();
  fill(0);
  for (int i = 0; i < num; i++) {
    text(pop.cfbb[i].getFitness(), 30+i*w, yPos+20);
  }
}

void controlEvent(ControlEvent theEvent) {
  int id = theEvent.getController().getId();
  pop.cfbb[id].addFitness(0.25);  // select
}

// reproduce
void love() {
  pop.selection();
  pop.reproduction();
}
