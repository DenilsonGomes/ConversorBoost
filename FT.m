% Autores: Denilson Gomes Vaz da Silva, Diego Martins Gomes Saraiva
% Graduandos em Engenharia da Computação e Engenharia Elétrica
% Controle de Sistemas Dinâmicos - Prof. Dr. Vandilberto
% Função que obtém um FT apartir dos parametros.

clear
clc

% Entre com parametros
Vi = 15 ; %Tensao de entrada
Vout = 30; %Tensao de saida
Vref = 3 ; %Tensao de referencia
L = 937e-6 ; %Indutancia
Ro = 10 ; %Carga
D = 0.5 ; %Duty-Cycle
C = 330e-6 ; %Capacitancia

numf = [-(Vi * L / (Ro * ( 1 -D) ^ 2)), Vi]; %Numerador
denf = [C*L , L / Ro ,( 1- D) ^ 2]; %Denominador

F = tf (numf, denf) %função transferencia da planta

H = Vref / Vout; % Sensor
fm = 1 / 3.3; % Inverso da amplitude do sinal de PWM
FTMA = F * H * fm; % De Tranferencia de malha aberta

bode (FTMA) %Diagrama de Bode
Control = pidtune(FTMA,'pid') %Calculo do controlador PID