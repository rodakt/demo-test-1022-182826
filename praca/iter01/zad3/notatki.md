# iter01/zad3 — dowód: deg F >= 4, deg F nie jest liczbą pierwszą; postać normalna

Oznaczenia (złożenie matematyczne, prawy czynnik działa pierwszy):
t_f(x,y) = (x, y+f(x)), u_g(x,y) = (x+g(y), y), σ(x,y) = (y,x) (σ jest afiniczne, σ t_g σ = u_g).
Aff — grupa afiniczna, J — grupa trójkątna {(αx+c, βy+h(x)) : αβ≠0, h∈Q[x]}, B = Aff∩J.

## 1. Twierdzenie Jung–van der Kulk i multiplikatywność stopnia (cytowane + dowód stopnia)

**Fakt (literatura, nie nasz wynik).** Dla dowolnego ciała k (w szczególności k=Q)
Aut(k²) = Aff *_B J (iloczyn wolny z amalgamacją). [H. W. E. Jung, J. reine angew. Math. 184 (1942);
W. van der Kulk, Nieuw Arch. Wisk. 1 (1953); por. A. van den Essen, *Polynomial automorphisms and
the Jacobian conjecture*, Birkhäuser 2000, rozdz. 5; S. Friedland, J. Milnor, Ergodic Theory Dynam.
Systems 9 (1989) 67–99.] W szczególności każdy automorfizm jest afiniczny albo ma słowo zredukowane
F = L_k T_k L_{k-1} … T_1 L_0, T_i ∈ J\Aff, L_i ∈ Aff, L_1,…,L_{k-1} ∉ B, k>=1, a k jest
wyznaczone jednoznacznie przez F (własność iloczynu z amalgamacją). Etykieta: cytowane twierdzenie.

**Lemat 1 (postać standardowa) — UDOWODNIONE.** (a) Każdy element J\Aff ma postać d∘t_f = t_{f'}∘d'
z d,d' ∈ B diagonalno-afinicznymi, deg f = deg f' >= 2: (αx+c, βy+h(x)) = d∘t_{h/β}, d(x,y)=(αx+c,βy).
(b) Rozkład Bruhata: Aff = B ∪ BσB. Dowód: niech L = (l1,l2) ∈ Aff. Jeśli l1 zależy tylko od x,
to L ∈ B. W przeciwnym razie l1 = ax+by+c, b≠0, i L = b1∘σ∘b2, gdzie b2(x,y) = (x, l1(x,y)) ∈ B (bo b≠0, więc odwracalne i trójkątne),
a b1 := L∘b2^{-1}∘σ^{-1}; sprawdzamy b1 ∈ B: L∘b2^{-1}(x,v) ma pierwszą składową
l1(b2^{-1}(x,v)) = v, więc L∘b2^{-1} = (v, m(x,v)) i b1(x,y) = L∘b2^{-1}(y,x) = (x, m(y,x)) —
pierwsza składowa zależy tylko od x, więc b1 ∈ B. ∎
(c) Wchłaniając części z B w sąsiednie czynniki trójkątne (J jest grupą, B ⊂ J), słowo zredukowane
przyjmuje postać F = A ∘ σ t_{f_k} σ t_{f_{k-1}} … σ t_{f_1} ∘ L, A,L ∈ Aff, deg f_i >= 2.
(Dowolny skrajny σ wchłania się w A lub L.)

**Lemat 2 (stopień) — UDOWODNIONE (dowód przez wyrazy wiodące; zgodny z Friedland–Milnor, van den Essen).**
Dla F jak w (c): deg F = ∏ deg f_i.
Dowód: niech G_0 = L = (l1,l2), l1,l2 afiniczne niezależne, więc deg l1 = 1. Kładziemy
G_j = σ t_{f_j} G_{j-1}; jeśli G_{j-1} = (P, R), to t_f G = (P, R + f(P)), σ(…) = (R + f(P), P).
Teza indukcyjna: deg G_j(1) = D_j := ∏_{i<=j} deg f_i > deg G_j(2) = D_{j-1} (z D_0 = 1, a dla j=0
zamiast nierówności mamy deg l1 = 1). Krok: deg f_j(P) = deg f_j · deg P = d_j D_{j-1} (iloczyn
wiodących form jest niezerowy, bo Q[x,y] jest dziedziną), a deg R <= D_{j-1} < d_j D_{j-1}
(dla j=1: deg R = deg l2 <= 1 < d_1). Więc deg G_j(1) = d_j D_{j-1} = D_j > D_{j-1} = deg G_j(2). ∎
Na koniec A afiniczne odwracalne nie zmienia max stopnia składowych (deg A∘G <= deg G
i deg G = deg A^{-1}∘(A∘G) <= deg A∘G). Więc deg F = D_k.

## 2. Brak funkcjonału afinicznego — OBLICZENIOWE (skrypt `skrypty/brak_funkcjonalu.py`, sympy, dokładnie)

Macierz 5×6 o wierszach [p_x, p_y, 1, -q_x, -q_y, -1] ma rząd 5, jądro = span{(0,0,1,0,0,1)}.
Zatem jeśli l(p_i) = l'(q_i) dla i=1..5, l, l' afiniczne, to l, l' są stałymi (i równe).
Uruchomienie: `$PYTHON praca/iter01/zad3/skrypty/brak_funkcjonalu.py zadanie.json` → „TYLKO STAŁE”.

**Wniosek 3 — UDOWODNIONE (z OBLICZENIOWEGO faktu 2 i lematów).** F(p_i)=q_i nie jest spełnione przez:
- F afiniczne: wtedy l' = pierwsza składowa F^{-1} = (l'_1,…) daje l'(q_i) = x(p_i) — niestały funkcjonał; sprzeczność.
- F = A∘T∘L z T ∈ J (k=1; pr_1∘T = α·pr_1 + c, α≠0): niech l := α·pr_1∘L + c (niestały, bo L odwracalne),
  l' := pr_1∘A^{-1} (niestały). Wtedy l'(q_i) = pr_1(T(L p_i)) = l(p_i); sprzeczność z 2.
  (Postać z czynnikiem u_g sprowadza się do tej, bo u_g = σ t_g σ, a σ wchłania się w A, L.)
