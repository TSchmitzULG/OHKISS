function [n] = logFreqToSample(freq,f1,f2,T,fs)

R = T/log(f2/f1);
n = fs*R*log(freq/f1) +1;