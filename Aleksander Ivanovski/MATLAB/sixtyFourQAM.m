function [ out ] = sixtyFourQAM( b )

    if (mod(length(b),6)~=0)
        b=[b; zeros( 6-mod(length(b),6),1 )];
    end
    
    pos=1;
    s=zeros(length(b)/6,1);
    for i=1:6:length(b)
        if (b(i)==1&&b(i+1)==0&&b(i+2)==0&&b(i+3)==0&&b(i+4)==0&&b(i+5)==0)
            s(pos)=-1/sqrt(2) + 1i/sqrt(2);
        elseif (b(i)==1&&b(i+1)==0&&b(i+2)==0&&b(i+3)==0&&b(i+4)==1&&b(i+5)==0)
            s(pos)=-5/(7*sqrt(2)) + 1i/sqrt(2);
        elseif (b(i)==1&&b(i+1)==0&&b(i+2)==1&&b(i+3)==0&&b(i+4)==1&&b(i+5)==0)
            s(pos)=-3/(7*sqrt(2)) + 1i/sqrt(2);
        elseif (b(i)==1&&b(i+1)==0&&b(i+2)==1&&b(i+3)==0&&b(i+4)==0&&b(i+5)==0)
            s(pos)=-1/(7*sqrt(2)) + 1i/sqrt(2);
        elseif (b(i)==0&&b(i+1)==0&&b(i+2)==1&&b(i+3)==0&&b(i+4)==0&&b(i+5)==0)
            s(pos)=1/(7*sqrt(2)) + 1i/sqrt(2);
        elseif (b(i)==0&&b(i+1)==0&&b(i+2)==1&&b(i+3)==0&&b(i+4)==1&&b(i+5)==0)
            s(pos)=3/(7*sqrt(2)) + 1i/sqrt(2);
        elseif (b(i)==0&&b(i+1)==0&&b(i+2)==0&&b(i+3)==0&&b(i+4)==1&&b(i+5)==0)
            s(pos)=5/(7*sqrt(2)) + 1i/sqrt(2);
        elseif (b(i)==0&&b(i+1)==0&&b(i+2)==0&&b(i+3)==0&&b(i+4)==0&&b(i+5)==0)
            s(pos)=1/sqrt(2) + 1i/sqrt(2);
        elseif (b(i)==1&&b(i+1)==0&&b(i+2)==0&&b(i+3)==0&&b(i+4)==0&&b(i+5)==1)
            s(pos)=-1/sqrt(2) + 5i/(7*sqrt(2));
        elseif (b(i)==1&&b(i+1)==0&&b(i+2)==0&&b(i+3)==0&&b(i+4)==1&&b(i+5)==1)
            s(pos)=-5/(7*sqrt(2)) + 5i/(7*sqrt(2));
        elseif (b(i)==1&&b(i+1)==0&&b(i+2)==1&&b(i+3)==0&&b(i+4)==1&&b(i+5)==1)
            s(pos)=-3/(7*sqrt(2)) + 5i/(7*sqrt(2));
        elseif (b(i)==1&&b(i+1)==0&&b(i+2)==1&&b(i+3)==0&&b(i+4)==0&&b(i+5)==1)
            s(pos)=-1/(7*sqrt(2)) + 5i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==0&&b(i+2)==1&&b(i+3)==0&&b(i+4)==0&&b(i+5)==1)
            s(pos)=1/(7*sqrt(2)) + 5i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==0&&b(i+2)==1&&b(i+3)==0&&b(i+4)==1&&b(i+5)==1)
            s(pos)=3/(7*sqrt(2)) + 5i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==0&&b(i+2)==0&&b(i+3)==0&&b(i+4)==1&&b(i+5)==1)
            s(pos)=5/(7*sqrt(2)) + 5i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==0&&b(i+2)==0&&b(i+3)==0&&b(i+4)==0&&b(i+5)==1)
            s(pos)=1/sqrt(2) + 5i/(7*sqrt(2));
        elseif (b(i)==1&&b(i+1)==0&&b(i+2)==0&&b(i+3)==1&&b(i+4)==0&&b(i+5)==1)
            s(pos)=-1/sqrt(2) + 3i/(7*sqrt(2));
        elseif (b(i)==1&&b(i+1)==0&&b(i+2)==0&&b(i+3)==1&&b(i+4)==1&&b(i+5)==1)
            s(pos)=-5/(7*sqrt(2)) + 3i/(7*sqrt(2));
        elseif (b(i)==1&&b(i+1)==0&&b(i+2)==1&&b(i+3)==1&&b(i+4)==1&&b(i+5)==1)
            s(pos)=-3/(7*sqrt(2)) + 3i/(7*sqrt(2));
        elseif (b(i)==1&&b(i+1)==0&&b(i+2)==1&&b(i+3)==1&&b(i+4)==0&&b(i+5)==1)
            s(pos)=-1/(7*sqrt(2)) + 3i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==0&&b(i+2)==1&&b(i+3)==1&&b(i+4)==0&&b(i+5)==1)
            s(pos)=1/(7*sqrt(2)) + 3i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==0&&b(i+2)==1&&b(i+3)==1&&b(i+4)==1&&b(i+5)==1)
            s(pos)=3/(7*sqrt(2)) + 3i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==0&&b(i+2)==0&&b(i+3)==1&&b(i+4)==1&&b(i+5)==1)
            s(pos)=5/(7*sqrt(2)) + 3i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==0&&b(i+2)==0&&b(i+3)==1&&b(i+4)==0&&b(i+5)==1)
            s(pos)=1/sqrt(2) + 3i/(7*sqrt(2));
        elseif (b(i)==1&&b(i+1)==0&&b(i+2)==0&&b(i+3)==1&&b(i+4)==0&&b(i+5)==0)
            s(pos)=-1/sqrt(2) + 1i/(7*sqrt(2));
        elseif (b(i)==1&&b(i+1)==0&&b(i+2)==0&&b(i+3)==1&&b(i+4)==1&&b(i+5)==0)
            s(pos)=-5/(7*sqrt(2)) + 1i/(7*sqrt(2));
        elseif (b(i)==1&&b(i+1)==0&&b(i+2)==1&&b(i+3)==1&&b(i+4)==1&&b(i+5)==0)
            s(pos)=-3/(7*sqrt(2)) + 1i/(7*sqrt(2));
        elseif (b(i)==1&&b(i+1)==0&&b(i+2)==1&&b(i+3)==1&&b(i+4)==0&&b(i+5)==0)
            s(pos)=-1/(7*sqrt(2)) + 1i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==0&&b(i+2)==1&&b(i+3)==1&&b(i+4)==0&&b(i+5)==0)
            s(pos)=1/(7*sqrt(2)) + 1i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==0&&b(i+2)==1&&b(i+3)==1&&b(i+4)==1&&b(i+5)==0)
            s(pos)=3/(7*sqrt(2)) + 1i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==0&&b(i+2)==0&&b(i+3)==1&&b(i+4)==1&&b(i+5)==0)
            s(pos)=5/(7*sqrt(2)) + 1i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==0&&b(i+2)==0&&b(i+3)==1&&b(i+4)==0&&b(i+5)==0)
            s(pos)=1/sqrt(2) + 1i/(7*sqrt(2));
        elseif (b(i)==1&&b(i+1)==1&&b(i+2)==0&&b(i+3)==1&&b(i+4)==0&&b(i+5)==0)
            s(pos)=-1/sqrt(2) - 1i/(7*sqrt(2));
        elseif (b(i)==1&&b(i+1)==1&&b(i+2)==0&&b(i+3)==1&&b(i+4)==1&&b(i+5)==0)
            s(pos)=-5/(7*sqrt(2)) - 1i/(7*sqrt(2));
        elseif (b(i)==1&&b(i+1)==1&&b(i+2)==1&&b(i+3)==1&&b(i+4)==1&&b(i+5)==0)
            s(pos)=-3/(7*sqrt(2)) - 1i/(7*sqrt(2));
        elseif (b(i)==1&&b(i+1)==1&&b(i+2)==1&&b(i+3)==1&&b(i+4)==0&&b(i+5)==0)
            s(pos)=-1/(7*sqrt(2)) - 1i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==1&&b(i+2)==1&&b(i+3)==1&&b(i+4)==0&&b(i+5)==0)
            s(pos)=1/(7*sqrt(2)) - 1i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==1&&b(i+2)==1&&b(i+3)==1&&b(i+4)==0&&b(i+5)==0)
            s(pos)=1/(7*sqrt(2)) - 1i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==1&&b(i+2)==1&&b(i+3)==1&&b(i+4)==1&&b(i+5)==0)
            s(pos)=3/(7*sqrt(2)) - 1i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==1&&b(i+2)==0&&b(i+3)==1&&b(i+4)==1&&b(i+5)==0)
            s(pos)=5/(7*sqrt(2)) - 1i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==1&&b(i+2)==0&&b(i+3)==1&&b(i+4)==0&&b(i+5)==0)
            s(pos)=1/sqrt(2) - 1i/(7*sqrt(2));
        elseif (b(i)==1&&b(i+1)==1&&b(i+2)==0&&b(i+3)==1&&b(i+4)==0&&b(i+5)==1)
            s(pos)=-1/sqrt(2) - 3i/(7*sqrt(2));
        elseif (b(i)==1&&b(i+1)==1&&b(i+2)==0&&b(i+3)==1&&b(i+4)==1&&b(i+5)==1)
            s(pos)=-5/(7*sqrt(2)) - 3i/(7*sqrt(2));
        elseif (b(i)==1&&b(i+1)==1&&b(i+2)==1&&b(i+3)==1&&b(i+4)==1&&b(i+5)==1)
            s(pos)=-3/(7*sqrt(2)) - 3i/(7*sqrt(2));
        elseif (b(i)==1&&b(i+1)==1&&b(i+2)==1&&b(i+3)==1&&b(i+4)==0&&b(i+5)==1)
            s(pos)=-1/(7*sqrt(2)) - 3i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==1&&b(i+2)==1&&b(i+3)==1&&b(i+4)==0&&b(i+5)==1)
            s(pos)=1/(7*sqrt(2)) - 3i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==1&&b(i+2)==1&&b(i+3)==1&&b(i+4)==1&&b(i+5)==1)
            s(pos)=3/(7*sqrt(2)) - 3i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==1&&b(i+2)==0&&b(i+3)==1&&b(i+4)==1&&b(i+5)==1)
            s(pos)=5/(7*sqrt(2)) - 3i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==1&&b(i+2)==0&&b(i+3)==1&&b(i+4)==0&&b(i+5)==1)
            s(pos)=1/sqrt(2) - 3i/(7*sqrt(2));
        elseif (b(i)==1&&b(i+1)==1&&b(i+2)==0&&b(i+3)==0&&b(i+4)==0&&b(i+5)==1)
            s(pos)=-1/sqrt(2) - 5i/(7*sqrt(2));
        elseif (b(i)==1&&b(i+1)==1&&b(i+2)==0&&b(i+3)==0&&b(i+4)==1&&b(i+5)==1)
            s(pos)=-5/(7*sqrt(2)) - 5i/(7*sqrt(2));
        elseif (b(i)==1&&b(i+1)==1&&b(i+2)==1&&b(i+3)==0&&b(i+4)==1&&b(i+5)==1)
            s(pos)=-3/(7*sqrt(2)) - 5i/(7*sqrt(2));
        elseif (b(i)==1&&b(i+1)==1&&b(i+2)==1&&b(i+3)==0&&b(i+4)==0&&b(i+5)==1)
            s(pos)=-1/(7*sqrt(2)) - 5i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==1&&b(i+2)==1&&b(i+3)==0&&b(i+4)==0&&b(i+5)==1)
            s(pos)=1/(7*sqrt(2)) - 5i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==1&&b(i+2)==1&&b(i+3)==0&&b(i+4)==1&&b(i+5)==1)
            s(pos)=3/(7*sqrt(2)) - 5i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==1&&b(i+2)==0&&b(i+3)==0&&b(i+4)==1&&b(i+5)==1)
            s(pos)=5/(7*sqrt(2)) - 5i/(7*sqrt(2));
        elseif (b(i)==0&&b(i+1)==1&&b(i+2)==0&&b(i+3)==0&&b(i+4)==0&&b(i+5)==1)
            s(pos)=1/sqrt(2) - 5i/(7*sqrt(2));
        elseif (b(i)==1&&b(i+1)==1&&b(i+2)==0&&b(i+3)==0&&b(i+4)==0&&b(i+5)==0)
            s(pos)=-1/sqrt(2) - 1i/sqrt(2);
        elseif (b(i)==1&&b(i+1)==1&&b(i+2)==0&&b(i+3)==0&&b(i+4)==1&&b(i+5)==0)
            s(pos)=-5/(7*sqrt(2)) - 1i/sqrt(2);
        elseif (b(i)==1&&b(i+1)==1&&b(i+2)==1&&b(i+3)==0&&b(i+4)==1&&b(i+5)==0)
            s(pos)=-3/(7*sqrt(2)) - 1i/sqrt(2);
        elseif (b(i)==1&&b(i+1)==1&&b(i+2)==1&&b(i+3)==0&&b(i+4)==0&&b(i+5)==0)
            s(pos)=-1/(7*sqrt(2)) - 1i/sqrt(2);
        elseif (b(i)==0&&b(i+1)==1&&b(i+2)==1&&b(i+3)==0&&b(i+4)==0&&b(i+5)==0)
            s(pos)=1/(7*sqrt(2)) - 1i/sqrt(2);
        elseif (b(i)==0&&b(i+1)==1&&b(i+2)==1&&b(i+3)==0&&b(i+4)==1&&b(i+5)==0)
            s(pos)=3/(7*sqrt(2)) - 1i/sqrt(2);
        elseif (b(i)==0&&b(i+1)==1&&b(i+2)==0&&b(i+3)==0&&b(i+4)==1&&b(i+5)==0)
            s(pos)=5/(7*sqrt(2)) - 1i/sqrt(2);
        elseif (b(i)==0&&b(i+1)==1&&b(i+2)==0&&b(i+3)==0&&b(i+4)==0&&b(i+5)==0)
            s(pos)=1/sqrt(2) - 1i/sqrt(2);
        end
        pos=pos+1;
    end
    out=s;
end

