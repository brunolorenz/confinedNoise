color[] cols = {#020132, #0A05FA, #FBC332, #FEB4BE};
color bg = #F2F2F2; 

// color[] cols = {#F2F2F2, #F2F2F2, #F2F2F2, #F2F2F2};
// color bg = #020132; 

int margin = 50;

int windowSize = 1080;
int count = 10;
int area = count*count;
PVector[] pos = new PVector[area];
float cellw, cellh;


Agent[] agents = new Agent[area];
float noiseScale = 100, noiseStrenght = 100;

void setup() {
  size(500, 500);
  background(bg);

  noFill();
  frameRate(2);

  cellw = (width-margin*2)/(float)count;
  cellh = (height-margin*2)/(float)count;

  initGrid();

  for (int i = 0; i < agents.length; i++) {
    agents[i] = new Agent(pos[i].x, pos[i].y, cellw, cellh);
  }
}

void draw() {
  background(bg);

  push();
  strokeWeight(0);
  noStroke();

  // stroke(cols[0], 50);
  guides(count*4, count*4);

  //stroke(cols[1], 50);
  guides(count, count);
  pop();

  for (Agent agent : agents) {
    agent.display(500);
  }
}

// parte 2 do código

void initGrid() {
  for (int n = 0; n < area; n++) {
    int i = n%count;
    int j = n/count;
    pos[n] = new PVector (i*cellw + margin, j*cellh + margin);
  }
}

void guides(int xcount, int ycount) {
  int area = xcount*ycount;

  float cellw = (width-margin*2)/(float)xcount;
  float cellh = (height-margin*2)/(float)ycount;


  for (int n = 0; n < area; n++) {
    int i = n%xcount;
    int j = n/ycount;
    rect(i*cellw + margin, j*cellh + margin, cellw, cellh);
  }
}
