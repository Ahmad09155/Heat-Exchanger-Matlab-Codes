%Heat Exchenger formulas
%This function calculates Reynold Number

%Made By: Ahmad M. Hassan

function Re = reynold(rho,V,D,mio)
  %rho = density of the fluid (Kg/m^3)
  %V = fliud velosity (m/s)
  %D = pipe diameter (m)
  %mio = dynamic viscosity (Kg/m*K)
  Re = (rho*V*D)/mio;
  fprintf('Reynold number (Re) = %d \n',Re)
