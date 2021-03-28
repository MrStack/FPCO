function cut = cutRecords(records)
for i = size(records,2):-1:1
    if sum(records(:,i))~=0
        break;
    end
end
cut = records(:,1:i);