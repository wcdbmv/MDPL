masm /zi main.asm,,,;
masm /zi pubin.asm,,,;
masm /zi psbin.asm,,,;
masm /zi pudec.asm,,,;
masm /zi psdec.asm,,,;
masm /zi puhex.asm,,,;
masm /zi pshex.asm,,,;
link /co main.obj pubin.obj psbin.obj pudec.obj psdec.obj puhex.obj pshex.obj,APP.EXE,,;
