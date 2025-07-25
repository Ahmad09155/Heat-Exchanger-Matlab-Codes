function Nu = dittus(Re,Pr)
  %Heat Transfer equations
 %Ditus-Boelter equation is uses to calculate nusselt number for turbulent flow in pipes
 %Re = Renult number and Pr = Prantdl number
  Nu = 0.023*Re^0.8*Pr^0.4;
  fprintf('Nusselt number = %d \n',Nu)
  end
