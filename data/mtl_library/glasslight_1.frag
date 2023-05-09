uniform sampler2D OffMap;
uniform sampler2D LightMap;
uniform sampler2D OnMap;   
uniform float power;
uniform float LUM; 


void main(void)
{
   vec4 off=texture2D(OffMap, gl_TexCoord[0].xy);
   vec4 L=texture2D(LightMap, gl_TexCoord[1].xy);	 	
   vec4 on=texture2D(OnMap, gl_TexCoord[0].xy);
     	    
   vec4 Ci=off;
   Ci=Ci*(1.0 - power)*LUM*L;    
   Ci = Ci*(1.0 - power) + power*on;	  	
   Ci.w = 1.0; 
   gl_FragColor = Ci;                         
}