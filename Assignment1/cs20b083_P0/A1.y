%{
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <stdlib.h>

int yylex (void);
void yyerror (const char *);

char indent[1000]="";
int store=0;

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

cList arg_list = {
	.head = NULL,
	.tail = NULL,
	.size = 0
};

void empty_list(cList *clist)
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

cList *addNode(cList *clist, const cNode *cnode)
{
	cNode *tmp = malloc(sizeof(cNode));
	tmp->data = cnode->data;
	tmp->next = NULL;

	if(clist==NULL)
	{
		cList *nlist = malloc(sizeof(cList));
		nlist->head = tmp;
		nlist->tail = tmp;
		nlist->size = 1;
		return nlist;
	}

	if(clist->head == NULL) 
	{
		clist->head = tmp;
		clist->tail = tmp;
		clist->size=1;
		return clist;
	}

	clist->tail->next = tmp;
	clist->tail = tmp;
	clist->size++;
	return clist;
}

void concatList(cList *l1, cList *l2)
{
	if(l2==NULL) return;
	l1->tail->next = l2->head;
	l1->tail = l2->tail;
	l1->size += l2->size;
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
			char buf[100]="";
			sprintf(buf, "-%d", i);
			node->id = strdup(buf);

			cList *list = NULL;
			cNode *cnode = malloc(sizeof(cNode));
			cnode->data = node;
			list = addNode(list, cnode);

			cNode *tmp = malloc(sizeof(cNode));
			tmp->data = list;
			arglist = addNode(arglist, tmp);
		}
		return arglist;
	}

	cList *clist = NULL;
	for(int i=1; i<=len; i++)
	{
		Node *node = malloc(sizeof(node));
		char buf[100];
		sprintf(buf, "-%d", i);
		node->id = strdup(buf);

		cNode *cnode = malloc(sizeof(cNode));
		cnode->data = node;
		cnode->next = NULL;
		clist = addNode(clist, cnode);
	}
	return clist;
}

void renameOneArg(void *arg, void *repl_arg, cList/*node*/ *replace)
{
	if(replace==NULL) return;

	Node *node = (Node *)arg;
	cList *list = (cList *)repl_arg;

	cNode *tmp = replace->head;
	cNode *prev = NULL;
	while(tmp != NULL) 
	{
		Node *n = (Node *)tmp->data;
		if(strcmp(n->id, node->id) == 0) 
		{
			cNode *tmp2 = tmp->next;
			cList *cpy = copyList(list);

			if(prev==NULL) replace->head=cpy->head;
			else prev->next = cpy->head;
			cpy->tail->next = tmp2;
		}
		prev = tmp;
		tmp = tmp->next;
	}
}

void replace_args(cList/*node*/ *args, cList/*cList->node*/ *repl_args, cList/*node*/ *replace)
{
	if(repl_args==NULL) return;

	cNode *repl_node = repl_args->head;
	cNode *node = args->head;
	while(repl_node != NULL)
	{
		renameOneArg(node->data, repl_node->data, replace);
		repl_node = repl_node->next;
		node = node->next;
	}
}

void add_macro(cList/*mac_node*/ *list, cNode/*mac_node*/ *cnode, cList/*node*/ *replace) 
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

cList *replace_macro(cList/*mac_node*/ *list, cNode/*Node*/ *cnode, cList/*clist->node*/ *arglist) 
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
	return NULL;
}

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
%type <list> And Or Not Noteq Lesseq Equal Add Sub Mul Div Dot CallArgs CallArgsEnd
%type <list> Lparen Rparen Lbrace Rbrace Lbracket Rbracket Semicolon Comma Integer
%type <list> StatementStar Statement  IndentIdef SpaceIdef IndentSpaceIdef Expression PrmExp Idef Type TypeDec VarDec MacExpIdef MacStmtIdef   
%type <list> ExpArgs ExpArgsEnd

%type MacDefStar MainClass TypeDecStar VarDecStar MacDef MacDefExp MacDefStmt ArgIdefStar ArgIdef MethArgs MethArgsEnd MethDec MethDecStar

%%
Goal: MacDefStar MainClass TypeDecStar;
MacDefStar: %empty
		| MacDef MacDefStar;
MacDef: MacDefExp
		| MacDefStmt;
