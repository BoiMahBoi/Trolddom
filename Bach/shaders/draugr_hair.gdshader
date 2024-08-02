shader_type spatial;
uniform sampler2D normalmap_tex: repeat_enable, filter_linear;
uniform sampler2D normalmap_tex2: repeat_enable, filter_linear;

uniform vec3 albino: source_color;
uniform vec3 death_color: source_color;
uniform float death_pct: hint_range(0.0, 1.0) = 0.0;
uniform sampler2D color_noise: repeat_enable, filter_linear;
uniform sampler2D color_noise2: repeat_enable, filter_linear;

uniform vec2 direction1 = vec2(1.0, 0.0);
uniform vec2 direction2 = vec2(0.0, 1.0);
uniform float scroll_speed: hint_range(0.0, 1.0) = 0.1;
uniform float scroll_speed2: hint_range(0.0, 1.0) = 0.1;


void fragment() {
	vec2 offset1 = scroll_speed * direction1 * TIME;
	vec2 offset2 = scroll_speed2 * direction2 * TIME;
	
	vec3 color_noise_map = texture(color_noise, UV + offset1).rgb;
	vec3 color_noise_map2 = texture(color_noise, UV + offset2).rgb;
	
	vec3 final_color_NM = mix(color_noise_map,color_noise_map2,0.3);
	vec3 final_base_color = mix(albino,final_color_NM,0.5);
	vec3 final_color = mix(final_base_color, death_color, death_pct);
	
	
	
	vec3 normal = texture(normalmap_tex, UV + offset1).rgb;
	vec3 normal2 = texture(normalmap_tex, UV + offset2).rgb;
	vec3 final_normal = mix(normal, normal2, 0.5);
	
	NORMAL_MAP = final_normal;
	
	ALBEDO = final_color;
	METALLIC = 0.0;
	ROUGHNESS = 0.9;
	}