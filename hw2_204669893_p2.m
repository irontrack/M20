% HOWEWORK PROBLEM 2: NEIGHBOR ID.

%
function hw2_204669893_p2()


    % get row of p
    M = input('please input M: ');

    % validates input
    if ~isnumeric(M)
        error('M must be an integer: ');
    end
    if floor(M) ~= M
        error('M must be an integer: ');
    elseif M <2
        error('Size of M must be at least 2:');
    end

    %get col of p
    N = input('please input N: ');

    % validates input
    if ~isnumeric(N)
        error('N must be an integer: ');
    end
    if floor(N) ~= N
        error('N must be an integer: ');
    elseif N < 2
        error('Size of N must be at least 2');
    end

    %get P
    P = input('Please input position, P:');
    % validates input
    if ~isnumeric(M)
        error('P must be an integer: ');
    end
    if floor(M) ~= M
        error('P must be an integer: ');
    elseif P > M*N
        error('Size of P must be less than MxN:');
    end

    % convert P to coordinates in array.
    m = 0;
    n = 0;

    if floor((P - 1)/M) == 0
        m = P;
        n = 1;
   
    else
        
        if mod(P,M) == 0
            m = M;
        else
            m = mod(P,M); 
        end
        if mod(P,N) == 0
            n = floor(P/M);
        else
            n = floor(P/M) + 1;
        end
    end




    function f = neighbor(m,n,M)

        f = (n - 1)*M + m;
    end
    fprintf('%i\n',m,n)
    fprintf('%s','Cell ID:   ');
    fprintf('%i\n',P)
    fprintf('%s','Neighbors:');
    
    if ~(m + 1 > M)
        fprintf(' %i',neighbor(m + 1,n,M));
         if ~(n +1 > N)
            fprintf(' %i',neighbor(m + 1,n + 1,M));
        
         end
         if ~(n - 1 < 1)
            fprintf(' %i',neighbor(m + 1,n - 1,M));
         end
    
    end
   
    if ~(m - 1 < 1)
        fprintf(' %i',neighbor(m - 1,n,M));
         if ~(n + 1 > N)
            fprintf(' %i',neighbor(m - 1,n + 1,M));
        
         end
         if ~(n - 1 < 1)
            fprintf(' %i',neighbor(m - 1,n - 1,M));
         end
    end
    if ~(n+1 > N)
        fprintf(' %i',neighbor(m,n + 1,M));
        
    end
    if ~(n - 1 < 1)
        fprintf(' %i',neighbor(m,n - 1,M));
        
    end
    fprintf('\n')
end