transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/QuartusProjects/nRisc {C:/altera/13.0sp1/QuartusProjects/nRisc/nrisc.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/QuartusProjects/nRisc {C:/altera/13.0sp1/QuartusProjects/nRisc/pc.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/QuartusProjects/nRisc {C:/altera/13.0sp1/QuartusProjects/nRisc/registradores.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/QuartusProjects/nRisc {C:/altera/13.0sp1/QuartusProjects/nRisc/extensor2para8.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/QuartusProjects/nRisc {C:/altera/13.0sp1/QuartusProjects/nRisc/extensor6para8.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/QuartusProjects/nRisc {C:/altera/13.0sp1/QuartusProjects/nRisc/muxzero.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/QuartusProjects/nRisc {C:/altera/13.0sp1/QuartusProjects/nRisc/controle.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/QuartusProjects/nRisc {C:/altera/13.0sp1/QuartusProjects/nRisc/mux.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/QuartusProjects/nRisc {C:/altera/13.0sp1/QuartusProjects/nRisc/ula.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/QuartusProjects/nRisc {C:/altera/13.0sp1/QuartusProjects/nRisc/somadorpc.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/QuartusProjects/nRisc {C:/altera/13.0sp1/QuartusProjects/nRisc/memdados.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/QuartusProjects/nRisc {C:/altera/13.0sp1/QuartusProjects/nRisc/meminst.v}

vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/QuartusProjects/nRisc {C:/altera/13.0sp1/QuartusProjects/nRisc/simula.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  simula

add wave *
view structure
view signals
run -all
