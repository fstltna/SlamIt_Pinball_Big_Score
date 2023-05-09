uniform sampler2D lightGI;
uniform sampler2D currentGI;
uniform float K;
uniform float intensity; 
uniform float LUMEN;

varying vec4 fPos;

void main(void)
{
   vec4 Llight=texture2D(lightGI, gl_TexCoord[0].xy);       
   
   vec2 c = fPos.xy / fPos.w;
   c = (c + 1.0) / 2.0;

   vec4 Lcurrent=texture2D(currentGI, c.xy);       
   
   gl_FragColor = K*Lcurrent + vec4(intensity*Llight.xyz*LUMEN,1.0);      
  
}