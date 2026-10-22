# Przypadek F = A o (x+g(y),y) o (x,y+f(x)) o B, deg f, deg g <= 2.
# a=al1 x+al2 y, e=e1 x+e2 y (stale wchlaniane przez b i f, c i g).
P=[(-1,-1),(1,-1),(1,1),(-1,1),(2,2)]
Q=[(1,1),(-1,1),(-1,-1),(2,2),(1,-1)]
R.<a1,a2,e1,e2>=QQ[]
A=lambda p:a1*p[0]+a2*p[1]
Ee=lambda q:e1*q[0]+e2*q[1]
# kolumna a jest kombinacja x,y, wiec uklad (b,f): [x,y,1,a^2 | e(q)] (5x5)
M1=matrix(R,[[p[0],p[1],1,A(p)^2,Ee(q)] for p,q in zip(P,Q)])
M2=matrix(R,[[q[0],q[1],1,Ee(q)^2,A(p)] for p,q in zip(P,Q)])
d1=M1.det().factor(); d2=M2.det().factor()
print("det1 =",d1); print("det2 =",d2)
I=R.ideal([M1.det(),M2.det()])
# wykluczamy a==0 lub e==0 (wtedy B lub A^{-1} nieodwracalne / zdegenerowane)
J=I.saturation(R.ideal([a1,a2]))[0].saturation(R.ideal([e1,e2]))[0]
print("dekompozycja:")
for c in J.primary_decomposition():
    print(c.gens(), " dim=",c.dimension())
S.<t>=QQ[]
for pol in [9*t^3+29*t^2+39*t+3, 3*t^3+39*t^2+29*t+9, t^2-38*t-15, 15*t^2+38*t-1]:
    print(pol, pol.factor(), "pierwiastki wymierne:", pol.roots(QQ))
print("punkty wymierne J (rzutowo):", [len(c.variety(QQ)) if c.dimension()==0 else 'n/a' for c in J.primary_decomposition()])
