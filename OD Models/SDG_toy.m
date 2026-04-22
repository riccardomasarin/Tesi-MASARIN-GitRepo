%% DeGroot signed 
% Simulazione del modello DeGroot signed su rete toy su n=6 agenti

clear; clc; close all;

%% 1. NETOWORK DEFINITION
% La rete è definita attraverso dei nodi collegati da archi orientati con peso aij, che definiscono la matrice di influenza W 

n = 6;
S = zeros(n);

S(1,1) = 0.7;  S(1,2) = 0.3;

S(2,1) = 0.25; S(2,2) = 0.5;  S(2,3) = 0.25;

S(3,2) = 0.1;  S(3,3) = 0.4;  S(3,4) = 0.25; S(3,6) = 0.25;

S(4,3) = 0.3;  S(4,4) = 0.4;  S(4,5) = 0.15; S(4,6) = 0.15;

S(5,4) = 0.3;  S(5,5) = 0.7;

S(6,3) = 0.2;  S(6,4) = 0.3;  S(6,6) = 0.5;

%definiamo la matrice Omega per la gauge transformation
Omega = diag([1 -1 1 -1 -1 1]);
W = Omega * S * Omega;


%% 2. CONDITIONS CHECK 
% imponiamo e verifichiamo la row-stochasticity di S: per ogni riga la somma degli elementi deve essere 1

disp('Somma righe di S:')
disp(sum(S,2))
if all(abs(sum(S,2) - 1) < 1e-12)
    disp('La matrice S è row-stochastic');
else
    error('La matrice S NON è row-stochastic');
end

% verifica che la trasformata inversa sia non-negativa:
disp('Controllo che Omega*W*Omega sia nonnegativa:')
disp(min(min(Omega*W*Omega)))
if min(min(Omega*W*Omega))>=0
    disp('La matrice Omega*W*Omega è non negativa')
else
     error('La matrice Omega*W*Omega NON è row-stochastic')
end

%calcolo degli autovalori: per il bipartite consensus vuoi che W abbia autovalore dominante 1 semplice e gli altri dentro il disco unitario.
%nota: la gauge transformation lascia invariati gli autovalori nella trasformazione da W a S.
eigS = eig(S);
rhoS = max(abs(eigS));

disp('Autovalori di S:');
disp(eigS);

if abs(rhoS - 1) < 1e-10
    num_on_unit_circle = sum(abs(abs(eigS) - 1) < 1e-8);

    if num_on_unit_circle == 1
        disp('OK: S ha autovalore dominante semplice in 1 e gli altri sono dentro il disco unitario.');
    else
        warning('Attenzione: S ha più di un autovalore sul cerchio unitario.');
    end
else
    warning('Attenzione: il raggio spettrale di S non è 1.');
end

% CHECK SPETTRALE SU W

eigW = eig(W);
rhoW = max(abs(eigW));

disp('Autovalori di W:');
disp(eigW);

if abs(rhoW - 1) < 1e-10
    num_on_unit_circle = sum(abs(abs(eigW) - 1) < 1e-8);

    if num_on_unit_circle == 1
        disp('OK: W ha autovalore dominante semplice in 1 sul cerchio unitario.');
    else
        warning('Attenzione: W ha più di un autovalore sul cerchio unitario.');
    end
else
    warning('Attenzione: il raggio spettrale di W non è 1.');
end

% PLOT AUTOVALORI NEL PIANO COMPLESSO

theta = linspace(0, 2*pi, 400);

figure;
plot(cos(theta), sin(theta), 'k--', 'LineWidth', 1.2); hold on;
plot(real(eigW), imag(eigW), 'ro', 'MarkerSize', 8, 'LineWidth', 1.5);

xlabel('Parte reale');
ylabel('Parte immaginaria');
title('Eigenvalues of W');
axis equal;
grid on;
xlim([-1.2 1.2]);
ylim([-1.2 1.2]);

%% 3. SIMULATION
% Condizioni iniziali x(0): provo varie opzioni iniziali
x0 = [1; -0.2; 0.8; 0.3; -1; 0.4];

T =25; % numero di iterazioni dell'aggiornamento

% salvataggio delle traiettorie
X = zeros(n, T+1);
X(:,1) = x0;

% aggiornamento dello stato dei nodi
for k = 1:T
    X(:,k+1) = W * X(:,k);
end

% stampa delle opinioni finali di ogni agente
disp('Final opinions:');
disp(X(:,end));

%% PLOT
%plot del grafo
n = size(W,1);

