import 'package:assembler/assembler.dart' as assembler;
import 'package:args/args.dart';

import 'dart:io';


class Assembler {

  String inputFile = ''; 
  String outputFile = './program.ksr';
  bool hex = false;

  Map lookupTable =  { 
    'LDV':'01',
    'LD': '00',
    'CMP': '10',
    'JUN': '11',
    'binaryOperations': {
      '+': '0000',
      '-': '0001'
    },
    'unaryOperators': {
      '-':'0011',
      '!': '1000', 
    }, 
    'constants': {
      
    }
  };

  Assembler(String inputFile, String outputFile, bool hex) {
    this.inputFile = inputFile; 
    this.outputFile = outputFile; 
    this.hex = hex;
  }


  String parseCommand(String command) {
      var instructionType = command.substring(0, 2); 
      var subInstruction = command.substring(3);

      switch(instructionType) {
        case 'CMP':
          var brokenExpression = subInstruction.split('=');
          print(brokenExpression);
          break;
        default:

          var tokens = subInstruction.split(',');


          print(tokens);

          break;
      }

      // LD or LDV or JMP instruction
      

      // CMP Command
      // 

    return ''; 

    }
 

  void generateCode() {

    var file = File(this.inputFile); 

    if (!file.existsSync()) {
      print('Invalid input file: file doesn\'t exists.');
      return; 
    }

    // Reads the file

    var sourceCode = file.readAsLinesSync();

    // go through each line
    for (int lineCounter = 0; lineCounter < sourceCode.length; lineCounter++) {

      this.parseCommand(sourceCode[lineCounter]);

    }
  }
}


// usage: assembler ./program.ksm -o program.ksr
// usage (with hex): assembler ./program.ksm -o program.ksr --hex
void main(List<String> arguments) {
  var exitCode = 0; 

  final argumentParser = ArgParser()
    ..addOption("output", abbr: "o",)
    ..addFlag('hex', abbr: 'h');
  

  if (arguments.length < 1) {
    exitCode = 1; 
    print('Wrong number of arguments'); 
    print('usage: assembler <file> -o <output>'); 
    return; 
  }
  
 

  // Parse Arguments
  try {

    ArgResults argResults = argumentParser.parse(arguments.sublist(1));

    final hex = argResults['hex'] as bool;
    final inputFilePath = arguments[0]; 
    final outFilePath = argResults['output'].runtimeType != Null ? argResults['output'] : './program.ksr';

    print(outFilePath);
    Assembler assembler = new Assembler(inputFilePath, outFilePath, hex);

    assembler.generateCode();


  } catch(err) {
    print(err);
  }
}
