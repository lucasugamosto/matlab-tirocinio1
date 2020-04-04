function AndamentoJ(A,B,v_max,xf)
    %ANDAMENTO DELL'INDICE DI COSTO
    %per mostrare l'andamento dell'indice di costo in funzione della
    %variabile temporale v crea un grafico con sull'asse delle ascisse
    %la variabile v = 2,...,v_max, e sull'asse delle ordinate i valori
    %di J
    
    %come prima cosa si crea il vettore contenente i valori di v
    v = 2:v_max;
    
    %ora si crea attraverso la funzione CalcolaIndiciDiCosto il vettore
    %contenente i valori di J al variare di v
    J = CalcolaIndiciDiCosto(A,B,v_max,xf);
    
    plot(v,J,"r:*","LineWidth",2);
    title("andamento di J");
    xlabel("tempo discreto v");
    ylabel("indice di costo J");
end