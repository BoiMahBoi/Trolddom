shader_type spatial;

uniform vec2 scroll = vec2(0.5);
uniform vec2 scroll2 = vec2(0.3);
uniform vec2 noiseScale = vec2(1.0);
uniform vec2 noiseScale2 = vec2(1.0);

uniform sampler2D fire_noise: repeat_enable;
uniform sampler2D vobing_tex: repeat_enable, filter_linear;
uniform sampler2D tone_mapping: repeat_enable, filter_linear;
uniform float blur: hint_range(0.0, 7.0) = 3.0;
uniform float base_intensity: hint_range(0.0, 0.5) = 0.1;
uniform float intensity_factor: hint_range(0.0, 5.0) = 1.5;

void vertex(){
	VERTEX.x += sin(TIME * 3. + VERTEX.y * 10.) * 0.01;
	VERTEX.z += sin(TIME * 2. + VERTEX.x * 0.002) * 0.0025;
}


void fragment(){
	//vec4 fireTex =  texture(fire_noise, UV);
	//vec4 gradient_color = texture(gradient_tex, fireTex.rg);

	//ALBEDO = gradient_color.rgb;

	float vobing = texture(vobing_tex, UV + TIME * scroll).r;

	float pattern_intensity = texture(fire_noise, UV + TIME * scroll).r;
	float pattern_intensity2 = texture(fire_noise, UV + TIME * scroll2).r;
	float intensity =  pattern_intensity * pattern_intensity2;
	vec4 color = texture(tone_mapping, vec2(intensity));

	ALBEDO = color.rgb;
}