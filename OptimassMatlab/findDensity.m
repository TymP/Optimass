function [D] = findDensity(P3, T3, power1, power2, flow, P5)
%%%Calculates the density of the two phase fluid on the evaporator return
%%%line using the heater power and mass flow rate. P3 in bar abs, T3 in
%%%Celcius, Power in W, flow in 
%Convert to refprop units
cd('../OptimassMatlab')
P3=P3*100; %kPa
T3=T3+273; %K

%Calculate enthalpy before expansion valve on manifold loop.
cd('../REFPROP')
h3=refpropm('H','T',T3,'P',P3,'CO2')

%Calculate change in enthalpy during evaporation.
dh=(power1+power2)/flow;

%calculate new enthalpy on return line.
h4=h3+dh;

%Determine density
D=refpropm('D','P',P5,'H',h4,'CO2')
cd('../OptimassMatlab')
end