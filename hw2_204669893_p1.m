% HOME WORK PROBLEM 1
% THIS PROBLEM WILL TAKE A DATE FROM JAN 1 1990 TO DEC 31 9999
% AND GIVE THE PHASE OF THE MOON.

%USER INPUT WILL BE VALIDATED AND ERRORS WILL BE THOWN IF INPUT IS INVALID

% bool control for while loop.



month = '';
day = '';
year = '';
MONTH = 0;
DAY = 0;
YEAR = 0;

% this loop will keep prompting the user for data until the 
% user has input a valid date.

    
    
    month = input('please enter the month as MMM (e.g. JAN):','s');
    
    day = input('please enter the day as DD (e.g. 01):','s');
    if (length(day) ~= 2)
        error('user must input the day as DD: ')
     
    else
    DAY = str2num(day);
    end
    
    if isempty(DAY) 
        
        error('the day must be a number entered as DD: ')
    end
    
    if DAY < 1
        error(' the day must be a positive integer entered as DD: ')
    end
        
    
    year = input('please enter the year as YYYY (e.g. 2000):','s');
    YEAR = str2num(year);
    if isempty(YEAR) 
        
        error('the year must be a number entered as YYYY: ')
    end
    if (YEAR<1900)||(YEAR>9999)
        error('year must be a year between 1990 and 9999')
    end
    % check for valid month
    
    if ~(strcmp(month,'JAN')||strcmp(month,'FEB')||strcmp(month,'MAR')||...
       strcmp(month,'APR')||strcmp(month,'MAY')||strcmp(month,'JUN')||...
       strcmp(month,'JUL')||strcmp(month,'AUG')||strcmp(month,'SEP')||...
            strcmp(month,'OCT')||strcmp(month,'NOV')||strcmp(month,'DEC'))
        % throws error for the month
        error('user must input a valid month as MMM: ');
    end
    
    
    % check leap year requirements
    leapyear = false;
    if mod(YEAR - 1900,4) == 0
        leapyear = true;
    end
    
    % check for valid days with switch case (every month is different
    a = 0;
    
    switch month
            
        case 'JAN'    
            % 31 days
            if DAY > 31
                error('JAN only has 31 days stupid')
            end
            a = 1;
            MONTH = 1;
        case 'FEB'
            % 28 or 29
            if leapyear && DAY > 29
                error('i need to whipe a unicorn''s rainbow off of my shoe')
            end
            if~leapyear && DAY > 28
                error('DOUBLE RAINBOW!?! what does it MEAN?????')
            end
            a = 1;
            MONTH = 2;
        case 'MAR'
            % 31 days
            if DAY > 31
                error('a leprechon licked my pint of guinness and gave me herpes')
            end
            MONTH = 3;
        case 'APR'
            %30 days
            if DAY > 30
                error('if you''re reading this call the police!')
            end
            MONTH = 4;
        case 'MAY'
            % 31 days
            if DAY > 31
                error('me gusta cerveza y tacos! quieres tomar una tequila conmigo?')
            end
            MONTH = 5;
        case 'JUN'
            % 30 days
               if DAY > 30
                error('eh! it''s my birthday bitches :) ')
               end
                MONTH = 6;
        case 'JUL'
            % 31 days
            if DAY > 31
                error('MERICA!!! LET''S BLOW SOME SHIT UP. WOOO!!!!!')
            end
            MONTH = 7;
        case 'AUG'
            % 31 days
             if DAY > 31
                error('awww, why is summer over?!?!?!')
             end
            MONTH = 8;
        case 'SEP'
            % 30 days
             if DAY > 30
                error('school starts... meh ')
             end
            MONTH = 9;
        case 'OCT'
            %31 days
             if DAY > 31
                error('Time to get drunk and dress up like my favorite meme')
             end
            MONTH = 10;
        case 'NOV'
            % 30 days
            if DAY > 31
                error('Time to get drunk and get into a political argument with my family')
            end
            MONTH = 11;
        case 'DEC'
            % 31 days
            if DAY > 31
                error('fun fact: i''ve never seen snow fall. maybe THAT''s why  i''m so weird')
            end
            MONTH = 12;                     
    end
    
    
    y = YEAR - a + 4800;
    m = MONTH +12*a - 3;
    j = DAY + floor((153*m +2)/5) + 365*y +floor(y/4) - ...
            floor(y/100) + floor(y/400) - 32045;
    delta_j = j - 2415021;
    
    L = sin(pi*mod(delta_j,29.530588853)/29.530588853)^2;
    
    % the next few lines compute the rate to determine if the 
    % moon is waxing or waning.
    
    delta_jp = delta_j - 1;
    L_p = sin(pi*mod(delta_jp,29.530588853)/29.530588853)^2;
    rate = L- L_p;
   
    %convert to percent
   L = L*100; 
   %displaying results
    fprintf('\n\n%s','');   
    fprintf('%s',month, ' ',day,' ', year,':');

    fprintf('\n%s','Illumination = ');
    fprintf('%4.1f',L);
    fprintf('%s\n',' percent');

    if rate > 0
        fprintf('%s\n','Waxing')
    else
        fprintf('%s\n','Waning')
    end

