# iter02/zad2 — pełny dowód i recenzja: każdy automorfizm realizujący bijekcję ma deg F ≥ 6

Status: **dowód kompletny modulo (i) cytowane twierdzenie Jung–van der Kulk, (ii) wynik OBLICZENIOWY
dla multistopnia (2,2)** (iter01/zad1, powtórzony tu niezależnym skryptem kontrolnym `skrypty/kontrola.sage`,
wyjście `tmp/kontrola.out`). Nie znaleziono luki merytorycznej; znaleziono dwa miejsca wymagające
doprecyzowania (opisane w §R i uzupełnione poniżej).

Oznaczenia (prawy czynnik działa pierwszy): t_f(x,y)=(x,y+f(x)), u_g(x,y)=(x+g(y),y), σ(x,y)=(y,x),
Aff – afiniczne, J = {(αx+c, βy+h(x)): αβ≠0, h∈Q[x]}, B = Aff∩J. Stopień = całkowity, deg F = max(deg F₁,deg F₂).

## Dowód

**Krok 0 (cytowane).** Jung–van der Kulk, dla dowolnego ciała k, w szczególności k=Q: Aut(k²) = Aff *_B J.
Każdy F ∉ Aff ma słowo zredukowane F = L_k T_k L_{k-1} ⋯ T_1 L_0, T_i ∈ J\B, L_i ∈ Aff, L_1..L_{k-1} ∉ B;
długość k jest niezmiennikiem F. Wszystkie czynniki mają współczynniki w Q (twierdzenie stosujemy nad Q, nie nad C).

**Krok 1 (UDOWODNIONE) — postać standardowa nad Q.**
(a) j = (αx+c, βy+h(x)) ∈ J\B ⇒ deg h ≥ 2 i j = d∘t_{h/β}, d=(αx+c, βy) diagonalno-afiniczne (sprawdzone wprost).
(b) Bruhat nad dowolnym ciałem: Aff = B ∪ BσB (dowód w iter01/zad3 §1 — sprawdziłem: b₂=(x,l₁), b₁=L∘b₂⁻¹∘σ ∈ B; używa tylko dzielenia przez współczynnik b≠0, więc działa nad Q).
(c) Zapisz L_i = b_i σ b_i' (1≤i≤k−1). Wtedy F = L_k T_k b_{k-1} σ b'_{k-1} T_{k-1} ⋯ σ b'_1 T_1 L_0.
Każdy blok j_i := b'_i T_i b_{i-1} (z b'_k:=id, b_0:=id na końcach odpowiednio wchłoniętymi w L_k, L_0) należy do J\B
(B podgrupa J, T_i ∉ B). Piszemy j_i = d_i t_{f_i}, deg f_i ≥ 2, i przesuwamy d_i w lewo przez σ:
σ d σ = (βx, αy+c) ∈ B — **tu istotne, że d jest diagonalne**; dla ogólnego elementu B to nie zachodzi
(doprecyzowanie względem iter01/zad3, gdzie napisano tylko „wchłaniając”). Iterując od prawej, wszystkie d lądują w A.
Wynik: **F = A ∘ σ t_{f_k} σ t_{f_{k-1}} ⋯ σ t_{f_1} ∘ L**, A, L ∈ Aff(Q), f_i ∈ Q[x], deg f_i ≥ 2.

**Krok 2 (UDOWODNIONE) — deg F = ∏ deg f_i (stopień całkowity).** G_0 = L = (l₁,l₂), G_j = σ t_{f_j} G_{j-1}:
jeśli G_{j-1}=(P,R), to G_j = (R + f_j(P), P). Indukcja: deg P = D_{j-1} := ∏_{i<j} d_i, deg R ≤ D_{j-1}
(dla j=1: deg l₁ = 1, bo L odwracalne ⇒ l₁ niestały; deg l₂ ≤ 1). Forma wiodąca f_j(P) to c·(forma wiodąca P)^{d_j} ≠ 0
(Q[x,y] dziedzina), więc deg f_j(P) = d_j D_{j-1} ≥ 2 D_{j-1} > deg R — **wiodące formy nie mogą się skrócić**,
bo stopnie są różne. Zatem deg G_j(1) = D_j, deg G_j(2) = D_{j-1} < D_j. Na końcu deg(A∘G) = deg G (A, A⁻¹ afiniczne). ∎

