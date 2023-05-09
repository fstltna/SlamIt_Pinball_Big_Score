uniform sampler2D baseMap;

void main(void)
{
   vec4 Ci=texture2D(baseMap, gl_TexCoord[0].xy);  
   gl_FragColor = Ci;                         
}