function [ out ] = thirtyTwoAPSK( b )

    if ( mod(length(b),5) ~=0 )
       b = [b ; zeros(5-mod(length(b),5),1)]; 
    end

    R1=1/4;
    R2=3/5;
    
    pos=1;
    s=zeros(length(b)/5,1);
    for i=1:5:length(b)
        if ( b(i)==0 && b(i+1)==0 && b(i+2)==0 && b(i+3)==0 && b(i+4)==0 )
            s(pos) = R1*( cos(5*pi/4) +1i*sin(5*pi/4) );
        elseif ( b(i)==0 && b(i+1)==0 && b(i+2)==0 && b(i+3)==0 && b(i+4)==1 )
            s(pos) = R2*( cos(13*pi/12) +1i*sin(13*pi/12) );
        elseif ( b(i)==0 && b(i+1)==0 && b(i+2)==0 && b(i+3)==1 && b(i+4)==0 )
            s(pos) = ( cos(21*pi/16) +1i*sin(21*pi/16) );
        elseif ( b(i)==0 && b(i+1)==0 && b(i+2)==0 && b(i+3)==1 && b(i+4)==1 )
            s(pos) = ( cos(17*pi/16) +1i*sin(17*pi/16) );
        elseif ( b(i)==0 && b(i+1)==0 && b(i+2)==1 && b(i+3)==0 && b(i+4)==0 )
            s(pos) = R2*( cos(17*pi/12) +1i*sin(17*pi/12) );
        elseif ( b(i)==0 && b(i+1)==0 && b(i+2)==1 && b(i+3)==0 && b(i+4)==1 )
            s(pos) = R2*( cos(15*pi/12) +1i*sin(15*pi/12) );
        elseif ( b(i)==0 && b(i+1)==0 && b(i+2)==1 && b(i+3)==1 && b(i+4)==0 )
            s(pos) = ( cos(23*pi/16) +1i*sin(23*pi/16) );
        elseif ( b(i)==0 && b(i+1)==0 && b(i+2)==1 && b(i+3)==1 && b(i+4)==1 )
            s(pos) = ( cos(19*pi/16) +1i*sin(19*pi/16) );
        elseif ( b(i)==0 && b(i+1)==1 && b(i+2)==0 && b(i+3)==0 && b(i+4)==0 )
            s(pos) = R1*( cos(3*pi/4) +1i*sin(3*pi/4) );
        elseif ( b(i)==0 && b(i+1)==1 && b(i+2)==0 && b(i+3)==0 && b(i+4)==1 )
            s(pos) = R2*( cos(11*pi/12) +1i*sin(11*pi/12) );
        elseif ( b(i)==0 && b(i+1)==1 && b(i+2)==0 && b(i+3)==1 && b(i+4)==0 )
            s(pos) = ( cos(11*pi/16) +1i*sin(11*pi/16) );
        elseif ( b(i)==0 && b(i+1)==1 && b(i+2)==0 && b(i+3)==1 && b(i+4)==1 )
            s(pos) = ( cos(15*pi/16) +1i*sin(15*pi/16) );
        elseif ( b(i)==0 && b(i+1)==1 && b(i+2)==1 && b(i+3)==0 && b(i+4)==0 )
            s(pos) = R2*( cos(7*pi/12) +1i*sin(7*pi/12) );
        elseif ( b(i)==0 && b(i+1)==1 && b(i+2)==1 && b(i+3)==0 && b(i+4)==1 )
            s(pos) = R2*( cos(9*pi/12) +1i*sin(9*pi/12) );
        elseif ( b(i)==0 && b(i+1)==1 && b(i+2)==1 && b(i+3)==1 && b(i+4)==0 )
            s(pos) = ( cos(9*pi/16) +1i*sin(9*pi/16) );
        elseif ( b(i)==0 && b(i+1)==1 && b(i+2)==1 && b(i+3)==1 && b(i+4)==1 )
            s(pos) = ( cos(13*pi/16) +1i*sin(13*pi/16) );
        elseif ( b(i)==1 && b(i+1)==0 && b(i+2)==0 && b(i+3)==0 && b(i+4)==0 )
            s(pos) = R1*( cos(7*pi/4) +1i*sin(7*pi/4) );
        elseif ( b(i)==1 && b(i+1)==0 && b(i+2)==0 && b(i+3)==0 && b(i+4)==1 )
            s(pos) = R2*( cos(23*pi/12) +1i*sin(23*pi/12) );
        elseif ( b(i)==1 && b(i+1)==0 && b(i+2)==0 && b(i+3)==1 && b(i+4)==0 )
            s(pos) = ( cos(27*pi/16) +1i*sin(27*pi/16) );
        elseif ( b(i)==1 && b(i+1)==0 && b(i+2)==0 && b(i+3)==1 && b(i+4)==1 )
            s(pos) = ( cos(31*pi/16) +1i*sin(31*pi/16) );
        elseif ( b(i)==1 && b(i+1)==0 && b(i+2)==1 && b(i+3)==0 && b(i+4)==0 )
            s(pos) = R2*( cos(19*pi/12) +1i*sin(19*pi/12) );
        elseif ( b(i)==1 && b(i+1)==0 && b(i+2)==1 && b(i+3)==0 && b(i+4)==1 )
            s(pos) = R2*( cos(21*pi/12) +1i*sin(21*pi/12) );
        elseif ( b(i)==1 && b(i+1)==0 && b(i+2)==1 && b(i+3)==1 && b(i+4)==0 )
            s(pos) = ( cos(25*pi/16) +1i*sin(25*pi/16) );
        elseif ( b(i)==1 && b(i+1)==0 && b(i+2)==1 && b(i+3)==1 && b(i+4)==1 )
            s(pos) = ( cos(29*pi/16) +1i*sin(29*pi/16) );
        elseif ( b(i)==1 && b(i+1)==1 && b(i+2)==0 && b(i+3)==0 && b(i+4)==0 )
            s(pos) = R1*( cos(pi/4) +1i*sin(pi/4) );
        elseif ( b(i)==1 && b(i+1)==1 && b(i+2)==0 && b(i+3)==0 && b(i+4)==1 )
            s(pos) = R2*( cos(pi/12) +1i*sin(pi/12) );
        elseif ( b(i)==1 && b(i+1)==1 && b(i+2)==0 && b(i+3)==1 && b(i+4)==0 )
            s(pos) = ( cos(5*pi/16) +1i*sin(5*pi/16) );
        elseif ( b(i)==1 && b(i+1)==1 && b(i+2)==0 && b(i+3)==1 && b(i+4)==1 )
            s(pos) = ( cos(pi/16) +1i*sin(pi/16) );
        elseif ( b(i)==1 && b(i+1)==1 && b(i+2)==1 && b(i+3)==0 && b(i+4)==0 )
            s(pos) = R2*( cos(5*pi/12) +1i*sin(5*pi/12) );
        elseif ( b(i)==1 && b(i+1)==1 && b(i+2)==1 && b(i+3)==0 && b(i+4)==1 )
            s(pos) = R2*( cos(3*pi/12) +1i*sin(3*pi/12) );
        elseif ( b(i)==1 && b(i+1)==1 && b(i+2)==1 && b(i+3)==1 && b(i+4)==0 )
            s(pos) = ( cos(7*pi/16) +1i*sin(7*pi/16) );
        elseif ( b(i)==1 && b(i+1)==1 && b(i+2)==1 && b(i+3)==1 && b(i+4)==1 )
            s(pos) = ( cos(3*pi/16) +1i*sin(3*pi/16) );
        end
        pos=pos+1;
    end
    out=s;
end

