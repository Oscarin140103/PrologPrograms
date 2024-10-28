% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que verifica si 
%              una lista es un palíndromo.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para verificar si una lista es un palíndromo en C#.
%     static bool IsPalindrome<T>(List<T> list)
%     {
%         if (list == null)
%             throw new ArgumentException("La lista no puede ser nula.");
%         
%         List<T> reversedList = new List<T>(list);
%         reversedList.Reverse(); // Invierte la lista.
%         
%         // Compara la lista original con la invertida.
%         for (int i = 0; i < list.Count; i++)
%         {
%             if (!list[i].Equals(reversedList[i]))
%                 return false;
%         }
%         return true; // Si todas las comparaciones son iguales, es un palíndromo.
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'b', 'a' };
%         bool esPalindromo = IsPalindrome(lista);
% 
%         Console.WriteLine("¿La lista es un palíndromo? " + esPalindromo);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado para invertir una lista
reverse_list(L, R) :- 
    reverse_list(L, [], R).

reverse_list([], Acc, Acc).
reverse_list([H|T], Acc, R) :- 
    reverse_list(T, [H|Acc], R).

% Predicado que verifica si una lista es un palíndromo
palindrome(L) :- 
    reverse_list(L, L).

% Predicado main para ejecutar el programa
main :-
    List = [a, b, c, b, a],
    (   palindrome(List)
    ->  format('¿La lista es un palíndromo? Sí~n')
    ;   format('¿La lista es un palíndromo? No~n')
    ),
    halt.

% Ejemplo de uso:
% ?- palindrome([a, b, c, b, a]).
% true.
% ----------------------------------------------

