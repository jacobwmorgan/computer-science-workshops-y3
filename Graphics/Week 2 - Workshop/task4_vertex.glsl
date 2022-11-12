precision highp float;
precision highp int;

uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;

attribute vec3 position;

uniform float time;

void main() {
    
    vec3 pos = position;
    
    float speed = 4.0;
    float strength = 0.25;
    
    pos.z = sin( pos.x * speed + time ) * strength;

    gl_Position = projectionMatrix * modelViewMatrix * vec4( pos, 1.0 );

}