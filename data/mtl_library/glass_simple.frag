uniform sampler2D Rainbow;
uniform sampler2D Environment; 
//uniform samplerCube Environment;
uniform float rainbowiness;

varying vec3 vNormal;
varying vec3 vViewVec; 

void main(void)
{
   vec3 normal = normalize(vNormal);

   float v =  dot(normalize(vViewVec), normal);

   // Map a rainbowish color
   vec3 rainbow = texture2D(Rainbow, vec2(v,0.0)).xyz;

   // Find the reflection
//   vec3 reflVec =  reflect(-vViewVec, normal);
//   vec3 refl = textureCube(Environment, reflVec).xyz;
//   vec3 refl = texture2D(Environment, reflVec.xy).xyz;       	 
//   vec3 refl = vec3(0.8,0.0,0.0);      
   vec3 refl = texture2D(Environment, gl_TexCoord[0].xy ).xyz;         	  
//   vec3 color = refl; 
//   gl_FragColor = vec4 (color,  1.0);         
//   vec3 color = (1.0 - v) * rainbow;   

   vec3 color = (1.0 - v) * rainbow;   
//   vec3 color = mix(refl, rainbow, rainbowiness * v);
   gl_FragColor = vec4 (color,  1.0 - v);   


     
}       