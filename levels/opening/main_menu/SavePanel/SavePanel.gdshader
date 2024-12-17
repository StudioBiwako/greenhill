shader_type canvas_item;

uniform vec2 shadow_offset = vec2(4.0, 4.0);
uniform vec4 shadow_color : source_color = vec4(0.0, 0.0, 0.0, 0.5);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 color = texture(TEXTURE, UV);
    vec4 shadow = texture(TEXTURE, UV - shadow_offset * TEXTURE_PIXEL_SIZE);
    
    COLOR = mix(shadow_color, color, color.a);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
