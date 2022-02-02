function pos = index(x,value)
% File: INDEX.M
% CALL: pos = index(x,value)
% This function returns the index of the x vector that equals value.
% That is, x(pos) = value

i = 1;
j = -1;
x = x(:);
temp = 0;
while (temp == 0)
  if (x(i) == value)
    j = 1;
    temp = 1;
  else
    i = i+1;
    if (i > length(x))
      temp = 1;
    end;
  end;
end;

if (j ~= -1)
  pos = i;
else
  pos = -1;
end;





