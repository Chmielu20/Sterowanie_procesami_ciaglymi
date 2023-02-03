%% STEROWANIE PROCESAMI CI¥G£YMI - LABORATORIUM 3
% Badanie parametrów regulatora liniowo-kwadratowego (LQR) na przyk³adzie
% odwróconego wahad³a
% Filip Chmielowski, Eryk Mo¿d¿eñ

clear
clc
close all

% Sta³e
M = 0.5; % Masa wózka
m = 0.2; % Masa wahad³a
L = 0.3; % D³ugoœæ od mocowania do œrodka ciê¿koœci wahad³a
b = 0.1; % Wspó³czynnik tarcia wózka
g = 9.8; % Przyspieszenie ziemskie

% Macierz A równania stanu
A = [ 0,  1,         0,               0;
      0,  -b/M,      -m*g/M,          0;
      0,  0,         0,               1;
      0,  -b/(M*L),  -(m+M)*g/(M*L),  0 ];

% Macierz B równania stanu
B = [ 0;
      1/M;
      0;
      1/(M*L) ];

% Pierwsza macierz Q
Q = [ 1,  0,  0,   0;
      0,  1,  0,   0;
      0,  0,  100, 0;
      0,  0,  0,   1 ];

% Druga macierz Q
%Q = [ 100, 0,  0,  0;
%      0,   1,  0,  0;
%      0,   0,  1,  0;
%      0,   0,  0,  1 ];

% Pierwsza wartoœæ skalarna R
R = 0.01;

% Druga wartoœæ skalarna R
%R = 100;

% Wyznaczenie szukanej macierzy K
K = lqr(A, B, Q, R)

% Warunki pocz¹tkowe
setpoint = [10; 0; 0; 0];
init_cond = [0; 0; 0; 0];

% Uruchomienie symulacji
sim('Model3.slx')

% Wektor czasu
t = linspace(0, 10, length(y));

% Wykresy
figure

subplot(3, 1, 1);
plot(t, y(:, 1), 'r');
title('Pozycja')
xlabel('Czas [s]')
ylabel('Wartoœæ pozycji')
grid on

subplot(3, 1, 2);
plot(t, y(:, 3), 'r');
title('Wychylenie')
xlabel('Czas [s]')
ylabel('Wartoœæ wychylenia')
grid on

subplot(3, 1, 3);
plot(t, u, 'r');
title('Si³a')
xlabel('Czas [s]')
ylabel('Wartoœæ si³y')
grid on