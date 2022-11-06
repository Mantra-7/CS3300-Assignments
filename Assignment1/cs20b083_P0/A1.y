%{
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdarg.h>

#define processTerminal(nt, terminal); if(store) nt=newList(terminal);\
						else code = concatList(2, code, newList(terminal));

#define processMacroExp(name, lp, exp, rp); store--;\
						addMacro(&mac_exp_list, name->head, concatList(3, lp, exp, rp));\
						clearList(&arg_list);

#define processMacroStmt(name, stmt); store--;\
						addMacro(&mac_stmt_list, name->head, stmt);\
						clearList(&arg_list);

typedef struct cNode {
	void *data;
	struct cNode *next;
} cNode;

typedef struct cList {
	cNode *head;
	cNode *tail;
	int size;
} cList;

typedef struct Node{
	char *id;
	struct Node *next;
} Node;

typedef struct argNode{
	cList *argVal;
	struct argNode *next;
} argNode;

typedef struct mac_node {
	char *name;
	cList *replace;
	int argc;
	struct mac_node *next;
} mac_node;

int yylex (void);
void yyerror (const char *);

int store=0;
cList *code = NULL;

cList arg_list = {
	.head = NULL,
	.tail = NULL,
	.size = 0
};

cList mac_stmt_list = {
	.head = NULL,
	.tail = NULL,
	.size = 0
};

cList mac_exp_list = {
	.head = NULL,
	.tail = NULL,
	.size = 0
};

cList *newList(cNode *cnode);
void clearList(cList *clist);
cList *addNode(cList *clist, cNode *cnode);
void printNodeList(cList/*Node*/ *clist);
cList *concatList(int num, ...);
void addMacro(cList/*mac_node*/ *list, cNode/*Node*/ *cnode, cList/*Node*/ *replace);
cList *replaceMacro(cList/*mac_node*/ *list, cNode/*Node*/ *cnode, cList/*clist->node*/ *arglist);

%}

%union {
cNode *node;
cList *list;
}

%token <node> CLASS PUBLIC STATIC VOID MAIN STRING PRINTLN EXTENDS RETURN INT BOOLEAN IF ELSE WHILE TRUE FALSE THIS NEW LENGTH
%token <node> DEFSTMT DEFSTMT0 DEFSTMT1 DEFSTMT2 DEFEXP DEFEXP0 DEFEXP1 DEFEXP2
%token <node> AND OR NOT NOTEQ LESSEQ EQUAL ADD SUB MUL DIV DOT
%token <node> LPAREN RPAREN LBRACE RBRACE LBRACKET RBRACKET SEMICOLON COMMA INTEGER ID

%type <list> Class Public Static Void Main String Println Extends Return Int Boolean If Else While True False This New Length
%type <list> And Or Not Noteq Lesseq Equal Add Sub Mul Div Dot 
%type <list> Lparen Rparen Lbrace Rbrace Lbracket Rbracket Semicolon Comma Integer Idef
%type <list> StatementStar Statement Expression PrmExp Type TypeDec VarDec MacIdef
%type <list> ExpArgs ExpArgsEnd CallArgs CallArgsEnd

%type MacDefStar MainClass TypeDecStar VarDecStar MacDef MacDefExp MacDefStmt ArgIdefStar ArgIdef MethArgs MethArgsEnd MethDec MethDecStar

%%
Goal: MacDefStar MainClass TypeDecStar {printNodeList(code);};

MainClass: Class Idef Lbrace Public Static Void Main Lparen String Lbracket Rbracket Idef Rparen Lbrace Println Lparen Expression Rparen Semicolon Rbrace Rbrace;

MacDefStar: %empty
		| MacDef MacDefStar;

MacDef: MacDefExp
		| MacDefStmt;

MacDefStmt: DEFSTMT MacIdef Lparen ArgIdef Comma ArgIdef Comma ArgIdef ArgIdefStar Rparen Lbrace StatementStar Rbrace
			{
				processMacroStmt($2, $12);
			}
			| DEFSTMT0 MacIdef Lparen Rparen Lbrace StatementStar Rbrace
			{
				processMacroStmt($2, $6);
			}
			| DEFSTMT1 MacIdef Lparen ArgIdef Rparen Lbrace StatementStar Rbrace
			{
				processMacroStmt($2, $7);
			}
			| DEFSTMT2 MacIdef Lparen ArgIdef Comma ArgIdef Rparen Lbrace StatementStar Rbrace
			{
				processMacroStmt($2, $9);
			};

