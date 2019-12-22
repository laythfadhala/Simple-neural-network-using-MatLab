
%%Set The Inputs:

Input_vector = [0 2 3 5 8];

%% Calculate The Alarm

A_Matrix_1 = [1   -1/14   0       0      0      0      0      0      0      0;
              0      0      1    -1/15   0      0      0      0      0      0;
              0      0      0       0      1   -1/20   0      0      0      0;
              0      0      0       0      0      0      1   -1/13   0      0;
              0      0      0       0      0      0      0      0      1   -1/10 ];

A_Matrix_2 = [ 1    0    0    0    0;
               1    0    0    0    0;
               0    1    0    0    0;
               0    1    0    0    0;
               0    0    1    0    0;
               0    0    1    0    0;
               0    0    0    1    0;
               0    0    0    1    0;
               0    0    0    0    1;
               0    0    0    0    1 ];   
          
          
A_Matrix_3 = [1 0 0 0 0 1 0 0 0 1 0 1 1 0 1;
              0 1 0 0 0 1 1 0 0 1 1 0 1 1 1;
              0 0 1 0 0 0 1 1 0 1 1 1 1 1 1;
              0 0 0 1 0 0 0 1 1 0 1 0 1 1 1;
              0 0 0 0 1 0 0 0 1 0 0 1 0 1 1];
        
A_Matrix_4 = [ 1     0     0     0     0;
               1     0     0     0     0;
               1     0     0     0     0;
               1     0     0     0     0;
               1     0     0     0     0;
               0     1     0     0     0;
               0     1     0     0     0;
               0     1     0     0     0;
               0     1     0     0     0;
               0     0     1     0     0;
               0     0     1     0     0;
               0     0     1     0     0;
               0     0     0     1     0;
               0     0     0     1     0;
               0     0     0     0     1];
           
A_bias_1 = [-1  1 -1  1 -1  1 -1  1 -1  1];

A_bias_2 = [-1 -1 -1 -1 -1];
           
A_bias_3 = [0 0 0 0 0 -1 -1 -1 -1 -2 -2 -2 -3 -3 -4];

A_layer_1 = (Input_vector * A_Matrix_1) + A_bias_1;

A_layer_1(A_layer_1 > 0)=1;
A_layer_1(A_layer_1 <= 0)=0;

A_layer_2 = (A_layer_1 * A_Matrix_2) + A_bias_2;
A_layer_2(A_layer_2 > 0)=1;
A_layer_2(A_layer_2 <= 0)=0;

A_layer_3 = (A_layer_2 * A_Matrix_3) + A_bias_3;
A_layer_3(A_layer_3 == 1)=1;
A_layer_3(A_layer_3 <= 0)=0;

A_layer_4 = (A_layer_3 * A_Matrix_4);
%% Calculate The Warning

W_Matrix_1 = [1/13   -1/30    0       0      0      0      0      0      0      0;
               0        0     1/14   -1/32   0      0      0      0      0      0;
               0        0        0       0   1/19  -1/40   0      0      0      0;
               0        0        0       0      0      0   1/12  -1/28   0      0;
               0        0        0       0      0      0      0      0     1/9  -1/22 ];

           
W_Matrix_2 = [ 1    0    0    0    0;
               1    0    0    0    0;
               0    1    0    0    0;
               0    1    0    0    0;
               0    0    1    0    0;
               0    0    1    0    0;
               0    0    0    1    0;
               0    0    0    1    0;
               0    0    0    0    1;
               0    0    0    0    1 ];             
           
           
W_Matrix_3 = [1 0 0 0 0 1 0 0 0 1 0 1 1 0 1;
              0 1 0 0 0 1 1 0 0 1 1 0 1 1 1;
              0 0 1 0 0 0 1 1 0 1 1 1 1 1 1;
              0 0 0 1 0 0 0 1 1 0 1 0 1 1 1;
              0 0 0 0 1 0 0 0 1 0 0 1 0 1 1];
        
          
W_Matrix_4 = [ 1     0     0     0     0;
               1     0     0     0     0;
               1     0     0     0     0;
               1     0     0     0     0;
               1     0     0     0     0;
               0     1     0     0     0;
               0     1     0     0     0;
               0     1     0     0     0;
               0     1     0     0     0;
               0     0     1     0     0;
               0     0     1     0     0;
               0     0     1     0     0;
               0     0     0     1     0;
               0     0     0     1     0;
               0     0     0     0     1];
         
           
W_bias_1 = [-1  1 -1  1 -1  1 -1  1 -1  1];

W_bias_2 = [-1 -1 -1 -1 -1];
           
W_bias_3 = [0 0 0 0 0 -1 -1 -1 -1 -2 -2 -2 -3 -3 -4];

W_layer_1 = (Input_vector * W_Matrix_1) + W_bias_1;
W_layer_1(W_layer_1 > 0)=1;
W_layer_1(W_layer_1 <= 0)=0;

W_layer_2 = (W_layer_1 * W_Matrix_2) + W_bias_2;
W_layer_2(W_layer_2 > 0)=1;
W_layer_2(W_layer_2 <= 0)=0;

W_layer_3 = (W_layer_2 * W_Matrix_3) + W_bias_3;
W_layer_3(W_layer_3 == 1)=1;
W_layer_3(W_layer_3 <= 0)=0;

W_layer_4 = (W_layer_3 * W_Matrix_4);


%% Results
% Normal
if A_layer_4(1) ==0&& A_layer_4(2) ==0&&A_layer_4(3) ==0 &&A_layer_4(4) ==0&&A_layer_4(5) ==0&& W_layer_4(1) ==0&& W_layer_4(2) ==0&&W_layer_4(3) ==0&&W_layer_4(4) ==0&&W_layer_4(5) ==0;
msgbox('Normal');
end

% Alarm
if A_layer_4(1) == 1
 msgbox('Alarm !! By Individual Parameter');  
end

if A_layer_4(2) ==1
 msgbox('Alarm !! By Pairs Parameter');
end

if A_layer_4(3) ==1
 msgbox('Alarm !! By Triples Parameters');
end

if A_layer_4(4) ==1
 msgbox('Alarm !! By Quad Parameters');
end

if A_layer_4(5) ==1
 msgbox('Alarm !! By Five Parameters');
end 

% Warning
if W_layer_4(1) ==1
 msgbox('Warning !! By Individual Parameter');
end

if W_layer_4(2) ==1
 msgbox('Warning !! By Pairs Parameter');
end

if W_layer_4(3) ==1
 msgbox('Warning !! By Triples Parameter');
end

if W_layer_4(4) ==1
 msgbox('Warning !! By Quad Parameter');
end

if W_layer_4(5) ==1
 msgbox('Warning !! By Five Parameter');
end
%-------

