with open("arquivo.txt", "r") as f:
   linhas = f.read().splitlines()

   for linha in linhas:
       print (linha)