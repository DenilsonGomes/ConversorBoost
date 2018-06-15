% Autores: Denilson Gomes Vaz da Silva, Diego Martins Gomes Saraiva
% Graduandos em Engenharia da Computação e Engenharia Elétrica
% Controle de Sistemas Dinâmicos - Prof. Dr. Vandilberto
% Função que obtém um FT apartir dos parametros.

clear
clc

% Entre com parametros
Vi = 15 ; %Tensao de entrada
Vout = 30;
Vref = 3 ;
L = 937e-6 ;
Ro = 10 ;
D = 0.5 ;
C = 330e-6 ;

numf = [-(Vi * L / (Ro * ( 1 -D) ^ 2)), Vi];
denf = [C*L , L / Ro ,( 1- D) ^ 2];

F = tf (numf, denf) %função transferencia da planta

H = Vref / Vout; % Sensor
fm = 1 / 5; % Inversão da amplitude do sinal de PWM
FTMA = F * H * fm; % De Tranferencia de malha aberta

bode (FTMA)
pidtune(FTMA,'pid')