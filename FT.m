%Autor: Denilson Gomes Vaz da Silva
%Graduando em Engenharia da Computa��o
%Controle de Sistemas Dinamicos - Prof. Dr. Vandilberto
%Fun��o que obtem a FT apartir dos parametros.

%entre com os parametros
Vi = 15;
Vout = 30;
Vref = 3;
L = 937e-6;
Ro = 10;
D = 0.5;
C = 330e-6;

numf = [Vi*L/(Ro*(1-D)^2) Vi];
denf = [C*L L/Ro (1-D)^2];

F = tf(numf, denf) %Fun��o transferencia da planta

H = Vref/Vout; %Sensor
fm = 1/15; % Amplitudedo sinal de PWM
FTMA = F*H*fm; %Fun��o tranferencia de malha aberta

bode(FTMA)