**Krok 3 (OBLICZENIOWE + UDOWODNIONE) — k ≥ 2.** Macierz 5×6 o wierszach [p_x,p_y,1,−q_x,−q_y,−1] ma rząd 5
(sprawdzone ponownie, `kontrola.sage`), jądro = span(0,0,1,0,0,1): jeśli l(p_i)=l'(q_i) (l,l' afiniczne), to l,l' stałe.
k=0 (F afiniczne): l := x, l' := pierwsza składowa F⁻¹ — oba niestałe, sprzeczność.
k=1: F = A∘T∘L, pr₁∘T = α·pr₁+c; l := α·pr₁∘L + c, l' := pr₁∘A⁻¹ niestałe, l'(q_i)=l(p_i) — sprzeczność. ∎

**Krok 4 (UDOWODNIONE) — deg F < 6 ⇒ k=2, (2,2).** deg F = d_1⋯d_k, d_i ≥ 2, k ≥ 2 ⇒ deg F ≥ 4; deg F ∈ {4,5} i
iloczyn ≥2 liczb ≥2: 5 pierwsza – niemożliwe; 4 = 2·2 tylko (k=2, d_1=d_2=2) (k≥3 daje ≥8).
Dla k=2: F = A σ t_{f_2} σ t_{f_1} L = A ∘ u_g ∘ t_f ∘ L (g=f_2, f=f_1, bo σ t σ = u).

**Krok 5 (UDOWODNIONE) — redukcja do warunków.** L(p) = (a(p), b(p)), A⁻¹(q) = (c(q), e(q)), (a,b) i (c,e) – pary
niezależnych funkcjonałów afinicznych nad Q. u_g t_f (a,b) = (a + g(b+f(a)), b+f(a)), więc F(p_i)=q_i ⇔
 e(q_i) − b(p_i) = f(a(p_i)),  c(q_i) − a(p_i) = g(e(q_i)), i=1..5.  (Nic nie zgubiono: to równoważność.)
Normalizacje (sprawdzone): (i) a ↦ a − a₀: zastąp f przez f(·+a₀) — ten sam stopień, b bez zmian; (ii) e ↦ e − e₀:
zastąp b przez b − e₀, bo e(q)−b(p) = (e−e₀)(q) − (b−e₀)(p), a g(e) = g̃(e−e₀) z g̃ = g(·+e₀). Obie
podmiany zachowują niezależność par i stopnie. Zatem bez straty ogólności a = α₁x+α₂y, e = ε₁x+ε₂y, (α₁,α₂)≠0, (ε₁,ε₂)≠0
(bo a, e są niestałe). Wyraz liniowy i stały f: f = f₂a²+f₁a+f₀, a f₁a+f₀ jest kombinacją kolumn x,y,1 — wchłania się w b;
**nie zakładamy** f₁=0, tylko zauważamy, że kolumny się pokrywają. Analogicznie g.

**Krok 6 (OBLICZENIOWE, przesłanka z iter01/zad1, powtórzona).** Przy ustalonych a, e pierwsze 5 równań to układ liniowy
w niewiadomych (b_x,b_y,b_1,f₂) z macierzą [p_x,p_y,1,a(p)²] i prawą stroną e(q); istnienie rozwiązania ⇒ det M1 = 0,
M1 = [p_x,p_y,1,a(p)² | e(q)] (warunek **konieczny** — wystarcza do wykluczenia; dostateczność niepotrzebna).
Analogicznie det M2 = 0, M2 = [q_x,q_y,1,e(q)² | a(p)]. Czego potrzebujemy: **brak (α,ε) ∈ Q⁴ z α≠0, ε≠0, det M1 = det M2 = 0.**
Obejmuje to także deg f ≤ 2 lub deg g ≤ 2 (f₂=0 dopuszczone) — szersza klasa niż potrzebna, co jest w porządku.
Sprawdzenie skryptu st4.sage: nasycenie I względem (α₁,α₂), potem (ε₁,ε₂) daje J z V(J) ⊇ V(I) \ (V(α)∪V(ε)),
więc każdy punkt wymierny z α≠0, ε≠0 leży w V(J) — poprawne. Uwaga o α₂=0: iter01/zad1 argumentuje słownie; ja
(`kontrola.sage`) sprawdziłem jawnie wszystkie karty (α₂=1 lub α₂=0,α₁=1)×(ε₂=1 lub ε₂=0,ε₁=1) dla każdej z dwóch
minimalnych składowych pierwszych J (det M1, det M2 są dwujednorodne, więc skalowanie α, ε jest dopuszczalne):
karty z α₂=0 lub ε₂=0 są puste, karta α₂=ε₂=1 jest 0-wymiarowa bez punktów wymiernych. Wynik: brak rozwiązań nad Q.
To potwierdza wynik iter01/zad1 (ta sama metoda: wyznaczniki+nasycenie, ale inne wykonanie końcowego kroku;
**niezależną metodą** sprawdza to równolegle iter02/zad1).

