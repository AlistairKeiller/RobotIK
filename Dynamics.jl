using Symbolics

@variables L_1, L_2, L_3, L_4, M_1, M_2, M_3, m_1, m_2, m_3, m_4, t, θ_1(t), θ_2(t), θ_3(t), θ_4(t), g

θ_1′=Symbolics.derivative(θ_1,t)
θ_2′=Symbolics.derivative(θ_2,t)
θ_3′=Symbolics.derivative(θ_3,t)
θ_4′=Symbolics.derivative(θ_4,t)

θ_1′′=Symbolics.derivative(θ_1′,t)
θ_2′′=Symbolics.derivative(θ_2′,t)
θ_3′′=Symbolics.derivative(θ_3′,t)
θ_4′′=Symbolics.derivative(θ_4′,t)

# set up points

P_1 = [0,0]
P_2 = [L_1*sin(θ_2),L_1*cos(θ_2)]
P_3 = [L_1*sin(θ_2)+L_2*sin(θ_2+θ_3),L_1*cos(θ_2)+L_2*cos(θ_2+θ_3)]
P_4 = [L_1*sin(θ_2)+L_2*sin(θ_2+θ_3)+L_3*sin(θ_2+θ_3+θ_4),L_1*cos(θ_2)+L_2*cos(θ_2+θ_3)+L_3*cos(θ_2+θ_3+θ_4)]

# calculate potential energy

point_potential = simplify(g*(m_2*P_2[2]+m_3*P_3[2]+m_4*P_4[2]))

line_potential = simplify(g*(M_1*P_2[2]/2+M_2*(P_3[2]+P_2[2])/2+M_3*(P_4[2]+P_3[2])/2))

potential = simplify(point_potential + line_potential)

I(s::Vector,e::Vector,m::Num)=m/3*(s[1]^2+s[1]*e[1]+e[1]^2+s[2]^2+s[2]*e[2]+e[2]^2)
I(p::Vector,m::Num)=m*(p[1]^2+p[2]^2)
I(s,e,m)=m/3*(s^2+e^2)
I(r,m)=m*r^2

# around J_3

I_J_3_S_3 = simplify(I(P_3-P_3,P_4-P_3,M_3))
I_J_3_P_4 = simplify(I(P_4-P_3,m_4))
I_J_3 = simplify(I_J_3_S_3+I_J_3_P_4)
J_3=simplify(1/2*I_J_3*θ_4′^2)

# around J_2

I_J_2_S_2 = simplify(I(P_2-P_2,P_3-P_2,M_2))
I_J_2_S_3 = simplify(I(P_3-P_2,P_4-P_2,M_3))
I_J_2_P_3 = simplify(I(P_3-P_2,m_3))
I_J_2_P_4 = simplify(I(P_4-P_2,m_4))
I_J_2 = simplify(I_J_2_S_2+I_J_2_S_3+I_J_2_P_3+I_J_2_P_4)
J_2=simplify(1/2*I_J_2*θ_3′^2)

# around J_1

I_J_1_S_1 = simplify(I(P_1-P_1,P_2-P_1,M_1))
I_J_1_S_2 = simplify(I(P_2-P_1,P_3-P_1,M_2))
I_J_1_S_3 = simplify(I(P_3-P_1,P_4-P_1,M_3))
I_J_1_P_2 = simplify(I(P_2-P_1,m_2))
I_J_1_P_3 = simplify(I(P_3-P_1,m_3))
I_J_1_P_4 = simplify(I(P_4-P_1,m_4))
I_J_1 = simplify(I_J_1_S_1+I_J_1_S_2+I_J_1_S_3+I_J_1_P_2+I_J_1_P_3+I_J_1_P_4)
J_1=simplify(1/2*I_J_1*θ_2′^2)

# around the rotating base

I_R_S_1 = simplify(I(P_1[1],P_2[1],M_1))
I_R_S_2 = simplify(I(P_2[1],P_3[1],M_2))
I_R_S_3 = simplify(I(P_3[1],P_4[1],M_3))
I_R_P_2 = simplify(I(P_2[1],m_2))
I_R_P_3 = simplify(I(P_3[1],m_3))
I_R_P_4 = simplify(I(P_4[1],m_4))
I_R = simplify(I_R_S_1+I_R_S_2+I_R_S_3+I_R_P_2+I_R_P_3+I_R_P_4)
R=simplify(1/2*I_R*θ_1′^2)

# total

kenetic = simplify(J_3+J_2+J_1+R)

lagrange = simplify(kenetic-potential)

# dynamics equation
Symbolics.derivative(Symbolics.derivative(lagrange,θ_1′),t)

# Symbolics.solve_for([
#     Symbolics.derivative(lagrange,θ_3)~Symbolics.derivative(Symbolics.derivative(lagrange,θ_3′),t)
#     ],[
#         θ_3′′
# ])

Symbolics.solve_for([
    Symbolics.derivative(lagrange,θ_1)~Symbolics.derivative(Symbolics.derivative(lagrange,θ_1′),t),
    Symbolics.derivative(lagrange,θ_2)~Symbolics.derivative(Symbolics.derivative(lagrange,θ_2′),t),
    Symbolics.derivative(lagrange,θ_3)~Symbolics.derivative(Symbolics.derivative(lagrange,θ_3′),t),
    Symbolics.derivative(lagrange,θ_4)~Symbolics.derivative(Symbolics.derivative(lagrange,θ_4′),t)
    ],[
        θ_1′′,
        θ_2′′,
        θ_3′′,
        θ_4′′
])

Symbolics.solve_for([
    Symbolics.derivative(lagrange,θ_4)~Symbolics.derivative(Symbolics.derivative(lagrange,θ_4′),t)
    ],[θ_4′′])
