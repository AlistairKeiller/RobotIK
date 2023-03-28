using Symbolics

n = 4

@variables g, t, L[1:n], M[1:n-1], m[1:n], θ(t)[1:n], τ[1:n]

θ′=Symbolics.derivative(Symbolics.scalarize(θ),t)
θ′′=Symbolics.derivative(Symbolics.scalarize(θ′),t)

P = []
push!(P, [0,0])
for i ∈ 2:n
    push!(P, P[i-1]+[L[i-1]*sin(sum(Symbolics.scalarize(θ[2:i]))),L[i-1]*cos(sum(Symbolics.scalarize(θ[2:i])))])
end

point_potential = sum(g*m[i]*P[i][2] for i ∈ 1:n)
line_potential = sum(g*m[i]*(P[i-1][2]+P[i][2])/2 for i ∈ 2:n)
potential = point_potential + line_potential

point_inertias = [
    [sum(m[i]*P[i][1]^2 for i ∈ 1:n)]; # rotating base point inertia
    [sum(m[i]*((P[i][1]-P[J][1])^2+(P[i][2]-P[J][2])^2) for i ∈ J+1:n) for J ∈ 1:n-1] # joint point inertias
    ]
line_inertias = [
    [sum(M[i]/3*(P[i][1]^2+P[i][1]*P[i+1][1]+P[i+1][1]^2) for i ∈ 1:n-1)]; # rotating base line inertia
    [sum(M[i]/3*((P[i][1]-P[J][1])^2+(P[i][1]-P[J][1])*(P[i+1][1]-P[J][1])+(P[i+1][1]-P[J][1])^2+(P[i][2]-P[J][2])^2+(P[i][2]-P[J][2])*(P[i+1][2]-P[J][2])+(P[i+1][2]-P[J][2])^2) for i ∈ J:n-1) for J ∈ 1:n-1] # joint line inertias
    ]
inertias = point_inertias+line_inertias
kenetic_energy = sum(1/2*inertias[i]*θ′[i]^2 for i ∈ 1:n)

lagrange = kenetic_energy - potential

Symbolics.solve_for([Symbolics.derivative(lagrange,θ[i])~Symbolics.derivative(Symbolics.derivative(lagrange,θ′[i]),t) for i ∈ 1:n],θ′′)