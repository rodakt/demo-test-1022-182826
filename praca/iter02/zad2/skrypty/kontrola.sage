# Kontrola recenzenta iter02/zad2: wyznaczniki, nasycenie, skladowe, punkty wymierne; rzad macierzy funkcjonalow
P=[(-1,-1),(1,-1),(1,1),(-1,1),(2,2)]
Q=[(1,1),(-1,1),(-1,-1),(2,2),(1,-1)]
print("rzad [px,py,1,-qx,-qy,-1]:", matrix(QQ,[[p[0],p[1],1,-q[0],-q[1],-1] for p,q in zip(P,Q)]).rank())
R.<a1,a2,e1,e2>=QQ[]
A=lambda p:a1*p[0]+a2*p[1]; E=lambda q:e1*q[0]+e2*q[1]
M1=matrix(R,[[p[0],p[1],1,A(p)^2,E(q)] for p,q in zip(P,Q)])
M2=matrix(R,[[q[0],q[1],1,E(q)^2,A(p)] for p,q in zip(P,Q)])
I=R.ideal([M1.det(),M2.det()])
J=I.saturation(R.ideal([a1,a2]))[0].saturation(R.ideal([e1,e2]))[0]
for c in J.minimal_associated_primes():
    print("skladowa:", c.gens(), "dim", c.dimension())
    # punkty wymierne rzutowe: afiniczne karty a2=1 lub (a2=0,a1=1), e2=1 lub (e2=0,e1=1)
    for ca in [[a2-1],[a2,a1-1]]:
        for ce in [[e2-1],[e2,e1-1]]:
            K=c+R.ideal(ca+ce)
            if K.dimension()<0: print("  karta",ca,ce,": pusto"); continue
            print("  karta",ca,ce,": dim",K.dimension(),"punkty Q:",K.variety(QQ) if K.dimension()==0 else "dim>0!")
