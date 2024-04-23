define init-pwndbg
set disassembly-flavor intel
set debuginfod enabled on
unset env LINES
unset env COLUMNS
source ~/Tools/pwndbg/gdbinit.py
#set show-compact-regs on
set context-clear-screen on
set show-flags on
end
python
import splitmind
(splitmind.Mind()
 .tell_splitter(show_titles=True)
  .tell_splitter(set_title="Main")
  .right(display="backtrace", size="28%")
  .above(of="backtrace", display="stack", size="70%")
  .above(of="backtrace", display="threads", size="35%")
  .above(of="main", display="disasm", size="70%", banner="top")
  .show("code", on="disasm", banner="top")
  .right(cmd='tty; tail -f /dev/null', size="45%", clearing=False)
  .tell_splitter(set_title='Input / Output')
  .above(display="legend", size="25")
  .show("regs", on="legend")
).build(nobanner=True)
end
set context-stack-lines 30
set context-code-lines 25
end

define init-gef
set disassembly-flavor intel
set debuginfod enabled on
unset env LINES
unset env COLUMNS
source /root/.gdbinit-gef.py
source /root/.d2d.py

end


