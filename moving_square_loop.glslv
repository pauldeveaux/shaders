#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;


void draw_square(inout float pct, vec2 st, vec2 startPoint, vec2 endPoint, float thick){
    vec2 bl =  step(vec2(thick), st - startPoint);
    vec2 tr = step(vec2(thick),endPoint-st);
    
    vec2 blr = (1.- step(vec2(startPoint), st)); 
    vec2 trr = step(vec2(endPoint), st); 
    
    pct *= bl.x * bl.y * tr.x * tr.y + blr.x + blr.y + trr.x + trr.y;
}

void main(){
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    vec3 color = vec3(0.0);
    float pct = 1.; 
    
    
    for(float i = 2.; i < 6.; i+=1.){
        draw_square(pct, st + sin(u_time+i)/2., vec2(1.-i,1.-i), vec2(i/5.,i/5.), i/100.);
    }
    

    color = vec3(pct);

    gl_FragColor = vec4(color,1.0);
}