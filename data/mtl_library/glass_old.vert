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
   Pos.x=wxform[0].x*gl_Vertex.x+wxform[1].x*gl_Vertex.y+wxform[2].x*gl_Vertex.z;      	 
   Pos.y=wxform[0].y*gl_Vertex.x+wxform[1].y*gl_Vertex.y+wxform[2].y*gl_Vertex.z;      	
   Pos.z=wxform[0].z*gl_Vertex.x+wxform[1].z*gl_Vertex.y+wxform[2].z*gl_Vertex.z;      	
    
   
  // vViewVec = -vViewDirection.xyz;                
  // vec3 vReflect = 2.0 * dot( vNormal, vViewVec ) * vNormal - vViewVec;               
  // float m=-vReflect.y*0.5+0.5;         
  // m=inversesqrt(m);
  // vec3 B=vReflect*m; 
  // B=B*0.25+0.5;    
  // gl_TexCoord[0]=vec4(B.x,-B.z,1,1);
   
   
    float K=1.0;     	 
	vec3 u = normalize( vec3(gl_ModelViewMatrix * gl_Vertex) );
	vec3 n = normalize( gl_NormalMatrix * gl_Normal );
	vec3 r = reflect( u, n );
	float m = 2.0 * sqrt( r.x*r.x + r.y*r.y + (r.z+1.0)*(r.z+1.0) );
	gl_TexCoord[0].s = (r.x/m)*K + 0.5;
	gl_TexCoord[0].t = (1.0-((r.y/m)*K + 0.5))*v_scale;
 
   	
   	                
   
}

