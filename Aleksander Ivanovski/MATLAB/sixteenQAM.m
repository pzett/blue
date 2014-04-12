function [ out ] = sixteenQAM( b )
    
    % Pad zeros in the end if the length does not devide by 4
    if (mod(length(b),4)~=0)
        b=[b;zeros((4-mod(length(b),4)),1)];
    end
    
    % Initialize and convert the bits into symbols
    pos=1;
    s=zeros(length(b)/4,1);
    for i=1:4:length(b)
        if ( b(i)==0&&b(i+1)==0&&b(i+2)==0&&b(i+3)==0 )
            s(pos)=-1/sqrt(2) + 1i/sqrt(2);
        elseif ( b(i)==0&&b(i+1)==1&&b(i+2)==0&&b(i+3)==0 )
            s(pos)=-1/(3*sqrt(2)) + 1i/sqrt(2);
        elseif ( b(i)==1&&b(i+1)==1&&b(i+2)==0&&b(i+3)==0 )
            s(pos)=1/(3*sqrt(2)) + 1i/sqrt(2);
        elseif ( b(i)==1&&b(i+1)==0&&b(i+2)==0&&b(i+3)==0 )
            s(pos)=1/sqrt(2) + 1i/sqrt(2);
        elseif ( b(i)==0&&b(i+1)==0&&b(i+2)==0&&b(i+3)==1 )
            s(pos)=-1/sqrt(2) + 1i/(3*sqrt(2));
        elseif ( b(i)==0&&b(i+1)==1&&b(i+2)==0&&b(i+3)==1 )
            s(pos)=-1/(3*sqrt(2)) + 1i/(3*sqrt(2));
        elseif ( b(i)==1&&b(i+1)==1&&b(i+2)==0&&b(i+3)==1 )
            s(pos)=1/(3*sqrt(2)) + 1i/(3*sqrt(2));
        elseif ( b(i)==1&&b(i+1)==0&&b(i+2)==0&&b(i+3)==1 )
            s(pos)=1/sqrt(2) + 1i/(3*sqrt(2));
        elseif ( b(i)==0&&b(i+1)==0&&b(i+2)==1&&b(i+3)==1 )
            s(pos)=-1/sqrt(2) - 1i/(3*sqrt(2));
        elseif ( b(i)==0&&b(i+1)==1&&b(i+2)==1&&b(i+3)==1 )
            s(pos)=-1/(3*sqrt(2)) - 1i/(3*sqrt(2));
        elseif ( b(i)==1&&b(i+1)==1&&b(i+2)==1&&b(i+3)==1 )
            s(pos)=1/(3*sqrt(2)) - 1i/(3*sqrt(2));
        elseif ( b(i)==1&&b(i+1)==0&&b(i+2)==1&&b(i+3)==1 )
            s(pos)=1/sqrt(2) - 1i/(3*sqrt(2));
        elseif ( b(i)==0&&b(i+1)==0&&b(i+2)==1&&b(i+3)==0 )
            s(pos)=-1/sqrt(2) - 1i/sqrt(2);
        elseif ( b(i)==0&&b(i+1)==1&&b(i+2)==1&&b(i+3)==0 )
            s(pos)=-1/(3*sqrt(2)) - 1i/sqrt(2);
        elseif ( b(i)==1&&b(i+1)==1&&b(i+2)==1&&b(i+3)==0 )
            s(pos)=1/(3*sqrt(2)) - 1i/sqrt(2);
        elseif ( b(i)==1&&b(i+1)==0&&b(i+2)==1&&b(i+3)==0 )
            s(pos)=1/sqrt(2) - 1i/sqrt(2);
        end
        pos=pos+1;
    end
    
    % Return the symbols
    out=s;
end

