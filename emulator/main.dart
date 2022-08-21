import './Emulator.dart'; 

void main() {

  Emulator emu = new Emulator(); 
  emu.load_program('emulator/teste_program.krn');
  
  emu.exec(); 
}