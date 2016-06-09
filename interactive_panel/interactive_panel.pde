import codeanticode.syphon.*;

SyphonServer syphon;
ArrayList<Scene> scenes;
int activeScene = 0;

void settings()
{
  size(640, 480, P3D);
  PJOGL.profile = 1;
}

void setup()
{
  setupSyphon();
  setupLeapMotion();

  // settings
  ellipseMode(CENTER);
  frameRate(60);

  // init scenes
  scenes = new ArrayList<Scene>();
  scenes.add(new ColorMapScene());
  scenes.add(new ColorBlobsScene());
  scenes.add(new ColorCircleScene());

  // set default active scene
  activeScene = 0;
  scenes.get(activeScene).init();
}

void draw()
{
  background(0);

  // render scene
  Scene s = scenes.get(activeScene);
  s.render();

  sendImageToSyphon();

  // draw information
  resetShader();
   
  textSize(12);
  text("Scene " + activeScene + ": " + s.getName(), 5, 15);
  text("FPS: " + round(frameRate), 5, 30);
}

void keyPressed() {
  switch(keyCode)
  {
  case LEFT:
    switchScene(-1);
    break;

  case RIGHT:
    switchScene(1);
    break;

  case ESC:
    shutdown();
    break;

  case 32:
    saveFrame("test.png");
    break;

  default:
    println("Key: " + keyCode);
  }
}

void switchScene(int sceneShift)
{
  scenes.get(activeScene).stop();
  int newSceneNr = (activeScene + sceneShift) % scenes.size();
  activeScene = newSceneNr < 0 ? scenes.size()-1 : newSceneNr;
  scenes.get(activeScene).init();

  println("switched scene to " + scenes.get(activeScene).getName());
}

void shutdown()
{
  syphon.stop(); 
  syphon.dispose();
  exit();
}