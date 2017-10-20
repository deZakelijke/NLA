% Made by Micha de Groot

function plot_function(A,b)

    t = A(:,2);
    x = A\b;

    plot(t, b-A*x);
    title("Error of Ax-b");
    xlabel("Entries of the error vector");
    ylabel("Error");


end
