
uniform vec4  vParams;

void main(void)
{   
   vec3 pos = gl_Vertex.xyz;
   
   /*
   float pf=vParams.x;
   float qf=vParams.y;
   float L=vParams.z;
   float lambda=vParams.w;
   float p,q;
   p=pos.x;
   float value =1.0-((L-abs(p))/L);
   q=qf*cos(value*3.1469*0.5);  
   pos.y=pos.y+q;
   */
   
   //pos.y=pos.y+vParams.y*cos((1.0-((vParams.z-abs(pos.x))/vParams.z))*3.1469*0.5);  
   pos.y=pos.y + vParams.y*(0.5+0.5*cos( (1.0-((vParams.z-abs(pos.x))/vParams.z))*3.1469 ));   
             
   gl_Position = gl_ModelViewProjectionMatrix * vec4(pos,1.0);  
   gl_TexCoord[0]=gl_MultiTexCoord0;
   gl_TexCoord[1]=gl_MultiTexCoord1;
   gl_FrontColor=gl_Color; 
    	 
}