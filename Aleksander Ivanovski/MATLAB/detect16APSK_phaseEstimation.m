function [ out,s,R,phaseError ] = detect16APSK_phaseEstimation( s,ampMax )
    
    % Normalize the signal
    s=s/ampMax;
    
    % Define the border betwwen the circles
    R=0.6;
    
    % Average the inner circle symbols
    UR=0;
    UL=0;
    DL=0;
    DR=0;
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
        if ( sqrt( real(s(i))^2 + imag(s(i))^2 ) < R ) 
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
    
    % Estimate the phase error
    phaseError=0;
    if (URiden==1 || ULiden==1 || DRiden==1 || DLiden==1)
         phaseError=((pi/4-angle(UR/countUR))+(3*pi/4-angle(UL/countUL))+...
             (-3*pi/4-angle(DL/countDL))+(-pi/4-angle(DR/countDR)))/...
             (URiden+ULiden+DRiden+DLiden);
    end
    
    % Rotate the constellation accourding to the estimated error
    for i=1:length(s)
        s(i) = amp(i)*( cos(phase(i)+phaseError) + 1i*sin(phase(i)+phaseError) );
    end
        
    %Initialize and convert the symbols into bits
    pos=1;
    b=zeros(length(s)*4,1);
    for j=1:length(s)
       if (amp(j)>=0 && amp(j)<R)
           if (phase(j)>0 && phase(j)<=pi/2)
              b(pos)=1;
              b(pos+1)=1;
              b(pos+2)=0;
              b(pos+3)=0;
           elseif (phase(j)>pi/2 && phase(j)<=pi)
              b(pos)=1;
              b(pos+1)=1;
              b(pos+2)=1;
              b(pos+3)=0;
           elseif (phase(j)>-pi && phase(j)<=-pi/2)
              b(pos)=1;
              b(pos+1)=1;
              b(pos+2)=1;
              b(pos+3)=1;
           elseif (phase(j)>-pi/2 && phase(j)<=0)
              b(pos)=1;
              b(pos+1)=1;
              b(pos+2)=0;
              b(pos+3)=1;
           end
       elseif (amp(j)>=R)
           if (phase(j)>0 && phase(j)<=pi/6)
              b(pos)=0;
              b(pos+1)=1;
              b(pos+2)=0;
              b(pos+3)=0;
           elseif (phase(j)>pi/6 && phase(j)<=pi/3)
              b(pos)=0;
              b(pos+1)=0;
              b(pos+2)=0;
              b(pos+3)=0;
           elseif (phase(j)>pi/3 && phase(j)<=pi/2)
              b(pos)=1;
              b(pos+1)=0;
              b(pos+2)=0;
              b(pos+3)=0;
           elseif (phase(j)>pi/2 && phase(j)<=2*pi/3)
              b(pos)=1;
              b(pos+1)=0;
              b(pos+2)=1;
              b(pos+3)=0;
           elseif (phase(j)>2*pi/3 && phase(j)<=5*pi/6)
              b(pos)=0;
              b(pos+1)=0;
              b(pos+2)=1;
              b(pos+3)=0;
           elseif (phase(j)>5*pi/6 && phase(j)<=pi)
              b(pos)=0;
              b(pos+1)=1;
              b(pos+2)=1;
              b(pos+3)=0;
           elseif (phase(j)>-pi && phase(j)<=-5*pi/6)
              b(pos)=0;
              b(pos+1)=1;
              b(pos+2)=1;
              b(pos+3)=1;
           elseif (phase(j)>-5*pi/6 && phase(j)<=-2*pi/3)
              b(pos)=0;
              b(pos+1)=0;
              b(pos+2)=1;
              b(pos+3)=1;
           elseif (phase(j)>-2*pi/3 && phase(j)<=-pi/2)
              b(pos)=1;
              b(pos+1)=0;
              b(pos+2)=1;
              b(pos+3)=1;
           elseif (phase(j)>-pi/2 && phase(j)<=-pi/3)
              b(pos)=1;
              b(pos+1)=0;
              b(pos+2)=0;
              b(pos+3)=1;
           elseif (phase(j)>-pi/3 && phase(j)<=-pi/6)
              b(pos)=0;
              b(pos+1)=0;
              b(pos+2)=0;
              b(pos+3)=1;
           elseif (phase(j)>-pi/6 && phase(j)<=0)
              b(pos)=0;
              b(pos+1)=1;
              b(pos+2)=0;
              b(pos+3)=1;
           end
       end
       pos=pos+4;
    end
    
    % Return the bit sequence
    out=b;
end