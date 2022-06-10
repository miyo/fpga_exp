set project_dir    "./prj"
set project_name   "prj"
set project_target "xc7a35ticsg324-1L"
set source_files { \
    ./sources/decoder0.vhd \
    ./sources/decoder1.vhd \
    ./sources/top.vhd \
}

set constraint_files { \
    ./sources/top.xdc
}

set simulation_files { \
}

create_project -force $project_name $project_dir -part $project_target
add_files -norecurse $source_files
add_files -fileset constrs_1 -norecurse $constraint_files

update_ip_catalog

import_ip -files ./ip/ila_0.xci

set_property top top [current_fileset]
set_property target_constrs_file ./sources/top.xdc [current_fileset -constrset]

update_compile_order -fileset sources_1

#add_files -fileset sim_1 -norecurse $simulation_files

update_compile_order -fileset sim_1

reset_project

set_property strategy Flow_PerfOptimized_high [get_runs synth_1]
set_property strategy Performance_ExplorePostRoutePhysOpt [get_runs impl_1]

launch_runs synth_1 -jobs 8
wait_on_run synth_1

launch_runs impl_1 -jobs 8
wait_on_run impl_1
open_run impl_1
report_utilization -file [file join $project_dir "project.rpt"]
report_timing -file [file join $project_dir "project.rpt"] -append
 
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
close_project

quit