MacDefExp: DEFEXP MacIdef Lparen ArgIdef Comma ArgIdef Comma ArgIdef ArgIdefStar Rparen Lparen Expression Rparen
			{
				processMacroExp($2, $11, $12, $13);
			}
			| DEFEXP0 MacIdef Lparen Rparen Lparen Expression Rparen
			{
				processMacroExp($2, $5, $6, $7);
			}
			| DEFEXP1 MacIdef Lparen ArgIdef Rparen Lparen Expression Rparen
			{
				processMacroExp($2, $6, $7, $8);
			}
			| DEFEXP2 MacIdef Lparen ArgIdef Comma ArgIdef Rparen Lparen Expression Rparen
			{
				processMacroExp($2, $8, $9, $10);
			};

MacIdef: ID { store++; $$ = newList($1); };

ArgIdefStar: %empty 
			| Comma ArgIdef ArgIdefStar;

ArgIdef: ID { addNode(&arg_list, $1); };

StatementStar: %empty { if(store) $$ = NULL; }
			| Statement StatementStar { if(store) $$ = concatList(2, $1, $2); };

Statement: Lbrace StatementStar Rbrace
			{
				if(store) $$ = concatList(3, $1, $2, $3);
			}
			| Println Lparen Expression Rparen Semicolon
			{
				if(store) $$ = concatList(5, $1, $2, $3, $4, $5);
			}
			| Idef Equal Expression Semicolon
			{
				if(store) $$ = concatList(4, $1, $2, $3, $4);
			}
			| Idef Lbracket Expression Rbracket Equal Expression Semicolon
			{
				if(store) $$ = concatList(7, $1, $2, $3, $4, $5, $6, $7);
			}
			| If Lparen Expression Rparen Statement
			{
				if(store) $$ = concatList(5, $1, $2, $3, $4, $5);
			}
			| If Lparen Expression Rparen Statement Else Statement
			{
				if(store) $$ = concatList(7, $1, $2, $3, $4, $5, $6, $7);
			}
			| While Lparen Expression Rparen Statement
			{
				if(store) $$ = concatList(5, $1, $2, $3, $4, $5);
			}
			| MacIdef Lparen ExpArgs Rparen Semicolon /* Macro stmt call */
			{
				$$ = replaceMacro(&mac_stmt_list, $1->head, $3);
				store--;
				if(!store) code = concatList(2, code, $$);
			};

Expression: PrmExp And PrmExp 
			{
				if(store) $$ = concatList(3, $1, $2, $3);
			}
			| PrmExp Or PrmExp 
			{
				if(store) $$ = concatList(3, $1, $2, $3);
			}
			| PrmExp Noteq PrmExp 
			{
				if(store) $$ = concatList(3, $1, $2, $3);
			}
			| PrmExp Lesseq PrmExp 
			{
				if(store) $$ = concatList(3, $1, $2, $3);
			}	
			| PrmExp Add PrmExp 
			{
				if(store) $$ = concatList(3, $1, $2, $3);
			}	
			| PrmExp Sub PrmExp
			{
				if(store) $$ = concatList(3, $1, $2, $3);
			}	
			| PrmExp Mul PrmExp
			{
				if(store) $$ = concatList(3, $1, $2, $3);
			}	
			| PrmExp Div PrmExp
			{
				if(store) $$ = concatList(3, $1, $2, $3);
			}	
			| PrmExp Lbracket PrmExp Rbracket
			{
				if(store) $$ = concatList(4, $1, $2, $3, $4);
			}
			| PrmExp Dot Length
			{
				if(store) $$ = concatList(3, $1, $2, $3);
			}
			| PrmExp
			{
				if(store) $$ = $1;
			}
			| PrmExp Dot Idef Lparen CallArgs Rparen
			{
				if(store) $$ = concatList(6, $1, $2, $3, $4, $5, $6);
			}
			| MacIdef Lparen ExpArgs Rparen /* Macro expr call */
			{
				$$ = replaceMacro(&mac_exp_list, $1->head, $3);
				store--;
				if(!store) code = concatList(2, code, $$);
			}; 

PrmExp: Integer {if(store) $$ = $1;}
		| True {if(store) $$ = $1;}
		| False	{if(store) $$ = $1;}
		| Idef	{if(store) $$ = $1;}
		| This	{if(store) $$ = $1;}
		| Not Expression
		{
			if(store) $$ = concatList(2, $1, $2);
		}
		| New Int Lbracket Expression Rbracket
		{
			if(store) $$ = concatList(5, $1, $2, $3, $4, $5);
		}
		| New Idef Lparen Rparen
		{
			if(store) $$ = concatList(4, $1, $2, $3, $4);
		}
		| Lparen Expression Rparen
		{
			if(store) $$ = concatList(3, $1, $2, $3);
		};

ExpArgs: %empty { $$ = NULL; }
			| ExpArgsEnd { $$ = $1; };

