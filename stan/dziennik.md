# Dziennik eksperymentu

Start: 22.10.2026 18:28

## Etap 0

Znana konstrukcja (dwa odwzorowania trójkątne z interpolacji) zapisana w praca/iter00/baza/.


## Iteracja 01 — plan

Wiemy: zweryfikowana jest tylko konstrukcja bazowa stopnia 16. Krótki rachunek planisty pokazał, że jedyny afiniczny funkcjonał zgodny na p_i i q_i (l1(p_i)=l2(q_i)) jest stały, więc odwzorowania afiniczne oraz postaci afiniczne∘trójkątne∘afiniczne są wykluczone (HIPOTEZA do czasu spisania dowodu). Z twierdzenia Jung–van der Kulk wynika stąd, że stopień musi być iloczynem co najmniej dwóch liczb >= 2, czyli >= 4. Dla słów z dwoma czynnikami postać F = A∘(x+g(y),y)∘(x,y+f(x))∘B daje warunki, które przy ustalonych dwóch funkcjonałach afinicznych są liniowe — to sprawia, że przeszukiwanie jest wykonalne. Planujemy trzy zadania: (1) rozstrzygnięcie multistopnia (2,2), czyli stopnia 4; (2) konstrukcje stopnia 6/8/9 jako zabezpieczenie; (3) staranny dowód ograniczenia dolnego >= 4 i lematu o postaci normalnej. Jeśli (1) da rozwiązanie stopnia 4, a (3) dowód, pytanie będzie rozstrzygnięte.
