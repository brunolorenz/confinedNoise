class Agent {
  float x, y, z;
  float size, speed;

  float cellx, celly;
  float cellw, cellh;

  float rand;

  color col;
  Agent(float _x, float _y, float _cellw, float _cellh) {
    x = _x;
    y = _y;
    cellx = x;
    celly = y;
    cellw = x + _cellw;
    cellh = y + _cellh;

    z = random(0.02, 0.08);

    size = random(0.5, 3);
    speed = random(0.3, 5);


    rand = random(1);
    col = cols[(int)random(cols.length)];
  }

  void style() {
    if (rand < 0.7) {
      stroke(col);
    } else {
      noStroke();
    }
  }

  void display(int count) {
    style();
    beginShape();
    for (int i = 0; i < count; i++) {
      update();
    }
    endShape();
  }

  void update() {
    float angle = noise (x/noiseScale, y/noiseScale, z)
      * noiseStrenght;

    x += cos(angle) * speed;
    y += sin(angle) * speed;

    bounds();

    z += 0.005;

    vertex(x, y);
  }

  void bounds() {
    x = constrain(x, cellx, cellw);
    y = constrain(y, celly, cellh);
  }
}
