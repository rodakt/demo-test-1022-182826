# iter01/zad2 — konstrukcje multistopnia (2,3), (3,2)

## Metoda
Szukano F = A∘(x+g(y), y)∘(x, y+f(x))∘B, A, B afiniczne. Oznaczenia: a, b — współrzędne B(p),
c, e — współrzędne A⁻¹(q). Warunki: e(qᵢ) − b(pᵢ) = f(a(pᵢ)), c(qᵢ) − a(pᵢ) = g(e(qᵢ)).
Normalizacja (bez straty ogólności, bo skalę i przesunięcie argumentu wchłaniają f, g, b, c):
a(p) = x + s·y albo a = y; e(q) = x + t·y albo e = y. Przy ustalonych s, t oba układy są liniowe
(Sage, macierze nad QQ). Przeszukano s, t ∈ {n/d : |n| ≤ 6, 1 ≤ d ≤ 4} ∪ {a=y}; sprawdzana
niezależność (a,b) i (c,e) (det ≠ 0). Skrypt: `skrypty/szukaj.sage DF DG` (uruchamiać w tym katalogu).

## Wyniki
- (deg f, deg g) = (2,3): s = −3, t = 5, f = 2/3·x² − 8/3, g = y³/162 →
  `rozwiazanie_st6_23.json` — weryfikator lokalny: ok, stopień 6 (ZWERYFIKOWANE dopiero po
  weryfikatorze zarządcy).
- (3,2): s = −3, t = 0 (e = x), f = −5/96·x³ + 1/24·x² − 1/6, g = 8/3·y² − 8/3 →
  `rozwiazanie_st6_32.json` — weryfikator lokalny: ok, stopień 6.
- Wynik: najlepszy znaleziony stopień 6 (nie „minimalny” — brak ograniczenia dolnego).
- Przypadki (2,4), (4,2), (3,3) i (2,2,2) dają stopień ≥ 8 > 6, więc ich nie liczono.

## Uwagi / czego nie zrobiono
- Nie badano ograniczeń dolnych. Stopień < 6 w tej klasie słów dwutrójkątnych to tylko
  (2,2) [stopień 4 — inne zadanie] oraz (k,1)/(1,k) (degeneruje do afiniczne∘trójkątne∘afiniczne,
  wykluczone przez planistę — HIPOTEZA do sprawdzenia: czy redukcja jest poprawna).
- Stopień 5 w ogólności (np. słowa z czynnikiem stopnia 5 i afinicznymi) — niezbadany.

## Kontrola krzyżowa (2,2)
Ten sam skrypt z parametrami `2 2` na tej samej siatce s, t nie znalazł rozwiązania. Zgadza się
to z algebraicznym wynikiem negatywnym zad1 (brak wymiernych s, t). Samo przeszukanie siatki ma
status HIPOTEZA.