**Twierdzenie.** Każdy automorfizm wielomianowy Q² z F(p_i)=q_i ma deg F ≥ 6.
Etykieta: UDOWODNIONE modulo cytowane twierdzenie Jung–van der Kulk oraz OBLICZENIOWE fakty z Kroków 3 i 6.
Wraz z ZWERYFIKOWANYMI rozwiązaniami stopnia 6 (iter01) daje to: 6 jest minimalnym stopniem
(stan/zweryfikowane.json: weryfikator zarządcy przyjął praca/iter01/zad1/rozwiazanie_st6.json, stopień 6 — ZWERYFIKOWANE).

## §R. Lista sprawdzonych punktów (recenzja)
1. Słowo nad Q, nie nad C: JvdK obowiązuje dla każdego ciała; Bruhat i postać standardowa używają tylko działań ciała — OK.
2. Wchłanianie czynników B przez σ: wymaga diagonalności d (Krok 1c) — doprecyzowano, poprawne.
3. Lemat stopnia: dotyczy stopnia całkowitego; brak skracania, bo stopnie składników różne (d_j D_{j-1} > D_{j-1}) — OK.
4. deg 4 ⇒ dokładnie k=2, (2,2): OK; deg 5 niemożliwy (pierwsza, a k≥2).
5. Redukcja do warunków: równoważność, normalizacja stałych w a, e uprawniona (podmiana f(·+a₀), g(·+e₀), b−e₀);
   f nie zakłada się bez wyrazu liniowego — wyraz liniowy pokrywa się z kolumnami x,y (uprawnione).
6. st4.sage: det=0 jako warunek konieczny — OK; nasycenie — OK; przypadek α₂=0 / ε₂=0 — sprawdzony jawnie, puste.
7. Krok 3 (k=0,1) zależy od rzędu 5 macierzy 5×6 — sprawdzone ponownie.
Luki: brak merytorycznych. Pozostaje zależność od cytowanego JvdK (standard) i od obliczeń komputerowych (Singular w Sage).

## Wersja do raportu (zwięzła)
*Twierdzenie (UDOWODNIONE modulo cytowane Jung–van der Kulk i dwa fakty OBLICZENIOWE).* deg F ≥ 6.
*Dowód.* Z JvdK nad Q każdy automorfizm nieafiniczny ma postać F = A∘σt_{f_k}σ⋯σt_{f_1}∘L, deg f_i ≥ 2 (rozkład Bruhata,
diagonalne części przesuwamy przez σ). Indukcja po wiodących formach daje deg F = ∏deg f_i (wiodące formy nie skracają się,
bo pierwsza składowa ma ściśle większy stopień od drugiej). (OBL.) Jedyne pary funkcjonałów afinicznych l,l' z l(p_i)=l'(q_i)
są stałe, co wyklucza k=0 i k=1. Stąd deg F jest iloczynem ≥2 liczb ≥2, więc deg F<6 ⇒ F = A∘u_g∘t_f∘L z deg f=deg g=2.
Warunki e(q_i)−b(p_i)=f(a(p_i)), c(q_i)−a(p_i)=g(e(q_i)) po normalizacji a, e do form liniowych dają konieczne
det M1 = det M2 = 0 — dwa równania dwujednorodne w (α,ε) ∈ P¹×P¹. (OBL.) Po nasyceniu ich zbiór zer to skończenie wiele
punktów, zdefiniowanych nad ciałem kubicznym (9t³+29t²+39t+3) i Q(√94); brak punktów wymiernych. ∎

## Czego nie zrobiono
- Nie sprawdzano JvdK (cytowane). Nie powtórzono obliczeń inną metodą (robi to iter02/zad1).
