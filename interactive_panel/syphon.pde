import codeanticode.syphon.*;

void setupSyphon()
{
   syphon = new SyphonServer(this, "InteractivePanel");
}

void sendImageToSyphon()
{
  loadPixels();
  syphon.sendScreen();
}