rng('shuffle')

% N is the vector containing the number of people when two people 
% have the same birthday
N = zeros(1,1e4);

 for i = 1:1e4
    
     match_found = false;
     temp = 0;
     while ~match_found
         temp = temp +1;
         % run the simulation
         new_bday = round(365*rand,0);
         group(temp) =  new_bday;
         
         
         % searches the group for birthday matches
            match_found = search_group(group);
         
         
     end
     clear group
     N(i) = temp;
     
     
     
 end
 
med = median(N);

fprintf('Median Number of People: %3.2i\n',med)
histogram(N,'BinWidth',1)
axis([0,100,0,350])
