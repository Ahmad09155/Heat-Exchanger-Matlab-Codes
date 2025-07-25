%Heat Exchanger formulas
% Heat Exchanger Effectiveness Calculator
% This coed calculates several things:
% - Heat capacities of the fluids (Cc and Ch)
% - The capacity ratio (R)
% - Number of transfer units (NTU)
% - and finally: the effectiveness of heat exchanger (epsilon)

%Made By: Ahmad M. Hassan

disp('Choose input type:');
disp('1. Temperatures only');
disp('2. Flow rates and heat capacities ');
choice = input('Enter your choice (1 or 2): ');

if choice == 1
    % Case 1: Temperature inputs (for condensers/evaporators, where C = 0)
    Thi = input('Enter hot fluid inlet temperature (Thi): ');
    Tho = input('Enter hot fluid outlet temperature (Tho): ');
    Tci = input('Enter cold fluid inlet temperature (Tci): ');
    Tco = input('Enter cold fluid outlet temperature (Tco): ');

    if (Thi - Tho) > (Tco - Tci)  % Hot fluid has larger dT, C_h = C_min
        e = (Thi - Tho) / (Thi - Tci);
    else  % Cold fluid has larger dT, C_c = C_min
        e = (Tco - Tci) / (Thi - Tci);
    end
    fprintf('\nEffectiveness = %.4f\n', e);
    NTU = -log(1 - e);
    fprintf('NTU = %.4f (for condensers/evaporators)\n', NTU);

elseif choice == 2
    % Case 2: Flow rates and heat capacities
    mh = input('Mass flow rate of hot fluid (kg/s): ');
    cph = input('Specific heat of hot fluid (J/kg·K): ');
    mc = input('Mass flow rate of cold fluid (kg/s): ');
    cpc = input('Specific heat of cold fluid (J/kg·K): ');
    U = input('Overall heat transfer coefficient (W/m^2*K): ');
    A = input('Heat transfer area (m^2): ');

    % Calculate heat capacities and NTU
    Ch = mh * cph;
    Cc = mc * cpc;
    Cmin = min(Ch, Cc);
    Cmax = max(Ch, Cc);
    R = Cmin / Cmax;
    NTU = (U * A) / Cmin;

    fprintf('\nCmin = %.2f W/K, Cmax = %.2f W/K\n', Cmin, Cmax);
    fprintf('Capacity ratio (R = Cmin/Cmax) = %.4f\n', R);
    fprintf('NTU = %.4f\n', NTU);

    % Heat exchanger type selection
    disp('Select heat exchanger type:');
    disp('1. Parallel flow');
    disp('2. Counter flow');
    disp('3. Shell-and-tube (1 shell pass, 2/4 tube passes)');
    disp('4. Shell-and-tube (n shell passes)');
    disp('5. Cross-flow (both fluids unmixed)');
    disp('6. Cross-flow (one mixed, one unmixed)');
    disp('7. Condenser/Evaporator (C = 0)');
    option = input('Enter option (1-7): ');

    % Calculate effectiveness based on type
    switch option
        case 1  % Parallel flow
            if R == 1
                e = (1 - exp(-2 * NTU)) / 2;
            else
                e = (1 - exp(-NTU * (1 + R))) / (1 + R);
            end

        case 2  % Counter flow
            if R == 1
                e = NTU / (1 + NTU);
            else
                e = (1 - exp(-NTU * (1 - R))) / (1 - R * exp(-NTU * (1 - R)));
            end

        case 3  % Shell-and-tube (One shell passe)
            sqrt_term = sqrt(1 + R^2);
            exp_term = exp(-NTU * sqrt_term);
            e = 2 / (1 + R + sqrt_term * (1 + exp_term) / (1 - exp_term));

        case 4  % Shell-and-tube (n shell passes)
            n = input('Number of shell passes: ');
            sqrt_term = sqrt(1 + R^2);
            exp_term = exp(-NTU * sqrt_term / n);
            e1 = 2 / (1 + R + sqrt_term * (1 + exp_term) / (1 - exp_term));
            term = (1 - e1 * R) / (1 - e1);
            e = (term^n - 1) / (term^n - R);

        case 5  % Cross-flow (both unmixed)
            e = 1 - exp((NTU^0.22 / R) * (exp(-R * NTU^0.78) - 1));

        case 6  % Cross-flow (one mixed, one unmixed)
            disp('Which fluid is mixed?');
            disp('1. Cmax mixed, Cmin unmixed');
            disp('2. Cmin mixed, Cmax unmixed');
            mixed_choice = input('Enter choice (1 or 2): ');

            if mixed_choice == 1
                e = (1 - exp(-R * (1 - exp(-NTU)))) / R;
            else
                e = 1 - exp(-(1 - exp(-R * NTU)) / R);
            end

        case 7  % Condenser/Evaporator (C = 0)
            e = 1 - exp(-NTU);

        otherwise
            error('Invalid option selected!');
    end

    fprintf('\nEffectiveness (e) = %.4f\n', e);
end
