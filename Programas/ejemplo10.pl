% ===============================================
% Autor: Oscar Roberto Lopez Machado
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que codifica 
%              una lista usando codificación Run-Length.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para codificar una lista usando codificación Run-Length en C#.
%     static List<Tuple<int, T>> Encode<T>(List<T> list)
%     {
%         var packed = Pack(list); // Agrupa duplicados consecutivos.
%         var result = new List<Tuple<int, T>>(); // Lista para almacenar el resultado.
% 
%         foreach (var sublist in packed)
%         {
%             result.Add(Tuple.Create(sublist.Count, sublist[0])); // Agrega la pareja (N, X).
%         }
%         return result; // Devuelve la lista codificada.
%     }
% 
%     // Función auxiliar para agrupar duplicados consecutivos.
%     static List<List<T>> Pack<T>(List<T> list)
%     {
%         var result = new List<List<T>>();
%         if (list == null || list.Count == 0)
%             return result;
%         
%         var sublist = new List<T> { list[0] };
% 
%         for (int i = 1; i < list.Count; i++)
%         {
%             if (EqualityComparer<T>.Default.Equals(list[i], list[i - 1]))
%             {
%                 sublist.Add(list[i]);
%             }
%             else
%             {
%                 result.Add(sublist);
%                 sublist = new List<T> { list[i] };
%             }
%         }
%         result.Add(sublist);
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'b', 'c', 'a', 'a', 'd' };
%         var listaCodificada = Encode(lista);
% 
%         Console.WriteLine("Lista codificada: ");
%         foreach (var pair in listaCodificada)
%         {
%             Console.WriteLine($"({pair.Item1}, {pair.Item2})");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado encode(L, R) que codifica la lista L usando codificación Run-Length, 
% devolviendo R.

% Primero agrupa los duplicados y luego transforma las sublistas en parejas (N, X).
encode(L, R) :- 
    pack(L, P), 
    transform(P, R).

% Transforma sublistas en parejas (N, X), donde N es la cantidad de elementos.
transform([], []).
transform([[X|Xs]|Ys], [[N,X]|Zs]) :- 
    length([X|Xs], N), 
    transform(Ys, Zs).

% Ejemplo de uso:
% ?- encode([a, a, b, b, c, a, a, d], R).
% R = [[2, a], [2, b], [1, c], [2, a], [1, d]].
% ----------------------------------------------
