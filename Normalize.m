function f = Normalize(wave)
Abs = abs(wave);
Sign = sign(wave);
Abs = mapminmax(Abs,0,1);
f = Sign.*Abs;