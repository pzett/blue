close all
clear all
clc

fs=44100;
fc=fs/5;
Ts=1/fs;
upConversion=25;
bitrate=fs*6/upConversion;

% Generate random data
nrDataBits = bitrate; % Choose number of data bits
data1 = (rand(1, nrDataBits) > .5);
data = sixtyFourQAM(data1);

% Load the training sequence and guard bits
guard=dlmread('guard');
train=dlmread('train');
guardFront = sixteenQAM(rand(1, 2*82) > .5);

% Convert the length of the data into bits and then to complex symbols
sequenceLength = length(data);
binLength=zeros(1,18);
pos = 18;
while (sequenceLength > 0)
    binLength(pos) = mod(sequenceLength,2);
    sequenceLength=floor(sequenceLength/2);
    pos = pos-1;
end
dataLength=qpsk(binLength);

% Build the final transmission sequence
y = [guardFront;train;dataLength;data;guard];
%dlmwrite('10000bits64QAM',y);

% Up-converting
pulseShape=ones(1,upConversion);
upY=upfirdn(y, pulseShape, upConversion, 1);

% Modulation
x=0:Ts:Ts*(length(upY)-1);
yTx=zeros(1,length(upY));
for k = 1:length(upY)
    %yTx(k) = sqrt(real(upY(k))^2+imag(upY(k))^2)*cos(2*pi*fc*x(k)+angle(upY(k)));
    yTx(k) = sqrt(2)*real(upY(k))*cos(2*pi*fc*x(k)) - sqrt(2)*imag(upY(k))*sin(2*pi*fc*x(k));
end
%plot(yTx)
%pwelch(yTx)

% Save the transmission sequence to file
yT=yTx.*(2^15 -1)/1.5;
%create_file_of_shorts( '10000bits64QAM.dat', yT )
%wavwrite(yT,44100,'TestData.wav')

% Demodulation
yRxc=zeros(1,length(yTx));
yRxs=zeros(1,length(yTx));
for m=1:length(yTx)
    yRxc(m)=yTx(m)*sqrt(2)*cos(2*pi*fc*x(m));
    yRxs(m)=-yTx(m)*sqrt(2)*sin(2*pi*fc*x(m));
end
%plot(yRxc)

% Low-pass filtering
LP=load('lowPass500Hz40dB (Order 20).mat');
coefLP=LP.Num;
yRxcLP=filter(coefLP,1,yRxc);
yRxsLP=filter(coefLP,1,yRxs);
%plot(yRxcLP)

% Down-converting (Symbol detection)
current=1;
yRx=zeros(length(y),1);
for l=25:25:length(yRxcLP)
  yRx(current)=yRxcLP(l)+1i*yRxsLP(l);
  current=current+1;
end
yRx=conj(yRx)';

% Convert the symbols into bits and calculate BER
bRx=detect(yRx);
bTx=detect(y);
BER=length(find(bTx-bRx))/length(bTx);