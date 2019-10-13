.data

RetChar: .asciiz "\n"
Tableau: .asciiz "Tableau de taille: "
Aladresse: .asciiz "à l'adresse: "
Adresse: .asciiz "Adresse du premier entier du tableau: "
Place: .asciiz "Place de l'entier dans le tableau: "

.text
.globl __start

__start:

li $s0 10 #nombre d'entiers dans $s0, registre temp. sauvegardé par les fonctions
move $a2 $s0
li $a3 0
jal CreerTableau
move $s1 $v0 #$s1: adresse du premier octet du tableau

##################### Affichage de l'adresse à laquelle commence le tableau
la $a0 Adresse
li $v0 4
syscall
move $a0 $s1
jal AfficheEntier
#####################

move $a0 $s0
move $a1 $s1
jal AfficheTableau

#####################test fonction CherchePlace essayer avec un tableau trié
la $a0 Place
li $v0 4
syscall
move $a0 $s0
move $a1 $s1
li $a2 5
jal CherchePlace
move $a0 $v0
jal AfficheEntier
la $a0 RetChar
li $v0 4
syscall
####################

#####################test fonction CherchePlaceRec essayer avec un tableau trié
la $a0 Place
li $v0 4
syscall
move $a0 $s0
move $a1 $s1
li $a2 5
jal CherchePlaceRec
move $a0 $v0
jal AfficheEntier
la $a0 RetChar
li $v0 4
syscall
####################

####################test de la fonction decalage
move $a0 $s0
move $a1 $s1
jal Decalage

move $a0 $s0
move $a1 $s1
jal AfficheTableau
####################

####################test de la fonction Inserer
move $a0 $s0
move $a1 $s1
li $a2 5
jal Inserer

move $a0 $s0
move $a1 $s1
jal AfficheTableau
####################

####################test de la fonction Tri
move $a0 $s0
move $a1 $s1
jal Tri

move $a0 $s0
move $a1 $s1
jal AfficheTableau
####################

j Exit

Exit:
ori $2, $0, 10
syscall

#################################Fonction CreerTableau
###entrées: $a0: taille (en nombre d'entiers) du tableau à créer
###         $a1: 0: tableau trié dans l'ordre croissant, 1: tableau trié dans l'ordre décroissant, 2: tableau quelconque
###Pré-conditions: $a0 >=0
###Sorties: $v0: adresse (en octet) du premier entier du tableau
###Post-conditions: si $a0==0, $v0 = 0x00000000
###                 les registres temp. $si sont rétablies si utilisées
CreerTableau:
#prologue: à renseigner
	# conditional variables
	addi		$t1		1
	addi		$t2		2
	# index
	addi		$t3		0 
#corps de la fonction: à compléter
	# alloue de l'espace dans une zone memoire
	li 		$v0 		9
	# garde l'adresse alloué dans $v0 pour qu'on puisse travailler avec
	move		$v1		$v0
	# crée un tableau en dependence de ce que $a1 contient
	beq		$a3		$zero		InitialiseTableauOrdreCroissant
	beq		$a3		$t1		InitialiseTableauOrdreDecroissant
	beq		$a3		$t2		InitialiseTableauOrdreAleatoire
	
	InitialiseTableauCroissant:
		loopCroissant:
			beq		$a2		$t3		continue
			sw		$t3		0($v1)
			addi		$t3		$t3		1
			addi		$v1		$v1		4
			j		loopCroissant
		
	InitialiseLoopDecroissant:
		move		$a2		$t3
		loopDecroissant:
			beqz		$t3		continue
			sw		$t3		0($v1)
			addi		$t3		$t3		-1
			addi		$v1		$v1		4
			j		loopDecroissant
		
	InitialiseLoopAleatoire:
		li		$a1		10
		loopAleatoire:
			beq		$a2		$t3		continue
			li		$v0		42
			syscall
			
			sw		$a0		0($v1)
			addi		$t3		$t3		1
			addi		$v1		$v1 		4
			j		loopAleatoire
	
#épilogue: à renseigner
	# retour à l'addresse sauvé dans $ra
	continue:
		jr $ra

#########################################################

#################################Fonction CherchePlace
###entrées: $a0: taille (en nombre d'entiers) du tableau
###         $a1: adresse du premier élément du tableau
###         $a2: l'entier dont on cherche la place
###Pré-conditions: $a0 >=0,
###                le tableau est trié
###Sorties: $v0: offset (en octet) de la place à laquelle devrait se trouver l'entier dans $a2
###Post-conditions: si $a0==0, $v0 = 0
###                 les registres temp. $si sont rétablies si utilisées
CherchePlace:
#prologue: à renseigner
	# taille du tableau
	li		$a0		10
	# adresse du premier element du tableau
	addi		$v1		$v1		-40
	move		$a1		$v1
	# entier qu'on cherche la place
	li		$a2		5
	# offset en octets depuis le debut de la place a laquelle l'entier dans $a2 se trouve
	li		$t1		0
	
