%Heat EXchanger Formulas
%This function calculate convection heat transfer coefficient in turbulent flow

%Made By: Ahmad M. Hassan

function h = conv_coeff()
  disp(' Enter your given data to calculate (h): ')
  disp('   ')
  rho = input(' Enter fluid density (Kg/m^3): ');
  V = input(' Enter fliud velosity (m/s): ');
  D = input(' Enter pipe diameter (m): ');
  mio = input(' Enter dynamic viscosity (Kg/m*K): ');
  Pr = input(' Enter Prantdl number: ');
  k = input(' Enter thermal conductivity of fluid (w/m*K): ');
   Re = reynold(rho,V,D,mio);
  Nu = dittus(Re,Pr);
  h = (Nu*k)/D;
  %Nu = nusselt number
  %k = Thermal conductivity
  %D = diameter
  fprintf('Convection coefficient = %.4f w/m^2*K \n',h)
  end
