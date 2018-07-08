function convertedDays = continuousDayOfYear(numericDays)
  disp('Converting days to numeric function...');
  convertedDays = cos((2*pi*numericDays/365) + pi) + 1;
end