%Heat Exchanger Formulas
%  This function is to calculate area required for heat exchanger
%  Note that there is pre-definded fuctions in this coed and it can't work without them,
%  So you need to have all this package of functions before running this coed


%Made By: Ahmad M. Hassan

function A = exchanger_area();
  %Step 1: Enter Q or calculate it
  Q = input('  Enter heat transfer rate (Q) if given, or just -1 to calculate: ');
  if Q == -1
    m = input(' Enter mass flow rate (Kg/s): ');
    cp = input(' Enter specific heat (J/Kg*K): ');
    dT = input(' Enter temperature difference (K or C): ');

    Q = heat_rate(m,cp,dT);
  end
  %Step 2: Enter U or calculate it
  U = input('  Enter overall heat transfer coefficient if given, or -1 to calculate: ');
  if U == -1
    U = overall_coeff();
  end
  %Step 3: Calculate LMTD and correction factor (F)
  disp('  What kind of heat exchanger do you have?')
  disp(' 1. double pipe, 2. shell and tube or 3. Other ?')
  exchanger_type = input('  Enter 1,2 or 3 for exchanger type: ');
  switch exchanger_type
    case 1

  disp('  The type of flow is: 1. parallel or 2.counter flow? ')
  flow_type = input('  Enter 1 for parallel or 2 for counter flow: ');
  Thi = input('  Enter Hot fluid inlet temperature (K or C): ');
  Tho = input('  Enter Hot fluid outlet temperature (K or C): ');
  Tci = input('  Enter Cold fluid inlet temperature (K or C): ');
  Tco = input('  Enter Cold fluid outlet temperature (K or C): ');
  F = 1;
  if flow_type == 1
    LMTD = LMTD_parallel(Thi,Tho,Tci,Tco)
elseif flow_type == 2
    LMTD = LMTD_counter(Thi,Tho,Tci,Tco);
else
    error(' Invalid option, type just one or two.')
  end
case 2

  Thi = input('  Enter Hot fluid inlet temperature (K or C): ');
  Tho = input('  Enter Hot fluid outlet temperature (K or C): ');
  Tci = input('  Enter Cold fluid inlet temperature (K or C): ');
  Tco = input('  Enter Cold fluid outlet temperature (K or C): ');
  LMTD = LMTD_counter(Thi,Tho,Tci,Tco);
  F = correction(Thi,Tho,Tci,Tco);
case 3

 Thi = input('  Enter Hot fluid inlet temperature (K or C): ');
  Tho = input('  Enter Hot fluid outlet temperature (K or C): ');
  Tci = input('  Enter Cold fluid inlet temperature (K or C): ');
  Tco = input('  Enter Cold fluid outlet temperature (K or C): ');
  LMTD = LMTD_counter(Thi,Tho,Tci,Tco);
  F = input('  Enter correction factor from charts: ');
otherwise
  error('  You have just three options!')
end
A = Q /( U * LMTD * F);
fprintf('   Area required to design this heat exchanger = %.4f m^2 \n',A)
end
