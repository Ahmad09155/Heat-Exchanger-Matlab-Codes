%Heat Exchanger Formulas
%  This a function to calculate logarethmic mean Temperature
%  for a double pipe heat exchanger in parallel flow

%Made By: Ahmad M.Hassan

function LMTD = LMTD_parallel(Thi,Tho,Tci,Tco)
  T1 = Tho - Tco;
  T2 = Thi -  Tci;
  %Thi = Hot fluid inlet temperature
  %Tho = Hot fluid outlet temperature
  %Tci = Cold fluid inlet temperature
  %Tco = Cold fluid outlet temperature
  LMTD = (T1 - T2)/log(T1/T2);
  fprintf('  Logarethmic mean temperature = %.4f C degree \n',LMTD)
  end
