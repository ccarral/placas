function outT = updateRow(key, T,P)
% Update contents of row with key 'key'
    oldValues = T(strcmp(T.key,key),:);
    
    oldValues.hu_1 = oldValues.hu_1 + P(1);
    oldValues.hu_2 = oldValues.hu_2 + P(2);
    oldValues.hu_3 = oldValues.hu_3 + P(3);
    oldValues.hu_4 = oldValues.hu_4 + P(4);
    oldValues.hu_5 = oldValues.hu_5 + P(5);
    oldValues.hu_6 = oldValues.hu_6 + P(6);
    oldValues.hu_7 = oldValues.hu_7 + P(7);
    
    oldValues.Area = oldValues.Area + P(8);
    oldValues.MajorAxisLength = oldValues.MajorAxisLength + P(9);
    oldValues.MinorAxisLength = oldValues.MinorAxisLength + P(10);
    oldValues.Count = oldValues.Count + 1;

    T(strcmp(T.key,key),:) = oldValues;
    
    outT = T;
    
end

