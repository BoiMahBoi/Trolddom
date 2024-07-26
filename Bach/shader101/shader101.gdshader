shader_type canvas_item;

uniform vec4 my_color: source_color;

void vertex() {
	if (VERTEX.y > 0.0 && VERTEX.x <0.0){
		//VERTEX += vec2(cos(TIME*0.5)*100.0, sin(TIME)*40.0);
	}
	
}

void fragment(){
	float change = (sin(TIME*2.0)+1.0)*0.5;
	
	vec4 color1 = vec4(1.0, 0.0, 0.0, 1.0);
	vec4 color2 = vec4(0.0, 1.0, 0.0, 1.0);
	
	//vec4 output_color =mix(color1, color2, change);
	
	
	COLOR = texture(TEXTURE, UV) * my_color;
}

