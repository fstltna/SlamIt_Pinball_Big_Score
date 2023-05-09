uniform sampler2D DiffuseMap;
uniform sampler2D LightMap;
uniform sampler2D ReflectionMap; 
uniform float lightPower;
uniform float LUM;

varying vec3 vNormal;
varying vec3 vViewVec;   


void main(void)
{   
   vec4 Cs=texture2D(DiffuseMap, gl_TexCoord[0].xy);
   vec4 CL=texture2D(LightMap, gl_TexCoord[1].xy);	 	
   vec4 Crefl=texture2D(ReflectionMap, gl_TexCoord[2].xy);	 	  
     
   vec3 normal = normalize(vNormal);
   float v =  dot(normalize(vViewVec), normal);
          		  
   vec4 Ci = Cs;
   Cs=Cs*3.0;
   
   float reflection=0.45;  

   // increase luminosity in f(power) 
 //  reflection=0.45-(1-lightPower)*0.35;   
   reflection=0.45-lightPower*0.35;   
  
   Ci=(1.0-reflection)*(1.0-reflection)*Cs + reflection*reflection*Crefl;      
       
      
   Ci.w=v*0.90+(1.0-v)*1.0;      
   vec3 edge_color=Ci.xyz*1.2;   
   Ci.xyz=Ci.xyz+0.5*v*edge_color;            
      	   
	   
   Ci.xyz=Ci.xyz*CL.xyz;   // TODO: poseban shader za LED lampice bez lajtmapa!         
   Ci.xyz=LUM*Ci.xyz;
    	   		
   gl_FragColor = Ci;                                 
    
}  	  