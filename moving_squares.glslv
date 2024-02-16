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


    vec2 startPoint = vec2(0.10,0.1);
    vec2 endPoint = vec2(0.9,0.3);
    
    draw_square(pct, st, startPoint, endPoint,  0.05);
    draw_square(pct, st + sin(u_time+1.)/5., vec2(0.,0.), vec2(0.3,0.8),  0.01);
    draw_square(pct, st + vec2(0.,sin(u_time)/10.), vec2(0.5,0.4), vec2(0.9,0.6),  0.02);
    draw_square(pct, st + sin(u_time)/10.*vec2(-1.,1.), vec2(0.4,0.7), vec2(1.,1.), 0.02);
    

    color = vec3(pct);

    gl_FragColor = vec4(color,1.0);
}