uniform sampler2D Map1;
uniform sampler2D Map2;
uniform float fade;

void main(void)
{
   vec4 C1=texture2D(Map1, gl_TexCoord[0].xy);  
   vec4 C2=texture2D(Map2, gl_TexCoord[0].xy);  
   vec4 Ci=C2*fade+(1.0-fade)*C1;   
   gl_FragColor = Ci;                         
}