ExpArgsEnd: Expression
			{
				cNode *temp = malloc(sizeof(cNode));
				temp->data = $1;
				$$ = newList(temp);
			}
			| Expression COMMA ExpArgsEnd
			{
				cNode *temp = malloc(sizeof(cNode));
				temp->data = $1;
				$$ = concatList(2, newList(temp), $3);
			};

CallArgs: %empty { if(store) $$ = NULL; }
			| CallArgsEnd { if(store) $$ = $1; };

CallArgsEnd: Expression { if(store) $$ = $1; }
			| Expression Comma CallArgsEnd
			{
				if(store) $$ = concatList(3, $1, $2, $3);
			};

TypeDecStar: %empty
			| TypeDec TypeDecStar;
TypeDec: Class Idef Lbrace VarDecStar MethDecStar Rbrace
			| Class Idef Extends Idef Lbrace VarDecStar MethDecStar Rbrace;
VarDecStar: %empty
			| VarDecStar VarDec;
VarDec: Type Idef Semicolon;
MethDecStar: %empty
			| MethDec MethDecStar;
MethDec: Public Type Idef Lparen MethArgs Rparen Lbrace VarDecStar StatementStar Return Expression Semicolon Rbrace;
MethArgs: %empty
			| Type Idef MethArgsEnd;
MethArgsEnd: %empty
			| Comma Type Idef MethArgsEnd;
Type: Int Lbracket Rbracket 
			| Boolean 
			| Int 
			| Idef;

Class: CLASS 		{processTerminal($$, $1);};
Public: PUBLIC 		{processTerminal($$, $1);};
Static: STATIC 		{processTerminal($$, $1);};
Void: VOID 			{processTerminal($$, $1);};
Main: MAIN 			{processTerminal($$, $1);};
String: STRING 		{processTerminal($$, $1);};
Println: PRINTLN 	{processTerminal($$, $1);};
Extends: EXTENDS 	{processTerminal($$, $1);};
Return: RETURN 		{processTerminal($$, $1);};
Int: INT 			{processTerminal($$, $1);};
Boolean: BOOLEAN 	{processTerminal($$, $1);};
If: IF 				{processTerminal($$, $1);};
Else : ELSE 		{processTerminal($$, $1);};
While: WHILE 		{processTerminal($$, $1);};
True: TRUE 			{processTerminal($$, $1);};
False: FALSE 		{processTerminal($$, $1);};
This: THIS 			{processTerminal($$, $1);};
New: NEW 			{processTerminal($$, $1);};
Length: LENGTH 		{processTerminal($$, $1);};
Lparen: LPAREN 		{processTerminal($$, $1);};
Rparen: RPAREN 		{processTerminal($$, $1);};
Lbrace: LBRACE 		{processTerminal($$, $1);};
Rbrace: RBRACE 		{processTerminal($$, $1);};
Lbracket: LBRACKET 	{processTerminal($$, $1);};
Rbracket: RBRACKET 	{processTerminal($$, $1);};
Semicolon: SEMICOLON {processTerminal($$, $1);};
Comma: COMMA 		{processTerminal($$, $1);};
And: AND 			{processTerminal($$, $1);};
Or: OR 				{processTerminal($$, $1);};
Not: NOT 			{processTerminal($$, $1);};
Noteq: NOTEQ 		{processTerminal($$, $1);};
Lesseq: LESSEQ 		{processTerminal($$, $1);};
Equal: EQUAL 		{processTerminal($$, $1);};
Add: ADD 			{processTerminal($$, $1);};
Sub: SUB 			{processTerminal($$, $1);};
Mul: MUL 			{processTerminal($$, $1);};
Div: DIV 			{processTerminal($$, $1);};
Dot: DOT 			{processTerminal($$, $1);};
Idef: ID 			{processTerminal($$, $1);};
Integer: INTEGER 	{processTerminal($$, $1);};
%%

void yyerror (const char *s) 
{
	printf ("//Failed to parse input code");
	exit(1);
}

int main () 
{
	yyparse ();
	return 0;
}

#include "lex.yy.c"

void clearList(cList *clist)
{
	clist->head = NULL;
	clist->tail = NULL;
	clist->size = 0;
}

void printNodeList(cList *clist)
{
	if(clist==NULL) return;
	cNode *node = clist->head;
	while (node != NULL) 
	{
		Node *n = (Node *)node->data;
		printf("%s ", n->id);
		node = node->next;
	}
}

cList *newList(cNode *cnode)
{
	if(cnode==NULL) return NULL;
	
	cNode *tmp = (cNode *)malloc(sizeof(cNode));
	tmp->data = cnode->data;
	tmp->next = NULL;

	cList *clist = (cList *)malloc(sizeof(cList));
	clist->head = tmp;
	clist->tail = tmp;
	clist->size = 1;
	return clist;
}

