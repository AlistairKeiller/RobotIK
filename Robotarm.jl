using GLMakie

f = Figure()

sg = SliderGrid(f[2,1],
    (label = "L1", range = 0:.1:2, startvalue = 1.0),
    (label = "L2", range = 0:.1:2, startvalue = 1.0),
    (label = "L3", range = 0:.1:2, startvalue = 1.0),
    (label = "L4", range = 0:.1:2, startvalue = 1.0),
    (label = "θ1", range = 0:.1:2π, startvalue = 0.0),
    (label = "θ2", range = 0:.1:2π, startvalue = 0.0),
    (label = "θ3", range = 0:.1:2π, startvalue = 0.0),
    (label = "θ4", range = 0:.1:2π, startvalue = π/2),
)

L1 = sg.sliders[1].value
L2 = sg.sliders[2].value
L3 = sg.sliders[3].value
L4 = sg.sliders[4].value
θ1 = sg.sliders[5].value
θ2 = sg.sliders[6].value
θ3 = sg.sliders[7].value
θ4 = sg.sliders[8].value

J2 = @lift(Point2(0,$L1))
J3 = @lift($J2 + Point2($L2*sin($θ2), $L2*cos($θ2)))
J4 = @lift($J3 + Point2($L3*sin($θ2+$θ3), $L3*cos($θ2+$θ3)))
J5 = @lift($J4 + Point2($L4*sin($θ2+$θ3+$θ4),$L4*cos($θ2+$θ3+$θ4)))

to3(p) = @lift(Point3($p[1]*sin($θ1), $p[1]*cos($θ1), $p[2]))

Axis3(f[1,1], limits=(-4,4,-4,4,-4,4))

lines!(@lift([Point3(0,0,0),$(to3(J2)),$(to3(J3)),$(to3(J4)),$(to3(J5))]))
