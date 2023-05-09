uniform sampler2D TransMap;
varying vec4 fPos;

void main(void)
{
   vec4 vis;
   vec2 c = fPos.xy / fPos.w;
   c = (c + 1.0) / 2.0;
   	 
//   c.x=c.x*512;
//   c.y=c.y*384;        
//   float x=floor(c.x);  
//   float y=floor(c.y);
//   float index=y*512+x;   
//   vis.w= fract(index*0.5); 
//   vis.w= vis.w*2.0;              
     			
     			
   c*=4.0;
   vis=texture2D(TransMap, c.xy);              
  
   gl_FragColor = vec4(1.0,1.0,1.0,vis.w);      
   
}