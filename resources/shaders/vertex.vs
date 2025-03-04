#version 330 core

in vec3 position;
in vec2 textureCoords;
in vec3 normal;

out vec2 o_fragTextureCoords;
out vec3 o_normal;
out vec3 o_pos;

uniform mat4 transformationMatrix;
uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;

void main() 
{ 
    vec4 worldPos =  transformationMatrix * vec4(position, 1);
    gl_Position = projectionMatrix * viewMatrix * worldPos;
    o_normal = normalize(worldPos).xyz;
    o_pos = worldPos.xyz;
    o_fragTextureCoords = textureCoords;
}