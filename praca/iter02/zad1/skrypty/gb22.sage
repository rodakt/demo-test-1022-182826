# Niezalezna weryfikacja: F = A o u_g o t_f o B, deg f = deg g = 2.
# Normalizacje (uzasadnienie w notatki.md): f = x^2, g = g2*y^2, a0 = e0 = 0.
R = PolynomialRing(QQ, 'a1,a2,b0,b1,b2,c0,c1,c2,e1,e2,g2,u,v,w', order='degrevlex')
a1,a2,b0,b1,b2,c0,c1,c2,e1,e2,g2,u,v,w = R.gens()
P = [(-1,-1),(1,-1),(1,1),(-1,1),(2,2)]
Q = [(1,1),(-1,1),(-1,-1),(2,2),(1,-1)]
eqs = []
for (px,py),(qx,qy) in zip(P,Q):
    a = a1*px+a2*py; b = b0+b1*px+b2*py
    c = c0+c1*qx+c2*qy; e = e1*qx+e2*qy
    eqs.append(e - b - a^2)
    eqs.append(c - a - g2*e^2)
eqs += [u*(a1*b2-a2*b1)-1, w*(c1*e2-c2*e1)-1, v*g2-1]
I = R.ideal(eqs)
print("dim:", I.dimension())
G = I.groebner_basis()
print("GB len", len(G))
E = I.elimination_ideal([b0,b1,b2,c0,c1,c2,u,v,w,a2,e1,e2])
print("elim do a1, g2:", E.gens())
for J in I.minimal_associated_primes():
    print("PRIME dim", J.dimension(), ":", J.gens()[:6])
    for v_ in [a1,a2,e1,e2,g2]:
        Ev = J.elimination_ideal([x for x in R.gens() if x!=v_])
        print("   ", v_, Ev.gens())
