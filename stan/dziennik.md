# Dziennik eksperymentu

Start: 22.10.2026 18:28

## Etap 0

Znana konstrukcja (dwa odwzorowania trójkątne z interpolacji) zapisana w praca/iter00/baza/.


## Iteracja 01 — plan

Wiemy: zweryfikowana jest tylko konstrukcja bazowa stopnia 16. Krótki rachunek planisty pokazał, że jedyny afiniczny funkcjonał zgodny na p_i i q_i (l1(p_i)=l2(q_i)) jest stały, więc odwzorowania afiniczne oraz postaci afiniczne∘trójkątne∘afiniczne są wykluczone (HIPOTEZA do czasu spisania dowodu). Z twierdzenia Jung–van der Kulk wynika stąd, że stopień musi być iloczynem co najmniej dwóch liczb >= 2, czyli >= 4. Dla słów z dwoma czynnikami postać F = A∘(x+g(y),y)∘(x,y+f(x))∘B daje warunki, które przy ustalonych dwóch funkcjonałach afinicznych są liniowe — to sprawia, że przeszukiwanie jest wykonalne. Planujemy trzy zadania: (1) rozstrzygnięcie multistopnia (2,2), czyli stopnia 4; (2) konstrukcje stopnia 6/8/9 jako zabezpieczenie; (3) staranny dowód ograniczenia dolnego >= 4 i lematu o postaci normalnej. Jeśli (1) da rozwiązanie stopnia 4, a (3) dowód, pytanie będzie rozstrzygnięte.

## Iteracja 02 — plan

Wiemy: zweryfikowano automorfizmy stopnia 6 (multistopnie (3,2) i (2,3)); udowodniono (modulo cytowane Jung–van der Kulk), że deg F jest iloczynem co najmniej dwóch stopni czynników trójkątnych ≥ 2, więc jedynym kandydatem poniżej 6 jest stopień 4 = 2·2 w postaci A∘(x+g(y),y)∘(x,y+f(x))∘B. Wykonawca iter01/zad1 obliczeniowo wykluczył tę postać nad Q (rozwiązania istnieją tylko nad ciałem kubicznym i Q(√94)), co razem daje ograniczenie dolne 6 — ale ten rachunek nie był niezależnie sprawdzony, a łańcuch dowodu nie jest spisany w jednym miejscu. Dlatego w tej iteracji: (1) niezależna weryfikacja braku (2,2) inną metodą, z testem kontrolnym nad rozszerzeniem ciała; (2) spisanie i krytyczna recenzja pełnego dowodu deg ≥ 6, ze szczególną uwagą na normalizacje i przypadki brzegowe; (3) czytelne rozwiązanie stopnia 6 do raportu oraz niezależna kontrola braku zgodnego funkcjonału afinicznego. Jeśli (1) i (2) potwierdzą wynik, w iteracji 03 będzie można zakończyć eksperyment z odpowiedzią: najniższy stopień 6, udowodniony jako minimalny (modulo cytowane twierdzenie).

## Iteracja 03 — plan

Wiemy: weryfikator zarządcy przyjął 5 automorfizmów stopnia 6 (najczytelniejszy: praca/iter02/zad3/rozwiazanie_st6_ladne.json, multistopień (2,3)). Iteracja 02 potwierdziła ograniczenie dolne: iter02/zad2 spisał i zrecenzował pełny dowód deg F ≥ 6 (UDOWODNIONE modulo cytowane twierdzenie Jung–van der Kulk), a iter02/zad1 niezależną metodą (pełna baza Gröbnera, test kontrolny nad ciałami liczbowymi) potwierdził OBLICZENIOWO brak wymiernego rozwiązania o multistopniu (2,2), czyli jedynego kandydata na stopień 4. Fakt o braku niestałego funkcjonału afinicznego zgodnego na p_i i q_i (który wyklucza stopnie 1, 2, 3 i 5) sprawdzono niezależnie trzykrotnie. Pytanie uznajemy więc za rozstrzygnięte: najniższy stopień to 6 i jest on minimalny w całej klasie automorfizmów Q², z zastrzeżeniem zależności od cytowanego twierdzenia i faktów obliczeniowych. Nie planujemy dalszych zadań (koniec: true); pozostały czas przeznaczamy na raport.
