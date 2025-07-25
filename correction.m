%Heat Exchanger formulas
%TEMA correction factor formula for shell and tube heat exchanger:

%Made By: Ahmad M. Hassan

function F = correction(Thi,Tho,Tci,Tco)
P = (Tco-Tci)/(Thi-Tci) %The temperature ratio
R = (Thi-Tho)/(Tco-Tci) %The capacity ratio
N = input('   Enter number of shell side passes: ');
disp('    ')
if R ~= 1

    disp('   ')
  alpha = (( 1- P*R)/(1 - P))^(1/N);
  S = (alpha - 1)/(alpha - R);
  num = sqrt(R^2 + 1)*log((1 - S)/(1 - R*S));
  den = (R - 1)*log((2 - S*(R + 1 -sqrt(R^2 + 1)))/(2 - S*(R +1 + sqrt(R^2 + 1))));
  F = num / den;
  fprintf('  Correction Factor (F) = %4.4f\n',F)
else

  S = P/(N*(N - 1)*P);
  F = (S*sqrt(2))/(1 - S)*log((2-S*(2 - sqrt(2))/(2-S+sqrt(2))));
  fprintf('  Correction Factor (F) = %4.4f\n',F)
  end
