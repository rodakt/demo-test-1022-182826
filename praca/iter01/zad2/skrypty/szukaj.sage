# Szukanie F = A∘(x+g(y),y)∘(x,y+f(x))∘B. a(p)=x+s*y lub y, e(q)=x+t*y lub y (normalizacja skali/przesunięcia).
import sys, itertools, json
P=[(-1,-1),(1,-1),(1,1),(-1,1),(2,2)]; Q=[(1,1),(-1,1),(-1,-1),(2,2),(1,-1)]
df,dg=int(sys.argv[1]),int(sys.argv[2])
def lin(v): return (v[0],v[1]) 
def solve(df,dg,av,ev):
    a=[av[0]*p[0]+av[1]*p[1] for p in P]; e=[ev[0]*q[0]+ev[1]*q[1] for q in Q]
    # e_i - (b1 x+b2 y+b0) = f(a_i): unknowns b1,b2, f0..fdf  (b0 wchłonięte w f0)
    M=matrix(QQ,[[P[i][0],P[i][1]]+[a[i]^k for k in range(df+1)] for i in range(5)]); r=vector(QQ,e)
    try: s1=M.solve_right(r)
    except ValueError: return None
    K1=M.right_kernel().basis()
    N=matrix(QQ,[[Q[i][0],Q[i][1]]+[-e[i]^k for k in range(dg+1)] for i in range(5)]); r2=vector(QQ,a)
    try: s2=N.solve_right(r2)
    except ValueError: return None
    K2=N.right_kernel().basis()
    # niezaleznosc: (a,b) i (c,e) — sprawdz dla rozwiazania szczegolnego + kilku przesuniec w jadrze
    for c1 in [0,1,2,-1]:
      x1=s1+sum(c1*k for k in K1) if K1 else s1
      for c2 in [0,1,2,-1]:
        x2=s2+sum(c2*k for k in K2) if K2 else s2
        if matrix(QQ,[av,[x1[0],x1[1]]]).det()!=0 and matrix(QQ,[[x2[0],x2[1]],ev]).det()!=0:
            return (x1,x2)
    return None
vals=sorted(set(QQ(n)/d for n in range(-6,7) for d in range(1,5)))
cands=[(1,s) for s in vals]+[(0,1)]
found=None
for av in cands:
  for ev in cands:
    res=solve(df,dg,av,ev)
    if res:
      found=(av,ev,res); break
  if found: break
print("df,dg",df,dg,"zakres s,t:",len(cands))
if found:
  av,ev,(x1,x2)=found; print("ZNALEZIONO",av,ev,x1,x2)
  b1,b2=x1[0],x1[1]; fc=x1[2:]; c1,c2=x2[0],x2[1]; gc=x2[2:]
  R.<x,y>=QQ[]
  f=sum(fc[k]*x^k for k in range(df+1)); g=sum(gc[k]*y^k for k in range(dg+1))
  # B(p)=(a(p), b(p)) ; po trójkątnych: (u,v)->(u, v+f(u)) ; ->(u+g(v'), v')
  # chcemy: e(q)=b(p)+f(a(p)) => v'=e ; c(q)=a(p)+g(e) => u'=c. A: (c,e)->q, czyli A = Minv
  Minv=matrix(QQ,[[c1,c2],[ev[0],ev[1]]]).inverse()
  # c(q) = c1 qx + c2 qy - g0? stała: równanie c(q)-a = g(e) z g zawierającym stałą; ok bez stałej w c
  fs=lambda z: str(z)
  sol={"autor":"iter01/zad2","opis":"A∘(x+g(y),y)∘(x,y+f(x))∘B, multistopien (%d,%d)"%(df,dg),"postac":"slowo","czynniki":[
   {"typ":"afiniczne","A":[[fs(av[0]),fs(av[1])],[fs(b1),fs(b2)]],"t":["0","0"]},
   {"typ":"trojkatne","zmienia":"y","f":str(f).replace('^','**')},
   {"typ":"trojkatne","zmienia":"x","f":str(-g if False else g).replace('^','**')},
   {"typ":"afiniczne","A":[[fs(Minv[0,0]),fs(Minv[0,1])],[fs(Minv[1,0]),fs(Minv[1,1])]],"t":["0","0"]}]}
  json.dump(sol,open("rozwiazanie_st%d_%d%d.json"%(df*dg,df,dg),"w"),indent=1,ensure_ascii=False)
else: print("BRAK")
