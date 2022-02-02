function y = Sa(x)
% File: SA.M
% CALL: y = Sa(x)
% This function computes sin(x)/x.
% x is assumed to be a "scalar" or a vector;

x = x(:);
y = zeros(length(x),1);

for (i = 1:length(x))
  if (x(i) == 0)
    y(i) = 1;
  else
    y(i) = sin(x(i))/x(i);
  end;
end;



