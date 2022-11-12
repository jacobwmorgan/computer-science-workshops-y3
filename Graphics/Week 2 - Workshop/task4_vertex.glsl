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
    
    // This gives a wiggle effect, like a moving flag
    // Very basic.. just moves the vertices into the
    // shape of a sine wave
    pos.z = sin( pos.x * speed + time ) * strength;

    gl_Position = projectionMatrix * modelViewMatrix * vec4( pos, 1.0 );

}