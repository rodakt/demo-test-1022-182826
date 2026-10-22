# iter01/zad1 — multistopień (2,2), stopień 4

## Klasa przeszukana
F = A ∘ (x+g(y), y) ∘ (x, y+f(x)) ∘ B, A, B afiniczne nad Q, deg f ≤ 2, deg g ≤ 2 (współczynniki wymierne).
Oznaczenia: B(p) = (a(p), b(p)), A⁻¹(q) = (c(q), e(q)). Warunki F(pᵢ)=qᵢ:
e(qᵢ) = b(pᵢ) + f(a(pᵢ)),  c(qᵢ) = a(pᵢ) + g(e(qᵢ)), i=1..5.
Stałe w a, e można wchłonąć w b, f oraz c, g, więc a = α₁x+α₂y, e = ε₁x+ε₂y.
Kolumna a(p) jest kombinacją kolumn x, y, więc układ (b,f) ma macierz [x, y, 1, a² | e(q)] (5×5);
rozwiązalność ⇔ det M1 = 0. Analogicznie (c,g): det M2 = 0, M2 = [qx, qy, 1, e² | a(p)].
(Warunek konieczny i dostateczny na istnienie b, f, c, g przy danych a, e; niezależność (a,b), (c,e)
nie była potrzebna, bo i tak brak rozwiązań.)

## Wynik (OBLICZENIOWE, skrypt `skrypty/st4.sage`, wyjście `tmp/st4.out`)
det M1 = −4(3α₁²ε₁ + 30α₁α₂ε₁ + 3α₂²ε₁ + 9α₁²ε₂ + 26α₁α₂ε₂ + 9α₂²ε₂),
det M2 = 4(9α₁ε₁² + 3α₂ε₁² + 26α₁ε₁ε₂ + 30α₂ε₁ε₂ + 9α₁ε₂² + 3α₂ε₂²).
Po nasyceniu względem (α₁,α₂) i (ε₁,ε₂) (a≠0, e≠0 — inaczej A, B nieodwracalne) ideał rozkłada się na
dwie składowe (rzutowo: skończenie wiele punktów na P¹×P¹, 5 zespolonych z krotnością):
1. α₁ε₁ = α₂ε₂, 9α₁³+29α₁²α₂+39α₁α₂²+3α₂³ = 0, ...
2. 15α₂ε₁ + α₁ε₂ = 0, α₁² − 38α₁α₂ − 15α₂² = 0, ...
W obu α₂=0 wymusza α₁=0, więc t=α₁/α₂ musiałoby być wymiernym pierwiastkiem 9t³+29t²+39t+3
lub t²−38t−15 — Sage: brak pierwiastków wymiernych (wyróżnik kwadratowego 1504 nie jest kwadratem).
**Wniosek (OBLICZENIOWE):** w klasie powyżej nie ma żadnego odwzorowania (także z deg f lub deg g < 2,
co obejmuje stopnie 1,2,4 w tej postaci). Rozwiązania istnieją tylko nad ciałami rozszerzonymi
(kubicznym / Q(√1504)=Q(√94)).

## Zastrzeżenia
- To NIE jest ograniczenie dolne dla wszystkich automorfizmów: dotyczy tylko słów z ≤ 2 czynnikami
  trójkątnymi w powyższej postaci. Redukcja „każde słowo z dwoma czynnikami trójkątnymi ma tę postać”
  (z Jung–van der Kulk, sprzężenie zamianą zmiennych, wchłonięcie części trójkątnej afinicznego środka)
  jest standardowa, ale nie spisałem jej dowodu tutaj — HIPOTEZA do formalnego zapisu.
- Następny krok: multistopnie (2,3)/(3,2) (stopień 6; ta sama metoda: kolumny a², a³), oraz słowa
  z trzema czynnikami (2,2,2) → stopień 8.

## Dodatkowo: konstrukcja stopnia 6 (multistopień (3,2)) — przyjęta przez lokalny weryfikator
Skrypt `skrypty/st6.sage`, plik `rozwiazanie_st6.json`. Przy deg f = 3 układ (b,f) ma macierz
[x,y,1,a²,a³] 5×5 — zwykle nieosobliwą, więc zawsze ma rozwiązanie. Wystarczy det M2 = 0 (deg g = 2),
a ten wyznacznik jest LINIOWY w (α₁,α₂), więc dla dowolnego wymiernego e da się wyznaczyć a.
Wzięto e = x, wyszło a = 12x − 36y; det B = −12, det A⁻¹ = −36, współczynnik f przy a³ = −5/165888, g = 32y².
Lokalny weryfikator: ok, stopień 6, stopnie czynników [3,2]. (ZWERYFIKOWANE nadaje dopiero weryfikator zarządcy.)

## Sprawdzenie planisty: jeden czynnik trójkątny (OBLICZENIOWE, `skrypty/jeden_trojkatny.sage`)
Dla A∘(x,y+f(x))∘B potrzeba c(qᵢ) = a(pᵢ) z c, a afinicznymi; jądro układu to tylko stałe (a = c = const),
więc B nie byłoby odwracalne. Brak rozwiązań dowolnego stopnia w postaci afiniczne∘trójkątne∘afiniczne
(i w postaci afinicznej).

## Wniosek warunkowy (HIPOTEZA, do spisania dowodu)
Z twierdzenia o multistopniu (Jung–van der Kulk; Friedland–Milnor: deg F = iloczyn stopni czynników
trójkątnych zredukowanego słowa, każdy ≥ 2) stopnie < 6 dają tylko słowa: jeden czynnik stopnia 2..5
albo dwa czynniki (2,2). Oba przypadki wykluczono powyżej nad Q. Jeśli redukcja słowa z dwoma czynnikami
do postaci A∘(x+g(y),y)∘(x,y+f(x))∘B jest poprawna (standardowa), to **6 jest minimalnym stopniem**
wśród wszystkich automorfizmów wielomianowych nad Q dla tej bijekcji. Należy to starannie zapisać
i sprawdzić w następnej iteracji (szczególnie: słowa nad Q a nie nad C, wchłanianie stałych, (k,1) ≡ jeden czynnik).
