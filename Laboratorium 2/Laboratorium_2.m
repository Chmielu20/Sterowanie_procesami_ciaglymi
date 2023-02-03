%% STEROWANIE PROCESAMI CIĄGŁYMI - LABORATORIUM 2
% Charakterystyki częstotliwościowe
% Filip Chmielowski, Eryk Możdżeń

clear
clc
close all

% Transmitancja układu
k = 1;
T = 1;
K = tf(k, [T, 1]);

% Dane 4 punktów dla pętli "for"
w_0 = [1, 10, 100, 500];
A_ref = [1, 1, 1, 1];
A = [0.711, 0.106, 0.014, 2.002e-03];
dt = [0.82, 0.144, 0.017, 0.002738];

% Podpunkt 1
nyquist(K)
hold on

% Podpunkt 2
for i = 1 : length(w_0)

    T = 2 * pi / w_0(i);
    phi = 2 * pi * dt(i) / T;
    p = A(i) / A_ref(i);

    x = p * cos(phi);
    y = p * sin(phi);

    plot(x, y, '*');
end