#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    vec3 color = vec3(0.0);

    vec2 pos = vec2(0.5)-st;

    float r = length(pos)*2.0;
    float a = atan(pos.y,pos.x);
    a += u_time * 6.;

    float f = (abs(cos(a*12.) * abs(sin(a*3.)))*.8+.1 * step(0.6,r)) * step(0.02,r);

    color = vec3( 1.-smoothstep(f,f,r) ) * vec3(r+0.1,0.,0.5+r*0.4) + (smoothstep(0.7,0.75,r) - smoothstep(0.75,0.75 + abs(sin(u_time))*0.1 ,r))*vec3(0.,0.,1.)*(abs(sin(u_time/2.))+0.5);

    gl_FragColor = vec4(color, 1.0);
}
