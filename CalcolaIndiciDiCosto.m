function Jv = CalcolaIndiciDiCosto(A,B,v_max,xf)
    %bisogna calcolare il controllo ottimale u(.) per ogni valore di v che
    %va da 2 a v_max,quest'ultimo definito in input
    if v_max <= 1
        fprintf("v deve avere valore >=2\n");
        return
    else
        Jv = [];
        for v = 2:v_max
            u = TrovaControllo(A,B,v,xf);
            
            %una volta calcolato il controllo ottimale u(.) si calcola
            %il valore di Jv e si inserisce in un array contenente tutti
            %i valori di Jv per v che va da 2 a v_max
            val_J = 0;
            
            for i = 1:v
                u_trasp = u(:,i)';
                val = u_trasp*u(:,i);
                val_J = val_J+val;
            end
            Jv = horzcat(Jv,val_J);
        end
    end
end