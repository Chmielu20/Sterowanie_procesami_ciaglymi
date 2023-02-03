%% STEROWANIE PROCESAMI CI�G�YMI - LABORATORIUM 3
% Badanie parametr�w regulatora liniowo-kwadratowego (LQR) na przyk�adzie
% odwr�conego wahad�a
% Filip Chmielowski, Eryk Mo�d�e�

clear
clc
close all

% Sta�e
M = 0.5; % Masa w�zka
m = 0.2; % Masa wahad�a
L = 0.3; % D�ugo�� od mocowania do �rodka ci�ko�ci wahad�a
b = 0.1; % Wsp�czynnik tarcia w�zka
g = 9.8; % Przyspieszenie ziemskie

% Macierz A r�wnania stanu
A = [ 0,  1,         0,               0;
      0,  -b/M,      -m*g/M,          0;
      0,  0,         0,               1;
      0,  -b/(M*L),  -(m+M)*g/(M*L),  0 ];

% Macierz B r�wnania stanu
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

% Pierwsza warto�� skalarna R
R = 0.01;

% Druga warto�� skalarna R
%R = 100;

% Wyznaczenie szukanej macierzy K
K = lqr(A, B, Q, R)

% Warunki pocz�tkowe
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
ylabel('Warto�� pozycji')
grid on

subplot(3, 1, 2);
plot(t, y(:, 3), 'r');
title('Wychylenie')
xlabel('Czas [s]')
ylabel('Warto�� wychylenia')
grid on

subplot(3, 1, 3);
plot(t, u, 'r');
title('Si�a')
xlabel('Czas [s]')
ylabel('Warto�� si�y')
grid on