require './vivado_util.rb'

def main()
  dir="prj"
  name="xpm_cdc_handshake_test"
  
  vivado = Vivado.new(dir: dir, name: name, top: "top")
  #vivado.add_parameters({"general.maxThreads" => 1})
  
  vivado.set_target("xc7a35ticsg324-1L")

  vivado.add_sources(["sources/top.v"])

  vivado.add_constraints(["sources/top.xdc"])
  vivado.add_testbenchs([])
  vivado.add_ipcores([
                      "ipcores/clk_wiz_0.xci",
                     ])
  
  #vivado.add_verilog_define({"BOARD_ID" => board_id})
  
  vivado.generate_tcl("create_prj.tcl")
  #vivado.run()
  
  #config = Vivado.new(dir=dir, name=name, top="top", kind=Vivado.CONFIG)
  #config.set_chip("xc7a35t_0")
  #config.generate_tcl("config_board_#{key}.tcl")
  #config.run()
end

main()


