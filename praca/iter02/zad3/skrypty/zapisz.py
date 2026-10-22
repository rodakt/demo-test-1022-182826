import json, sympy as sp
exec(open('skrypty/szukaj_ladne.py').read().split('best=[]')[0])
sc,df,dg,al,ep,S1,S2=json.load(open('tmp/najlepsze_R3.json'))[0]
S1=[sp.Rational(v) for v in S1]; S2=[sp.Rational(v) for v in S2]
Bm,Bt,f,g,Am,At,F=build(df,dg,al,ep,S1,S2)
s=lambda v: str(sp.Rational(v))
sol={"autor":"iter02/zad3","opis":"A∘(x+g(y),y)∘(x,y+f(x))∘B, multistopien (%d,%d), najczytelniejsze z przeszukania kierunkow |.|<=3"%(df,dg),"postac":"slowo",
"czynniki":[{"typ":"afiniczne","A":[[s(c) for c in Bm.row(i)] for i in range(2)],"t":[s(c) for c in Bt]},
{"typ":"trojkatne","zmienia":"y","f":str(f)},{"typ":"trojkatne","zmienia":"x","f":str(g)},
{"typ":"afiniczne","A":[[s(c) for c in Am.row(i)] for i in range(2)],"t":[s(c) for c in At]}]}
json.dump(sol,open('rozwiazanie_st6_ladne.json','w'),indent=1,ensure_ascii=False)
# odwrotnosc
Bi=Bm.inv(); Ai=Am.inv()
v=Ai*(sp.Matrix([x,y])-At); v1,v2=v[0]-g.subs(y,v[1]),v[1]; v2=v2-f.subs(x,v1)
w=Bi*(sp.Matrix([v1,v2])-Bt); G=[sp.expand(w[0]),sp.expand(w[1])]
print("B=",Bm,Bt,"f=",f,"g=",g,"A=",Am,At)
print("F1=",F[0]);print("F2=",F[1]);print("G1=",G[0]);print("G2=",G[1])
for p,q in zip(P,Q): print(p,"->",tuple(Fi.subs({x:p[0],y:p[1]}) for Fi in F),"oczek.",q)
print("F(G)=",[sp.expand(Fi.subs({x:G[0],y:G[1]},simultaneous=True)) for Fi in F])
