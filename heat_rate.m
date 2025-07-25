%Heat Echanger Formulas
%This function is to calculate heat transfer rate in heat exhangers

%Made By: Ahmad M. Hassan

function Q = heat_rate(m,cp,dT)
  Q = m*cp*dT;
  %m = mass flow rate of the fluid (m)
  %cp = specific heat of fluid (J/Kg*K)
  %dT = Temperature differance (K or C)
  fprintf('  Heat transfer rate (Q) = %.4f watt \n',Q)
end

