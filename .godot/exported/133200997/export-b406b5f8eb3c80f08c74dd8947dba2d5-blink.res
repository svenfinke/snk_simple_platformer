RSRC                     VisualShader            ????????                                            L      resource_local_to_scene    resource_name    output_port_for_preview    default_input_values    expanded_output_ports    input_name    script    source    texture    texture_type    parameter_name 
   qualifier    default_value_enabled    default_value    op_type 	   operator 	   function    hint    min    max    step    code    graph_offset    mode    modes/blend    flags/skip_vertex_transform    flags/unshaded    flags/light_only    nodes/vertex/0/position    nodes/vertex/connections    nodes/fragment/0/position    nodes/fragment/2/node    nodes/fragment/2/position    nodes/fragment/3/node    nodes/fragment/3/position    nodes/fragment/4/node    nodes/fragment/4/position    nodes/fragment/6/node    nodes/fragment/6/position    nodes/fragment/7/node    nodes/fragment/7/position    nodes/fragment/8/node    nodes/fragment/8/position    nodes/fragment/9/node    nodes/fragment/9/position    nodes/fragment/10/node    nodes/fragment/10/position    nodes/fragment/11/node    nodes/fragment/11/position    nodes/fragment/12/node    nodes/fragment/12/position    nodes/fragment/13/node    nodes/fragment/13/position    nodes/fragment/14/node    nodes/fragment/14/position    nodes/fragment/15/node    nodes/fragment/15/position    nodes/fragment/16/node    nodes/fragment/16/position    nodes/fragment/connections    nodes/light/0/position    nodes/light/connections    nodes/start/0/position    nodes/start/connections    nodes/process/0/position    nodes/process/connections    nodes/collide/0/position    nodes/collide/connections    nodes/start_custom/0/position    nodes/start_custom/connections     nodes/process_custom/0/position !   nodes/process_custom/connections    nodes/sky/0/position    nodes/sky/connections    nodes/fog/0/position    nodes/fog/connections        $   local://VisualShaderNodeInput_x4fc4 ?
      &   local://VisualShaderNodeTexture_sv0x6 ?
      -   local://VisualShaderNodeColorParameter_ikugw 3      .   local://VisualShaderNodeVectorDecompose_4wxaa ?      ,   local://VisualShaderNodeVectorCompose_jaluj ?      '   local://VisualShaderNodeVectorOp_ba6fg       $   local://VisualShaderNodeInput_u2oic @      *   local://VisualShaderNodeMultiplyAdd_gnlxg w      )   local://VisualShaderNodeVectorFunc_bw54x       $   local://VisualShaderNodeClamp_jicsy F      -   local://VisualShaderNodeFloatParameter_7qbx0 ?      &   local://VisualShaderNodeFloatOp_64nwf %      -   local://VisualShaderNodeFloatParameter_tdjpw Y      '   local://VisualShaderNodeVectorOp_jttkf ?         local://VisualShader_3flqe ?         VisualShaderNodeInput             texture          VisualShaderNodeTexture                                VisualShaderNodeColorParameter    
         BlinkColor                    VisualShaderNodeVectorDecompose                                                         VisualShaderNodeVectorCompose             VisualShaderNodeVectorOp             VisualShaderNodeInput             time          VisualShaderNodeMultiplyAdd                                              ??  ??  ??                                       VisualShaderNodeVectorFunc                                VisualShaderNodeClamp                                                                   ??  ??  ??                  VisualShaderNodeFloatParameter    
         Speed                  ?A         VisualShaderNodeFloatOp                      VisualShaderNodeFloatParameter    
      
   Intensity                            VisualShaderNodeVectorOp                      VisualShader #           shader_type canvas_item;
uniform vec4 BlinkColor : source_color = vec4(1.000000, 1.000000, 1.000000, 1.000000);
uniform float Speed = 20;
uniform float Intensity : hint_range(0, 1) = 0;



void fragment() {

	vec4 n_out3p0;
// Texture2D:3
	n_out3p0 = texture(TEXTURE, UV);


// VectorDecompose:6
	float n_out6p0 = n_out3p0.x;
	float n_out6p1 = n_out3p0.y;
	float n_out6p2 = n_out3p0.z;
	float n_out6p3 = n_out3p0.w;


// VectorCompose:7
	vec3 n_out7p0 = vec3(n_out6p0, n_out6p1, n_out6p2);


// ColorParameter:4
	vec4 n_out4p0 = BlinkColor;


// Input:9
	float n_out9p0 = TIME;


// FloatParameter:13
	float n_out13p0 = Speed;


// FloatOp:14
	float n_out14p0 = n_out9p0 * n_out13p0;


// VectorFunc:11
	vec3 n_out11p0 = sin(vec3(n_out14p0));


// Clamp:12
	vec3 n_in12p1 = vec3(0.00000, 0.00000, 0.00000);
	vec3 n_in12p2 = vec3(1.00000, 1.00000, 1.00000);
	vec3 n_out12p0 = clamp(n_out11p0, n_in12p1, n_in12p2);


// MultiplyAdd:10
	vec3 n_in10p2 = vec3(0.00000, 0.00000, 0.00000);
	vec3 n_out10p0 = fma(vec3(n_out4p0.xyz), n_out12p0, n_in10p2);


// FloatParameter:15
	float n_out15p0 = Intensity;


// VectorOp:16
	vec3 n_out16p0 = n_out10p0 * vec3(n_out15p0);


// VectorOp:8
	vec3 n_out8p0 = n_out7p0 + n_out16p0;


// Output:0
	COLOR.rgb = n_out8p0;
	COLOR.a = n_out6p3;


}
    
   =??ıL?                      
     %E  ?C                 
     ?B  HC!            "   
     CD   C#            $   
      C  D%            &   
    ??D   C'            (   
    ??D   B)            *   
    ?	E  D+            ,   
     >?  ?C-            .   
    ??D  CD/            0   
     ?C  fD1         	   2   
     >D  ?D3         
   4   
     C?  *D5            6   
     ??  >D7            8   
     ?C ??D9            :   
    ??D  ?D;       D                                                                                                                     
                            
      	                                                      
                                 RSRC