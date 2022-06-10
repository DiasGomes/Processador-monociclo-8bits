# Processador-monociclo-8bits

Processador nRisc monociclo de 8bits desenvolvido para a disciplina de Arquitetura e Organização de Computadores I.
O programa executado nesse projeto é um bubblesort.

CODIGO EM C

	ordena(int v[], int n){
		for (k = 1; k < n; k++) {
			for (j = 0; j+1 < n; j++) {
				if (vetor[j] > vetor[j + 1]) {
					aux = vetor[j];
					vetor[j] = vetor[j + 1];
					vetor[j + 1] = aux;
				}
			}
		}
	}
  
  ## Formato das Instruções
  
  
![Formato das Instruções](https://user-images.githubusercontent.com/87345751/172976592-1426c0c6-c2aa-4322-bb29-42018b5208bc.png)
  
  ## Datapath
 
![datapath](https://user-images.githubusercontent.com/87345751/172976673-a62d62a9-759b-46f7-bb00-53772c62d188.png)
