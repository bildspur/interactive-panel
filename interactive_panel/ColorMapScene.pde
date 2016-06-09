class ColorMapScene extends Scene
{
  PShader colorShader;
  PShape plane;

  String getName() {
    return "ColorMap";
  }

  void init() {
    println("loading shader...");
    colorShader = loadShader("shader/colorMapFrag.glsl");

    // creating plane
    textureMode(NORMAL);
    plane = createShape();
    plane.beginShape();
    plane.noStroke();
    plane.vertex(0, 0, 0);
    plane.vertex(width, 0, 0);
    plane.vertex(width, height, 0);
    plane.vertex(0, height, 0);
    plane.endShape(CLOSE);
  };

  void render() {
    background(0);

    // default strength
    float strength = 1.0;
    float inputX = mouseX;
    float inputY = mouseY;

    // set variables
    Frame f  = getFrame();
    if (f != null && !f.hands().isEmpty())
    {
      Hand h = f.hands().leftmost(); 
      strength = h.grabStrength();
      inputX = h.palmPosition().getX();
      inputY = h.palmPosition().getY();
    }

    // set unform types
    colorShader.set("hand", inputX, inputY, strength);
    colorShader.set("time", (float)(millis() / 1000.0));
    colorShader.set("resolution", (float)width, (float)height);

    shader(colorShader);
    shape(plane);
  };

  void stop() {
  };
}