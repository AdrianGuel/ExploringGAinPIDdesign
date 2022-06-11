%Discrete time process
function varargout=response2(gains)
ts=0.01;
z = tf('z',ts);
P = (1+1.858741*z^(-1)+z^(-2))/(1-0.748386*z^(-1)+0.213374*z^(-2));
C = gains(1)+gains(2)*ts*z/(z-1);%PI
T = feedback(P*C,1);
[y,t]=step(T,10);
unitstep = t>=0;
RMSE = sqrt(mean((unitstep - y).^2)); 
    if abs(nargout)==1
        varargout={RMSE};
    else
        varargout={RMSE,t,y,unitstep};
    end
end
