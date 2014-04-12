function [ out,i1,i2,q1,q2 ] = detectQAM( s,ampMax )
    
    % Gain the signal to a reference level
    s=s./ampMax;
    
    % Detect the maximum and minimum Q and I components
    iMax=real(s(1));
    iMin=iMax;
    qMin=imag(s(1));
    qMax=qMin;
    for i=1:length(s)
        if (real(s(i))>iMax)
            iMax=real(s(i));
        end
        if (real(s(i))<iMin)
            iMin=real(s(i));
        end
        if (imag(s(i))>qMax)
            qMax=imag(s(i));
        end
        if (imag(s(i))<qMin)
            qMin=imag(s(i));
        end
    end
    
    % Define borders and change if needed
    i1=2*iMin/3;
    i2=2*iMax/3;
    q1=2*qMax/3;
    q2=2*qMin/3;
    
    % Initialize and convert the symbols into bits
    pos=1;
    b=zeros(4*length(s),1);
    for i=1:length(s)
        if ( real(s(i))< i1)
            if ( imag(s(i))>=q1 )
                b(pos)=0;
                b(pos+1)=0;
                b(pos+2)=0;
                b(pos+3)=0;
            elseif ( imag(s(i))>=0 && imag(s(i))<q1 )
                b(pos)=0;
                b(pos+1)=0;
                b(pos+2)=0;
                b(pos+3)=1;
            elseif ( imag(s(i))>=q2 && imag(s(i))<0 )
                b(pos)=0;
                b(pos+1)=0;
                b(pos+2)=1;
                b(pos+3)=1;
            elseif ( imag(s(i))<q2 )
                b(pos)=0;
                b(pos+1)=0;
                b(pos+2)=1;
                b(pos+3)=0;
            end
        elseif ( real(s(i))<0 && real(s(i))>=i1 )
            if ( imag(s(i))>=q1 )
                b(pos)=0;
                b(pos+1)=1;
                b(pos+2)=0;
                b(pos+3)=0;
            elseif ( imag(s(i))>=0 && imag(s(i))<q1 )
                b(pos)=0;
                b(pos+1)=1;
                b(pos+2)=0;
                b(pos+3)=1;
            elseif ( imag(s(i))>=q2 && imag(s(i))<0 )
                b(pos)=0;
                b(pos+1)=1;
                b(pos+2)=1;
                b(pos+3)=1;
            elseif ( imag(s(i))<q2 )
                b(pos)=0;
                b(pos+1)=1;
                b(pos+2)=1;
                b(pos+3)=0;
            end
        elseif ( real(s(i))<i2 && real(s(i))>=0 )
            if ( imag(s(i))>=q1 )
                b(pos)=1;
                b(pos+1)=1;
                b(pos+2)=0;
                b(pos+3)=0;
            elseif ( imag(s(i))>=0 && imag(s(i))<q1 )
                b(pos)=1;
                b(pos+1)=1;
                b(pos+2)=0;
                b(pos+3)=1;
            elseif ( imag(s(i))>=q2 && imag(s(i))<0 )
                b(pos)=1;
                b(pos+1)=1;
                b(pos+2)=1;
                b(pos+3)=1;
            elseif ( imag(s(i))<q2 )
                b(pos)=1;
                b(pos+1)=1;
                b(pos+2)=1;
                b(pos+3)=0;
            end
        elseif ( real(s(i))>=i2 )
            if ( imag(s(i))>=q1 )
                b(pos)=1;
                b(pos+1)=0;
                b(pos+2)=0;
                b(pos+3)=0;
            elseif ( imag(s(i))>=0 && imag(s(i))<q1 )
                b(pos)=1;
                b(pos+1)=0;
                b(pos+2)=0;
                b(pos+3)=1;
            elseif ( imag(s(i))>=q2 && imag(s(i))<0 )
                b(pos)=1;
                b(pos+1)=0;
                b(pos+2)=1;
                b(pos+3)=1;
            elseif ( imag(s(i))<q2 )
                b(pos)=1;
                b(pos+1)=0;
                b(pos+2)=1;
                b(pos+3)=0;
            end
        end
        pos=pos+4;
    end
    
    % Return the bit sequence
    out=b;
end

