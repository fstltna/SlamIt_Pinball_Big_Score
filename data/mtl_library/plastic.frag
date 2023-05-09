uniform sampler2D baseMap;
uniform sampler2D lightMap;
uniform float KL1;
uniform float KL2;
uniform float LUM;


void main(void)
{
   vec4 base=texture2D(baseMap, gl_TexCoord[0].xy);
   vec4 illum=texture2D(lightMap, gl_TexCoord[1].xy);	 	
    
   vec4 Ci=base*(KL1*vec4(1.0,1.0,1.0,1.0) + KL2*LUM*illum);	 
   Ci.w = base.w; 
   gl_FragColor = Ci;                         
}