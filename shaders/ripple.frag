#pragma header

uniform float iTime;

uniform float speed = 4.0;
uniform float distortionAmount = 0.01;
uniform float distortionIntensity = 4.0;

void main()
{
	vec2 uv = openfl_TextureCoordv.xy;
	uv = (floor(uv * (openfl_TextureSize * 5)) + vec2(0.5, 0.5)) / (openfl_TextureSize * 5);
	
	vec2 relativeMouse = vec2(0.5, 0.5);
    
	vec2 dv = vec2(relativeMouse.x - uv.x, relativeMouse.y - uv.y);	
	float slope = cos(length(dv) * (distortionIntensity) - iTime * speed);
    
	vec2 fv = uv + normalize(dv) * slope * distortionAmount;

	fv = 1.0 - abs(fract(fv * 0.5) * 2.0 - 1.0);
	
	gl_FragColor = flixel_texture2D(bitmap, fv);
}