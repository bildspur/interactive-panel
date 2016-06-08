#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform float inputX;
uniform float inputY;
uniform float inputZ;

void main() {
  gl_FragColor = vec4(inputZ, inputX, inputY, 1);
}
