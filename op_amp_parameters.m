% CMOS Operational Amplifier Design

%% Derivation of all parameter values

mu_n = 0.025; % units: m^2/(Vs)
mu_p = 0.010; % units: m^2/(Vs)

e_ox = 3.9*8.854E-12; % units: F/m
t_ox = 2.6E-9; % units: m

c_ox = e_ox/t_ox; % units: F/m^2

k_n = mu_n*c_ox; % units: A/V^2
k_p = mu_p*c_ox; % units: A/V^2

%% Determination of all parasitics

% relevant parasitic capacitances: cgd4, cdb4, cgd5, cdb5, cgs6, cgd6,
% cdb6, cgd9, cdb9, cdb_r, cgs_r, csb_r, cgd_r

syms W4 L4 W5 L5 W6 L6 W9 L9 W_r L_r vdb4 vdb5 vdb6 vdb9 av_II

% MAKE SURE ALL WIDTHS AND LENGTHS ARE IN TERMS OF M

% note: all suffixes with _r refer to the linear resistor used for
% moving the zero to the RHP.

c_j = 8E-4; % units: F/m^2
c_jsw = 8E-10; % units: F/m
LD = 2.5E-8; % units: m

% gate-drain
cgd4 = W4*LD*c_ox; % units: F
cgd5 = W5*LD*c_ox; % units: F
cgd6 = W6*LD*c_ox; % units: F
cgd9 = W9*LD*c_ox; % units: F
cgd_r = W_r*LD*c_ox; % units: F

% gate-source
cgs6 = (2/3)*W6*L6*c_ox + cgd6; % units: F
cgs_r = (2/3)*W_r*L_r*c_ox + cgd_r; % units: F


% drain-body & source-body

    % fill in the following:
    % vdb4 = ;
    % vdb5 = ;
    % vdb6 = ;
    % vdb9 = ;
    
lambda_4 = L4/2; % units: m
lambda_5 = L5/2; % units: m
lambda_6 = L6/2; % units: m
lambda_9 = L9/2; % units: m
lambda_r = L_r/2; % units: m

cdb4 = ( W4*(5*lambda_4)*c_j + (W4 + 2*(5*lambda_4))*c_jsw ) / sqrt(1+vdb4/0.2); % units: F
cdb5 = ( W5*(5*lambda_5)*c_j + (W5 + 2*(5*lambda_5))*c_jsw ) / sqrt(1+vdb5/0.2); % units: F
cdb6 = ( W6*(5*lambda_6)*c_j + (W6 + 2*(5*lambda_6))*c_jsw ) / sqrt(1+vdb6/0.2); % units: F
cdb9 = ( W9*(5*lambda_9)*c_j + (W9 + 2*(5*lambda_9))*c_jsw ) / sqrt(1+vdb9/0.2); % units: F
csb_r = ( W_r*(5*lambda_r)*c_j + (W_r + 2*(5*lambda_r))*c_jsw ); % units: F


%% Equations

C_I = cdb5 + cdb4 + cgd4 + cgd5 + cgs_r + cgs6 + csb_r + cgd6*(1+av_II);
C_II = cdb6 + cdb9 + cgd9 + cgd6 + cgd_r;

% Approximations:

% C_I = cgd4 + cgd5+ cgs6 + (1+av_II)*cgd6;
% C_II = cgd6 + cgd9;



