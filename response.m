%Autor Adrian Josue Guel Cortez 2020
%Please cite one of my works if you are using this algorithm.
%https://scholar.google.com.mx/citations?user=gZcBLuoAAAAJ&hl=es

function varargout=response(gains)
delay=0.3;
s = tf('s');
P = 3.25*exp(-delay*s)/(s^2+0.5*s+3.25);
C = gains(1)+gains(2)*s+gains(3)/s;
T = feedback(P*C,1);
[y,t]=step(T,3);
unitstep = t>=delay;
%RMSE = sqrt(mean((unitstep - y).^2));
RMSE=0.5*norm(unitstep - y)^2;
    if abs(nargout)==1
        varargout={RMSE};
    else
        varargout={RMSE,t,y,unitstep};
    end
end
