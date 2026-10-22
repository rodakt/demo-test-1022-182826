# Jądro macierzy wierszy [p_x, p_y, 1, -q_x, -q_y, -1]:
# rozwiązania (al,be,ga,de,ep,ze) układu al*px+be*py+ga = de*qx+ep*qy+ze dla wszystkich i.
import json, sys
from sympy import Matrix, Rational
z = json.load(open(sys.argv[1] if len(sys.argv) > 1 else 'zadanie.json'))
P = [[Rational(c) for c in p] for p in z['punkty_p']]
Q = [[Rational(c) for c in q] for q in z['punkty_q']]
M = Matrix([[p[0], p[1], 1, -q[0], -q[1], -1] for p, q in zip(P, Q)])
print('rząd =', M.rank())
ker = M.nullspace()
print('jądro:', [list(v) for v in ker])
ok = len(ker) == 1 and list(ker[0][[0,1,3,4],:]) == [0,0,0,0]
print('TYLKO STAŁE' if ok else 'ISTNIEJE NIESTAŁY FUNKCJONAŁ')
