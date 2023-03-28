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

total_point_potential = sum([g*m[i]*P[i][2] for i ∈ 1:n])
total_line_potential = sum([g*m[i]*(P[i-1][2]+P[i][2])/2 for i ∈ 2:n])
total_potential = total_point_potential + total_line_potential

total_kenetic_energy = 0
for J ∈ 1:n-1
    point_inertia = sum(m[i]*((P[i][1]-P[J][1])^2+(P[i][2]-P[J][2])^2) for i ∈ J+1:n)
    line_inertia = sum(M[i]/3*((P[i][1]-P[J][1])^2+(P[i][1]-P[J][1])*(P[i+1][1]-P[J][1])+(P[i+1][1]-P[J][1])^2+(P[i][2]-P[J][2])^2+(P[i][2]-P[J][2])*(P[i+1][2]-P[J][2])+(P[i+1][2]-P[J][2])^2) for i ∈ J:n-1)
    inertia = point_inertia + line_inertia
    kenetic_energy = 1/2*inertia*θ′[J+1]^2
    total_kenetic_energy += kenetic_energy
end
point_inertia = sum(m[i]*P[i][1]^2 for i ∈ 1:n)
line_inertia = sum(M[i]/3*(P[i][1]^2+P[i][1]*P[i+1][1]+P[i+1][1]^2) for i ∈ 1:n-1)
inertia = point_inertia + line_inertia
kenetic_energy = 1/2*inertia*θ′[1]^2
total_kenetic_energy += kenetic_energy

lagrange = total_kenetic_energy - total_potential

Symbolics.solve_for([Symbolics.derivative(lagrange,θ[i])~Symbolics.derivative(Symbolics.derivative(lagrange,θ′[i]),t) for i ∈ 1:n],θ′′)