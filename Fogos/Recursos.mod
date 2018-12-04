/*********************************************
 * OPL 12.8.0.0 Model
 * Author: perei
 * Creation Date: 03/12/2018 at 15:43:39
 *********************************************/
 
 // COMO RESTRINGIR ISTO A SER DE UMA C�LULA PARA OUTRA?
 
 int a = ...;
 int n = a * a;
 int d[1..n][1..n] = ...;
 
 int b = ...;
 int delta = ...; // constante de retarda��o
 int ignicao = ...; // celula de ignicao
 int proteger = ...; // celula a proteger
 

 

 
 // Vari�veis de Decis�o
 dvar int x[1..n][1..n]; // numero de caminhos no nodo ij  (???)
 dvar int y[1..n]; // 1 se nodo i tem recurso, 0 c.c.
 
 // Fun��o Objetivo: MAXIMIZAR OS TEMPOS ENTRE OS NODOS DOS CAMINHOS ENTRE IG E PROT, EM QUE O TEMPO � A DIST * DELTA (SE A ORIGEM OU DESTINO TIVEREM UM RECURSO)
 maximize sum(i in 1..n, j in 1..n) ((d[i][j]+delta*y[i]+delta*y[j])*x[i][j]);  // as dist dos arcos aqui poder�o ser 99999 ???
 
 // Sujeito a:
 subject to {
 	forall(i in 1..n) x[i][i] == 0;
 	sum(j in 2..n) (x[1][j] - x[j][1]) == n-1;
 	forall(i in 2..n) sum(j in 1..n) (x[i][j] - x[j][i]) == -1;
 	forall(i in 1..n, j in 1..n) x[i][j] >= 0;
 	
 	forall(i in 1..n) y[i]<=1; // como juntar estas duas?
 	forall(i in 1..n) y[i]>=0;
 	sum(i in 1..n) y[i] <= b; // restricao numero de recursos
 } 