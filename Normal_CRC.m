%% Initialize
%Init
K = 4
M = 4
P = 10
N = 44

%% Data inport & process

% Import data
data = importdata('~/Downloads/bi_cpm_selected_features.Normal-CRC.txt')
Norm_CRC_data = data.data'
Y = zeros(size(Norm_CRC_data(:,1)))
Y(1:32) = 1

%% Generate W
nY = 0.1
%add noise to binary output to create continuous output variable
Y = Y + nY*randn(size(Y));
%Create sample specific weight vector w using 0.5 as a binarization threshold
W = abs(Y-0.5);
%Binarize Y
Y = double(Y>0.5);
%Set equal class weights
W(Y==1) = W(Y==1)./sum(W(Y==1));
W(Y==0) = W(Y==0)./sum(W(Y==0));
%Set weight of samples from the Y=0 class as negative numbers
W(Y==0) = -W(Y==0);

%% Cplex options
param = cat(1,{'timelimit.Cur',60,'MaxTime'},...                            %Maximum time for IP (in seconds)
              {'mip.tolerances.integrality.Cur',1e-5,'Integrality'},...     %Integrality contraint; default = 1e-5 (see cplex.Param.mip.tolerances.integrality.Help)
              {'mip.tolerances.mipgap.Cur',1e-4,'RelGap'},...               %Optimality gap tolerance; default = 1e-4 (0.01% of optimal solution, set to 0.05, 5% for early termination, approximate solution) (see cplex.Param.mip.tolerances.mipgap.Help)
              {'threads.Cur',8,'Threads'},...                               %Number of threads to use (default = 0, automatic) (see  cplex.Param.threads.Help);          
              {'parallel.Cur',-1,'ParallelMode'},...                        %Parallel optimization mode,  -1 = opportunistic 0 = automatic 1 = deterministic (see cplex.Param.parallel.Help)
              {'mip.pool.relgap.Cur',1e-1,'Pool_relgap'},...                %Relative gap for suboptimal solutions in the pool; default 0.1 (10%)
              {'mip.pool.intensity.Cur',1,'Pool_intensity'},...             %Pool intensity; default 1 = mild: generate few solutions quickly (see  cplex.Param.mip.pool.intensity.Help)
              {'mip.pool.replace.Cur',2,'Pool_replace'},...                 %Pool replacement strategy; default 2 = replace least diverse solutions (see  cplex.Param.mip.pool.replace.Help)
              {'mip.pool.capacity.Cur',11,'Pool_capacity'},...              %Pool capacity; default 11 = best + 10 (see  cplex.Param.mip.pool.replace.Help)
              {'mip.limits.populate.Cur',11,'Pool_size'});                  %Number of solutions generated; default 11 = best + 10 (see  cplex.Param.mip.limits.populate.Help)


%% Cplex solver
sol = lobico(Norm_CRC_data,W,K,M,1,param);

%% Check solution
disp('***********************');

%inferred formula
x = round(sol.Solution.x);
SolMat = getsolution(x,K,M,P);
str = showformula(SolMat,K,M);
disp('Inferred logic model');
disp(str);

%actual formula
%str = showformula(SolMatT,K,M);
%disp('Actual logic model');
%disp(str);

disp('***********************');