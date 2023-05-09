
varying vec4  fPos;  

void main(void)
{   
 	gl_Position = ftransform();		 
	fPos=gl_Position;
}              