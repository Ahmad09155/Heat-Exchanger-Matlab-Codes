%Heat Exchanger formulas
%This function calculate overall heat transfer coefficient in heat exchangers

%Made By: Ahmad M. Hassan

function [U] = overall_coeff()
  disp(' Enter internal convection coefficient (hi) if given or just -1 to calculate:')
  hi = input(' Convecion coefficient of internal fluid (w/m^2*K) = ');
  %Calculating internal convection coefficient if not given
  if hi == -1
    hi = conv_coeff();
  end
  disp(' Enter outer convection coefficient (ho) if given or just -1 to calculate:')
  ho = input(' Convecion coefficient of outer fluid (w/m^2*K) = ');
  %Calculating outer convection coefficient if not given
  if ho == -1
    ho = conv_coeff();
  end
  disp(' Enter conduction resistance if given or just -1 to calculate:')
  R_conduction = input(' conduction resistance of the pipe wall (m^2*k/w) = ');
  %Calculating conduction resistance if not given
  if R_conduction == -1
     R_conduction = R_cond();
  end
  %Get the fouling factors
  Rfi = input( 'Enter fouling factor based on internal area (m^2*k/w): ');
  Rfo = input(' Enter fouling factor based on outer area (m^2*k/w): ');
  %Get diameters and length to calculate area
  disp(' Enter diameters and length to calculate area: ')
   Di = input(' Enter Inner diameter of the pipe (m): ');
    Do = input(' Enter Outer diameter of the pipe (m): ');
    L  = input(' Enter length of the pipe (m): ');
  Ai = pi*Di*L;  %Internal surface area of heat transfer
  Ao = pi*Do*L; %Outer surface area of heat transfer
  R_convection_in = 1/(hi*Ai);  %Internal Convection resistance
  R_convection_out = 1/(ho*Ao);   %Outer convection resistance
  R_fouling_in = Rfi/Ai;    %Inner fouling resistance
  R_fouling_out = Rfo/Ao ;   %Outer fouling resistance
  R_total = R_convection_in +R_fouling_in + R_conduction + R_fouling_out + R_convection_out;
  Ui = 1/(R_total*Ai);
  U = 1/(R_total*Ao);
  fprintf('  Total resistance = %.4f m^2*k/w \n',R_total)
  fprintf('  Overall heat transfer coefficient based on inner area = %.4f w/m^2*k \n',Ui)
  fprintf('  Overall heat transfer coefficient based on outer area = %.4f w/m^2*k \n',U)
  end
