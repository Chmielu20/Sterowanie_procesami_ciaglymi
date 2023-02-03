%% SPC - Laboratorium 6

clear all
clc
close all

%% Rekurencyjna wersja Metody Najmniejszych Kwadratów (MNK)

Theta = [0.5 ; 0.3]; % Przyjęty wektor rzeczywistych parametrów obiektu
ThetaN = [0.7 ; 0.5];
PN = [1000 0 ; 0 1000];

Y = 0; % Wyjście systemu
U = 1; % Wejście systemu
n = 1; % Ilość iteracji
E = [0.001 , 0.001]; % Błąd oczekiwany
L = 1; % Waga

while (abs((ThetaN(1) - Theta(1))) > E(1) || ...
        abs((ThetaN(2) - Theta(2))) > E(2))
    n = n + 1;
    PhiN = [Y; U];
    Y = (PhiN') * Theta + (rand() - 0.5); % Symulowanie wartości wyjścia
    PN = (1/L) * (PN - ((PN * PhiN * PhiN' * PN) / ...
        (L + PhiN' * PN * PhiN)));
    ThetaN = ThetaN + PN * PhiN * (Y - PhiN' * ThetaN);
end

disp(ThetaN); % Wyświetlenie wyniku (estymatora)

% Wnioski: Wartości estymatora bardzo zbliżone do przyjętego wektora Theta.
% Pomimo stałego wejścia, wyjście systemu zakłócone jest wartościami
% losowymi. Dlatego też, przy każdym uruchomieniu programu algorytm
% otrzymuje nieco inne wartości.

%% Ćwiczenie 1

% a = 1/2;
% b = 1;
% 
% theta = [a; b];
% Vn = 0:9999;
% Un = 0:9999;
% yn = 0:9999;
% yn2 = 0:9999;
% 
% Zn = 0:9999;
% 
% for i=1:1:10000
%     Zn(i) = rand - 0.5;
%     Vn(i) = 0;
% end
% 
% for i=1:1:1000
%    Vn(i+1) = a*Vn(i)+b*Un(i+1);
%    yn(i) = Vn(i) + Zn(i);
% end
% 
% for i=1:1:1000
%    yn2(i) = yn(i+1);
% end
% 
% y(1) = 0;
% yn2 = transpose(yn2);
% On = [yn2(:), Un(:)];
% OnT = transpose(On);
% 
% T = inv(OnT*On);
% T2 = T*OnT;
% T = T2*yn2;

%% Ćwiczenie 2

% a = 1/2;
% b = 1;
% 
% teta = [a; b];
% Vn = 0:9999;
% Un = 0:9999;
% yn = 0:9999;
% 
% Zn = 0:9999;
% 
% for i=1:1:10000
%     Zn(i) = rand - 0.5;
%     Vn(i) = 0;
% end
% 
% for i=1:1:1000
%    Vn(i+1) = a*Vn(i)+b*Un(i+1);
%    yn(i+1) = Vn(i+1) + Zn(i+1);
% end

%% Ćwiczenie 3

% teta_prawdziwe = [1/2; 1];
% N = 1000;    %liczba próbek
% Z = randn(N, 1) - 1;    %zakłócenia
% U = randn(N, 1);    %wejścia
% V = zeros(N, 1);    %wyjścia obiektu
% v0 = 0;
% V(1) = 1/2*v0 + U(1);
% Y = zeros(N, 1);    %wyjścia układu
% y0 = 0;
% Y(1) = V(1) + Z(1);
% 
% %symulacja danych eksperymentalnych
% for i=2:N
%     V(i) = 1/2*V(i-1) + U(i);
%     Y(i) = V(i) + Z(i);
% end
% 
% %wyznaczanie macierzy fi
% F = zeros(N, 2);    %macierz wyjść poprzednich (1. kolumna) i wejść
% % aktualnych (2. kolumna)
% F(1,1) = y0;
% F(1,2) = U(1);
% for i=2:N
%     F(i,1) = Y(i-1);
%     F(i,2)= U(i);
% end
% 
% %wyznaczanie estymatora teta z daszkiem
% Pp = zeros(2,2);    %poprawka poprzednia
% p0 = [100, 0; 0, 100];
% Pp = p0 - (p0*F(1,1:2)'*F(1,1:2)*p0) / (1 + F(1,1:2)*p0*F(1,1:2)');
% Tp = (F'*F)^(-1)*F'*Y;
% 
% P=Pp;
% T=Tp;
% for i=2:N
%     P = Pp - (Pp*F(i,1:2)'*F(i,1:2)*Pp) / (1 + F(i,1:2)*Pp*F(i,1:2)');
%     Pp = P;
%     T = Tp + P*F(i,1:2)'*(Y(i) - F(i,1:2)*Tp);
%     Tp = T;
%     a(i)=T(1);
%     b(i)=T(2);
%     %figure(1); grid on; hold on;
%     %plot(T(1), i); plot(T(2), i); legend('a', 'b');
% end
% figure(1);
% hold on; grid on; grid minor;
% N=[1:1:N];
% plot(N,a,N,b, 'linewidth', 3);
% set(gca,'FontSize',14)
% title("Estymowane wartości parametrów");
% xlabel("Próbka");
% ylabel("Wartości parametrów");
% legend("a","b");
% %blad
% B = teta_prawdziwe - T;