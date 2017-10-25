function E_list = pertubate_and_solve(A,b)
    E = (rand(3,2)-0.5)*1e-3;
    AE_3 = A+E;
    x = AE_3\b;
    
    disp(sprintf('x_1 for (A+E_e3)\\b: %d', x(1)));
    disp(sprintf('x_2 for (A+E_e3)\\b: %d\n', x(2)));


    E = (rand(3,2)-0.5)*1e-6;
    AE_6 = A+E;
    x = AE_6\b;
    
    disp(sprintf('x_1 for (A+E_e6)\\b: %d', x(1)));
    disp(sprintf('x_2 for (A+E_e6)\\b: %d\n', x(2)));

    E = (rand(3,2)-0.5)*1e-9;
    AE_9 = A+E;
    x = AE_9\b;
    
    disp(sprintf('x_1 for (A+E_e9)\\b: %d', x(1)));
    disp(sprintf('x_2 for (A+E_e9)\\b: %d\n', x(2)));

    E = (rand(3,2)-0.5)*1e-12;
    AE_12 = A+E;
    x = AE_12\b;
    
    disp(sprintf('x_1 for (A+E_e12)\\b: %d', x(1)));
    disp(sprintf('x_2 for (A+E_e12)\\b: %d\n', x(2)));

    E = (rand(3,2)-0.5)*1e-15;
    AE_15 = A+E;
    x = AE_15\b;
    
    disp(sprintf('x_1 for (A+E_e15)\\b: %d', x(1)));
    disp(sprintf('x_2 for (A+E_e15)\\b: %d\n', x(2)));
    
    E_list = [AE_3, AE_6, AE_9, AE_12, AE_15];
end
