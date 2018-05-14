% HW 4: DNA FRAGMENTS

function hw4_203669893_p2()

    % storage variables
    
   total_proteins = 0;
   longest_pro = 0;
   shortest_pro = 9;
   average_pro = 0;
   proteins = zeros(10000,1);
   
    DNA = load('chr1_sect.mat');
    dna = DNA.dna;
    % function to test if the end codon has been found
    function t = end_test(i,dna)
        
        t = (dna(i) == 4 && dna(i + 1) == 1&& dna(i + 2) == 3||...
            dna(i) == 4 && dna(i + 1) == 1 && dna(i + 2) == 1||...
            dna(i) == 4 && dna(i + 1) == 3&& dna(i + 2) == 1);
    end
    function e = end_codon(i,dna)
        if (dna(i) == 4 && dna(i + 1) == 1&& dna(i + 2) == 3)
            e = 1;
        elseif (dna(i) == 4 && dna(i + 1) == 1 && dna(i + 2) == 1)
            e = 2;
        elseif (dna(i) == 4 && dna(i + 1) == 3&& dna(i + 2) == 1)
            e = 3;
        end
    end

   
    
    % initialize a tabulation of end codons for statistics
    end_count = zeros(3,1);
    k = 1;
    while k < length(dna) - 2
        atg = 1;
        if dna(k) == 1 && dna(k + 1) == 4 && dna(k + 2) == 3
            atg = k;
            tag = k;
            end_found = false;
            i = k + 3;
            % from protein start, loop through dna till protein end is
            % found
            while ~end_found
                if end_test(i,dna)
                    tag = i;
                    end_found = true;
                    codon = end_codon(i,dna);
                    switch codon
                        case 1
                            end_count(1) = end_count(1) + 1;
                        case 2
                            end_count(2) = end_count(2) + 1;
                        case 3
                            end_count(3) = end_count(3) + 1;
                    end
                else
                    i = i + 3;
                end
                % make sure the loop is not infinite
                if i > length(dna) - 2
                    break
                end
            end
            
            % update statistical data
            total_proteins = total_proteins + 1;
            % store length of protein
            proteins(total_proteins) = tag - atg + 3;
            
            % update longest and shortest
            if proteins(total_proteins) > longest_pro
                longest_pro = proteins(total_proteins);
            end
            if proteins(total_proteins) < shortest_pro
                shortest_pro = proteins(total_proteins);
            end
            k = tag + 3;
            % incriment k if no protein start is found
        else
            
            k = k + 3;
        end
        if k > length(dna) - 2
                    break
        end
    end
    
    % this finds the average number of proteins
    m = 0;
    for i = 1:total_proteins
        m = m + proteins(i);
    end
    
    percent = (m/length(dna))*100;
    average_pro = m/total_proteins;
    
    
  % find the most and least use edn codons.
    [most,m] = max(end_count);
    [least,l] = min(end_count);
 most_used = '';
 least_used = '';
 
 
 % this code takes the statistical data for end codons and converts the 
 % enumerated result into a string.
 switch m
     case 1
         most_used = 'TAG';
     case 2
         most_used = 'TAA';
     case 3
         most_used = 'TGA';
 end
  switch l
     case 1
         least_used = 'TAG';
     case 2
         least_used = 'TAA';
     case 3
         least_used = 'TGA';
  end
 
% print answers to part c:   
fprintf('Total Protein-coding Segments: %i\n',total_proteins)
fprintf('Average Length %6.2f\n',average_pro)
fprintf('Maximum Length %6.2f\n',longest_pro)
fprintf('Minimum Length %6.2f\n',shortest_pro)

% the following code is only to print out most and least used
% end codons

fprintf('\nThe most used end codon is %s\n',most_used)
fprintf('The least used end codon is %s\n',least_used)
fprintf('The percentage of dna used in coding is %5.2f percent\n',percent)
end