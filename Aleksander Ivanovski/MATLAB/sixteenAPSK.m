function [ out ] = sixteenAPSK( b )

    R=0.4; %Choose inner circle radius
    
    % Define coordinates according to the constellation
    x1=cos(pi/4);
    y1=x1;
    x2=cos(pi/12);
    y2=sin(pi/12);
    x3=y2;
    y3=x2;
    x4=R*x1;
    y4=R*y1;
    
    % Pad zeros in the end if the length does not devide by 4
    if (mod(length(b),4)~=0)
        b=[b;zeros(4-mod(length(b),4),1)];       
    end
    
    % Initialize and convert the bits into complex numbers
    pos=1;
    s=zeros(length(b)/4,1);
    for i=1:4:(length(b)-3)
        if(b(i)==0 && b(i+1)==0 && b(i+2)==0 && b(i+3)==0)
            s(pos)= x1 +1i*y1;
        elseif(b(i)==0 && b(i+1)==0 && b(i+2)==0 && b(i+3)==1)
            s(pos)= x1 -1i*y1;
        elseif(b(i)==0 && b(i+1)==0 && b(i+2)==1 && b(i+3)==0)
            s(pos)= -x1 +1i*y1;
        elseif(b(i)==0 && b(i+1)==0 && b(i+2)==1 && b(i+3)==1)
            s(pos)= -x1 -1i*y1;
        elseif(b(i)==0 && b(i+1)==1 && b(i+2)==0 && b(i+3)==0)
            s(pos)= x2 +1i*y2;
        elseif(b(i)==0 && b(i+1)==1 && b(i+2)==0 && b(i+3)==1)
            s(pos)= x2 -1i*y2;
        elseif(b(i)==0 && b(i+1)==1 && b(i+2)==1 && b(i+3)==0)
            s(pos)= -x2 +1i*y2;
        elseif(b(i)==0 && b(i+1)==1 && b(i+2)==1 && b(i+3)==1)
            s(pos)= -x2 -1i*y2;
        elseif(b(i)==1 && b(i+1)==0 && b(i+2)==0 && b(i+3)==0)
            s(pos)= x3 +1i*y3;
        elseif(b(i)==1 && b(i+1)==0 && b(i+2)==0 && b(i+3)==1)
            s(pos)= x3 -1i*y3;
        elseif(b(i)==1 && b(i+1)==0 && b(i+2)==1 && b(i+3)==0)
            s(pos)= -x3 +1i*y3;
        elseif(b(i)==1 && b(i+1)==0 && b(i+2)==1 && b(i+3)==1)
            s(pos)= -x3 -1i*y3;
        elseif(b(i)==1 && b(i+1)==1 && b(i+2)==0 && b(i+3)==0)
            s(pos)= x4 +1i*y4;
        elseif(b(i)==1 && b(i+1)==1 && b(i+2)==0 && b(i+3)==1)
            s(pos)= x4 -1i*y4;
        elseif(b(i)==1 && b(i+1)==1 && b(i+2)==1 && b(i+3)==0)
            s(pos)= -x4 +1i*y4;
        elseif(b(i)==1 && b(i+1)==1 && b(i+2)==1 && b(i+3)==1)
            s(pos)= -x4 -1i*y4;
        end
        pos=pos+1;
    end
    
    % Return the complex symbols
    out=s;
end