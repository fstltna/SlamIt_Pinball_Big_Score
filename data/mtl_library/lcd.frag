uniform sampler2D baseMap;



void main(void)  
{
   vec4 Ci=texture2D(baseMap, gl_TexCoord[0].xy);   
 
  // float Lum=2.8;

  // float px=0.0019531*3;  
  // float py=0.0078125*3;  
  // vec4 s1=texture2D(baseMap, gl_TexCoord[0].xy+vec2(-px,-py));        
  // vec4 s2=texture2D(baseMap, gl_TexCoord[0].xy+vec2(-px,py));     
  // vec4 s3=texture2D(baseMap, gl_TexCoord[0].xy+vec2(px,-py));     
//   vec4 s4=texture2D(baseMap, gl_TexCoord[0].xy+vec2(px,py));     

  // s1=s1*Lum;	
  // s2=s2*Lum;	
  // s3=s3*Lum;	
  // s4=s4*Lum;	
    
  // float w1=1;
  // float w2=1;
  // float w3=1;
  // float w4=1;
  // vec4 final=(s1*w1+s2*w2+s3*w3+s4*w4)*0.25;    	      	 
    
//   Lum=(Ci.x+Ci.y+Ci.z);        
  // if(Lum<0.3)  
    // final=vec4(0,0,0,0); 
    
   Ci=1.8*Ci; 	
   Ci.w=1;   
   gl_FragColor = Ci;                          
}   