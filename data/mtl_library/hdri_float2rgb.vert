
varying vec4  fPos;  

void main(void)
{   
 	gl_Position = ftransform();		
	gl_TexCoord[0] = gl_MultiTexCoord0;
	fPos=gl_Position;
}              