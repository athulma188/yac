val out = (Translate.compile (Parse.parse()));
val _ = TextIO.output(TextIO.openOut "out.js",out);
