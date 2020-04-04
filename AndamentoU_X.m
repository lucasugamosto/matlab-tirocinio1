function AndamentoU_X(A,B,v_max,xf)
    %con la funzione TrovaControllo, verifico se esiste un controllo u(.)
    %che mi permette di raggiungere lo stato desiderato
    dim_A = size(A);
    dim_B = size(B);
    p = dim_B(2);
    n = dim_A(1);
    
    if n ~= 2
        fprintf("n deve avere dimensione 2\n");
        return
    end
    
    u = TrovaControllo(A,B,v_max,xf);
    v = [0:1:v_max];
    
    %ANDAMENTO DI u(.) NELL'INTERVALLO [0,v] (con u(v) = 0)
    u = horzcat(u,0)
    plot(v,u,"b--*","Linewidth",2);
    
    %ANDAMENTO DI x(.) NELL'INTERVALLO [0,v] (con u(v) = 0)
    X = zeros(n,1);
    x = X;
    u_v = zeros(p,1);
    
    for i = 1:v_max
        X = (A*X)+(B*u(:,i));
        x = horzcat(x,X);
    end
    x
    x1 = x(1,:);
    x2 = x(2,:);
    hold on
    plot(v,x1,"r--*","LineWidth",2);
    hold on
    plot(v,x2,"g--*","LineWidth",2);
    
    title("andamento di u(.) e x(.)");
    xlabel("tempo discreto v");
    legend("u(.)","1°componente di x(.)","2°componente di x(.)");
end