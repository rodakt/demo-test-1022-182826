# Zadanie B: pary afinicznych l(x,y)=u1 x+u2 y+u0, l'(x,y)=v1 x+v2 y+v0 z l(p_i)=l'(q_i), i=1..5
import sympy as sp
P=[(-1,-1),(1,-1),(1,1),(-1,1),(2,2)]; Q=[(1,1),(-1,1),(-1,-1),(2,2),(1,-1)]
u1,u2,u0,v1,v2,v0=sp.symbols('u1 u2 u0 v1 v2 v0')
eqs=[u1*p[0]+u2*p[1]+u0-(v1*q[0]+v2*q[1]+v0) for p,q in zip(P,Q)]
M=sp.Matrix([[sp.diff(e,s) for s in (u1,u2,u0,v1,v2,v0)] for e in eqs])
print("rzad macierzy 5x6:",M.rank())
print("jadro:",M.nullspace())
print("rozwiazanie:",sp.linsolve(eqs,[u1,u2,u0,v1,v2,v0]))
