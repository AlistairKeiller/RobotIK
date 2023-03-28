using Symbolics, LinearAlgebra

n = 4

@variables g, t, L[1:n], M[1:n-1], m[1:n], θ(t)[1:n]

θ′=Symbolics.derivative(Symbolics.scalarize(θ),t)
θ′′=Symbolics.derivative(Symbolics.scalarize(θ′),t)

P = []
push!(P, [0,0])
for i ∈ 2:n
    push!(P, P[i-1]+[L[i-1]*sin(sum(Symbolics.scalarize(θ[2:i]))),L[i-1]*cos(sum(Symbolics.scalarize(θ[2:i])))])
end

point_potential = sum([g*m[i]*P[i][2] for i in 1:n])

line_potential = sum([g*m[i]*(P[i-1][2]+P[i][2])/2 for i in 2:n])

potential = point_potential + line_potential

