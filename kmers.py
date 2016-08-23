#!/usr/bin/python
# -*- coding: utf-8 -*-
adn= raw_input('Ingrese su secuencia:') #Ingresar secuencia manualmente por el usuario.
ADN = adn.upper()#Convertir secuencia en mayusculas
print 'Secuencia ingresada',ADN

k= raw_input('Ingrese el número de kmers:')
K= int(k)


def kmer_list(dna, k): #Función de python que calcula el número de kmers dentro de una cadena y genera una lista.
    result = []
    for x in range(len(dna)+1-k):
        result.append(dna[x:x+k])
    return result

x= kmer_list(ADN,int(k)) #Invoando función de kamers y creando la lista. Se nuestra la lista de kmers presentes.
print x

#El siguiente ciclo genera dos listas la primera identifica los elementos presentes en la lista x (kmers generados), estos son ordenados y los coloca en una lista aparte, la lista final contendra las repeticiones de la lista original y añadira su respectivo conteo. e imprime una lista en forma de tuplas (kmer, ocurrrencia).

lista = [] 
lista_final = []
 
for numero in x:
   lista += numero.split()
lista.sort()
set_lista = set(lista)
set_lista = list(set_lista)
set_lista.sort()
print "Secuenica->Número de ocurrencias"
for numero in set_lista:
    lista_final.append((numero,lista.count(numero)))
 
lista_final.sort(reverse=True)

print lista_final



