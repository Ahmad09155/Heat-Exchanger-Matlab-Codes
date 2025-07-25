%Heat Exchanger Formulas
%  This a function to calculate logarethmic mean temperature
%  for a double pipe heat exchanger in counter flow

%Made By: Ahmad M. Hassan

function LMTD = LMTD_counter(Thi,Tho,Tci,Tco)
  T1 = Thi - Tco;
  T2 = Tho - Tci;
  %Thi = Hot fluid inlet temperature
  %Tho = Hot fluid outlet temperature
  %Tci = Cold fluid inlet temperature
  %Tco = Cold fluid outlet temperature
  LMTD = (T1 - T2)/(log(T1/T2));
   fprintf('  Logarethmic mean temperature = %.4f C degree \n',LMTD)
  end
