T.<t> = QQ[]
for p in [1024*t^3+705*t^2+16128*t+10368, 241*t^2+1152*t+1152, 1358954496*t^5 + 248512512*t^4 - 284450816*t^3 + 90070784*t^2 - 3648791*t + 3000]:
    print(p, "->", p.factor(), "pierwiastki wymierne:", p.roots(QQ))
# Test kontrolny: nad cialem liczbowym znajdz punkt (z g2=1 dla ustalenia skalowania)
load("skrypty/gb22_def.sage")
I2 = R.ideal(eqs + [g2-1])
print("dim z g2=1:", I2.dimension())
for J in I2.minimal_associated_primes():
    Eg = J.elimination_ideal([x for x in R.gens() if x!=a1]).gens()[0]
    pf = Eg.univariate_polynomial().factor()[0][0]
    print("min. wielomian a1:", pf)
    K = NumberField(pf, 'r')
    print("cialo:", K)
    S = J.change_ring(R.change_ring(K))
    pts = S.variety()
    print("liczba punktow:", len(pts))
    s = pts[0]
    Rx.<x,y> = K[]
    A_ = lambda X: X
    ax = s[R('a1')]*x+s[R('a2')]*y; bx = s[R('b0')]+s[R('b1')]*x+s[R('b2')]*y
    # B(x,y) = (a,b); t_f: (X,Y)->(X,Y+X^2); u_g: (X,Y)->(X+g2*Y^2,Y)
    X1, Y1 = ax, bx + ax^2
    X2, Y2 = X1 + s[R('g2')]*Y1^2, Y1
    # A^{-1}(q)=(c,e) => A = odwrotnosc liniowo-afiniczna
    M = matrix(K,[[s[R('c1')],s[R('c2')]],[s[R('e1')],s[R('e2')]]]); t0 = vector(K,[s[R('c0')],0])
    Minv = M.inverse()
    F = Minv*(vector([X2,Y2]) - t0)
    print("deg F:", max(F[0].degree(),F[1].degree()))
    ok = all(F[0](px,py)==qx and F[1](px,py)==qy for (px,py),(qx,qy) in zip(P,Q))
    print("F(p_i)=q_i:", ok)
    print("jakobian:", (F[0].derivative(x)*F[1].derivative(y)-F[0].derivative(y)*F[1].derivative(x)))
