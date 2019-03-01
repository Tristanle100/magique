program carrev2;

uses crt;

const TAILLECARRE = 5; //taille du carre

VAR care : array[1..TAILLECARRE,1..TAILLECARRE] of integer;
	util : array[1..TAILLECARRE,1..TAILLECARRE] of boolean;
	i,j,k : integer;
Procedure init;
//BUT : initialisation de toutes les cases du carré
//ENTREE : la premiere case i=1 et j=1
//SORTIE : la derniere case i=5 et j=5
BEGIN
	for i:=1 to TAILLECARRE do
	BEGIN
		for j:=1 to TAILLECARRE do
		BEGIN
				util[i,j]:=false; // la case est libre ou non
		END;
	END;
END;

Procedure creation;
//BUT : Crée le carré
//ENTREE : On commence par la valeur 1
//SORTIE : On dit au chiffre d'aller au nord est, si la case est vide il la comble sinon il continue et va au nord ouest
VAR caz: integer;
BEGIN
	//la premiere case
	caz:=1;
	i:= TAILLECARRE DIV 2 + 1;
	j:= TAILLECARRE DIV 2;
	care[i,j]:= caz;
	util[i,j]:= true;
	//on continue la boucle tant que caz n'est pas égal au dernier chiffre du tableau (pour un carré de 5x5 par exemple la dernière valeur sera égale à 25)
	//boucle pour faire 24 fois chaque étape jusqu'a remplir le tableau entierement
        for k:=2 TO (TAILLECARRE*TAILLECARRE) do
        BEGIN
                j:=j-1;
                i:=i+1;
                //si j dépasse la taille minimal du carré il revient à la taille max du carré
                 if j=0 then
                 BEGIN

                 j:= TAILLECARRE;
                 END;
                 if i=TAILLECARRE+1 then
                 BEGIN
                 i:=1
                 END;
//si la case est vide alors on va en haut à droite
                if (care[i,j]=0) then
                BEGIN
                //si i dépasse la taille du carré il revient à 1
                 if i = TAILLECARRE+1 then
                 BEGIN
                 i:=1;
                 END;
                 care[i,j]:=k;

                //si j dépasse la taille minimal du carré il revient à la taille max du carré
                 if j=0 then
                 BEGIN

                 j:= TAILLECARRE;
                 END;


                 END
////////////////////////////////////////////////////////////////////////////////////////////
//si la case est utilisé alors on va en haut à gauche
                else
                BEGIN
                i:=i-1;
                j:=j-1;

                //si i dépasse la taille du carré il revient à 1

//si j dépasse la taille minimal du carré il revient à la taille max du carré
                 if j=0 then
                 BEGIN

                 j:= TAILLECARRE;
                 END;

                //si j dépasse la taille minimal du carré il revient à la taille max du carré
                if i=0 then
                BEGIN
                i:= TAILLECARRE;
                END;
                if i=-1 then
                BEGIN
                i:= TAILLECARRE;
                END;
                //si i dépasse la taille du carré il revient à 1
                 if i = TAILLECARRE+1 then
                 BEGIN
                 i:=1;
                 END;

                care[i,j]:=k;
                 //si i dépasse la taille du carré il revient à 1
                 if i = TAILLECARRE+1 then
                 BEGIN
                 i:=1;
                 END;

                //si j dépasse la taille minimal du carré il revient à la taille max du carré
                 if j=0 then
                 BEGIN

                 j:= TAILLECARRE;
                 END;

                care[i,j]:=k;


                END;
        END;
END;

Procedure affichage;
//BUT : afficher le carré
//ENTREE : les valeurs du tableau
//SORTIE : mettre les traits pour une meilleur lisibilité
BEGIN
	for i:=1 to TAILLECARRE do
	BEGIN
		for j:=1 to TAILLECARRE do
		BEGIN
			write('|');
			write(care[j,i]:2);
		END;
		write('|');
		writeln();
	END;
END;

BEGIN
	clrscr;
	init();
	creation();
	affichage();
	readln;
END.
