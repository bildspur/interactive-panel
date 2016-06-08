

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
    float inputX = 0;
    float inputY = 0;

    // set variables
    Frame f  = getFrame();
    if (!f.hands().isEmpty())
    {
      Hand h = f.hands().leftmost(); 
      strength = h.grabStrength();
      inputX = h.palmPosition().normalized().getX();
      inputY = h.palmPosition().normalized().getY();
    }

    /*
    colorShader.set("inputX", map(mouseX, 0, width, 0, 1));
     colorShader.set("inputY", map(mouseY, 0, height, 0, 1));
     */
     
    colorShader.set("inputX", inputX);
    colorShader.set("inputY", inputY);
    colorShader.set("inputZ", strength);

    shader(colorShader);
    shape(plane);
  };

  void stop() {
  };
}