MacDefExp: DEFEXP MacExpIdef Lparen ArgIdef Comma ArgIdef Comma ArgIdef ArgIdefStar Rparen Lparen Expression Rparen
			{
				store--;
				concatList($11,$12);
				concatList($11,$13);
				add_macro(&mac_exp_list, $2->head, $11);
				empty_list(&arg_list);
			}
			| DEFEXP0 MacExpIdef Lparen Rparen Lparen Expression Rparen
			{
				store--;
				concatList($5,$6);
				concatList($5,$7);
				add_macro(&mac_exp_list, $2->head, $5);
				empty_list(&arg_list);
			}
			| DEFEXP1 MacExpIdef Lparen ArgIdef Rparen Lparen Expression Rparen
			{
				store--;
				concatList($6,$7);
				concatList($6,$8);
				add_macro(&mac_exp_list, $2->head, $6);
				empty_list(&arg_list);
			}
			| DEFEXP2 MacExpIdef Lparen ArgIdef Comma ArgIdef Rparen Lparen Expression Rparen
			{
				store--;
				concatList($8,$9);
				concatList($8,$10);
				add_macro(&mac_exp_list, $2->head, $8);
				empty_list(&arg_list);
			};
MacDefStmt: DEFSTMT MacStmtIdef Lparen ArgIdef Comma ArgIdef Comma ArgIdef ArgIdefStar Rparen Lbrace StatementStar Rbrace
			{
				store--;
				add_macro(&mac_stmt_list, $2->head, $12);
				empty_list(&arg_list);
			}
			| DEFSTMT0 MacStmtIdef Lparen Rparen Lbrace StatementStar Rbrace
			{
				store--;
				add_macro(&mac_stmt_list, $2->head, $6);
				empty_list(&arg_list);
			}
			| DEFSTMT1 MacStmtIdef Lparen ArgIdef Rparen Lbrace StatementStar Rbrace
			{
				store--;
				add_macro(&mac_stmt_list, $2->head, $7);
				empty_list(&arg_list);
			}
			| DEFSTMT2 MacStmtIdef Lparen ArgIdef Comma ArgIdef Rparen Lbrace StatementStar Rbrace
			{
				store--;
				add_macro(&mac_stmt_list, $2->head, $9);
				empty_list(&arg_list);
			};
StatementStar: %empty { if(store)$$ = NULL; }
			| Statement StatementStar { if(store) { $$ = $1; concatList($$, $2); } };
ArgIdefStar: %empty  
			| Comma ArgIdef ArgIdefStar;
Statement: Lbrace StatementStar Rbrace
			{
				if(store)
				{
					$$ = $1;
					concatList($$, $2);
					concatList($$, $3);
				}
			}
			| Println Lparen Expression Rparen Semicolon
			{
				if(store)
				{
					$$ = $1;
					concatList($$, $2);
					concatList($$, $3);
					concatList($$, $4);
					concatList($$, $5);
				}
			}
			| IndentSpaceIdef Equal Expression Semicolon
			{
				if(store)
				{
					$$ = $1;
					concatList($$, $2);
					concatList($$, $3);
					concatList($$, $4);
				}
			}
			| IndentIdef Lbracket Expression Rbracket Equal Expression Semicolon
			{
				if(store)
				{
					$$ = $1;
					concatList($$, $2);
					concatList($$, $3);
					concatList($$, $4);
					concatList($$, $5);
					concatList($$, $6);
					concatList($$, $7);
				}
			}
			| If Lparen Expression Rparen Statement
			{
				if(store)
				{
					$$ = $1;
					concatList($$, $2);
					concatList($$, $3);
					concatList($$, $4);
					concatList($$, $5);
				}
			}
			| If Lparen Expression Rparen Statement Else Statement
			{
				if(store)
				{
					$$ = $1;
					concatList($$, $2);
					concatList($$, $3);
					concatList($$, $4);
					concatList($$, $5);
					concatList($$, $6);
					concatList($$, $7);
				}
			}
			| While Lparen Expression Rparen Statement
			{
				if(store)
				{
					$$ = $1;
					concatList($$, $2);
					concatList($$, $3);
					concatList($$, $4);
					concatList($$, $5);
				}
			}
			| MacStmtIdef Lparen  ExpArgs Rparen Semicolon  /* Macro stmt call */
			{
				$$ = replace_macro(&mac_stmt_list, $1->head, $3);
				if($$==NULL)
				{
					printf("\n\nError: Macro not found\n");
					exit(1);
				}
				store--;
				if(!store) printNodeList($$);
			};

