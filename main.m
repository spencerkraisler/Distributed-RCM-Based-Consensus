clear; close all; clc

% Written by Spencer Kraisler

%% Init constraints
N = 10; % num agents
tol = 1e-6; % tolerance for sim
max_steps = 200; % max steps for sim

n = 5;
M = rotationsfactory(n); % SO(n) manifold object
M.inner = @(x, xi, eta) trace(xi'*eta)/2;
M.norm = @(x, xi) sqrt(M.inner(x, xi, xi));

% Generate random connected undirected graph
p = .4; % probability of 2 nodes being adjacent
G = RandomConnectedGraph(N, p);

% Generate init positions of agents
sigma = pi/2; % st dev of gaussian distr
center = M.rand(); % generate init agent positions around center
x = repmat({}, 1, N);
for i = 1:N
    v_i = sigma*rand*M.randvec(center);
    x_i = M.exp(center, v_i);
    x{i} = x_i;
end

%% run sim
consensus_error_hist = [];
for t = 1:max_steps

    % compute consensus error
    consensus_error = ConsensusError(x, M, G); 
    if consensus_error < tol % halt sim if tolerance achieved
        break;
    end
    consensus_error_hist = [consensus_error_hist consensus_error];

    i = mod(t, N) + 1;
   
    % compute RCM of nbrhood of agent i
    N_i = neighbors(G, i)';
    x{i} = RiemannianCenterOfMass(x(N_i), M); 
end

%% plot error over time
hold on 
grid on 
set(gca, 'YScale', 'log'); % log y-scale
xlabel('time step')
ylabel('consensus error')
plot(consensus_error_hist)