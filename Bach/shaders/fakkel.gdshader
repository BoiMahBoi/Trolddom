shader_type spatial;

uniform sampler2D tex;

void fragment(){
	vec4 color = texture(tex, UV);
	
	ALBEDO = color.rgb;
}
