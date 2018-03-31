function [ values] = dayvalues( hours, meanvalue )
%Calculates an aproximate of the values according to the mean value using a
%sine for the calc.

f=1/hours;
t=1:0.001:hours;
values=meanvalue*(1+sin(2*pi*f*t-pi/2));
for i=1:length(values)-1
    if(values(i)>997)
        values(i)=997;
    end
end

end

