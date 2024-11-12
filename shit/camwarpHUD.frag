    #pragma header

	uniform int invert;

    void main()
    {
		vec2 pos = openfl_TextureCoordv;
		pos -= 0.5;
		float xx = abs(cos(0.7*pos.x));
		float yy = abs(cos(0.7*pos.y*0.5625));
		pos *= xx*yy;
		pos += 0.5;
		vec4 color = flixel_texture2D(bitmap, pos);
		if(invert == 1) {
			gl_FragColor = vec4(1-color.rgb,1.0)*color.a;
		}
		else {
			gl_FragColor = color;
		}
    }