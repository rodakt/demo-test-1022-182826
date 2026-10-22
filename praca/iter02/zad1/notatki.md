# iter02/zad1 — niezależna weryfikacja braku automorfizmu (2,2) nad Q

## Przeszukana klasa
F = A∘u_g∘t_f∘B, t_f(x,y)=(x,y+f(x)), u_g(x,y)=(x+g(y),y), A,B afiniczne odwracalne nad Q,
deg f = deg g = 2 (dokładnie). Oznaczenia: B(p)=(a(p),b(p)), A^{-1}(q)=(c(q),e(q)); warunki
e(q_i)-b(p_i)=f(a(p_i)), c(q_i)-a(p_i)=g(e(q_i)), i=1..5. (To, że każdy automorfizm stopnia 4
ma tę postać, pochodzi z iter01/zad3 — tu tego nie sprawdzałem.)

## Normalizacje (wszystkie wymierne, zachowują odwracalność)
1. Liniowe i stałe wyrazy f: f = f2 x² + f1 x + f0 → b := b + f1 a + f0 (det(a,b) bez zmian). Analogicznie g → g2 y², c := c + g1 e + g0.
2. f2 ∈ Q\{0}: zastępujemy e, b przez e/f2, b/f2 (sprzężenie diag(1,1/f2)); g2 zmienia się o czynnik f2², nadal wymierny ≠ 0. Stąd f = x².
3. a0 = 0: a := a + s ⇒ (a+s)² = a² + 2sa + s², pochłania b := b + 2sa + s².
4. e0 = 0: e := e + s pochłania b := b + s oraz c := c + 2 g2 s e − g2 s² (dodaje wielokrotność e, det bez zmian).
Wszystkie przekształcenia są nad Q i odwracalne, więc rozwiązanie wymierne ogólnej postaci istnieje ⇔ istnieje znormalizowane.
Nie dzieliłem przez żaden parametr: warunki ≠0 dodane zmiennymi u·det(a,b)=1, w·det(c,e)=1, v·g2=1; przypadek a2=0, e1=0 itd. jest w ideale (nic nie zakładano).

## Metoda (skrypty/gb22.sage, wynik tmp/gb22.out)
Ideał w Q[a1,a2,b0,b1,b2,c0,c1,c2,e1,e2,g2,u,v,w]: 10 równań + 3 warunki niezerowości. Wymiar 1
(pozostała jednowymiarowa grupa skalowań a→λa, b,e→λ²·, c→λc, g2→λ^{-3}g2). Eliminacja do Q[a1,g2]:
  1358954496 s^5 + 248512512 s^4 − 284450816 s^3 + 90070784 s^2 − 3648791 s + 3000, s = a1³g2,
= 1358954496·(s² + 59/96 s − 125/4096)·(s³ − 373/864 s² + 9569/110592 s − 1/13824).
Dyskryminanta czynnika kwadratowego = 4606/9216 = 49·94/9216 → ciało Q(√94) (zgodne z iter01/zad1).
Brak pierwiastków wymiernych (Sage roots(QQ)) ⇒ żaden punkt wymierny ideału nie istnieje (każdy punkt
spełnia ten wielomian eliminacyjny, a s byłoby wymierne). Dwie minimalne składowe pierwsze, wymiaru 1;
niezmiennik v·w spełnia odpowiednio 1024t³+705t²+16128t+10368 i 241t²+1152t+1152 — też bez pierwiastków wymiernych.
Czas obliczeń: kilka sekund.

## Test kontrolny (skrypty/kontrola.sage, tmp/kontrola.out)
Dodano g2=1 (ustala skalowanie; dopuszczalne nad rozszerzeniem z pierwiastkami 3. stopnia), ideał
wymiaru 0, 3 składowe; dla każdej zbudowano ciało liczbowe K z wielomianu minimalnego a1, policzono
punkty nad K, zbudowano F jawnie i sprawdzono symbolicznie w K[x,y]: deg F = 4, F(p_i)=q_i dla wszystkich i,
jakobian stały niezerowy. Wszystkie trzy składowe dały poprawne F. Metoda nie jest więc ślepa.

## Wniosek
OBLICZENIOWE: w klasie A∘u_g∘t_f∘B z deg f = deg g = 2 nie ma automorfizmu nad Q realizującego bijekcję;
istnieją nad ciałami liczbowymi stopnia 3 i 6 (m.in. zawierającymi √94). Zgadza się z iter01/zad1.
Nie sprawdzałem: lematu postaci normalnej (iter01/zad3) ani przypadków deg f<2 lub deg g<2 (te dają stopień <4).
