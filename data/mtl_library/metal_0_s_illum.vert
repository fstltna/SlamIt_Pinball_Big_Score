uniform mat4 wxform;   
uniform vec4 view_position;
uniform vec4 vViewDirection;    
   
// world system: up: +z, forward: +y


uniform vec4 uv_xform;     	   	    	   	   	                  



void main(void)
{   	
   vec3 Pos = gl_Vertex.xyz;
        
   gl_Position = gl_ModelViewProjectionMatrix * vec4(Pos,1.0);
   vec3 vNormal; 
   vec3 vViewVec;  
    	
        
   vNormal = gl_Normal;
    	
   // include rotation 	for dynamic objects 
   vNormal.x=wxform[0].x*gl_Normal.x+wxform[1].x*gl_Normal.y+wxform[2].x*gl_Normal.z;      	 
   vNormal.y=wxform[0].y*gl_Normal.x+wxform[1].y*gl_Normal.y+wxform[2].y*gl_Normal.z;      	
   vNormal.z=wxform[0].z*gl_Normal.x+wxform[1].z*gl_Normal.y+wxform[2].z*gl_Normal.z;      		      	  
   Pos.x=wxform[0].x*gl_Vertex.x+wxform[1].x*gl_Vertex.y+wxform[2].x*gl_Vertex.z;      	 
   Pos.y=wxform[0].y*gl_Vertex.x+wxform[1].y*gl_Vertex.y+wxform[2].y*gl_Vertex.z;      	
   Pos.z=wxform[0].z*gl_Vertex.x+wxform[1].z*gl_Vertex.y+wxform[2].z*gl_Vertex.z;      	
       
   vViewVec = -vViewDirection.xyz;    
            
   vec3 vReflect = 2.0 * dot( vNormal, vViewVec ) * vNormal - vViewVec;               
    
   float m=-vReflect.y*0.5+0.5;         
   m=inversesqrt(m);
   vec3 B=vReflect*m; 
   B=B*0.25+0.5;    
   gl_TexCoord[1]=vec4(B.x,-B.z,1.0,1.0); 
      
   vec3 C,D;
//   C.x=uv_xform.x*B.x+uv_xform.y;   	   	 
//   C.y=uv_xform.z*(-B.z)+uv_xform.w;    	   	
	      
//   C.x=uv_xform.x*(gl_Vertex.x-uv_xform.y) + 0.5;   	      	   
//   C.y=uv_xform.z*(gl_Vertex.y-uv_xform.w) + 0.5;   	   	 

 //  C.x=vNormal.x*0.5 + 0.5;   	      	   
 //  C.y=vNormal.y*0.5 + 0.5;   	      	    
    
    D.x=(gl_Vertex.x + 30.64)*uv_xform.x;   	      	     
    D.y=(gl_Vertex.y + 65.80)*uv_xform.y;     
    
 //   C.x=(1-D.y)*0.5;     	      
 //   C.y=1 - D.x*0.5;      	      

    C.x=(1.0 - D.y)*0.39843;  	      	      
    C.y= 1.0 - D.x*0.18359;  	      	      
    	      
   	
   gl_TexCoord[0]=vec4(C.x,C.y,1.0,1.0);
   	
   gl_FrontColor=gl_Color;
   		
   	   	                  
}  
  