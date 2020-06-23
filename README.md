# matlab tirocinio1
tirocinio1 di TdS sullo studio di un sistema a tempo discreto.

- 1. La  funzione "TrovaControllo.m" calcola il controllo ottimale u*(.), che consente di raggiungere lo stato finale
in un numero finito di passi. Inoltre una volta trovato tale controllo viene fatta una verifica dell' esattezza del risultato.

- 2. La funzione "CalcolaIndiciDiCosto.m" calcola l'indice di costo J al variare del valore temporale v. Cioè date due matrici
A e B e uno stato finale xf, allora al variare del valore v, il controllo u*(.) cambierà perchè lo stato finale giustamente
viene raggiunto con valori diversi. Quindi in questa funzione dato un valore di v da 2 a un max, per ogni valore sarà calcolato
un controllo u*(.) e sarà calcolato l'indice di costo Jv. (L'INDICE DI COSTO DIMINUISCE ALL'AUMENTARE DI v)

- 3. La funzione "AndamentoJ.m" mostra come varia l'indice di costo al variare del valore v, questo avviene grazie ad un grafico
dove sull'asse delle ascisse vi è il valore v (che indica il tempo discreto), mentre sull'asse delle ordinate il valore di Jv.

- 4. La funzione "AndamentoU_X.m" mostra come varia il controllo u*(.) e la corrispondente risposta dello stato x(k) per v che
appartiene all'intervallo [0,v]. Questa funzione è stata scritta per un sistema che ha come valore n (=n° righe di x(.) = n°
di righe e di colonne di A = n° di righe di B) pari a 2.
