precision highp float;
precision highp int;

varying vec2 uvs;

uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;

attribute vec3 position;
attribute vec2 uv;

void main() {
    
    uvs = uv;

    gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );

}