precision highp float;
precision highp int;

varying vec2 uvs;

uniform float time;
uniform sampler2D myTexture;

float GetGrayValue( vec3 color )
{
    float grayValue = 0.21 * color.r;
    grayValue += 0.72 * color.g;
    grayValue += 0.07 * color.b;
     
    return grayValue;
}

void main() {
    
    vec2 uv = uvs;
    uv += vec2( sin( time ), sin( time * 2.0 ) ) * 0.1;
    
    vec3 col = texture2D( myTexture, uv ).xyz;
    
    float v = length( uvs - 0.5 );
    v *= 2.0;
    col *= 1.0 - v;
    

    gl_FragColor = vec4( vec3( col ), 1.0 );

}