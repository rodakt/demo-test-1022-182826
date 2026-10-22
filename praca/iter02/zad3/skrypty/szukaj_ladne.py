# Przeszukanie kierunkow a=al1*x+al2*y, e=ep1*x+ep2*y (calkowite |.|<=R) dla F=A∘(x+g(y),y)∘(x,y+f(x))∘B
import sympy as sp, itertools, json, sys
from fractions import Fraction
P=[(-1,-1),(1,-1),(1,1),(-1,1),(2,2)]; Q=[(1,1),(-1,1),(-1,-1),(2,2),(1,-1)]
x,y=sp.symbols('x y')
R=int(sys.argv[1]) if len(sys.argv)>1 else 2
def solve(df,dg,al,ep):
    b1,b2,b0=sp.symbols('b1 b2 b0'); fc=sp.symbols('f0:%d'%(df+1))
    g1,g2,g0=sp.symbols('g1 g2 g0'); gc=sp.symbols('h0:%d'%(dg+1))
    a=lambda p: al[0]*p[0]+al[1]*p[1]; e=lambda q: ep[0]*q[0]+ep[1]*q[1]
    eqf=[e(q)-(b1*p[0]+b2*p[1]+b0)-sum(fc[k]*a(p)**k for k in range(df+1)) for p,q in zip(P,Q)]
    eqg=[(g1*q[0]+g2*q[1]+g0)-a(p)-sum(gc[k]*e(q)**k for k in range(dg+1)) for p,q in zip(P,Q)]
    sf=sp.linsolve(eqf,[b1,b2,b0,*fc]); sg=sp.linsolve(eqg,[g1,g2,g0,*gc])
    if not sf or not sg: return []
    sf=list(sf)[0]; sg=list(sg)[0]
    out=[]
    frf=sorted(set().union(*[v.free_symbols for v in sf]),key=str)
    frg=sorted(set().union(*[v.free_symbols for v in sg]),key=str)
    vals=[0]
    for vf in itertools.product(vals,repeat=len(frf)):
        S1=[v.subs(dict(zip(frf,vf))) for v in sf]
        if al[0]*S1[1]-al[1]*S1[0]==0: continue
        for vg in itertools.product(vals,repeat=len(frg)):
            S2=[v.subs(dict(zip(frg,vg))) for v in sg]
            if S2[0]*ep[1]-S2[1]*ep[0]==0: continue
            out.append((S1,S2))
    return out
def build(df,dg,al,ep,S1,S2):
    Bm=sp.Matrix([[al[0],al[1]],[S1[0],S1[1]]]); Bt=sp.Matrix([0,S1[2]])
    f=sum(S1[3+k]*x**k for k in range(df+1)); g=sum(S2[3+k]*y**k for k in range(dg+1))
    Ai=sp.Matrix([[S2[0],S2[1]],[ep[0],ep[1]]]); Ait=sp.Matrix([S2[2],0])
    Am=Ai.inv(); At=-Am*Ait
    u=Bm*sp.Matrix([x,y])+Bt; u1,u2=u[0],u[1]+f.subs(x,u[0]); u1=u1+g.subs(y,u2)
    Fv=Am*sp.Matrix([u1,u2])+At
    F=[sp.expand(Fv[0]),sp.expand(Fv[1])]
    return Bm,Bt,f,g,Am,At,F
def score(F,Am,Bm):
    s=0
    for Fi in F:
        for c in sp.Poly(Fi,x,y).coeffs(): s+=len(str(c))+2
    s+=sum(len(str(c)) for c in list(Am)+list(Bm))
    return s
best=[]
dirs=[d for d in itertools.product(range(-R,R+1),repeat=2) if d!=(0,0) and sp.gcd(*d)==1 and (d[0]>0 or (d[0]==0 and d[1]>0))]
for df,dg in [(3,2),(2,3)]:
  for al in dirs:
    for ep in dirs:
      for S1,S2 in solve(df,dg,al,ep):
        Bm,Bt,f,g,Am,At,F=build(df,dg,al,ep,S1,S2)
        if max(sp.Poly(Fi,x,y).total_degree() for Fi in F)>6: continue
        sc=score(F,Am,Bm); best.append((sc,df,dg,al,ep,[str(v) for v in S1],[str(v) for v in S2])); best.sort(key=lambda t:t[0]); json.dump(best[:50],open("tmp/najlepsze_R%d.json"%R,"w"))
  best.sort(key=lambda t:t[0]); json.dump(best[:50],open('tmp/najlepsze_R%d.json'%R,'w')); print(df,dg,best[:3],flush=True)
