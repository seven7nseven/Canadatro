extern number opacity;


vec4 effect( vec4 colour, Image texture, vec2 texcord, vec2 screencord) {
	vec4 src = Texel(texture, texcord);
	vec4 one = vec4(1.);

	vec3 colour = vec3(255./255., 198./255., 82./255.);
	vec4 blend = vec4(colour, 1.);

	vec4 mult = 2. * src * blend;
	vec4 screen = one - (2. * (one - src)) * (one - blend);

	number grey = (src.r + src.b + src.g) / 3.;
	number threshold = step(grey, .5);
	vec4 overlay = (mult * (1. - threshold)) + (screen * threshold);
	return mix(src, overlay, vec4(opacity));
}