uniform sampler2D map;
uniform float K;

varying vec4 fPos;

void main(void)
{
   vec4 value=texture2D(map, gl_TexCoord[0].xy);       
   
   //vec2 c = fPos.xy / fPos.w;
   //c = (c + 1.0) / 2.0;    
   //vec4 value=texture2D(map, c.xy);       
	 
   value=K*value;		
   value.w=1.0;	 
   gl_FragColor = value;         
    
}   