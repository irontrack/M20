% home work 7: problem 1

function hw7_204669893_p1()
    

    num_rows = 150;
    num_cols = 200;
    living_cells = zeros(1,300);
    
    % INITIALIZE A RANDOM;Y GENERATED 2D CELL OF ONES AND ZEROS
    % 10% CHANCE OF A 1, 90% ZERO
    function [temp,num_rows,num_cols] = init_cell(cell,num_rows,num_cols)
        
        for k = 1:num_cols
            for j = 1:num_rows
                if rand >= .9
                    cell(j,k) = 1;
                else
                    cell(j,k) = 0;
                end
            end
        end
        
        temp = cell;
      
    end

    cell = ones(num_rows,num_cols);
    
    cell = init_cell(cell,num_rows,num_cols);
   
   % ITERATE THROUGH 300 timesteps
   % cells with 2 or 3 members survive
   % cells with < 2 or >3 die
   % dead cells with 3 members live again
   
    function [temp,j,k,num_rows,num_cols] = test_cell(cell,j,k,num_rows,num_cols)
        
        % tests a cell to determine if it lives or dies
        live_cells = 0;
        n_greater = false;
        n_lesser = false;
        
        for n = -1:1
            if n + k > num_cols
                n_greater = true;
            elseif n + k < 1
                n_lesser = true;
            else
                n_greater = false;
                n_lesser = false;
            end
            for m = -1:1
                % returns 1 or 0
                if m == 0&& n == 0
                   
                    
                elseif j + m > num_rows
                    if n_greater
                        if cell(1,1) == 1
                            live_cells = live_cells + 1;
                        end
                    elseif n_lesser
                        if cell(1,num_cols) == 1
                            live_cells = live_cells + 1;
                        end
                    else
                        if cell(1,k + n) == 1
                            live_cells = live_cells + 1;
                        end
                    end
                elseif j +m < 1
                    if n_greater
                        if cell(num_rows,1) == 1
                            live_cells = live_cells + 1;
                        end
                    elseif n_lesser
                        if cell(num_rows,num_cols) == 1
                            live_cells = live_cells + 1;
                        end
                    else
                        if cell(num_rows,k + n) == 1
                            live_cells = live_cells + 1;
                        end
                    end
                else
                    if n_greater
                        if cell(j + m,1) == 1
                            live_cells = live_cells + 1;
                        end
                    elseif n_lesser
                        if cell(j + m,num_cols) == 1
                            live_cells = live_cells + 1;
                        end
                    else
                        if cell(j + m,k + n) == 1
                            live_cells = live_cells + 1;
                        end
                    end
                end
            end
        
        
        end
        
        if cell(j,k) == 0 && live_cells == 3
            cell(j,k) = 1;
        elseif live_cells < 2 || live_cells > 3
            cell(j,k) = 0;
        end
        temp = cell(j,k);
        
    end
    function [temp,num_rows, num_cols] = advance_cell(cell,num_rows,num_cols)
        
        for k = 1:num_cols
            
            for j = 1:num_rows
                
                cell(j,k) = test_cell(cell,j,k,num_rows,num_cols);
            end
        end
        temp = cell;
    end
            
    figure (1)
    imagesc(cell)
    t = zeros(1,300);
    for i = 1:300
        t(i) = i;
        cell = advance_cell(cell,num_rows,num_cols);
        living_cells(i) = sum(sum(cell));
    end
    figure (2)
    imagesc(cell)
    figure (3)
    
    plot(t,living_cells)

end