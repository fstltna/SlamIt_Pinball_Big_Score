void main(void)
{   	
   gl_Position=ftransform();       
   gl_Position.xy = gl_Position.xy+gl_MultiTexCoord1.xy;          	  
   gl_TexCoord[0]=gl_MultiTexCoord0;
   gl_FrontColor=gl_Color;	
   	   	                  
}

