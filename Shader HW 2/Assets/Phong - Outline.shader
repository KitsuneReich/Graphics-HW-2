
//Adapted from Example 5.3 in The CG Tutorial by Fernando & Kilgard
Shader "CM163/Phong"
{
    Properties
    {   
        _Color ("Color", Color) = (1, 1, 1, 1) //The color of our object
        _EmmisiveColor("Emmisive Color", Color) = (1, 1, 1, 1)
        _Emissiveness("Emmissiveness", Range(0,10)) = 0
        _Shininess ("Shininess", Float) = 10 //Shininess
        _SpecColor ("Specular Color", Color) = (1, 1, 1, 1) //Specular highlights color
        _MainTex ("Texture", 2D) = "white" {}
    }
    
    SubShader
    {
        Pass {
            Tags { "LightMode" = "ForwardAdd" } //Important! In Unity, point lights are calculated in the the ForwardAdd pass
            Blend One One //Turn on additive blending if you have more than one point light
          
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"
            
           
            uniform float4 _LightColor0; //From UnityCG
            uniform float4 _Color; 
            uniform float4 _SpecColor;
            uniform float _Shininess;
    
            uniform float4 _EmmisiveColor;
            uniform float _Emissiveness;   
            sampler _MainTex;       
          
            struct appdata
            {
                    float4 vertex : POSITION;
                    float3 normal : NORMAL;
                    float2 uv: TEXCOORD0;
            };

            struct v2f
            {
                    float4 vertex : SV_POSITION;
                    float3 normal : NORMAL;       
                    float3 vertexInWorldCoords : TEXCOORD1;
                    float2 uv: TEXCOORD0;
                    float3 viewDir: TEXCOORD2;
            };

 
           v2f vert(appdata v)
           { 
                v2f o;
                o.vertexInWorldCoords = mul(unity_ObjectToWorld, v.vertex); //Vertex position in WORLD coords
                //o.normal = v.normal; //Normal 
                o.normal = UnityObjectToWorldNormal(v.normal);
                o.uv = v.uv;
                o.vertex = UnityObjectToClipPos(v.vertex); 
                o.viewDir = normalize(_WorldSpaceCameraPos.xyz - mul(unity_ObjectToWorld, v.vertex).xyz);
                
              

                return o;
           }

           fixed4 frag(v2f i) : SV_Target
           {
                float ndotV = 1 - dot(i.normal, i.viewDir);
                ndotV *= 1.5;
                return float4(ndotV + i.normal.x, ndotV + i.normal.y, ndotV, 0);
 
            }
            
            ENDCG
 
            
        }
            
    }
}
