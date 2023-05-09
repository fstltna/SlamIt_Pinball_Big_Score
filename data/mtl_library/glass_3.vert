uniform mat4 wxform;   
uniform vec4 view_position;
uniform vec4 vViewDirection;   

// world system: up: +z, forward: +y

varying vec3 vNormal;
varying vec3 vViewVec;

void main(void)
{
   vec3 Pos = gl_Vertex.xyz;
        
   gl_Position = gl_ModelViewProjectionMatrix * vec4(Pos,1.0);
    	
        
   vNormal = gl_Normal;
    	
   // include rotation 	for dynamic objects 
   vNormal.x=wxform[0].x*gl_Normal.x+wxform[1].x*gl_Normal.y+wxform[2].x*gl_Normal.z;      	 
   vNormal.y=wxform[0].y*gl_Normal.x+wxform[1].y*gl_Normal.y+wxform[2].y*gl_Normal.z;      	
   vNormal.z=wxform[0].z*gl_Normal.x+wxform[1].z*gl_Normal.y+wxform[2].z*gl_Normal.z;      		      	  
    
   
   vViewVec = -vViewDirection.xyz;  
   
}

