
% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determina
%              el último elemento de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función para encontrar el último elemento de una lista en C#.
%     static T MyLast<T>(List<T> list)
%     {
%         if (list == null || list.Count == 0)
%             throw new ArgumentException("La lista no puede estar vacía.");
%
%         return list[list.Count - 1]; // Devuelve el último elemento.
%     }
%
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd' };
%         char ultimoElemento = MyLast(lista);
%
%         Console.WriteLine("El último elemento es: " + ultimoElemento);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado my_last(X, List) que determina el último
% elemento X de la lista List.

% Caso base: el último elemento es cuando la lista tiene solo un elemento.
my_last(X, [X]).

% Caso recursivo: ignora el primer elemento de la lista y sigue evaluando.
my_last(X, [_|T]) :-
    my_last(X, T).

% Predicado main para ejecutar el programa
main :-
    List = [a, b, c, d],
    my_last(X, List),
    format('El último elemento es: ~w~n', [X]),
    halt.

% Ejemplo de uso:
% ?- my_last(X, [a, b, c, d]).
% X = d.
% ----------------------------------------------

