function [topNode, FIRA] = load_SingleCP_file(pathname, filename)

% Clear the data log
topsDataLog.theDataLog(true);

%% Get the ecode matrix using the topsDataLog utility
%
% get the mainTreeNode
mainTreeNodeStruct = topsDataLog.getTaggedData('mainTreeNode', ...
    fullfile(pathname, filename));
topNode = mainTreeNodeStruct.item;

FIRA =table;

numChildren = length(topNode);
for c = 1:numChildren
    task = topNode.children{c};
    trials = task.trialData;
    if length(trials) == 1 || strcmp(task.name(1:3), 'Tut')
        continue
    else
        FIRA = [FIRA; struct2table(trials)];
    end
end

end