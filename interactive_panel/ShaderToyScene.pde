abstract class ShaderToyScene extends Scene
{
  PShader colorShader;
  PShape plane;
  
  protected String shaderPath = "";

  void init() {
    println("loading shader...");
    colorShader = loadShader(shaderPath);

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
    
    // set unform types (shadertoy)
    colorShader.set("iGlobalTime", (float)(millis() / 1000.0));
    colorShader.set("iResolution", (float)width, (float)height);

    shader(colorShader);
    shape(plane);
  };

  void stop() {
  };
}