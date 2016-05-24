function [out]=fadeIn(x,fadeTime)
%fade in de fadeTime second on the signal x


fs=44100;
nbSamplesFade=round(fs*fadeTime);
fade =linspace(0,1,nbSamplesFade);
out=[x(1:nbSamplesFade).*fade, x(nbSamplesFade+1:end)];