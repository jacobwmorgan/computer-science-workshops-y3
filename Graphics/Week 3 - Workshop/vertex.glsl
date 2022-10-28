precision highp float;
precision highp int;

uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;

// Pass the UV co-ordinates to the fragment shader
varying vec2 uvs;

// ShaderFrog should give us vertex positions
attribute vec3 position;

// ShaderFrog should give us UV co-ordinates
attribute vec2 uv;

void main() 
{    
    // Pass the UV co-ordinates to the fragment shader
    uvs = uv;

    // Multiplying 3D co-ordinates by a projection & model-view matrix will
    // 'project' those 3D co-ordinates into 2D space for viewing on a 
    // 2D monitor.
    // You don't need to worry about any of this right now.
    gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );
}