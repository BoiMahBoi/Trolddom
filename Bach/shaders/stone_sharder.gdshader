shader_type spatial;


uniform sampler2D noise_tex: repeat_enable;
uniform sampler2D stone_normal: repeat_enable;

uniform sampler2D gradient_texture;

uniform vec2 resolution = vec2(600.0, 400.0);
uniform vec3 start_color: source_color;

void vertex() {
	//VERTEX.x += sin( VERTEX.y*10.)*0.06;
}

void fragment() {
	//color
	vec2 uv = UV - 2.;
	uv.x *= resolution.x / resolution.y;
	uv *= 6.0;
	float min_dist = 200.;
	vec2 grid_coords = floor(uv);
	vec2 grid_uv = fract(uv) - 0.5;
	for(float y = -1.0; y <= 50.0; y++){
		for(float x =-1.0; x <= 20.0; x++){
		vec2 offset = vec2(x, y);
		vec2 n = vec2(offset + grid_coords);
		vec2 p = offset + n;
		float d = length(grid_uv - n);
		if (d < min_dist){
			min_dist = d;
		}
	}
	}
	
	
	vec3 col = vec3(min_dist);
	
	
	//texture
	float noise = texture(noise_tex, vec2(UV.x, UV.y/3.0)).r;
	noise = floor(noise*4.)/4.;
	vec3 rock_map = texture(stone_normal, UV).rbg;
	
	vec3 bacis_normal = mix(col, rock_map, 0.4);
	
	NORMAL_MAP= bacis_normal;
	
	ALBEDO = vec3(rock_map);
}

