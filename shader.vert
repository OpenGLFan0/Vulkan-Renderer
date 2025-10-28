#version 450

layout(location=0) out vec3 fragColor;

vec3 colors[4] = vec3[](
	vec3(1.0, 0.0, 0.0), // lower left
						vec3(0.0, 1.0, 0.0), // lower right
						vec3(0.0, 0.0, 1.0), // upper right
						vec3(1.0, 1.0, 0.0)  // upper left
);

// triangles: (0,1,2), (0,2,3)
// So expand index mapping:
vec2 positions[6] = vec2[](
	vec2(-0.5, -0.5), // lower left, 0
						   vec2( 0.5, -0.5), // lower right, 1
						   vec2( 0.5,  0.5), // upper right, 2
						   vec2(-0.5, -0.5), // lower left, 0
						   vec2( 0.5,  0.5), // upper right, 2
						   vec2(-0.5,  0.5)  // upper left, 3
);

int indices[6] = int[](
	0, 1, 2, 0, 2, 3
);
void main(){
	gl_Position = vec4(positions[gl_VertexIndex], 0.0, 1.0);
	fragColor = colors[indices[gl_VertexIndex]];
}

