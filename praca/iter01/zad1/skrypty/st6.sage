# Multistopien (3,2): deg f=3, deg g=2. det M2=0 jest liniowe w alfa -> parametryzacja wymierna.
import json
P=[(-1,-1),(1,-1),(1,1),(-1,1),(2,2)]
Q=[(1,1),(-1,1),(-1,-1),(2,2),(1,-1)]
R.<a1,a2>=QQ[]
X.<x,y>=QQ[]
for (e1,e2) in [(1,0),(0,1),(1,1),(1,-1),(1,2),(2,1),(1,3)]:
    E=lambda q:e1*q[0]+e2*q[1]
    A=lambda p:a1*p[0]+a2*p[1]
    M2=matrix(R,[[q[0],q[1],1,E(q)^2,A(p)] for p,q in zip(P,Q)])
    d=M2.det()
    if d==0: continue
    # d = u*a1+v*a2 -> a=(v,-u)
    u=d.coefficient({a1:1}); v=d.coefficient({a2:1})
    al=(QQ(v),QQ(-u))
    if al==(0,0): continue
    a=lambda p:al[0]*p[0]+al[1]*p[1]
    M1=matrix(QQ,[[p[0],p[1],1,a(p)^2,a(p)^3] for p in P]); r1=vector(QQ,[E(q) for q in Q])
    if M1.rank()<5: continue
    s1=M1.solve_right(r1)  # b=s0 x+s1 y+s2, f=s3 a^2+s4 a^3
    M2n=matrix(QQ,[[q[0],q[1],1,E(q)^2] for q in Q]); r2=vector(QQ,[a(p) for p in P])
    try: s2=M2n.solve_right(r2)
    except ValueError: continue
    # c(q)=a(p)+g(e): c = gamma.(x,y,1) + g; writing a(p) = c0 x+c1 y+c2 - k e^2 ... s2 solves  c0 qx+c1 qy+c2 + k e^2 = a(p), g(e)=-k e^2
    detB=al[0]*s1[1]-al[1]*s1[0]; detA=s2[0]*e2-s2[1]*e1
    print((e1,e2),al,"detB",detB,"detA",detA, "f3",s1[4],"g2",-s2[3])
    if detB==0 or detA==0: continue
    # B: p -> (a, b), T1: (u,w)->(u, w+f(u)), T2: (u,w)->(u+g(w),w), then (u,w)=(c,e) -> q=Ainv^{-1}
    t=polygen(QQ,'t')
    f=s1[3]*t^2+s1[4]*t^3; g=-s2[3]*t^2
    Ci=matrix(QQ,[[s2[0],s2[1]],[e1,e2]]); ci=vector(QQ,[s2[2],0])
    Aff=Ci.inverse(); tA=-Aff*ci
    S=lambda z:str(z)
    sol={"autor":"iter01/zad1","opis":"A o (x+g(y),y) o (x,y+f(x)) o B, multistopien (3,2), deg 6",
      "postac":"slowo","czynniki":[
      {"typ":"afiniczne","A":[[S(al[0]),S(al[1])],[S(s1[0]),S(s1[1])]],"t":["0",S(s1[2])]},
      {"typ":"trojkatne","zmienia":"y","f":str(f(x)).replace('^','**')},
      {"typ":"trojkatne","zmienia":"x","f":str(g(y)).replace('^','**')},
      {"typ":"afiniczne","A":[[S(Aff[0,0]),S(Aff[0,1])],[S(Aff[1,0]),S(Aff[1,1])]],"t":[S(tA[0]),S(tA[1])]}]}
    json.dump(sol,open("rozwiazanie_st6.json","w"),indent=1); print("zapisano"); break
