% ······························
% Developed by Fernanda Tempesta 
%          Nov. 2018               
%·······························


% File with distance from cities
load('ciudadesNueva.mat');

% Number of iterations
iteration = 2;

% Percentage of selection
percent = 0.66; 

% Nunber of cities
n_city = 5;

% Number of individuals (min 100)
n_individual = 8;

% mutation rate (min 1%)
theta = 0.1;

% 1. Generate population

[M] = population(n_city,n_individual);
