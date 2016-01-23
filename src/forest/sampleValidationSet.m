function [ vset, vind ] = sampleValidationSet( m, n, l )
%sampleValidationSet Samples n samples from file m, to be used as
%validation
%   vset: Validation set
%   vind: Indices of total dataset, that belong to vset

% parpool(4);
fprintf('Generating validation set...');
info = whos(m, 'classIndex');
vind = uint32(randi([1 info.size(1)], n, 1));

% X = single(zeros(n, l));
% y = uint8(zeros(n, 1));
features = m.features;
classIndex = m.classIndex;

X = features(vind, :);
y = classIndex(vind);

% parfor i = 1:length(vind)
%     features(i,:) = m.features(vind(i),:);
%     classIndex(i) = m.classIndex(vind(i),1);
% end

% delete(gcp);
vset = struct('features', X, 'classIndex', y);
fprintf(' done\n\n');

end


