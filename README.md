# yac
Yet Another Compiler  
A compiler from C Subset to Javascript

## Subset of C language
- Control statements (if, else, break, continue)
- Loop (while)
- Variables 
- Arithmetic operators(\+, \-, \*, \/, %)
- Logical operators(&&, ||)
- Assignment operator(=)
- Relational Operators(<, >, <=, >=, ==)
- Function defenitions
- Types(Int, Float, Char) 

## File Descriptions

### ast.sml
Contains the datatypes to encode the abstract syntax tree.

### myC.mlb
ML Basis file that contain all the source files of the project.

### mycom.grm
Describes the grammar of the language.

### mycom.lex
Rules for token matching.

### parsetest.sml
Driver program. Join lex and yacc files. Initiates parsing.

### translate.sml
Converts the ast to javascript code.

