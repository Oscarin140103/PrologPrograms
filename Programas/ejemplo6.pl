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
% Predicado palindrome(L) que verifica si la lista L es un palíndromo.

% Una lista es un palíndromo si es igual a su inversa.
palindrome(L) :- 
    reverse_list(L, L).

% Ejemplo de uso:
% ?- palindrome([a, b, c, b, a]).
% true.
% ----------------------------------------------