#corps de la fonction: à compléter
	li $v0 0
	
	cherchePlaceLoop:
		lw		$t2		0($a1)
		beq		$t2		$a2		set$V0
		addi		$t1		$t1		1
		addi		$a1		$a1		4
		j cherchePlaceLoop
	
	setV0:
		move		$v0		$t1
		j		continueCherchePlace
#épilogue: à renseigner
	continueCherchePlace:
		jr $ra
#########################################################

#################################Fonction CherchePlaceRec
###entrées: $a0: taille (en nombre d'entiers) du tableau
###         $a1: adresse du premier élément du tableau
###         $a2: l'entier dont on cherche la place
###Pré-conditions: $a0 >=0,
###                le tableau est trié
###Sorties: $v0: offset (en octet) de la place à laquelle devrait se trouver l'entier dans $a2
###Post-conditions: si $a0==0, $v0 = 0
###                 les registres temp. $si sont rétablies si utilisées
CherchePlaceRec:
#prologue: à renseigner

#corps de la fonction: à compléter
li $v0 0

#épilogue: à renseigner

jr $ra
#########################################################

#################################Fonction Decalage
###entrées: $a0: taille (en nombre d'entiers) du tableau
###         $a1: adresse du premier élément du tableau
###Pré-conditions: $a0 >=0,
###                les 4 octets à la suite du tableau peuvent être écris
###Sorties:
###Post-conditions: le tableau est décalé d'une case vers la droite
###                 les registres temp. $si sont rétablies si utilisées
Decalage:
#prologue: à renseigner

#corps de la fonction: à compléter

#épilogue: à renseigner

jr $ra
#########################################################

#################################Fonction Inserer
###entrées: $a0: taille (en nombre d'entiers) du tableau
###         $a1: adresse du premier élément du tableau
###         $a2: l'entier à insérer
###Pré-conditions: $a0 >=0,
###                le tableau commençant à $a1 de taille $a0 est trié
###                les 4 octets à la suite du tableau peuvent être écris
###Sorties:
###Post-conditions: le tableau commençant à $a1, de taille $a0+1 est trié
###                 les registres temp. $si sont rétablies si utilisées
Inserer:
#prologue: à renseigner

#corps de la fonction: à compléter

#épilogue: à renseigner

jr $ra
#########################################################

#################################Fonction Tri
###entrées: $a0: taille (en nombre d'entiers) du tableau
###         $a1: adresse du premier élément du tableau
###Pré-conditions: $a0 >=0,
###Sorties:
###Post-conditions: le tableau commençant à $a1, de taille $a0 est trié
###                 les registres temp. $si sont rétablies si utilisées
Tri:
#prologue: à renseigner

#corps de la fonction: à compléter

#épilogue: à renseigner

jr $ra
#########################################################


#################################Fonction AfficheTableau
###entrées: $a0: taille (en nombre d'entiers) du tableau à afficher
###Pré-conditions: $a0 >=0
###Sorties:
###Post-conditions: les registres temp. $si sont rétablies si utilisées
AfficheTableau:
#prologue:
subu $sp $sp 24
sw $s0 20($sp)
sw $s1 16($sp)
sw $s2 12($sp)
sw $a0 8($sp)
sw $a1 4($sp)
sw $ra 0($sp)

#corps de la fonction:
la $a0 Tableau
li $v0 4
syscall
lw $a0 8($sp)
jal AfficheEntier
la $a0 Aladresse
li $v0 4
syscall
lw $a0 4($sp)
jal AfficheEntier

lw $a0 8($sp)
lw $a1 4($sp)

li $s0 4
mul $s2 $a0 $s0 #$a0: nombre d'octets occupés par le tableau
li $s1 0 #s1: variable incrémentée: offset
LoopAffichage:
bge $s1 $s2 FinLoopAffichage
lw $a1 4($sp)
add $t0 $a1 $s1 #adresse de l'entier: adresse de début du tableau + offset
lw $a0 0($t0)
jal AfficheEntier
addi $s1 $s1 4 #on incrémente la variable
j LoopAffichage

FinLoopAffichage:

la $a0 RetChar
li $v0 4
syscall

#épilogue:
lw $s0 20($sp)
lw $s1 16($sp)
lw $s2 12($sp)
lw $a0 8($sp)
lw $a1 4($sp)
lw $ra 0($sp)
addu $sp $sp 24
jr $ra
#########################################################

#################################Fonction AfficheEntier
###entrées: $a0: entier à afficher
###Pré-conditions:
###Sorties:
###Post-conditions:
AfficheEntier:
#prologue:
subu $sp $sp 8
sw $a0 4($sp)
sw $ra 0($sp)

#corps de la fonction:
li $v0 1
syscall

la $a0 RetChar
li $v0 4
syscall

#épilogue:
lw $a0 4($sp)
lw $ra 0($sp)
addu $sp $sp 8
jr $ra
#########################################################
