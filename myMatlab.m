x = 0:pi/100:pi*2;
y=sin(x);
plot(x,y);

xlabel('x');
ylabel('sin(x)');
title('Plot of the Sine Function');

hold on

y2=cos(x);
plot(x,y2,'r--')

legend('sin','cos')