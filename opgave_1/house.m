function [Q,R]=house(A)
    if ~ismatrix(A)
        disp('Input is not a matrix');
        return 
    end

    [m,n] = size(A);
    if n > m
        disp('More columns than rows.');
        return
    end

    R = A;
    V = zeros(n);
    Q = eye(m,n);

    for i=1:n
        x = R(i:m, i);
        s = sign(x(1,:));
        if ~s
            s = 1;
        end
        e = zeros(n-i+1, 1);
        e(1,1) = 1;
        V(i:n,i) = s*norm(x)*e + x;
        V(i:n,i) = V(i:n,i)/norm(V(i:n,i));

        R(i:m, i:n) = R(i:m,i:n) - 2*V(i:n,i)*(V(i:n,i)'*R(i:m,i:n));
        temp_v = V(:,i);
        temp_v(1:i-1) = 0;
        Q = (eye(n)- 2*(temp_v*temp_v')/(temp_v'*temp_v))*Q;
    end
    Q = Q';
end