MainClass: Class SpaceIdef Lbrace Public Static Void Main Lparen String Lbracket Rbracket Idef Rparen Lbrace Println Lparen Expression Rparen Semicolon Rbrace Rbrace;
Expression: PrmExp And PrmExp 
			{
				if(store)
				{
					$$ = $1;
					concatList($$, $2);
					concatList($$, $3);
				}
			}
			| PrmExp Or PrmExp 
			{
				if(store) {
				$$ = $1;
				concatList($$, $2);
				concatList($$, $3);}
			}
			| PrmExp Noteq PrmExp 
			{
				if(store) {
				$$ = $1;
				concatList($$, $2);
				concatList($$, $3);}
			}
			| PrmExp Lesseq PrmExp 
			{
				if(store) {
				$$ = $1;
				concatList($$, $2);
				concatList($$, $3);}
			}	
			| PrmExp Add PrmExp 
			{
				if(store) {
				$$ = $1;
				concatList($$, $2);
				concatList($$, $3);}
			}	
			| PrmExp Sub PrmExp
			{
				if(store) {
				$$ = $1;
				concatList($$, $2);
				concatList($$, $3);}
			}	
			| PrmExp Mul PrmExp
			{
				if(store) {
				$$ = $1;
				concatList($$, $2);
				concatList($$, $3);}
			}	
			| PrmExp Div PrmExp
			{
				if(store) {
				$$ = $1;
				concatList($$, $2);
				concatList($$, $3);}
			}	
			| PrmExp Lbracket PrmExp Rbracket
			{
				if(store) {
				$$ = $1;
				concatList($$, $2);
				concatList($$, $3);
				concatList($$, $4);}
			}
			| PrmExp Dot Length
			{
				if(store) {
				$$ = $1;
				concatList($$, $2);
				concatList($$, $3);}
			}
			| PrmExp
			{
				if(store) {
				$$ = $1;}
			}
			| PrmExp Dot  Idef  Lparen  CallArgs Rparen
			{
				if(store) {
				$$ = $1;
				concatList($$, $2);
				concatList($$, $3);
				concatList($$, $4);
				concatList($$, $5);
				concatList($$, $6);}
			}
			| MacExpIdef Lparen  ExpArgs Rparen /* Macro expr call */
			{
				$$ = replace_macro(&mac_exp_list, $1->head, $3);
				if($$==NULL)
				{
					printf("\n\nError: Macro not found\n");
					exit(1);
				}
				store--;
				if(!store) printNodeList($$);
			}; 
PrmExp: Integer {if(store)  $$ = $1;}
			| True {if(store)  $$ = $1;}
			| False	{if(store)  $$ = $1;}
			| Idef	{if(store)  $$ = $1;}
			| This	{if(store)  $$ = $1;}
			| Not Expression
			{
				if(store) 
				{
				$$ = $1;
				concatList($$, $2);
				}
			}
			| New Int Lbracket Expression Rbracket
			{
				if(store) {
				$$ = $1;
				concatList($$, $2);
				concatList($$, $3);
				concatList($$, $4);
				concatList($$, $5);}
			}
			| New Idef Lparen Rparen
			{
				if(store) {
				$$ = $1;
				concatList($$, $2);
				concatList($$, $3);
				concatList($$, $4);}
			}
			| Lparen Expression Rparen
			{
				if(store) {
				$$ = $1;
				concatList($$, $2);
				concatList($$, $3);}
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
				$$ = newList(temp);
				concatList($$, $3);
			};
CallArgs: %empty { if(store) $$ = NULL; }
			| CallArgsEnd { if(store) $$ = $1; };
CallArgsEnd: Expression { if(store) {$$ = $1;} }
			| Expression Comma CallArgsEnd
			{
				if(store)
				{
					$$ = $1;
					concatList($$, $2);
					concatList($$, $3);
				}
			};

TypeDecStar: %empty
			| TypeDec TypeDecStar;
TypeDec: Class Idef Lbrace VarDecStar MethDecStar Rbrace
			| Class SpaceIdef Extends Idef Lbrace VarDecStar MethDecStar Rbrace;
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
			| IndentSpaceIdef;

Class: CLASS  		{if(store) $$=newList($1);
						else printf("%sclass ", indent); };
Public: PUBLIC 		{if(store) $$=newList($1);
						else printf("%spublic ", indent);};
Static: STATIC 		{if(store) $$=newList($1);
						else printf("static ");};
Void: VOID 			{if(store) $$=newList($1);
						else printf("void ");};
