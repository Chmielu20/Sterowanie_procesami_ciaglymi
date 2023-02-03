%% STEROWANIE PROCESAMI CIĄGŁYMI - LABORATORIUM 1
% Charakterystyki czasowe
% Filip Chmielowski, Eryk Możdżeń

clear
clc
close all

%% Zadanie 1

% Transformata członu całkującego
K_int = tf(1, [1, 0]);

% Transformata członu różniczkującego
K_deriv = tf([1, 0], [0.0000001, 1]);

% Transformata członu proporcjonalnego
K_prop = tf(3, 1);

% Wykresy
figure
subplot(3, 1, 1), impulse(K_int)
subplot(3, 1, 2), impulse(K_deriv, 1)
subplot(3, 1, 3), impulse(K_prop)

%% Zadanie 2 & 3

% Parametry dla odpowiedzi skokowych
params = [ 2,  20;
           -1, -5;
           5,  1;
           -1, 5 ];

% Wykresy
figure

for i = 1 : size(params, 1) 
    a = params(i, 1);
    b = params(i, 2);
    
    K = tf(1, [1, a, b]);

    subplot(size(params, 1), 2, 2 * i - 1);
    step(K);
    
    subplot(size(params, 1), 2, 2 * i);
    pzmap(K)
end