W_noLoops = W - diag(diag(W));
% usa la trasposta per avere il verso corretto (j -> i)
G = digraph(W_noLoops');

% coordinate nodi (puoi cambiarle)
xpos = [4.2 2.7 1.6 2.5 0.5 5.8];
ypos = [4.3 4.3 2.8 1.5 1.5 2.8];

figure('Color','w');

p = plot(G,'XData', xpos,'YData', ypos,'NodeColor', 'k','MarkerSize', 8,'LineWidth', 1.8,'ArrowSize', 12);
title('Signed network structure', 'FontSize', 15, 'FontWeight', 'bold');
axis off;

% etichette nodi
p.NodeLabel = arrayfun(@num2str, 1:n, 'UniformOutput', false);
p.NodeFontSize = 12;

% COLORI ARCHI

E = G.Edges.EndNodes;
numEdges = size(E,1);

edgeVals = zeros(numEdges,1);

for k = 1:numEdges
    src = E(k,1);
    dst = E(k,2);

    % G = digraph(W'), quindi arco src->dst = W(dst,src)
    if W_noLoops(dst,src) > 0
        edgeVals(k) = 1;   % positivo → blu
    else
        edgeVals(k) = -1;  % negativo → rosso
    end
end

p.EdgeCData = edgeVals;
p.EdgeColor = 'flat';

% colormap: minimo (-1) rosso, massimo (+1) blu
colormap([ ...
    1.00 0.00 0.00;   % rosso
    0.00 0.00 1.00    % blu
]);

caxis([-1 1]);

box off;

% Plot Heatmap di W:
figure;
imagesc(W);
colorbar;
axis equal tight;
xlabel('j');
ylabel('i');
title('Influence matrix W');
disp(W);

% plot delle traiettorie 
figure;
plot(0:T, X(1,:), 'LineWidth', 1.5); hold on;
plot(0:T, X(2,:), 'LineWidth', 1.5);
plot(0:T, X(3,:), 'LineWidth', 1.5);
plot(0:T, X(4,:), 'LineWidth', 1.5);
plot(0:T, X(5,:), 'LineWidth', 1.5);
plot(0:T, X(6,:), 'LineWidth', 1.5);

xlabel('Time step k');
ylabel('Opinion');
title('DeGroot opinion dynamics on a toy network');
legend('Agent 1','Agent 2','Agent 3','Agent 4','Agent 5','Agent 6','Location','best');
grid on;

% Plot di Z
Z = Omega * X;

figure;
plot(0:T, Z.', 'LineWidth', 1.5);
xlabel('Time step k');
ylabel('Transformed opinion');
title('Gauge-transformed dynamics: should reach consensus');
grid on;

%plot numerical range
eigW = eig(W);
theta = linspace(0,2*pi,500);

Znr = numerical_range_boundary(W, 800);

figure; hold on;
set(gcf,'Color','w');

% riempimento area
fill(real(Znr), imag(Znr), [0.95 0.1 0.1], ...
    'FaceAlpha', 1.0, 'EdgeColor', 'k', 'LineWidth', 1.0);

% autovalori
plot(real(eigW), imag(eigW), 'k.', 'MarkerSize', 18);

% cerchio unitario tratteggiato
plot(cos(theta), sin(theta), 'k--', 'LineWidth', 1.3);

xlabel('Real axis');
ylabel('Imaginary axis');
title('Numerical range \omega(W)');
axis equal;
grid on;
box on;
set(gca,'FontSize',12);

xlim([-1.15 1.15]);
ylim([-1.15 1.15]);

%% 4. Interpretazione
% Se esiste una gauge transformation Omega tale che S = Omega*W*Omega
% è nonnegativa, row-stochastic e primitiva, allora la dinamica trasformata
% z(k)=Omega*x(k) converge a consenso.
% Di conseguenza, la dinamica originale x(k) converge a bipartite consensus.

%% funzioni aggiuntive
function Z = numerical_range_boundary(Q, Ntheta)
% Restituisce punti sul bordo del numerical range di Q
% usando la massimizzazione della parte reale della matrice ruotata.

    if nargin < 2
        Ntheta = 400;
    end

    n = size(Q,1);
    theta = linspace(0, 2*pi, Ntheta+1);
    theta(end) = [];

    Z = zeros(Ntheta,1);

    for k = 1:Ntheta
        th = theta(k);

        Hth = (exp(-1i*th)*Q + exp(1i*th)*Q')/2;

        % autovettore associato al massimo autovalore
        [V,D] = eig(Hth);
        [~,idx] = max(real(diag(D)));
        v = V(:,idx);
        v = v / norm(v);

        Z(k) = v' * Q * v;
    end
end