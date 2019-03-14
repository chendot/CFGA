// Population for CFBB

class Population {

  float mutationRate;           
  CFBB[] cfbb;                  
  ArrayList<CFBB> matingPool;   
  int generations;              // Number of generations

  // 参数分别为突变率和个体数量
  Population(float m, int num) {
    mutationRate = m;
    cfbb = new CFBB[num];
    matingPool = new ArrayList<CFBB>();
    generations = 0;
    for (int i = 0; i < cfbb.length; i++) {
      // 初始化种群中物种，设置物种生成位置
      cfbb[i] = new CFBB(new DNA(8), 50+i*width/num, yPos);
    }
  }

  void display() {
    for (int i = 0; i < cfbb.length; i++) {
      cfbb[i].display(); //<>//
    }
  }

  // Generate a mating pool
  void selection() {
    // Clear the ArrayList
    matingPool.clear();

    // Calculate total fitness of whole population
    float maxFitness = getMaxFitness();

    // Calculate fitness for each member of the population (scaled to value between 0 and 1)
    // Based on fitness, each member will get added to the mating pool a certain number of times
    // A higher fitness = more entries to mating pool = more likely to be picked as a parent
    // A lower fitness = fewer entries to mating pool = less likely to be picked as a parent
    for (int i = 0; i < cfbb.length; i++) {
      float fitnessNormal = map(cfbb[i].getFitness(), 0, maxFitness, 0, 1);
      int n = (int) (fitnessNormal * 100);  // Arbitrary multiplier
      for (int j = 0; j < n; j++) {
        matingPool.add(cfbb[i]);
      }
    }
  }  

  // Making the next generation
  void reproduction() {
    // Refill the population with children from the mating pool
    for (int i = 0; i < cfbb.length; i++) {
      // Sping the wheel of fortune to pick two parents
      int m = int(random(matingPool.size()));
      int d = int(random(matingPool.size()));
      // Pick two parents
      CFBB mom = matingPool.get(m);
      CFBB dad = matingPool.get(d);
      // Get their genes
      DNA momgenes = mom.getDNA();
      DNA dadgenes = dad.getDNA();
      // Mate their genes
      DNA child = momgenes.crossover(dadgenes);
      // Mutate their genes
      child.mutate(mutationRate);
      // Fill the new population with the new child
      cfbb[i] = new CFBB(child, cfbb[i].x, cfbb[i].y);
    }
    generations++;
  }

  int getGenerations() {
    return generations;
  }

  // Find highest fintess for the population
  float getMaxFitness() {
    float record = 0;
    for (int i = 0; i < cfbb.length; i++) {
      if (cfbb[i].getFitness() > record) {
        record = cfbb[i].getFitness();
      }
    }
    return record;
  }
}
