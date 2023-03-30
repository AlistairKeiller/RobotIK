using Symbolics

n = 4

@variables t, θ(t)[1:n], ω[1:n], τ[1:n]
g = 9.81
L = [0.8636, 0.8636, 0.8636, 0.254]
M = [0.5, 0.5, 0.5, 0.5]
m = [0.5, 0.5, 0.5, 0.5]

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

α = simplify(Symbolics.solve_for([Symbolics.derivative(lagrange,θ[i])~Symbolics.derivative(Symbolics.derivative(lagrange,θ′[i]),t) for i ∈ 1:n],θ′′) + # angular acceleration from gravity
    [τ[i]/inertias[i] for i ∈ 1:n]) # angular acceleration from motors

A = Symbolics.jacobian([θ′;α], [Symbolics.scalarize(θ);θ′])
B = Symbolics.jacobian([θ′;α], Symbolics.scalarize(τ))

AInCCode = build_function(Symbolics.substitute(A, Dict([θ′[i] => ω[i] for i ∈ 1:n])), θ, ω, τ, target=Symbolics.CTarget())
BInCCode = build_function(Symbolics.substitute(B, Dict([θ′[i] => ω[i] for i ∈ 1:n])), θ, ω, τ, target=Symbolics.CTarget())

AInCCode = replace(AInCCode, "//" => "/")
BInCCode = replace(BInCCode, "//" => "/")

write("A.h", AInCCode)
write("B.h", BInCCode)