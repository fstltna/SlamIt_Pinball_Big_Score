 
uniform vec3 uv_scale; 
uniform vec3 uv_transl;
       
void main(void)
{   
   
 
   gl_Position = ftransform();

   gl_TexCoord[0] = vec4(gl_MultiTexCoord0.x*uv_scale.x+uv_transl.x,gl_MultiTexCoord0.y*uv_scale.y+uv_transl.y,1.0,1.0);
   gl_TexCoord[1] = gl_MultiTexCoord1;
   
}