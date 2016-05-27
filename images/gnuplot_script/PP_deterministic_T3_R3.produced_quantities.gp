# Output parameters
# set terminal tikz
# set output 'images/PP_deterministic_T3_R3.produced_quantities.eps'

# Size of the graph
set size 1.25,.75

# Title and axis names
set title "Produced quantities of references over the periods"
set xlabel "Periods"
set ylabel "Produced quantities"

set xrange [-0.5:2.5000e+00]
set yrange [0:1.0020e+03]

set boxwidth 0.75 absolute
set style fill   solid 1.00 border lt -1
set key outside right top vertical Left reverse noenhanced autotitle columnhead nobox
set style histogram rowstacked title textcolor lt -1
set style data histograms
plot 'images/gnuplot_script/PP_deterministic_T3_R3.produced_quantities.dat' using 1 t "$ref_0$", '' using 2 t "$ref_1$", '' using 3 t "$ref_2$", ''  using 4 t "available"
