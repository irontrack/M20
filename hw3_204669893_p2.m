% PROBLEM 2: THE POCKET CHANGE PROBLEM

coins = zeros(20,1);
% for loop iterates through every value of change that can be produced 
% and finds the number of coins required

 for i = 0:1:99
 change = i;

    n = 0;
    % start with quarters
    coin = 'Q';
    while change > 0
        switch coin
        case 'Q'
            if (change - 25) >= 0
                n = n + 1;
                change = change - 25;
                
            end
            % if quarters can't be used any more, move on to dimes
            if change < 25
                coin = 'D';
            end
         case 'D'
             if (change - 10) >= 0
                 n = n + 1;
                 change = change - 10;
                 
             end
             % if dimes can't be used, move on to nickels
             if change  < 10
                 coin = 'N';
                 
             end
         case 'N'
             if (change - 5) >= 0
                 n = n + 1;
                 change = change - 5;
                 
             end
             % if nickel can't be used, then pennies
             if change < 5
                 coin = 'P';
                 
             end
         case 'P'
                 if (change - 1) >= 0
                 n = n + 1;
                 change = change - 1;
                 
                 end 
                 % end the while loop
                if change < 1
                 coin = '';
                 
                end
            otherwise
                    break
        end
                
    end
   % stores record of how many were used for this amount of change  
   if n == 0
       coins(1) = coins(1) +1;
   else
    coins(n + 1) = coins(n + 1) + 1;
   end
    
 end
 
 % makes average
 sum_n = 0;
 sum_d = 0;
 for i = 1:20
     
     sum_n = sum_n + (i - 1)*coins(i);
     sum_d = sum_d + coins(i);
     
 end
 average = sum_n/sum_d;
 
 
 fprintf('Average Number of Coins = %4.2f\n',average);