cList *addNode(cList *clist, cNode *cnode)
{
	if(clist==NULL) return newList(cnode);

	cNode *tmp = malloc(sizeof(cNode));
	tmp->data = cnode->data;
	tmp->next = NULL;

	if(clist->head == NULL) 
	{
		clist->head = tmp;
		clist->tail = tmp;
		clist->size = 1;
		return clist;
	}

	clist->tail->next = tmp;
	clist->tail = tmp;
	clist->size++;
	return clist;
}

cList *concatList(int num, ...)
{
	va_list valist;
	va_start(valist, num);

	cList *clist = va_arg(valist, cList *);
	for (int i = 1; i < num; i++) 
	{
		cList *l2 = va_arg(valist, cList *);
		if(clist == NULL) clist = l2;
		else if(l2 != NULL)
		{
			clist->tail->next = l2->head;
			clist->tail = l2->tail;
			clist->size += l2->size;
		}
	}

	va_end(valist);
	return clist;
}

cList *copyList(cList *clist)
{
	if(clist==NULL) return NULL;

	cList *cpy = NULL;
	cNode *tmp = clist->head;
	while(tmp != NULL)
	{
		cpy = addNode(cpy, tmp);
		tmp = tmp->next;
	}
	return cpy;
}

void *createTempArgs(int len, bool inList)
{
	if(inList)
	{
		cList *arglist = NULL;
		for(int i=1; i<=len; i++)
		{
			Node *node = malloc(sizeof(node));
			char buf[10000]="";
			sprintf(buf, "-%d", i);
			node->id = strdup(buf);

			cList *list = NULL;
			cNode *tmp = malloc(sizeof(cNode));
			tmp->data = node;
			list = addNode(list, tmp);

			tmp->data = list;
			arglist = addNode(arglist, tmp);
		}
		return arglist;
	}

	cList *clist = NULL;
	for(int i=1; i<=len; i++)
	{
		Node *node = malloc(sizeof(node));
		char buf[10000];
		sprintf(buf, "-%d", i);
		node->id = strdup(buf);

		cNode *tmp = malloc(sizeof(cNode));
		tmp->data = node;
		tmp->next = NULL;
		clist = addNode(clist, tmp);
	}
	return clist;
}

void renameOneArg(Node *arg, cList *repl_arg, cList/*Node*/ *replace)
{
	if(replace==NULL) return;

	cNode *tmp = replace->head;
	cNode *prev = NULL;
	while(tmp != NULL) 
	{
		Node *n = (Node *)tmp->data;
		if(strcmp(n->id, arg->id) == 0) 
		{
			cNode *tmp2 = tmp->next;
			cList *cpy = copyList(repl_arg);

			if(prev==NULL) replace->head=cpy->head;
			else prev->next = cpy->head;
			cpy->tail->next = tmp2;
			prev = cpy->tail;
		}
		else prev = tmp;
		tmp = tmp->next;
	}
}

void replace_args(cList/*Node*/ *args, cList/*cList->Node*/ *repl_args, cList/*Node*/ *replace)
{
	if(repl_args==NULL) return;

	cNode *repl_node = repl_args->head;
	cNode *node = args->head;
	while(repl_node != NULL)
	{
		renameOneArg((Node *)node->data, (cList *)repl_node->data, replace);
		repl_node = repl_node->next;
		node = node->next;
	}
}

void addMacro(cList/*mac_node*/ *list, cNode/*Node*/ *cnode, cList/*Node*/ *replace) 
{
	replace_args(&arg_list, createTempArgs(arg_list.size, true), replace);
	
	mac_node *node = malloc(sizeof(mac_node));
	Node *n = (Node *)cnode->data;
	node->name = n->id;
	node->replace = replace;
	node->argc = arg_list.size;
	node->next = NULL;

	cNode *nnode = malloc(sizeof(cNode));
	nnode->data = node;
	list = addNode(list, nnode);
}

cList *replaceMacro(cList/*mac_node*/ *list, cNode/*Node*/ *cnode, cList/*clist->Node*/ *arglist) 
{
	cNode *node = list->head;
	Node *n = (Node *)cnode->data;
	
	while (node != NULL) 
	{	
		mac_node *mac = (mac_node *)node->data;
		int sz = 0;
		if(arglist) sz = arglist->size;

		if (mac->argc == sz && strcmp(mac->name, n->id) == 0) 
		{
			cList *upd = copyList(mac->replace);
			if(arglist!=NULL) replace_args(createTempArgs(arglist->size, false), arglist, upd);
			return upd;
		}
		node = node->next;
	}

	yyerror("");
	return NULL;
}