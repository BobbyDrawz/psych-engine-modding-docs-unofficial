    #pragma header

    void main()
    {
		vec2 pos = openfl_TextureCoordv;
		pos -= 0.5;
		float xx = abs(cos(pos.x));
		float yy = abs(cos(pos.y*0.5625));
		pos *= xx*yy;
		pos += 0.5;
		gl_FragColor = flixel_texture2D(bitmap, pos);
    }