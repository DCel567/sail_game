shader_type canvas_item;

void fragment() {
	float mean = 0.0;
	
	COLOR = texture(TEXTURE, UV);
	mean = (COLOR.r + COLOR.g + COLOR.b)/3.0;
	
	COLOR.rgb = vec3(mean, mean, mean);
}
