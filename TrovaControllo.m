function u = TrovaControllo(A,B,v,xf)
    %calcolo delle dimensioni della matrice A e B
    dim_A = size(A);
    dim_B = size(B);
    n = dim_A(1);
    p = dim_B(2);
    %creazione della matrice di raggiungibilità P(A,B)
    P = [];
    j = 0;
    for i = 1:n
        mat = (A^j)*B;
        P = horzcat(P,mat);
        j = j+1;
    end
    
    %controllo se sistema è raggiungibile
    rank_P = rank(P);
    
    if rank_P == n
        %fprintf("il sistema è raggiungibile =>\n");
        %fprintf("=> qualsiasi stato può essere raggiunto\n");
    else
        %fprintf("il sistema non è raggiungibile =>\n");
        %fprintf("=> controllare se lo stato può essere raggiunto\n");
        
        Px = [P,xf];
        rank_Px = rank(Px);
        
        if rank_Px == rank_P
            %fprintf("lo stato finale è raggiungibile\n");
        else
            fprintf("lo stato finale non è raggiungibile\n");
            return
        end
    end
    
    %eseguo passo 2 bis che permette di minimizzare l'indice di costo
    if v == 1
        P = B;
    elseif v == 2
        P = [B A*B];
    elseif v == 3
        P = [B A*B (A^2)*B];
    elseif v == 4
        P = [B A*B (A^2)*B (A^3)*B];
    elseif v == 5
        P = [B A*B (A^2)*B (A^3)*B (A^4)*B];
    elseif v == 6
        P = [B A*B (A^2)*B (A^3)*B (A^4)*B (A^5)*B];
    elseif v == 7
        P = [B A*B (A^2)*B (A^3)*B (A^4)*B (A^5)*B (A^6)*B];
    elseif v == 8
        P = [B A*B (A^2)*B (A^3)*B (A^4)*B (A^5)*B (A^6)*B (A^7)*B];
    elseif v == 9
        P = [B A*B (A^2)*B (A^3)*B (A^4)*B (A^5)*B (A^6)*B (A^7)*B (A^8)*B];
    elseif v == 10
        P = [B A*B (A^2)*B (A^3)*B (A^4)*B (A^5)*B (A^6)*B (A^7)*B (A^8)*B (A^9)*B];
    end
    
    P_trasp = P';
    G = P*P_trasp;
    %uso la funzione di matrice pseudo-inversa poichè nel caso esistesse
    %la inversa classica allora le due coincidono, altrimenti se la 
    %inversa di G non esiste, ne esiste però la pseudo-inversa
    G_pinv = pinv(G);
    beta = G_pinv*xf;
    w = P_trasp*beta;
    %ora trovato w, si partiziona in subvettori di dimensioni px1
    dim_w = size(w);
    
    j = dim_w(1);
    u = zeros(p,1);
    
    if p >= 2
        for i = 1:v
            u = horzcat(u,w(j-1:j));
            j = j-2;
        end
    else
        for i = 1:v
            u = horzcat(u,w(j));
            j = j-1;
        end
    end
            
    %eliminazione della prima colonna cosi si ottiene una matrice che ha
    %per colonne i segnali di controllo u da applicare in istanti diversi
    u(:,1) = [];
    
    %prova finale per controllare l'esattezza del risultato
    x = zeros(n,1);
    
    for q = 1:v
        x = (A*x)+(B*u(:,q));
    end
    %faccio round di x così prendo solo la parte intera
    x = round(x);
    xb = round(xf);
    a = x == xb;
    
    for z = 1:n
        if a(z) == 0
            fprintf("x(%d) = %d != xf(%d) = %d\n",z,x(z),z,xf(z)); 
            fprintf("il controllo u(.) calcolato non permette di raggiungere xf\n");
            return
        end
    end
    fprintf("il controllo u(.) calcolato permette di raggiungere xf\n");
end