%% paths
restoredefaultpath;
if isunix
    addpath(genpath('/Applications/CPLEX_Studio_Community128/cplex/matlab'));
    addpath('/Applications/CPLEX_Studio_Community128/cplex/examples/src/matlab');
else
    addpath(genpath(('C:\Program Files\IBM\ILOG\CPLEX_Studio125\cplex\matlab\x64_win64')));
    addpath('C:\Program Files\IBM\ILOG\CPLEX_Studio125\cplex\examples\src\matlab');
end
addpath(genpath(pwd));

%% Variables and Figs
clc; clear all; close all;