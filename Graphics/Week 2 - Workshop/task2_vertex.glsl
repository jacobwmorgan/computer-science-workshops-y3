precision highp float;
precision highp int;

uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;

attribute vec3 position;

uniform float time;

void main() {
    
    vec3 pos = position;
    
    //
    // Task 2: apply a twist to the plane primitive
    //
    
    float twistFactor = sin( time );
    
    // This is a modified 2D rotation matrix that takes into account the magnitude
    // of the position vector, resulting in a weird "twist" effect.
    //
    // Look here for more info about rotation matrices:
    // https://en.wikipedia.org/wiki/Rotation_matrix#In_two_dimensions
    
    pos.x = cos( twistFactor * length( position ) ) * position.x - sin( twistFactor * length( position ) ) * position.y;
    pos.y = sin( twistFactor * length( position ) ) * position.x + cos( twistFactor * length( position ) ) * position.y;
    pos.z = 0.0;

    gl_Position = projectionMatrix * modelViewMatrix * vec4( pos, 1.0 );

}