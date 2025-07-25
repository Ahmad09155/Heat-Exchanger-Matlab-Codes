function R_conduction = R_cond()
    Di = input(' Enter Inner diameter of the pipe (m): ');
    Do = input(' Enter Outer diameter of the pipe (m): ');
    L  = input(' Enter length of the pipe (m): ');
    k = input(' Enter thermal conductivity of pipe wall (w/m*k): ');
    R_conduction = log(Do/Di)/(2*pi*(k*L));
    fprintf(' Conduction resistance = %.4f m^2*k/w \n',R_conduction)
