shader_type spatial;
uniform sampler2D stone_normal: repeat_enable;

uniform sampler2D gradient_texture;
uniform sampler2D shape;


uniform vec3 start_color: source_color;

void vertex() {
	//VERTEX.x += sin( VERTEX.y*10.)*0.06;
}

void fragment() {
	//color

	
	//texture
	vec3 rock_map = texture(stone_normal, UV).rbg;
	
	//vec3 bacis_normal = mix(col, rock_map, 0.4);
	
	
	vec4 color = texture(shape, UV);
	float greyscale= (color.r + color.g + color.b)/3.0;
	
	vec2 sample_coords = vec2 (greyscale);
	vec4 gradient_color = texture(gradient_texture, sample_coords);
	
	vec3 final_color = mix (gradient_color.rgb, start_color, 0.7);
	
	//NORMAL_MAP= rock_map;
	
	ALBEDO = final_color.rgb;
	METALLIC = 0.01;
	ROUGHNESS = 9.;
}

