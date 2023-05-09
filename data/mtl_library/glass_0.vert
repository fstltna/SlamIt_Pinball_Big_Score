uniform vec4 view_position;
uniform vec4 vViewDirection;   
   

varying vec3 vNormal;
varying vec3 vViewVec; 

void main(void)
{   	
   vec3 Pos = gl_Vertex.xyz;       
   gl_Position = gl_ModelViewProjectionMatrix * vec4(Pos,1.0);
    	
   vViewVec = -vViewDirection.xyz;
   vNormal = gl_NormalMatrix * gl_Normal;
//   vNormal = gl_Normal;
       
   float K=1.0;     	 
   vec3 u = normalize( vec3(gl_ModelViewMatrix * gl_Vertex) );
   vec3 n = normalize( gl_NormalMatrix * gl_Normal );
   vec3 r = reflect( u, n );
   float m = 2.0 * sqrt( r.x*r.x + r.y*r.y + (r.z+1.0)*(r.z+1.0) );
   gl_TexCoord[2].s = (r.x/m)*K + 0.5;
   gl_TexCoord[2].t = (1.0-((r.y/m)*K + 0.5));
     	         
    		  	
   // diffuse 	 
   gl_TexCoord[0]=gl_MultiTexCoord0;  
 
   // lightmap
   gl_TexCoord[1]=gl_MultiTexCoord1;  
    	   
              
   //gl_FrontColor=gl_Color;	
    	   	                  
}  