Zatem w słowie zredukowanym k >= 2, a z Lematu 2: deg F = d_1⋯d_k, d_i >= 2, k >= 2.
**Twierdzenie — UDOWODNIONE (modulo cytowane Jung–van der Kulk):** każdy automorfizm wielomianowy Q²
realizujący zadaną bijekcję ma deg F >= 4 i deg F jest liczbą złożoną; w szczególności
deg F ∉ {1,2,3,5,7,11,13}. Najniższe możliwe stopnie a priori: 4, 6, 8, 9, 10, 12, 14, 15, 16.
(Konstrukcja bazowa daje 16, więc nie wykluczono żadnego stopnia z tej listy.)

Uwaga: d_i to stopnie *wszystkich* czynników; deg F = 4 wymaga k = 2, d_1=d_2=2; deg 6: k=2, {2,3};
deg 8: k=2 {2,4} lub k=3 (2,2,2); deg 9: k=2 (3,3); itd.

## 3. Postać normalna dla dwóch czynników — UDOWODNIONE

Dla k=2 z Lematu 1(c): F = A∘σ t_{f_2} σ t_{f_1}∘L, a σ t_{f_2} σ = u_{f_2}, więc **F = A∘u_g∘t_f∘B** (A,B ∈ Aff, g=f_2, f=f_1),
deg F = deg f · deg g. W formacie „slowo”: czynniki [B, trojkatne zmienia y f, trojkatne zmienia x g, A].
Warunki: niech B(p) = (a(p), b(p)) (para niezależnych funkcjonałów afinicznych od p),
A^{-1}(q) = (c(q), e(q)) (para niezależnych funkcjonałów od q). Rachunek:
(a,b) →t_f (a, b+f(a)) →u_g (a + g(b+f(a)), b+f(a)) = (c,e), czyli
  **e(q_i) − b(p_i) = f(a(p_i)),  c(q_i) − a(p_i) = g(e(q_i)),  i=1..5.**
Odwrotnie, każde takie dane (a,b niezależne, c,e niezależne, f,g wielomiany) dają automorfizm
F = A∘u_g∘t_f∘B z F(p_i)=q_i. Przy ustalonych a, e warunki są liniowe w (b,f) oraz (c,g) osobno.
Uwaga: można bez straty ogólności normalizować f, g (np. bez wyrazu stałego i liniowego —
te wchłaniają się w B, A), co zmniejsza liczbę niewiadomych w dalszych rachunkach.
Nota: przypadek deg f = 1 lub deg g = 1 też jest objęty wzorami (wtedy słowo nie jest zredukowane,
stopień = iloczyn nadal jest górnym ograniczeniem, ale z p.2 wiemy, że takie rozwiązania nie istnieją).

## 4. Trzy czynniki — UDOWODNIONE (ten sam rachunek)
F = A∘t_h∘u_g∘t_f∘B, deg F = deg f·deg g·deg h. Z wartościami pośrednimi r_i, s_i (niewiadome):
  s_i = b(p_i) + f(a(p_i)),  r_i = a(p_i) + g(s_i),  e(q_i) = s_i + h(r_i),  c(q_i) = r_i.
Czyli (podstawiając r = c(q)): c(q_i) − a(p_i) = g(s_i), e(q_i) − s_i = h(c(q_i)), s_i − b(p_i) = f(a(p_i)).
Przy ustalonych a, c, (i s_i) — liniowe. Stopień 8 = 2·2·2 to najmniejszy przypadek k=3.

## Czego nie zrobiono
- Nie rozstrzygnięto, czy deg 4 (f,g stopnia 2) jest możliwy — to rachunek rzędu przy parametrach a, e
  (zadanie dla innych wykonawców / następnej iteracji).
- Rozkład Bruhata i lemat stopnia sprawdzono ręcznie; Jung–van der Kulk tylko cytowany.