Main: MAIN 			{if(store) $$=newList($1);
						else printf("main ");};
String: STRING 		{if(store) $$=newList($1);
						else printf("String ");};
Println: PRINTLN 	{if(store) $$=newList($1);
						else printf("%sSystem.out.println", indent);};
Extends: EXTENDS 	{if(store) $$=newList($1);
						else printf("extends ");};
Return: RETURN 		{if(store) $$=newList($1);
						else printf("%sreturn ", indent);};
Int: INT 			{if(store) $$=newList($1);
						else printf("%sint ", indent);};
Boolean: BOOLEAN 	{if(store) $$=newList($1);
						else printf("%sboolean ", indent);};
If: IF 				{if(store) $$=newList($1);
						else printf("\n%sif ", indent);};
Else : ELSE 		{if(store) $$=newList($1);
						else printf("%selse ", indent);};
While: WHILE 		{if(store) $$=newList($1);
						else printf("%swhile ", indent);};
True: TRUE 			{if(store) $$=newList($1);
						else printf("true ");};
False: FALSE 		{if(store) $$=newList($1);
						else printf("false ");};
This: THIS 			{if(store) $$=newList($1);
						else printf("this");};
New: NEW 			{if(store) $$=newList($1);
						else printf("new ");};
Length: LENGTH 		{if(store) $$=newList($1);
						else printf("length");};
Lparen: LPAREN 		{if(store) $$=newList($1);
						else printf("(");};
Rparen: RPAREN 		{if(store) $$=newList($1);
						else printf(")");};
Lbrace: LBRACE 		{if(store) $$=newList($1);
						else {printf("\n%s{\n", indent); strcat(indent,"\t");}};
Rbrace: RBRACE 		{if(store) $$=newList($1);
						else {indent[strlen(indent)-1]='\0'; printf("\n%s}\n", indent);}};
Lbracket: LBRACKET 	{if(store) $$=newList($1);
						else printf("[");};
Rbracket: RBRACKET 	{if(store) $$=newList($1);
						else printf("] ");};
Semicolon: SEMICOLON {if(store) $$=newList($1);
						else printf(";\n");};
Comma: COMMA 		{if(store) $$=newList($1);
						else printf(",");};
And: AND 			{if(store) $$=newList($1);
						else printf("&& ");};
Or: OR 				{if(store) $$=newList($1);
						else printf("|| ");};
Not: NOT 			{if(store) $$=newList($1);
						else printf("!");};
Noteq: NOTEQ 		{if(store) $$=newList($1);
						else printf("!=");};
Lesseq: LESSEQ 		{if(store) $$=newList($1);
						else printf("<=");};
Equal: EQUAL 		{if(store) $$=newList($1);
						else printf("=");};
Add: ADD 			{if(store) $$=newList($1);
						else printf("+");};
Sub: SUB 			{if(store) $$=newList($1);
						else printf("-");};
Mul: MUL 			{if(store) $$=newList($1);
						else printf("*");};
Div: DIV 			{if(store) $$=newList($1);
						else printf("/");};
Dot: DOT 			{if(store) $$=newList($1);
						else printf(".");};
SpaceIdef: ID 		{if(store) $$=newList($1);
						else 
						{
							Node *n = (Node *)$1->data;
							printf("%s ", n->id);
						}};
Idef: ID 			{if(store) 
						{
							$$=newList($1);
						}
						else 
						{
							Node *n = (Node *)$1->data;
							printf("%s", n->id);
						}};
IndentIdef: ID 		{if(store) $$=newList($1);
						else 
						{
							Node *n = (Node *)$1->data;
							printf("%s%s", indent, n->id);
						}};
IndentSpaceIdef: ID {if(store) $$=newList($1);
						else 
						{
							Node *n = (Node *)$1->data;
							printf("%s%s ", indent, n->id);
						}};
ArgIdef: ID 		{ addNode(&arg_list, $1); };
MacExpIdef: ID 		{
						store++;
						$$ = newList($1);
					};
MacStmtIdef: ID 	{
						store++;
						$$ = newList($1);
					};
Integer: INTEGER 	{if(store) $$=newList($1);
					else 
					{
						Node *n = (Node *)$1->data;
						printf("%s ", n->id);
					}};
%%

void yyerror (const char *s) {
printf ("//Failed to parse input code\n");
}

int main () 
{
	yyparse ();
	return 0;
}

#include "lex.yy.c"