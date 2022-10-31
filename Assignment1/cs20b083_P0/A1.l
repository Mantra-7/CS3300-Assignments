%{

#define setVal yylval.node = (cNode *)malloc(sizeof(cNode)); Node *n = malloc(sizeof(Node *));  n->id=strdup(yytext); yylval.node->data = n;
%}

DIGIT [0-9]
INTEGER {DIGIT}+
IDENTIFIER [a-zA-Z_][a-zA-Z0-9_]*


%%
[ \t\n\r] { }
"//".*$ {}
"class" 	{ setVal return CLASS;}
"public" 	{ setVal return PUBLIC;}
"static" 	{ setVal return STATIC;}
"void" 		{ setVal return VOID;}
"main" 		{ setVal return MAIN;}
"String" 	{ setVal return STRING;}	
"System.out.println" 	{ setVal return PRINTLN;}
"extends" 	{ setVal return EXTENDS;}
"return" 	{ setVal return RETURN;}
"int" 		{ setVal return INT;}
"boolean" 	{ setVal return BOOLEAN;}
"if" 		{ setVal return IF;}
"else" 		{ setVal return ELSE;}
"while" 	{ setVal return WHILE;}
"true" 		{ setVal return TRUE;}
"false" 	{ setVal return FALSE;}
"this" 		{ setVal return THIS;}
"new" 		{ setVal return NEW;}
"length" 	{ setVal return LENGTH;}
"#defineStmt" 	{ setVal return DEFSTMT;}
"#defineStmt0" 	{ setVal return DEFSTMT0;}
"#defineStmt1" 	{ setVal return DEFSTMT1;}
"#defineStmt2" 	{ setVal return DEFSTMT2;}
"#defineExpr" 	{ setVal return DEFEXP;}
"#defineExpr0" 	{ setVal return DEFEXP0;}
"#defineExpr1" 	{ setVal return DEFEXP1;}
"#defineExpr2" 	{ setVal return DEFEXP2;}
"&&" 		{ setVal return AND;}
"||"		{ setVal return OR;}
"!=" 		{ setVal return NOTEQ;}
"<=" 		{ setVal return LESSEQ;}
"=" 		{ setVal return EQUAL;}
"+"			{ setVal return ADD;}
"-" 		{ setVal return SUB;}
"*" 		{ setVal return MUL;}
"/" 		{ setVal return DIV;}
"." 		{ setVal return DOT;}
"("			{ setVal return LPAREN;}
")" 		{ setVal return RPAREN;}
"{" 		{ setVal return LBRACE;}
"}" 		{ setVal return RBRACE;}
"["			{ setVal return LBRACKET;}
"]" 		{ setVal return RBRACKET;}
"," 		{ setVal return COMMA;}
";" 		{ setVal return SEMICOLON;}
"!" 		{ setVal return NOT;}
{INTEGER} {
	setVal
	return INTEGER;
}
{IDENTIFIER} {
	setVal
	return ID;
}
. { printf ("Lexer error: %d\n", yytext[0]); exit (1); }
