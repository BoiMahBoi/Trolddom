shader_type spatial;
uniform sampler2D stone_normal: repeat_enable, filter_linear;
uniform sampler2D stone_normal2: repeat_enable, filter_linear;

uniform sampler2D gradient_texture;
uniform sampler2D shape: repeat_enable, filter_linear_mipmap;

uniform float texture_str: hint_range(0.0, 1.0, 0.3);
uniform vec3 start_color: source_color;

void vertex() {
	//VERTEX.x += sin( VERTEX.y*10.)*0.06;
}

void fragment() {
	//texture
	vec3 rock_map1 = texture(stone_normal, UV).rbg;
	vec3 rock_map2 = texture(stone_normal2, UV).rbg;
	vec3 uv_texture = normalize(rock_map1.rbg); 
	vec3 uv_texture2 = normalize(rock_map2.rbg); 
	
	
	//color
	//setting up normals og UV
	vec3 noise_normal_mix = mix(uv_texture2, NORMAL, 0.2);
	vec3 noise_texture_mix = mix(noise_normal_mix, uv_texture, 0.2);
	float color_noise = noise_texture_mix.r;
	vec2 uv_mix = mix(UV, noise_texture_mix.rg,0.05);
	//making refrends
 	vec4 greycolor = texture(shape, uv_mix);
	//mix the color with texture
	vec3 sample_coords = mix (greycolor.rgb, uv_texture, 0.3);
	vec4 gradient_color = texture(gradient_texture, sample_coords.rg);
	//mix normals with color texturer 
	vec3 final_normal = mix( uv_texture * texture_str, greycolor.rgb, 0.5);
	
	NORMAL_MAP= final_normal;
	
	ALBEDO = gradient_color.rgb;
	
	ROUGHNESS = 0.9;
}

