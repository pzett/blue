function [ out,R1,R2,s,phaseError ] = detect32APSK_phaseEstimation( s,ampMax )
    
    s=s./ampMax;
    
    R1=1.65/5;
    R2=3.35/5;
    
    UR=0;
    UL=0;
    DR=0;
    DL=0;
    URiden=0;
    ULiden=0;
    DRiden=0;
    DLiden=0;
    countUR=0;
    countUL=0;
    countDR=0;
    countDL=0;
    amp=zeros(length(s),1);
    phase=amp;
    for i=1:length(s)
        amp(i) = sqrt( real(s(i))^2 + imag(s(i))^2 );
        phase(i) = angle(s(i));
        if ( sqrt( real(s(i))^2 + imag(s(i))^2 ) < R1 ) 
           if (angle(s(i))>0 && angle(s(i))<=pi/2)
               URiden=1;
               UR=UR+s(i);
               countUR=countUR+1;
           elseif (angle(s(i))<=pi && angle(s(i))>pi/2)
               ULiden=1;
               UL=UL+s(i);
               countUL=countUL+1;
           elseif (angle(s(i))>-pi && angle(s(i))<=-pi/2)
               DLiden=1;
               DL=DL+s(i);
               countDL=countDL+1;
           elseif (angle(s(i))>-pi/2 && angle(s(i))<=0)
               DRiden=1;
               DR=DR+s(i);
               countDR=countDR+1;
           end
        end
    end
    
    phaseError=0;
    if (URiden==1 || ULiden==1 || DRiden==1 || DLiden==1)
         phaseError=((pi/4-angle(UR/countUR))+(3*pi/4-angle(UL/countUL))+...
             (-3*pi/4-angle(DL/countDL))+(-pi/4-angle(DR/countDR)))/...
             (URiden+ULiden+DRiden+DLiden);
    end
    
    for i=1:length(s)
        s(i) = amp(i)*( cos(phase(i)+phaseError) + 1i*sin(phase(i)+phaseError) );
    end
    
    pos=1;
    b=zeros(length(s)*5,1);
    for i=1:length(s)
        if (sqrt(real(s(i))^2+imag(s(i))^2)<R1)
            if (angle(s(i))>0 && angle(s(i))<=pi/2)
               b(pos)   = 1;
               b(pos+1) = 1;
               b(pos+2) = 0;
               b(pos+3) = 0;
               b(pos+4) = 0;
            elseif (angle(s(i))>pi/2 && angle(s(i))<=pi)
               b(pos)   = 0;
               b(pos+1) = 1;
               b(pos+2) = 0;
               b(pos+3) = 0;
               b(pos+4) = 0;
            elseif (angle(s(i))>-pi && angle(s(i))<=-pi/2)
               b(pos)   = 0;
               b(pos+1) = 0;
               b(pos+2) = 0;
               b(pos+3) = 0;
               b(pos+4) = 0;
            elseif (angle(s(i))>-pi/2 && angle(s(i))<=0)
               b(pos)   = 1;
               b(pos+1) = 0;
               b(pos+2) = 0;
               b(pos+3) = 0;
               b(pos+4) = 0;
            end
        elseif (sqrt(real(s(i))^2+imag(s(i))^2)<R2 && sqrt(real(s(i))^2+imag(s(i))^2)>=R1)
            if (angle(s(i))>0 && angle(s(i))<=pi/6)
               b(pos)   = 1;
               b(pos+1) = 1;
               b(pos+2) = 0;
               b(pos+3) = 0;
               b(pos+4) = 1; 
            elseif (angle(s(i))>pi/6 && angle(s(i))<=2*pi/6)
               b(pos)   = 1;
               b(pos+1) = 1;
               b(pos+2) = 1;
               b(pos+3) = 0;
               b(pos+4) = 1;
            elseif (angle(s(i))>2*pi/6 && angle(s(i))<=3*pi/6)
               b(pos)   = 1;
               b(pos+1) = 1;
               b(pos+2) = 1;
               b(pos+3) = 0;
               b(pos+4) = 0;
            elseif (angle(s(i))>3*pi/6 && angle(s(i))<=4*pi/6)
               b(pos)   = 0;
               b(pos+1) = 1;
               b(pos+2) = 1;
               b(pos+3) = 0;
               b(pos+4) = 0;
            elseif (angle(s(i))>4*pi/6 && angle(s(i))<=5*pi/6)
               b(pos)   = 0;
               b(pos+1) = 1;
               b(pos+2) = 1;
               b(pos+3) = 0;
               b(pos+4) = 1;
            elseif (angle(s(i))>5*pi/6 && angle(s(i))<=pi)
               b(pos)   = 0;
               b(pos+1) = 1;
               b(pos+2) = 0;
               b(pos+3) = 0;
               b(pos+4) = 1;
            elseif (angle(s(i))>-pi && angle(s(i))<=-5*pi/6)
               b(pos)   = 0;
               b(pos+1) = 0;
               b(pos+2) = 0;
               b(pos+3) = 0;
               b(pos+4) = 1;
            elseif (angle(s(i))>-5*pi/6 && angle(s(i))<=-4*pi/6)
               b(pos)   = 0;
               b(pos+1) = 0;
               b(pos+2) = 1;
               b(pos+3) = 0;
               b(pos+4) = 1;
            elseif (angle(s(i))>-4*pi/6 && angle(s(i))<=-3*pi/6)
               b(pos)   = 0;
               b(pos+1) = 0;
               b(pos+2) = 1;
               b(pos+3) = 0;
               b(pos+4) = 0;
            elseif (angle(s(i))>-3*pi/6 && angle(s(i))<=-2*pi/6)
               b(pos)   = 1;
               b(pos+1) = 0;
               b(pos+2) = 1;
               b(pos+3) = 0;
               b(pos+4) = 0;
            elseif (angle(s(i))>-2*pi/6 && angle(s(i))<=-pi/6)
               b(pos)   = 1;
               b(pos+1) = 0;
               b(pos+2) = 1;
               b(pos+3) = 0;
               b(pos+4) = 1;
            elseif (angle(s(i))>-pi/6 && angle(s(i))<=0)
               b(pos)   = 1;
               b(pos+1) = 0;
               b(pos+2) = 0;
               b(pos+3) = 0;
               b(pos+4) = 1;
            end
        elseif (sqrt(real(s(i))^2+imag(s(i))^2)>=R2)
            if (angle(s(i))>0 && angle(s(i))<=pi/8)
               b(pos)   = 1;
               b(pos+1) = 1;
               b(pos+2) = 0;
               b(pos+3) = 1;
               b(pos+4) = 1;
            elseif (angle(s(i))>pi/8 && angle(s(i))<=2*pi/8)
               b(pos)   = 1;
               b(pos+1) = 1;
               b(pos+2) = 1;
               b(pos+3) = 1;
               b(pos+4) = 1; 
            elseif (angle(s(i))>2*pi/8 && angle(s(i))<=3*pi/8)
               b(pos)   = 1;
               b(pos+1) = 1;
               b(pos+2) = 0;
               b(pos+3) = 1;
               b(pos+4) = 0;
            elseif (angle(s(i))>3*pi/8 && angle(s(i))<=4*pi/8)
               b(pos)   = 1;
               b(pos+1) = 1;
               b(pos+2) = 1;
               b(pos+3) = 1;
               b(pos+4) = 0;
            elseif (angle(s(i))>4*pi/8 && angle(s(i))<=5*pi/8)
               b(pos)   = 0;
               b(pos+1) = 1;
               b(pos+2) = 1;
               b(pos+3) = 1;
               b(pos+4) = 0;
            elseif (angle(s(i))>5*pi/8 && angle(s(i))<=6*pi/8)
               b(pos)   = 0;
               b(pos+1) = 1;
               b(pos+2) = 0;
               b(pos+3) = 1;
               b(pos+4) = 0;
            elseif (angle(s(i))>6*pi/8 && angle(s(i))<=7*pi/8)
               b(pos)   = 0;
               b(pos+1) = 1;
               b(pos+2) = 1;
               b(pos+3) = 1;
               b(pos+4) = 1;
            elseif (angle(s(i))>7*pi/8 && angle(s(i))<=pi)
               b(pos)   = 0;
               b(pos+1) = 1;
               b(pos+2) = 0;
               b(pos+3) = 1;
               b(pos+4) = 1;
            elseif (angle(s(i))>-pi && angle(s(i))<=-7*pi/8)
               b(pos)   = 0;
               b(pos+1) = 0;
               b(pos+2) = 0;
               b(pos+3) = 1;
               b(pos+4) = 1;
            elseif (angle(s(i))>-7*pi/8 && angle(s(i))<=-6*pi/8)
               b(pos)   = 0;
               b(pos+1) = 0;
               b(pos+2) = 1;
               b(pos+3) = 1;
               b(pos+4) = 1;
            elseif (angle(s(i))>-6*pi/8 && angle(s(i))<=-5*pi/8)
               b(pos)   = 0;
               b(pos+1) = 0;
               b(pos+2) = 0;
               b(pos+3) = 1;
               b(pos+4) = 0;
            elseif (angle(s(i))>-5*pi/8 && angle(s(i))<=-4*pi/8)
               b(pos)   = 0;
               b(pos+1) = 0;
               b(pos+2) = 1;
               b(pos+3) = 1;
               b(pos+4) = 0;
            elseif (angle(s(i))>-4*pi/8 && angle(s(i))<=-3*pi/8)
               b(pos)   = 1;
               b(pos+1) = 0;
               b(pos+2) = 1;
               b(pos+3) = 1;
               b(pos+4) = 0;
            elseif (angle(s(i))>-3*pi/8 && angle(s(i))<=-2*pi/8)
               b(pos)   = 1;
               b(pos+1) = 0;
               b(pos+2) = 0;
               b(pos+3) = 1;
               b(pos+4) = 0;
            elseif (angle(s(i))>-2*pi/8 && angle(s(i))<=-pi/8)
               b(pos)   = 1;
               b(pos+1) = 0;
               b(pos+2) = 1;
               b(pos+3) = 1;
               b(pos+4) = 1;
            elseif (angle(s(i))>-pi/8 && angle(s(i))<=0)
               b(pos)   = 1;
               b(pos+1) = 0;
               b(pos+2) = 0;
               b(pos+3) = 1;
               b(pos+4) = 1;
            end
        end
        pos=pos+5;
    end
    out=b;
end

