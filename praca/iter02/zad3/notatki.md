# iter02/zad3 — notatki

## Zadanie A: czytelne rozwiązanie stopnia 6
Postać F = A∘(x+g(y),y)∘(x,y+f(x))∘B (w pliku: pierwszy czynnik B działa pierwszy).
Metoda (`skrypty/szukaj_ladne.py 3`, sympy, dokładnie nad Q): dla wszystkich prymitywnych kierunków
a = α₁x+α₂y, e = ε₁x+ε₂y o całkowitych |α|,|ε| ≤ 3 i obu multistopni (3,2), (2,3) rozwiązano liniowo
e(q_i)−b(p_i)=f(a(p_i)), c(q_i)−a(p_i)=g(e(q_i)); parametry swobodne ustawiono na 0 (to tylko trywialna swoboda
b→b+ka+m, f→f−kx−m, analogicznie c,g — nie zmienia F). Miara: suma długości zapisu współczynników F + wpisów A, B.
Wynik (OBLICZENIOWE): w tej siatce kierunków układy mają rozwiązanie z odwracalnymi A, B tylko dla 6 kombinacji
(lista: `tmp/najlepsze_R3.json`, log `tmp/log3.txt`) — dla małych kierunków wartości a(p_i)/e(q_i) się powtarzają
i układ jest sprzeczny. Wszystkie znalezione F mają podobne, „średnio brzydkie” współczynniki; wybrano najlepsze (wynik 250):

**rozwiazanie_st6_ladne.json** — weryfikator: ok, stopień 6, 32 wyrazy, multistopień (2,3).
- B(x,y) = (y, −3x + y − 8/3)
- f(x) = 8/3·x²  (zmienia y)
- g(y) = −5/96·y³ − 1/24·y²  (zmienia x)
- A(x,y) = [[−1, −5/24], [−3, −13/8]]·(x,y) + (−1/6, −1/2)  (A⁻¹ = [[−13/8, 5/24], [3, −1]] bez przesunięcia; druga współrzędna A⁻¹ to e = 3x − y)

Jawnie (z `skrypty/zapisz.py`, pełny wydruk w `tmp/jawne.txt`):
F1 = 80/81 y⁶ + 10/9 y⁵ − 10/3 xy⁴ − 9/4 y⁴ + 15/4 x²y² − 5/2 xy³ − 187/96 y³ − 45/32 x³ + 45/32 x²y + 177/32 xy² + 311/216 y² − 27/8 x² + 9/4 xy − 49/24 x − 23/72 y − 49/162
F2 = 80/27 y⁶ + 10/3 y⁵ − 10 xy⁴ − 27/4 y⁴ + 45/4 x²y² − 15/2 xy³ − 187/32 y³ − 135/32 x³ + 135/32 x²y + 531/32 xy² + 119/72 y² − 81/8 x² + 27/4 xy − 25/8 x − 47/24 y + 95/54
Sprawdzone: F2 − 3·F1 = 3x − y − 8/3·y² + 8/3 (stopnia 2) — to e∘F = b + f(a), więc F można zapisać krócej: F2 = 3F1 + 3x − y − 8/3 y² + 8/3.
G2 = 45/32 x³ − 45/32 x²y + 15/32 xy² − 5/96 y³ + 3/8 x² − 1/4 xy + 1/24 y² − 13/8 x + 5/24 y − 1/6
G1 = stopnia 6, współczynnik wiodący m.in. 225/128 x⁶, … , 25/10368 y⁶ (pełny w tmp/jawne.txt).
Sprawdzono symbolicznie F(G(x,y)) = (x,y).

| p_i | F(p_i) | q_i |
|---|---|---|
| (−1,−1) | (1,1) | (1,1) |
| (1,−1) | (−1,1) | (−1,1) |
| (1,1) | (−1,−1) | (−1,−1) |
| (−1,1) | (2,2) | (2,2) |
| (2,2) | (1,−1) | (1,−1) |

Wniosek: odwzorowanie F przy ustalonych kierunkach a, e nie zależy od parametrów swobodnych, więc „ładność” F
zależy tylko od (a,e); w zbadanej siatce lepszego nie ma. Wpisy B całkowite (det B = 3), f, g proste; brzydota
siedzi w A (mianowniki 24, 8). Nie zdążono: większe kierunki (R>3), wymierne kierunki, inne miary.

## Zadanie B: brak niestałych par funkcjonałów
`skrypty/brak_funkcjonalu_niezal.py` (własny, sympy): układ 5 równań liniowych u·p_i+u0 = v·q_i+v0 na 6 niewiadomych
ma macierz rzędu 5, jądro rozpięte przez (u0=v0=1, reszta 0). Zatem jedyne pary afinicznych l, l' z l(p_i)=l'(q_i)
to stałe l=l'. OBLICZENIOWE (dokładnie, nad Q). Wynik: `tmp/wynikB.txt`.
