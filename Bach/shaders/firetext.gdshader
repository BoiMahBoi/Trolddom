shader_type spatial;

uniform vec2 scroll = vec2(0.5);
uniform vec2 scroll2 = vec2(0.3);
uniform vec2 noiseScale = vec2(1.0);
uniform vec2 noiseScale2 = vec2(1.0);

uniform sampler2D noise_fire;
uniform sampler2D text;
uniform sampler2D tone_mapping;
uniform float blur: hint_range(0.0, 7.0) = 3.0;
uniform float base_intensity: hint_range(0.0, 0.5) = 0.1;
uniform float intensity_factor: hint_range(0.0, 5.0) = 1.5;


void fragment(){
	
	float vobing = texture(noise_fire, UV + TIME * scroll).r;
	
	float tex_alpha = texture(text, UV).a;
	float pattern_intensity = texture(noise_fire, UV + TIME * scroll).r;
	float pattern_intensity2 = texture(noise_fire, UV + TIME * scroll2).r;
	float intensity = tex_alpha * pattern_intensity * pattern_intensity2;
	vec4 color = texture(tone_mapping, vec2(intensity)); 
	
	ALBEDO = color.rgb;
}