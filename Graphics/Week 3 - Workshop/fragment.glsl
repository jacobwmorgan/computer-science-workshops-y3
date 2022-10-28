precision highp float;
precision highp int;

// Get the UV co-ordinates from the vertex shader
varying vec2 uvs;

// We want to be able to scale things over time
uniform float time;

// We want to be able to use our own texture
uniform sampler2D myTexture;

// This is a basic luminance function.
// It returns the grayscale value of a particular color.
// It is weighted more towards green because of how the human eye perceives color.
float GetGrayValue( vec3 color )
{
    // These color weights are approximations at 2dp, but this is good enough for our purposes.

    float grayValue = 0.21 * color.r;   // 21% red
    grayValue += 0.72 * color.g;        // 72% green
    grayValue += 0.07 * color.b;        // 7% blue
    return grayValue;
}

void main() 
{   
    // We want to modify the UVs.. so we make a copy, because we
    // can't modify variables that are "varying" (see above). 
    vec2 uv = uvs;

    // Wobble UVs over time
    uv += vec2( sin( time ), sin( time * 2.0 ) ) * 0.1;
    
    // Get the color from the texture
    vec3 col = texture2D( myTexture, uv ).xyz;
    
    // We want to create a vignette effect.. here are the steps we need to do:
    // Step 1: create a circle, centered at (0.5, 0.5)
    float v = length( uvs - 0.5 );
    // Step 2: Reduce the size of the circle so that it's twice as big
    v *= 2.0;
    // Step 3: use this circle as a 'mask', subtracting away from the color
    col *= 1.0 - v;
    
    // End result goes in gl_FragColor.
    gl_FragColor = vec4( col, 1.0 );
}