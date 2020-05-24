% q_mat when quality = 50
q_mat = [ 16 11 10 16 24 40 51 61;
         12 12 14 19 26 58 60 55;
         14 13 16 24 40 57 69 56;
         14 17 22 29 51 87 80 62;
         18 22 37 56 68 109 103 77;
         24 35 55 64 81 104 113 92;
         49 64 78 87 103 121 120 101;
         72 92 95 98 112 100 103 99];

% when quality = 0
q1 = findQMat(q_mat, 30);

% when quality = 100
q2 = findQMat(q_mat, 88);

%display answer
fprintf('When quality = 30 < 50, q_mat = \n');
disp(q1);
fprintf('When quality = 88 > 50, q_mat = \n');
disp(q2);

% generate q_mat when quality != 50
function new_q_mat = findQMat(q_mat, quality)
if quality > 50
    s = 200 - 2 * quality;
elseif quality < 50
    s = 5000/quality;
end

new_q_mat = floor((s * q_mat + 50) / 100);
new_q_mat(new_q_mat == 0) = 1;
end