# A o (x, y+f(x)) o B: warunek konieczny c(q_i)=a(p_i) z c,a afinicznymi.
P=[(-1,-1),(1,-1),(1,1),(-1,1),(2,2)]
Q=[(1,1),(-1,1),(-1,-1),(2,2),(1,-1)]
M=matrix(QQ,[[p[0],p[1],1,-q[0],-q[1],-1] for p,q in zip(P,Q)])
print("jadro:",M.right_kernel().basis())
