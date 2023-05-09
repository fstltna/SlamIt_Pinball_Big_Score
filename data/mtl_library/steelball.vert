uniform mat4 wxform;   
uniform vec4 view_position;
uniform vec4 vViewDirection;    

uniform float v_scale;
   
// world system: up: +z, forward: +y


void main(void)
{   	
   vec3 Pos = gl_Vertex.xyz;
        
   gl_Position = gl_ModelViewProjectionMatrix * vec4(Pos,1.0);
   vec3 vNormal;
   vec3 vViewVec; 
    	
       
   vNormal = gl_Normal;
        	
   vNormal.x=wxform[0].x*gl_Normal.x+wxform[1].x*gl_Normal.y+wxform[2].x*gl_Normal.z;      	 
   vNormal.y=wxform[0].y*gl_Normal.x+wxform[1].y*gl_Normal.y+wxform[2].y*gl_Normal.z;      	
   vNormal.z=wxform[0].z*gl_Normal.x+wxform[1].z*gl_Normal.y+wxform[2].z*gl_Normal.z;      		      	   
   Pos.x=wxform[0].x*gl_Vertex.x+wxform[1].x*gl_Vertex.y+wxform[2].x*gl_Vertex.z;      	 
   Pos.y=wxform[0].y*gl_Vertex.x+wxform[1].y*gl_Vertex.y+wxform[2].y*gl_Vertex.z;      	
   Pos.z=wxform[0].z*gl_Vertex.x+wxform[1].z*gl_Vertex.y+wxform[2].z*gl_Vertex.z;      	
   	        	  

   vNormal=normalize(vNormal);        
   

   // reflection 	
   vViewVec = -vViewDirection.xyz;                             			
   vec3 vReflect = 2.0 * dot( vNormal, vViewVec ) * vNormal - vViewVec;
   //vReflect=normalize(vReflect);        
   float m=-vReflect.y*0.5+0.5;             
//   float m=-2*0.5+0.5;              
   m=inversesqrt(m);   
   vec3 B=vReflect*m;   
   B=B*0.25+0.5;     
   gl_TexCoord[1]=vec4(B.x,-B.z*v_scale,1.0,1.0);       
  //gl_TexCoord[1]=vec4(B.x,B.z*v_scale,1.0,1.0);       
    
      			
   // diffuse 	 
   gl_TexCoord[0]=gl_MultiTexCoord0;  
    	    
   		              
   gl_FrontColor=gl_Color;	
   	   	                  
}  
