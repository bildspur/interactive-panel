#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform float time;

uniform vec2 resolution;
uniform vec3 hand;

void main() {
  vec2 uv = gl_FragCoord.xy / resolution.xy;
  vec2 mouse = hand.xy / resolution.xy;
  gl_FragColor = vec4(uv,mouse.x+mouse.y*sin(time),1.0);
}
