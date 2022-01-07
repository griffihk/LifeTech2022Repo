% LifeTech 2022 Draft Code 
% Paper Title: Towards Domain-Agnostic Machine Learning Benchmarks ...
% for Gender Classification Using Eye Movements
% Instructions
% Step 1: Execute this script
% Step 2: Run the "Classification Learner" application in MATLAB to
% reproduce Table 1 results

load LifeTech2022FeatureExtOut.mat; %import data
%SStep 1: Remove nan and inf features
noNaNs=~any(isnan(FeatureTable));
noInf=~any(isinf(FeatureTable));
validFeat=noNaNs & noInf;
FeatureTableValid=FeatureTable(1:50,validFeat);
%step 2: normalize and remove nans again
FeatureTableValidNormal=[normalize(FeatureTableValid(:,1:width(FeatureTableValid)-1)),FeatureTableValid(:,width(FeatureTableValid))];
noNaNsNorm=~any(isnan(FeatureTableValidNormal));
FeatureTableValidNormal=FeatureTableValidNormal(:,noNaNsNorm);
%step 3: rank features according to MRMR algorithm (uncomment to plot)
[idx,scores] = fscmrmr(FeatureTableValidNormal(:,1:width(FeatureTableValidNormal)-1),FeatureTableValidNormal(:,width(FeatureTableValidNormal)));
% figure(1);bar(scores(idx));xlim([1,10]);
%step 4: choose top features 
numFeatsSel=10;
FeatureTableValidNormalFiltered=[FeatureTableValidNormal(:,idx(1:numFeatsSel)),FeatureTableValidNormal(:,width(FeatureTableValidNormal))];
