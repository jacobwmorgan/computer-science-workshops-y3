precision highp float;
precision highp int;

uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;

attribute vec3 position;

uniform float time;

void main() {
    
    vec3 pos = position;
    
    //
    // Task 3: rotate the plane primitive
    //
    
    float angle = sin( time ) * 90.0;
    angle = radians( angle );
    
    // The math behind this consists of a simple 2D rotation matrix,
    // look here for more info about rotation matrices:
    // https://en.wikipedia.org/wiki/Rotation_matrix#In_two_dimensions
    
    pos.x = ( position.x * cos( angle ) ) - ( position.y * sin( angle ) );
    pos.y = ( position.x * sin( angle ) ) + ( position.y * cos( angle ) );
    pos.z = 0.0;
    
    gl_Position = projectionMatrix * modelViewMatrix * vec4( pos, 1.0 );
    
}