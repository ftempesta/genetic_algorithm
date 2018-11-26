function  [normalized_vector] = Normalization(F)
    
    normalized_vector = [];

    bigger = F(1,1);
    bad_solution = []
    
    [r,c] = size(F);
    
    for i = 1:r
        if F(i,1) > bigger
            bigger = F(i,1);
        end
    end
    
    for i = 1:r
        if F(i,1) == -1
            F(i,1) = bigger*2;
            bad_solution = [bad_solution, i]
            F(i,4) = 1
        end
    end
    
    normalized_vector = [F(:,1:3)/norm(F(:,1:3)),F(:,4)]
    
%     j = 1;
%     for i = 1:r
%         if i == bad_solution[j]
%             j = j+1;
%             normalized_vector(i,4) = 1;
%         end
%     end
%     normalized_vector
    
end