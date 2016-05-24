function [out]=convFreq(x,h)

sizex=length(x);
sizeh=length(h);
sizeConv=2^ceil(log2(sizex+sizeh-1));

X=fft(x,sizeConv);
H=fft(h,sizeConv);
Y=X.*H;

out=(ifft(Y,'symmetric'));