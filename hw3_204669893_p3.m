% PROBLEM 3: NESTED RADICALS

% THIS PROGRAM WILLL ASK FOR A VALUE OF m
% m IS TO BE GREATER THAN 1 AND AN INTEGER
function hw3_204669893_p3

    % recursive function for the radical
    function t = radical(m,n)
        
        if n == 0
            t = 0;
        elseif n == 1
            t = sqrt(m);
        elseif n == 2
            t = sqrt(m - sqrt(m));
        else
            t = sqrt(m - sqrt(m + radical(m,n-2)));
        
        end
    end
    
    % bool control for loop
    not_valid = true;
    % error string for display if invalid input
    error = 'error: input must be a positive integer greater than 1';
    
    % keeps prompting input until valid input is provided
    while not_valid
        m = input('please input an integer m:');

        if ~((m > 1)&&(floor(m) == m)&&isnumeric(m))
            fprintf('%s\n',error)
        else
            not_valid = false;
        end
    end
   
   % bool control for while loop
   converged = false; 
   n = 1;
   
   % calls and displays values until the nested radical converges
   while ~converged
       t = radical(m,n);
       fprintf('t%i = ',n)
       fprintf('%15.12f\n',t)
       if abs(t - radical(m,n-1)) < 1e-12
           converged = true;
       end
       n = n + 1;
   end
    
 
    
end