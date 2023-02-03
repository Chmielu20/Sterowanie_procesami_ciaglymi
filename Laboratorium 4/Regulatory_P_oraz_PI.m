clear
clc
close all

%% Zadanie 1 i 2

% Obliczenia: k_p > -1  =>  Uk³ad stabilny, w przeciwnym razie niestabilny
k_p = -0.5;

sim("Regulator_P.slx", 50);

figure(1)

subplot(2, 1, 1)
plot(tout, y, 'r')
title("Regulator P - Przebieg wyjœciowy y(t)")
xlabel('t')
ylabel('y')
hold on
grid on
plot(tout, y_sp, 'b')

subplot(2, 1, 2)
plot(tout, error, 'r')
title("Regulator P - Ca³ka kwadratu b³êdu")
xlabel('t')
ylabel('error')
grid on

% Wniosek: Obliczenia teoretyczne pokrywaj¹ siê z obserwacjami z symulacji.

%% Zadanie 3

k_p = 0.75;
k_i_list = 0 : 0.01 : 1;
error_list = [];

for i = 1 : length(k_i_list)
    k_i = k_i_list(i);

    sim("Regulator_PI.slx", 50);
    
    error_list(i) = error(length(error));
end

% Minimum of the function
[val_min_zadanie_3, idx_min_zadanie_3] = min(error_list);

figure(2)

plot(k_i_list, error_list)
hold on
grid on
plot(k_i_list(idx_min_zadanie_3), error_list(idx_min_zadanie_3), "*r")
text(k_i_list(idx_min_zadanie_3), error_list(idx_min_zadanie_3), ...
    ['(' num2str(k_i_list(idx_min_zadanie_3)) ',' ...
    num2str(error_list(idx_min_zadanie_3)) ')'], 'Fontsize', 12)

% ==========

k_i = 0.47; % Wartoœæ 'x' punktu wyznaczaj¹cego minimum powy¿szego wykresu

sim("Regulator_PI.slx", 50);

figure(3)

subplot(2, 1, 1)
plot(tout, y, 'r')
title("Regulator PI - Przebieg wyjœciowy y(t)")
xlabel('t')
ylabel('y')
hold on
grid on
plot(tout, y_sp, 'b')

subplot(2, 1, 2)
plot(tout, error, 'r')
title("Regulator PI - Ca³ka kwadratu b³êdu")
xlabel('t')
ylabel('error')
grid on

%% Zadanie 4

k_p = 0.1;
k_i_list = 0 : 0.01 : 1;
error_list = [];

for i = 1 : length(k_i_list)
    k_i = k_i_list(i);

    sim("Regulator_PI.slx", 50);
    
    error_list(i) = error(length(error));
end

% Minimum of the function
[val_min_zadanie_4, idx_min_zadanie_4] = min(error_list);

figure(4)

plot(k_i_list, error_list)
hold on
grid on
plot(k_i_list(idx_min_zadanie_4), error_list(idx_min_zadanie_4), "*r")
text(k_i_list(idx_min_zadanie_4), error_list(idx_min_zadanie_4), ...
    ['(' num2str(k_i_list(idx_min_zadanie_4)) ',' ...
    num2str(error_list(idx_min_zadanie_4)) ')'], 'Fontsize', 12)

% ==========

k_i = 0.37; % Wartoœæ 'x' punktu wyznaczaj¹cego minimum powy¿szego wykresu

sim("Regulator_PI.slx", 50);

figure(5)

subplot(2, 1, 1)
plot(tout, y, 'r')
title("Regulator PI - Przebieg wyjœciowy y(t)")
xlabel('t')
ylabel('y')
hold on
grid on
plot(tout, y_sp, 'b')

subplot(2, 1, 2)
plot(tout, error, 'r')
title("Regulator PI - Ca³ka kwadratu b³êdu")
xlabel('t')
ylabel('error')
grid on