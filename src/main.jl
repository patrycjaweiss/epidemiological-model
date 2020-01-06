#=
Final project for "Modelowanie Wieloagentowe" course

To install Blink use the code below.
using Pkg
Pkg.add("Blink")
using Blink
Blink.AtomShell.install()
=#
import Pkg;
using Pkg
Pkg.build("SpecialFunctions")
Pkg.add("DifferentialEquations")
println("After DifferentialEquations")
Pkg.add("Plots")
println("After ADD")
using DifferentialEquations
using Plots

println("A")
function sir_ode2(du,u,p,t)
    S,I,R = u
    b,g = p
    du[1] = -b*S*I
    du[2] = b*S*I-g*I
    du[3] = g*I
end
println("B")
parms = [0.1,0.05]
init = [0.99,0.01,0.0]
tspan = (0.0,200.0)
sir_prob2 = ODEProblem(sir_ode2,init,tspan,parms)
sir_sol = solve(sir_prob2,saveat = 0.1)
println("C")

plot_result = plot(sir_sol,xlabel="Time",ylabel="Number")
println("plot RESULR")
display(sir_sol)