function convertedDays = continuousDayOfYear(numericDays)
  convertedDays = cos((2*pi*numericDays/365) + pi) + 1;
  %disp(numericDays);
  %disp(convertedDays);
end