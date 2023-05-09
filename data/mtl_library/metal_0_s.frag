uniform sampler2D DiffuseMap;
uniform sampler2D LightMap;
uniform sampler2D ReflectionMap; 
uniform float reflection; 
uniform float LUM;

void main(void)
{
   vec4 Cs=texture2D(DiffuseMap, gl_TexCoord[0].xy);
   vec4 CL=texture2D(LightMap, gl_TexCoord[1].xy);	 	
   vec4 Crefl=texture2D(ReflectionMap, gl_TexCoord[2].xy);	 	  
		  
 //  vec4 Ci = Cs*CL;
 //  float r=reflection;
 //  Ci=r*Crefl + (1-r)*Ci;      
 //  Ci.w=Cs.w;   

   vec4 Ci = Cs;
   Ci = Cs.w*Cs.w*Cs + (1.0-Cs.w)*(1.0-Cs.w)*Crefl;    
 
   float r = 0.40;
   CL=LUM*CL;
   Ci = r*Ci + (1.0 - r)*CL;        
      
   Ci.w = 1.0;  
   		 
   gl_FragColor = Ci;                            
}	  