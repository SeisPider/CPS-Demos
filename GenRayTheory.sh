#! /usr/bin/en sh

# 定义模型
cat < model.d <<EOF
MODEL.01
TEST MODEL
ISOTROPIC
KGS
FLAT EARTH
1-D
CONSTANT VELOCITY
LINE08
LINE09
LINE10
LINE11
H VP VS RHO QP QS ETAP ETAS FREFP FREFS
40. 6.0 3.5 2.8 0.0 0.0 0.0 0.0 1.0 1.0
00. 8.0 4.7 3.3 0.0 0.0 0.0 0.0 1.0 1.0
EOF

# 计算模型的前期准备
HS=10
HR=0

gprep96 -DOALL -HR 0 -HS 10 -M model.d -N 10 -DOCONV

# 定义距离文件
cat < dfile <<EOF
10.0  0.125  256  -1.0  6.0
20.0  0.125  256  -1.0  6.0
30.0  0.125  256  -1.0  6.0
40.0  0.125  256  -1.0  6.0
50.0  0.125  256  -1.0  6.0
60.0  0.125  256  -1.0  6.0
70.0  0.125  256  -1.0  6.0
80.0  0.125  256  -1.0  6.0
90.0  0.125  256  -1.0  6.0
100.0  0.125  256  -1.0  6.0
EOF

genray96 -d dfile > genray96.out

# 计算叠加波形
gpulse96 -V -p -l 4 | fprof96

# 查看波形
plotxvig < FPROF96.PLT
