% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que elimina 
%              duplicados consecutivos de una lista.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para eliminar duplicados consecutivos de una lista en C#.
%     static List<T> Compress<T>(List<T> list)
%     {
%         if (list == null)
%             throw new ArgumentException("La lista no puede ser nula.");
%         
%         List<T> result = new List<T>();
%         T? previous = default; // Variable para almacenar el elemento anterior.
%         
%         foreach (var item in list)
%         {
%             if (!EqualityComparer<T>.Default.Equals(item, previous)) // Compara con el anterior.
%             {
%                 result.Add(item); // Agrega el elemento si no es un duplicado.
%                 previous = item; // Actualiza el anterior.
%             }
%         }
%         return result; // Devuelve la lista sin duplicados.
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'b', 'c', 'a', 'a', 'd' };
%         List<char> listaSinDuplicados = Compress(lista);
% 
%         Console.WriteLine("Lista sin duplicados: " + string.Join(", ", listaSinDuplicados));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado compress(List, R) que elimina duplicados consecutivos de la lista List y devuelve R.

% Caso base: una lista vacía se mantiene vacía.
compress([], []).

% Si queda un solo elemento, no hay duplicados.
compress([X], [X]).

% Caso recursivo: si el primer y segundo elemento son iguales, ignora el primero.
compress([X,X|T], R) :- 
    compress([X|T], R).

% Si el primer y segundo elemento son distintos, conserva el primero.
compress([X,Y|T], [X|R]) :- 
    X \= Y, 
    compress([Y|T], R).

% Ejemplo de uso:
% ?- compress([a, a, b, b, c, a, a, d], R).
% R = [a, b, c, a, d].
% ----------------------------------------------

% Predicado main para ejecutar el programa
main :-
    List = [a, a, b, b, c, a, a, d],
    compress(List, R),
    format('Lista sin duplicados: ~w~n', [R]),
    halt.

