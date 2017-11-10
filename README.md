# yac
Yet Another Compiler

## Subset of C language
- if
- else
- while
- Arithmetic operators(\+, \-, \*, \/, %)
- Logical operators(&&, ||)
- Assignment operator(=)
- Relational Operators(<, >, <=, >=, ==)
- Function defenitions
- 
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

