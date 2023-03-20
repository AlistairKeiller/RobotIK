using GLMakie

f = Figure()

sg = SliderGrid(f[2,1],
    (label = "L1", range = 0:.1:2, startvalue = 1.0),
    (label = "L2", range = 0:.1:2, startvalue = 1.0),
    (label = "x", range = 0:.1:2, startvalue = 1.0),
    (label = "y", range = 0:.1:2, startvalue = 1.0),
)

L1 = sg.sliders[1].value
L2 = sg.sliders[2].value
x = sg.sliders[3].value
y = sg.sliders[4].value

θ2 = @lift(-acos((($x)^2+($y)^2-($L1)^2-($L2)^2)/(2*$L1*$L2)))
θ1 = @lift(atan($y,$x)-atan($L1*sin($θ2),$L1+$L2*cos($θ2)))

Axis(f[1,1], limits=(-4,4,-4,4), aspect = 1)

lines!(@lift([Point2(0,0),Point2($L1*cos($θ1), $L1*sin($θ1)),Point2($L1*cos($θ1)+$L2*cos($θ1+$θ2), $L1*sin($θ1)+$L2*sin($θ1+$θ2))]))

scatter!(@lift([($x,$y)]))