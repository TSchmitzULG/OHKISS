function [sweep,invSweep,R]=logSweep(N,f1,f2,timeFadeIn,fs)
% N duration of the sweep in samples
% f1 initial frequency of the sweep in hz
% f2 final frequency of the sweep in hz


Amplitude = 1;
if nargin == 4
fs=44100;
end;
if nargin == 3
    timeFadeIn = 0;
    fs=44100;
end;

w1 = 2*pi*f1;
w2 = 2*pi*f2;
n=0:N-1;
R = (N-1)/(log(f2/f1));

phase = (f1*R/fs) * (exp(n/R)-1);
sweep = Amplitude*sin(2*pi*phase);

%fade in sweep
if(timeFadeIn ~= 0)
sweep = fadeIn(sweep,timeFadeIn);
end;
 
%invSweep
invSweep = fliplr(sweep).*(f2/f1).^(-n/(N-1));

invSweep=invSweep';
sweep=sweep';

