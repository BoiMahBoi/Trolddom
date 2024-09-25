shader_type spatial;

uniform sampler2D tex;

void fragment(){
	vec4 color = texture(tex, UV);

	ALBEDO = vec3(color.r*0.8, color.g*0.5, color.b*0.2);
}
