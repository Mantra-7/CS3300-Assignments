/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "A1.y"

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

#line 333 "A1.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif


/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    CLASS = 258,                   /* CLASS  */
    PUBLIC = 259,                  /* PUBLIC  */
    STATIC = 260,                  /* STATIC  */
    VOID = 261,                    /* VOID  */
    MAIN = 262,                    /* MAIN  */
    STRING = 263,                  /* STRING  */
    PRINTLN = 264,                 /* PRINTLN  */
    EXTENDS = 265,                 /* EXTENDS  */
    RETURN = 266,                  /* RETURN  */
    INT = 267,                     /* INT  */
    BOOLEAN = 268,                 /* BOOLEAN  */
    IF = 269,                      /* IF  */
    ELSE = 270,                    /* ELSE  */
    WHILE = 271,                   /* WHILE  */
    TRUE = 272,                    /* TRUE  */
    FALSE = 273,                   /* FALSE  */
    THIS = 274,                    /* THIS  */
    NEW = 275,                     /* NEW  */
    LENGTH = 276,                  /* LENGTH  */
    DEFSTMT = 277,                 /* DEFSTMT  */
    DEFSTMT0 = 278,                /* DEFSTMT0  */
    DEFSTMT1 = 279,                /* DEFSTMT1  */
    DEFSTMT2 = 280,                /* DEFSTMT2  */
    DEFEXP = 281,                  /* DEFEXP  */
    DEFEXP0 = 282,                 /* DEFEXP0  */
    DEFEXP1 = 283,                 /* DEFEXP1  */
    DEFEXP2 = 284,                 /* DEFEXP2  */
    AND = 285,                     /* AND  */
    OR = 286,                      /* OR  */
    NOT = 287,                     /* NOT  */
    NOTEQ = 288,                   /* NOTEQ  */
    LESSEQ = 289,                  /* LESSEQ  */
    EQUAL = 290,                   /* EQUAL  */
    ADD = 291,                     /* ADD  */
    SUB = 292,                     /* SUB  */
    MUL = 293,                     /* MUL  */
    DIV = 294,                     /* DIV  */
    DOT = 295,                     /* DOT  */
    LPAREN = 296,                  /* LPAREN  */
    RPAREN = 297,                  /* RPAREN  */
    LBRACE = 298,                  /* LBRACE  */
    RBRACE = 299,                  /* RBRACE  */
    LBRACKET = 300,                /* LBRACKET  */
    RBRACKET = 301,                /* RBRACKET  */
    SEMICOLON = 302,               /* SEMICOLON  */
    COMMA = 303,                   /* COMMA  */
    INTEGER = 304,                 /* INTEGER  */
    ID = 305                       /* ID  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 263 "A1.y"

cNode *node;
cList *list;

#line 435 "A1.tab.c"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);



/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_CLASS = 3,                      /* CLASS  */
  YYSYMBOL_PUBLIC = 4,                     /* PUBLIC  */
  YYSYMBOL_STATIC = 5,                     /* STATIC  */
  YYSYMBOL_VOID = 6,                       /* VOID  */
  YYSYMBOL_MAIN = 7,                       /* MAIN  */
  YYSYMBOL_STRING = 8,                     /* STRING  */
  YYSYMBOL_PRINTLN = 9,                    /* PRINTLN  */
  YYSYMBOL_EXTENDS = 10,                   /* EXTENDS  */
  YYSYMBOL_RETURN = 11,                    /* RETURN  */
  YYSYMBOL_INT = 12,                       /* INT  */
  YYSYMBOL_BOOLEAN = 13,                   /* BOOLEAN  */
  YYSYMBOL_IF = 14,                        /* IF  */
  YYSYMBOL_ELSE = 15,                      /* ELSE  */
  YYSYMBOL_WHILE = 16,                     /* WHILE  */
  YYSYMBOL_TRUE = 17,                      /* TRUE  */
  YYSYMBOL_FALSE = 18,                     /* FALSE  */
  YYSYMBOL_THIS = 19,                      /* THIS  */
  YYSYMBOL_NEW = 20,                       /* NEW  */
  YYSYMBOL_LENGTH = 21,                    /* LENGTH  */
  YYSYMBOL_DEFSTMT = 22,                   /* DEFSTMT  */
  YYSYMBOL_DEFSTMT0 = 23,                  /* DEFSTMT0  */
  YYSYMBOL_DEFSTMT1 = 24,                  /* DEFSTMT1  */
  YYSYMBOL_DEFSTMT2 = 25,                  /* DEFSTMT2  */
  YYSYMBOL_DEFEXP = 26,                    /* DEFEXP  */
  YYSYMBOL_DEFEXP0 = 27,                   /* DEFEXP0  */
  YYSYMBOL_DEFEXP1 = 28,                   /* DEFEXP1  */
  YYSYMBOL_DEFEXP2 = 29,                   /* DEFEXP2  */
  YYSYMBOL_AND = 30,                       /* AND  */
  YYSYMBOL_OR = 31,                        /* OR  */
  YYSYMBOL_NOT = 32,                       /* NOT  */
  YYSYMBOL_NOTEQ = 33,                     /* NOTEQ  */
  YYSYMBOL_LESSEQ = 34,                    /* LESSEQ  */
  YYSYMBOL_EQUAL = 35,                     /* EQUAL  */
  YYSYMBOL_ADD = 36,                       /* ADD  */
  YYSYMBOL_SUB = 37,                       /* SUB  */
  YYSYMBOL_MUL = 38,                       /* MUL  */
  YYSYMBOL_DIV = 39,                       /* DIV  */
  YYSYMBOL_DOT = 40,                       /* DOT  */
  YYSYMBOL_LPAREN = 41,                    /* LPAREN  */
  YYSYMBOL_RPAREN = 42,                    /* RPAREN  */
  YYSYMBOL_LBRACE = 43,                    /* LBRACE  */
  YYSYMBOL_RBRACE = 44,                    /* RBRACE  */
  YYSYMBOL_LBRACKET = 45,                  /* LBRACKET  */
  YYSYMBOL_RBRACKET = 46,                  /* RBRACKET  */
  YYSYMBOL_SEMICOLON = 47,                 /* SEMICOLON  */
  YYSYMBOL_COMMA = 48,                     /* COMMA  */
  YYSYMBOL_INTEGER = 49,                   /* INTEGER  */
  YYSYMBOL_ID = 50,                        /* ID  */
  YYSYMBOL_YYACCEPT = 51,                  /* $accept  */
  YYSYMBOL_Goal = 52,                      /* Goal  */
  YYSYMBOL_MacDefStar = 53,                /* MacDefStar  */
  YYSYMBOL_MacDef = 54,                    /* MacDef  */
  YYSYMBOL_MacDefExp = 55,                 /* MacDefExp  */
  YYSYMBOL_MacDefStmt = 56,                /* MacDefStmt  */
  YYSYMBOL_StatementStar = 57,             /* StatementStar  */
  YYSYMBOL_ArgIdefStar = 58,               /* ArgIdefStar  */
  YYSYMBOL_Statement = 59,                 /* Statement  */
  YYSYMBOL_MainClass = 60,                 /* MainClass  */
  YYSYMBOL_Expression = 61,                /* Expression  */
  YYSYMBOL_PrmExp = 62,                    /* PrmExp  */
  YYSYMBOL_ExpArgs = 63,                   /* ExpArgs  */
  YYSYMBOL_ExpArgsEnd = 64,                /* ExpArgsEnd  */
  YYSYMBOL_CallArgs = 65,                  /* CallArgs  */
  YYSYMBOL_CallArgsEnd = 66,               /* CallArgsEnd  */
  YYSYMBOL_TypeDecStar = 67,               /* TypeDecStar  */
  YYSYMBOL_TypeDec = 68,                   /* TypeDec  */
  YYSYMBOL_VarDecStar = 69,                /* VarDecStar  */
  YYSYMBOL_VarDec = 70,                    /* VarDec  */
  YYSYMBOL_MethDecStar = 71,               /* MethDecStar  */
  YYSYMBOL_MethDec = 72,                   /* MethDec  */
  YYSYMBOL_MethArgs = 73,                  /* MethArgs  */
  YYSYMBOL_MethArgsEnd = 74,               /* MethArgsEnd  */
  YYSYMBOL_Type = 75,                      /* Type  */
  YYSYMBOL_Class = 76,                     /* Class  */
  YYSYMBOL_Public = 77,                    /* Public  */
  YYSYMBOL_Static = 78,                    /* Static  */
  YYSYMBOL_Void = 79,                      /* Void  */
  YYSYMBOL_Main = 80,                      /* Main  */
  YYSYMBOL_String = 81,                    /* String  */
  YYSYMBOL_Println = 82,                   /* Println  */
  YYSYMBOL_Extends = 83,                   /* Extends  */
  YYSYMBOL_Return = 84,                    /* Return  */
  YYSYMBOL_Int = 85,                       /* Int  */
  YYSYMBOL_Boolean = 86,                   /* Boolean  */
  YYSYMBOL_If = 87,                        /* If  */
  YYSYMBOL_Else = 88,                      /* Else  */
  YYSYMBOL_While = 89,                     /* While  */
  YYSYMBOL_True = 90,                      /* True  */
  YYSYMBOL_False = 91,                     /* False  */
  YYSYMBOL_This = 92,                      /* This  */
  YYSYMBOL_New = 93,                       /* New  */
  YYSYMBOL_Length = 94,                    /* Length  */
  YYSYMBOL_Lparen = 95,                    /* Lparen  */
  YYSYMBOL_Rparen = 96,                    /* Rparen  */
  YYSYMBOL_Lbrace = 97,                    /* Lbrace  */
  YYSYMBOL_Rbrace = 98,                    /* Rbrace  */
  YYSYMBOL_Lbracket = 99,                  /* Lbracket  */
  YYSYMBOL_Rbracket = 100,                 /* Rbracket  */
  YYSYMBOL_Semicolon = 101,                /* Semicolon  */
  YYSYMBOL_Comma = 102,                    /* Comma  */
  YYSYMBOL_And = 103,                      /* And  */
  YYSYMBOL_Or = 104,                       /* Or  */
  YYSYMBOL_Not = 105,                      /* Not  */
  YYSYMBOL_Noteq = 106,                    /* Noteq  */
  YYSYMBOL_Lesseq = 107,                   /* Lesseq  */
  YYSYMBOL_Equal = 108,                    /* Equal  */
  YYSYMBOL_Add = 109,                      /* Add  */
  YYSYMBOL_Sub = 110,                      /* Sub  */
  YYSYMBOL_Mul = 111,                      /* Mul  */
  YYSYMBOL_Div = 112,                      /* Div  */
  YYSYMBOL_Dot = 113,                      /* Dot  */
  YYSYMBOL_SpaceIdef = 114,                /* SpaceIdef  */
  YYSYMBOL_Idef = 115,                     /* Idef  */
  YYSYMBOL_IndentIdef = 116,               /* IndentIdef  */
  YYSYMBOL_IndentSpaceIdef = 117,          /* IndentSpaceIdef  */
  YYSYMBOL_ArgIdef = 118,                  /* ArgIdef  */
  YYSYMBOL_MacExpIdef = 119,               /* MacExpIdef  */
  YYSYMBOL_MacStmtIdef = 120,              /* MacStmtIdef  */
  YYSYMBOL_Integer = 121                   /* Integer  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_int16 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  24
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   335

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  51
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  71
/* YYNRULES -- Number of rules.  */
#define YYNRULES  121
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  299

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   305


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,   282,   282,   283,   284,   285,   286,   287,   295,   303,
     311,   319,   325,   331,   337,   343,   344,   345,   346,   347,
     356,   367,   377,   390,   401,   414,   425,   437,   438,   447,
     454,   461,   468,   475,   482,   489,   496,   504,   511,   516,
     526,   537,   538,   539,   540,   541,   542,   550,   559,   567,
     574,   575,   576,   582,   589,   590,   591,   592,   602,   603,
     604,   605,   606,   607,   608,   609,   610,   611,   612,   613,
     614,   615,   616,   617,   618,   619,   621,   623,   625,   627,
     629,   631,   633,   635,   637,   639,   641,   643,   645,   647,
     649,   651,   653,   655,   657,   659,   661,   663,   665,   667,
     669,   671,   673,   675,   677,   679,   681,   683,   685,   687,
     689,   691,   693,   695,   697,   703,   712,   718,   724,   725,
     729,   733
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "CLASS", "PUBLIC",
  "STATIC", "VOID", "MAIN", "STRING", "PRINTLN", "EXTENDS", "RETURN",
  "INT", "BOOLEAN", "IF", "ELSE", "WHILE", "TRUE", "FALSE", "THIS", "NEW",
  "LENGTH", "DEFSTMT", "DEFSTMT0", "DEFSTMT1", "DEFSTMT2", "DEFEXP",
  "DEFEXP0", "DEFEXP1", "DEFEXP2", "AND", "OR", "NOT", "NOTEQ", "LESSEQ",
  "EQUAL", "ADD", "SUB", "MUL", "DIV", "DOT", "LPAREN", "RPAREN", "LBRACE",
  "RBRACE", "LBRACKET", "RBRACKET", "SEMICOLON", "COMMA", "INTEGER", "ID",
  "$accept", "Goal", "MacDefStar", "MacDef", "MacDefExp", "MacDefStmt",
  "StatementStar", "ArgIdefStar", "Statement", "MainClass", "Expression",
  "PrmExp", "ExpArgs", "ExpArgsEnd", "CallArgs", "CallArgsEnd",
  "TypeDecStar", "TypeDec", "VarDecStar", "VarDec", "MethDecStar",
  "MethDec", "MethArgs", "MethArgsEnd", "Type", "Class", "Public",
  "Static", "Void", "Main", "String", "Println", "Extends", "Return",
  "Int", "Boolean", "If", "Else", "While", "True", "False", "This", "New",
  "Length", "Lparen", "Rparen", "Lbrace", "Rbrace", "Lbracket", "Rbracket",
  "Semicolon", "Comma", "And", "Or", "Not", "Noteq", "Lesseq", "Equal",
  "Add", "Sub", "Mul", "Div", "Dot", "SpaceIdef", "Idef", "IndentIdef",
  "IndentSpaceIdef", "ArgIdef", "MacExpIdef", "MacStmtIdef", "Integer", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-177)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-121)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     306,   -30,   -30,   -30,   -30,   -21,   -21,   -21,   -21,    31,
      33,   306,  -177,  -177,  -177,    -7,    -7,    -7,    -7,  -177,
      -7,    -7,    -7,    -7,  -177,  -177,    33,    -8,  -177,  -177,
      -6,     1,    -6,    -6,    -6,     1,    -6,    -6,  -177,    33,
      -3,  -177,    12,  -177,    14,  -177,    12,     1,    14,    14,
      -7,     1,    14,  -177,    32,    79,    12,  -177,    92,  -177,
      -6,   126,    12,    -6,    -6,   165,    -7,    -6,  -177,    47,
    -177,  -177,    93,    14,  -177,  -177,  -177,   -20,    57,   126,
      -7,    -7,    -7,   126,    58,    69,    -7,   126,     1,    14,
    -177,  -177,  -177,  -177,  -177,  -177,    66,     1,   273,  -177,
    -177,  -177,    28,   165,   165,  -177,    -7,  -177,   165,     1,
    -177,    12,    73,  -177,   102,    -6,  -177,  -177,  -177,   165,
     165,   165,    57,  -177,   165,  -177,   165,   165,    57,    12,
      -6,  -177,  -177,  -177,  -177,  -177,  -177,  -177,  -177,  -177,
    -177,   252,   252,   252,   252,   252,   252,   252,   252,   252,
      40,  -177,    58,    -7,     1,  -177,   165,     1,    -7,  -177,
    -177,  -177,  -177,    57,    92,    47,    80,    58,  -177,  -177,
    -177,   106,    14,     1,     1,     1,  -177,    63,    74,    68,
       1,  -177,  -177,   126,    14,    63,  -177,  -177,  -177,  -177,
    -177,  -177,  -177,  -177,  -177,  -177,    -7,   165,     1,  -177,
       1,  -177,   165,    73,  -177,  -177,    74,    47,    63,  -177,
      -7,     1,    -6,    74,   126,   126,  -177,    69,  -177,  -177,
     165,    74,    57,     1,  -177,   165,    63,  -177,  -177,     1,
      57,  -177,    -7,  -177,   112,    12,    14,  -177,   109,  -177,
     165,  -177,  -177,  -177,    -7,    14,     1,  -177,  -177,  -177,
    -177,    80,  -177,    58,   126,  -177,  -177,   126,    74,   165,
     165,  -177,     1,    47,    63,    57,  -177,  -177,     1,  -177,
      12,    14,    47,  -177,  -177,  -177,  -177,    80,     1,   247,
      47,    12,   122,    69,    14,   125,  -177,   165,  -177,    -7,
      74,   165,    57,     1,  -177,    74,    57,    57,  -177
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       3,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     3,     5,     6,   120,     0,     0,     0,     0,   119,
       0,     0,     0,     0,     1,    76,    58,     0,     4,    95,
       0,     0,     0,     0,     0,     0,     0,     0,     2,    58,
       0,   114,     0,   118,     0,    96,     0,     0,     0,     0,
       0,     0,     0,    59,   114,     0,     0,    97,     0,   102,
       0,    15,     0,     0,     0,     0,     0,     0,    83,     0,
      62,    77,     0,     0,    82,    87,    89,   117,     0,    15,
       0,     0,     0,    15,     0,     0,     0,    15,     0,     0,
      90,    91,    92,    93,   105,   121,   115,     0,    38,    42,
      43,    45,     0,     0,     0,    44,     0,    41,     0,     0,
     115,     0,    65,    78,     0,     0,    98,    12,    16,     0,
       0,     0,     0,    99,     0,   108,     0,    50,     0,     0,
       0,     8,   103,   104,   106,   107,   109,   110,   111,   112,
     113,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    85,     0,     0,     0,    46,    50,     0,     0,    62,
      86,   117,    63,     0,    65,     0,     0,    74,    73,    75,
      79,     0,    17,     0,     0,     0,    19,     0,     0,    52,
       0,    51,    13,    15,    17,     0,    28,    29,    30,    31,
      32,    33,    34,    35,    94,    37,     0,     0,     0,    49,
       0,     9,     0,    65,    60,    66,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,   100,     0,   101,    21,
       0,     0,     0,     0,    36,    54,     0,    48,    40,     0,
       0,    64,     0,    72,     0,     0,    17,    20,    23,    25,
       0,    53,    26,    14,     0,    56,     0,    55,    47,    10,
      61,    68,    81,     0,    15,    18,    88,     0,     0,     0,
       0,    39,     0,     0,     0,     0,    24,    22,     0,    57,
       0,    70,     0,    11,     7,    62,    69,     0,     0,    15,
       0,     0,     0,    75,    70,     0,    84,     0,    71,     0,
       0,     0,     0,     0,    67,     0,     0,     0,    27
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -177,  -177,   128,  -177,  -177,  -177,   -55,  -168,  -155,  -177,
      -9,   178,   -12,   -84,  -177,  -119,   108,  -177,  -148,  -177,
    -146,  -177,  -177,  -128,  -151,   135,    99,  -177,  -177,  -177,
    -177,  -127,  -177,  -177,    65,  -177,  -177,  -177,  -177,  -177,
    -177,  -177,  -177,  -177,   -15,   -25,   -23,   -58,   -94,  -139,
    -176,   -35,  -177,  -177,  -177,  -177,  -177,   -52,  -177,  -177,
    -177,  -177,  -177,   130,   -28,  -177,   -85,    16,   146,   159,
    -177
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
       0,     9,    10,    11,    12,    13,    78,   211,    79,    26,
     179,    98,   180,   181,   246,   247,    38,    39,   112,   162,
     163,   164,   262,   276,   165,    40,   166,   114,   171,   210,
     253,    80,    69,   287,   167,   168,    81,   257,    82,    99,
     100,   101,   102,   195,   103,    46,    83,   117,   124,   217,
     219,   212,   142,   143,   104,   144,   145,   126,   146,   147,
     148,   149,   150,    42,   105,    84,    85,    44,   106,    86,
     107
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      30,    31,    32,    33,   141,    34,    35,    36,    37,    60,
      50,   203,    56,    63,    64,   207,   223,    67,   205,    58,
      14,  -120,    62,    61,   118,  -116,    66,   169,   122,    19,
     231,    24,   128,    70,    29,    65,    25,   237,   115,    87,
     151,   111,    41,    45,    43,   242,   224,    54,    47,    48,
      49,   108,    51,    52,   130,    57,    97,   230,   197,   238,
     239,   194,    59,   129,   176,   119,   120,   121,   255,   233,
     182,   127,   131,   208,   153,  -115,    73,    71,   110,    88,
      89,   169,   267,   109,   158,   151,   160,   248,   159,    68,
     110,   156,   151,   160,   154,   155,    71,   110,   113,   157,
     263,   116,   266,   123,   125,   204,   183,  -119,   170,   216,
     173,   174,   175,   209,   292,   177,   220,   178,   169,   296,
     252,   218,   196,   161,   256,   272,   280,   279,   222,   199,
     161,   172,   201,   286,    74,    74,   241,   206,   198,    28,
      75,   269,    76,   202,   200,    27,   184,    53,   213,   214,
     215,    20,    21,    22,    23,   221,   288,    72,   289,   264,
      15,    16,    17,    18,   243,   240,   169,   152,     0,    57,
      55,     0,   250,   227,     0,   228,    77,     0,     0,   232,
       0,   225,    90,    91,    92,    93,   235,     0,   226,     0,
       0,     0,   169,   229,   283,   234,     0,    94,   244,   265,
       0,     0,     0,     0,   249,     0,    29,   273,     0,     0,
     260,     0,   254,     0,    95,    96,   245,   251,     0,     0,
       0,   261,     0,     0,   282,     0,     0,     0,   236,   259,
       0,   258,     0,     0,   294,   271,   277,   270,   297,   298,
       0,     0,     0,   274,   278,     0,     0,   275,     0,   277,
     268,   245,   284,   281,     0,     0,    74,     0,   285,   151,
     160,    75,     0,    76,     0,     0,     0,     0,   295,    90,
      91,    92,    93,     0,   291,     0,     0,     0,   290,     0,
       0,     0,   293,     0,    94,     0,     0,     0,     0,     0,
      57,     0,     0,    29,     0,     0,     0,    77,     0,     0,
       0,    95,   110,   132,   133,     0,   134,   135,     0,   136,
     137,   138,   139,   140,     0,     0,     0,     0,   123,   185,
     186,   187,   188,   189,   190,   191,   192,   193,     1,     2,
       3,     4,     5,     6,     7,     8
};

static const yytype_int16 yycheck[] =
{
      15,    16,    17,    18,    98,    20,    21,    22,    23,    44,
      35,   159,    40,    48,    49,   166,   184,    52,   164,    42,
      50,    41,    47,    46,    79,    45,    51,   112,    83,    50,
     206,     0,    87,    56,    41,    50,     3,   213,    73,    62,
      12,    69,    50,    42,    50,   221,   185,    50,    32,    33,
      34,    66,    36,    37,    89,    43,    65,   203,   152,   214,
     215,    21,    48,    88,   122,    80,    81,    82,   236,   208,
     128,    86,    97,   167,   102,    43,    60,     4,    50,    63,
      64,   166,   258,    67,   109,    12,    13,   226,   111,    10,
      50,   106,    12,    13,   103,   104,     4,    50,     5,   108,
     251,    44,   257,    45,    35,   163,   129,    41,     6,    46,
     119,   120,   121,     7,   290,   124,    48,   126,   203,   295,
       8,    47,   150,    50,    15,   264,   277,   275,   183,   154,
      50,   115,   157,    11,     9,     9,   220,   165,   153,    11,
      14,   260,    16,   158,   156,    10,   130,    39,   173,   174,
     175,     5,     6,     7,     8,   180,   284,    58,   285,   253,
       1,     2,     3,     4,   222,   217,   251,   102,    -1,    43,
      40,    -1,   230,   198,    -1,   200,    50,    -1,    -1,   207,
      -1,   196,    17,    18,    19,    20,   211,    -1,   197,    -1,
      -1,    -1,   277,   202,   279,   210,    -1,    32,   223,   254,
      -1,    -1,    -1,    -1,   229,    -1,    41,   265,    -1,    -1,
     245,    -1,   235,    -1,    49,    50,   225,   232,    -1,    -1,
      -1,   246,    -1,    -1,   279,    -1,    -1,    -1,   212,   244,
      -1,   240,    -1,    -1,   292,   263,   271,   262,   296,   297,
      -1,    -1,    -1,   268,   272,    -1,    -1,   270,    -1,   284,
     259,   260,   280,   278,    -1,    -1,     9,    -1,   281,    12,
      13,    14,    -1,    16,    -1,    -1,    -1,    -1,   293,    17,
      18,    19,    20,    -1,   289,    -1,    -1,    -1,   287,    -1,
      -1,    -1,   291,    -1,    32,    -1,    -1,    -1,    -1,    -1,
      43,    -1,    -1,    41,    -1,    -1,    -1,    50,    -1,    -1,
      -1,    49,    50,    30,    31,    -1,    33,    34,    -1,    36,
      37,    38,    39,    40,    -1,    -1,    -1,    -1,    45,   141,
     142,   143,   144,   145,   146,   147,   148,   149,    22,    23,
      24,    25,    26,    27,    28,    29
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,    22,    23,    24,    25,    26,    27,    28,    29,    52,
      53,    54,    55,    56,    50,   120,   120,   120,   120,    50,
     119,   119,   119,   119,     0,     3,    60,    76,    53,    41,
      95,    95,    95,    95,    95,    95,    95,    95,    67,    68,
      76,    50,   114,    50,   118,    42,    96,   118,   118,   118,
      96,   118,   118,    67,    50,   114,   115,    43,    97,    48,
     102,    97,    96,   102,   102,    95,    96,   102,    10,    83,
      97,     4,    77,   118,     9,    14,    16,    50,    57,    59,
      82,    87,    89,    97,   116,   117,   120,    97,   118,   118,
      17,    18,    19,    20,    32,    49,    50,    61,    62,    90,
      91,    92,    93,    95,   105,   115,   119,   121,    95,   118,
      50,   115,    69,     5,    78,   102,    44,    98,    57,    95,
      95,    95,    57,    45,    99,    35,   108,    95,    57,    96,
     102,    96,    30,    31,    33,    34,    36,    37,    38,    39,
      40,    99,   103,   104,   106,   107,   109,   110,   111,   112,
     113,    12,    85,   115,    61,    61,    95,    61,    96,    97,
      13,    50,    70,    71,    72,    75,    77,    85,    86,   117,
       6,    79,   118,    61,    61,    61,    98,    61,    61,    61,
      63,    64,    98,    97,   118,    62,    62,    62,    62,    62,
      62,    62,    62,    62,    21,    94,   115,    99,    95,    96,
      63,    96,    95,    69,    98,    71,   115,    75,    99,     7,
      80,    58,   102,    96,    96,    96,    46,   100,    47,   101,
      48,    96,    57,    58,   100,    95,    61,    96,    96,    61,
      71,   101,   115,   100,    95,    96,   118,   101,    59,    59,
     108,    64,   101,    98,    96,    61,    65,    66,   100,    96,
      98,    95,     8,    81,    97,    58,    15,    88,    61,    95,
     102,    96,    73,    75,    99,    57,    59,   101,    61,    66,
      96,   115,   100,    98,    96,    97,    74,   102,   115,    69,
      75,    96,    57,   117,   115,    97,    11,    84,    74,    82,
      61,    95,   101,    61,    98,    96,   101,    98,    98
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    51,    52,    53,    53,    54,    54,    55,    55,    55,
      55,    56,    56,    56,    56,    57,    57,    58,    58,    59,
      59,    59,    59,    59,    59,    59,    59,    60,    61,    61,
      61,    61,    61,    61,    61,    61,    61,    61,    61,    61,
      61,    62,    62,    62,    62,    62,    62,    62,    62,    62,
      63,    63,    64,    64,    65,    65,    66,    66,    67,    67,
      68,    68,    69,    69,    70,    71,    71,    72,    73,    73,
      74,    74,    75,    75,    75,    75,    76,    77,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    95,    96,    97,    98,    99,
     100,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     3,     0,     2,     1,     1,    13,     7,     8,
      10,    13,     7,     8,    10,     0,     2,     0,     3,     3,
       5,     4,     7,     5,     7,     5,     5,    21,     3,     3,
       3,     3,     3,     3,     3,     3,     4,     3,     1,     6,
       4,     1,     1,     1,     1,     1,     2,     5,     4,     3,
       0,     1,     1,     3,     0,     1,     1,     3,     0,     2,
       6,     8,     0,     2,     3,     0,     2,    13,     0,     3,
       0,     4,     3,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 7: /* MacDefExp: DEFEXP MacExpIdef Lparen ArgIdef Comma ArgIdef Comma ArgIdef ArgIdefStar Rparen Lparen Expression Rparen  */
#line 288 "A1.y"
                        {
				store--;
				concatList((yyvsp[-2].list),(yyvsp[-1].list));
				concatList((yyvsp[-2].list),(yyvsp[0].list));
				add_macro(&mac_exp_list, (yyvsp[-11].list)->head, (yyvsp[-2].list));
				empty_list(&arg_list);
			}
#line 1751 "A1.tab.c"
    break;

  case 8: /* MacDefExp: DEFEXP0 MacExpIdef Lparen Rparen Lparen Expression Rparen  */
#line 296 "A1.y"
                        {
				store--;
				concatList((yyvsp[-2].list),(yyvsp[-1].list));
				concatList((yyvsp[-2].list),(yyvsp[0].list));
				add_macro(&mac_exp_list, (yyvsp[-5].list)->head, (yyvsp[-2].list));
				empty_list(&arg_list);
			}
#line 1763 "A1.tab.c"
    break;

  case 9: /* MacDefExp: DEFEXP1 MacExpIdef Lparen ArgIdef Rparen Lparen Expression Rparen  */
#line 304 "A1.y"
                        {
				store--;
				concatList((yyvsp[-2].list),(yyvsp[-1].list));
				concatList((yyvsp[-2].list),(yyvsp[0].list));
				add_macro(&mac_exp_list, (yyvsp[-6].list)->head, (yyvsp[-2].list));
				empty_list(&arg_list);
			}
#line 1775 "A1.tab.c"
    break;

  case 10: /* MacDefExp: DEFEXP2 MacExpIdef Lparen ArgIdef Comma ArgIdef Rparen Lparen Expression Rparen  */
#line 312 "A1.y"
                        {
				store--;
				concatList((yyvsp[-2].list),(yyvsp[-1].list));
				concatList((yyvsp[-2].list),(yyvsp[0].list));
				add_macro(&mac_exp_list, (yyvsp[-8].list)->head, (yyvsp[-2].list));
				empty_list(&arg_list);
			}
#line 1787 "A1.tab.c"
    break;

  case 11: /* MacDefStmt: DEFSTMT MacStmtIdef Lparen ArgIdef Comma ArgIdef Comma ArgIdef ArgIdefStar Rparen Lbrace StatementStar Rbrace  */
#line 320 "A1.y"
                        {
				store--;
				add_macro(&mac_stmt_list, (yyvsp[-11].list)->head, (yyvsp[-1].list));
				empty_list(&arg_list);
			}
#line 1797 "A1.tab.c"
    break;

  case 12: /* MacDefStmt: DEFSTMT0 MacStmtIdef Lparen Rparen Lbrace StatementStar Rbrace  */
#line 326 "A1.y"
                        {
				store--;
				add_macro(&mac_stmt_list, (yyvsp[-5].list)->head, (yyvsp[-1].list));
				empty_list(&arg_list);
			}
#line 1807 "A1.tab.c"
    break;

  case 13: /* MacDefStmt: DEFSTMT1 MacStmtIdef Lparen ArgIdef Rparen Lbrace StatementStar Rbrace  */
#line 332 "A1.y"
                        {
				store--;
				add_macro(&mac_stmt_list, (yyvsp[-6].list)->head, (yyvsp[-1].list));
				empty_list(&arg_list);
			}
#line 1817 "A1.tab.c"
    break;

  case 14: /* MacDefStmt: DEFSTMT2 MacStmtIdef Lparen ArgIdef Comma ArgIdef Rparen Lbrace StatementStar Rbrace  */
#line 338 "A1.y"
                        {
				store--;
				add_macro(&mac_stmt_list, (yyvsp[-8].list)->head, (yyvsp[-1].list));
				empty_list(&arg_list);
			}
#line 1827 "A1.tab.c"
    break;

  case 15: /* StatementStar: %empty  */
#line 343 "A1.y"
                      { if(store)(yyval.list) = NULL; }
#line 1833 "A1.tab.c"
    break;

  case 16: /* StatementStar: Statement StatementStar  */
#line 344 "A1.y"
                                                  { if(store) { (yyval.list) = (yyvsp[-1].list); concatList((yyval.list), (yyvsp[0].list)); } }
#line 1839 "A1.tab.c"
    break;

  case 19: /* Statement: Lbrace StatementStar Rbrace  */
#line 348 "A1.y"
                        {
				if(store)
				{
					(yyval.list) = (yyvsp[-2].list);
					concatList((yyval.list), (yyvsp[-1].list));
					concatList((yyval.list), (yyvsp[0].list));
				}
			}
#line 1852 "A1.tab.c"
    break;

  case 20: /* Statement: Println Lparen Expression Rparen Semicolon  */
#line 357 "A1.y"
                        {
				if(store)
				{
					(yyval.list) = (yyvsp[-4].list);
					concatList((yyval.list), (yyvsp[-3].list));
					concatList((yyval.list), (yyvsp[-2].list));
					concatList((yyval.list), (yyvsp[-1].list));
					concatList((yyval.list), (yyvsp[0].list));
				}
			}
#line 1867 "A1.tab.c"
    break;

  case 21: /* Statement: IndentSpaceIdef Equal Expression Semicolon  */
#line 368 "A1.y"
                        {
				if(store)
				{
					(yyval.list) = (yyvsp[-3].list);
					concatList((yyval.list), (yyvsp[-2].list));
					concatList((yyval.list), (yyvsp[-1].list));
					concatList((yyval.list), (yyvsp[0].list));
				}
			}
#line 1881 "A1.tab.c"
    break;

  case 22: /* Statement: IndentIdef Lbracket Expression Rbracket Equal Expression Semicolon  */
#line 378 "A1.y"
                        {
				if(store)
				{
					(yyval.list) = (yyvsp[-6].list);
					concatList((yyval.list), (yyvsp[-5].list));
					concatList((yyval.list), (yyvsp[-4].list));
					concatList((yyval.list), (yyvsp[-3].list));
					concatList((yyval.list), (yyvsp[-2].list));
					concatList((yyval.list), (yyvsp[-1].list));
					concatList((yyval.list), (yyvsp[0].list));
				}
			}
#line 1898 "A1.tab.c"
    break;

  case 23: /* Statement: If Lparen Expression Rparen Statement  */
#line 391 "A1.y"
                        {
				if(store)
				{
					(yyval.list) = (yyvsp[-4].list);
					concatList((yyval.list), (yyvsp[-3].list));
					concatList((yyval.list), (yyvsp[-2].list));
					concatList((yyval.list), (yyvsp[-1].list));
					concatList((yyval.list), (yyvsp[0].list));
				}
			}
#line 1913 "A1.tab.c"
    break;

  case 24: /* Statement: If Lparen Expression Rparen Statement Else Statement  */
#line 402 "A1.y"
                        {
				if(store)
				{
					(yyval.list) = (yyvsp[-6].list);
					concatList((yyval.list), (yyvsp[-5].list));
					concatList((yyval.list), (yyvsp[-4].list));
					concatList((yyval.list), (yyvsp[-3].list));
					concatList((yyval.list), (yyvsp[-2].list));
					concatList((yyval.list), (yyvsp[-1].list));
					concatList((yyval.list), (yyvsp[0].list));
				}
			}
#line 1930 "A1.tab.c"
    break;

  case 25: /* Statement: While Lparen Expression Rparen Statement  */
#line 415 "A1.y"
                        {
				if(store)
				{
					(yyval.list) = (yyvsp[-4].list);
					concatList((yyval.list), (yyvsp[-3].list));
					concatList((yyval.list), (yyvsp[-2].list));
					concatList((yyval.list), (yyvsp[-1].list));
					concatList((yyval.list), (yyvsp[0].list));
				}
			}
#line 1945 "A1.tab.c"
    break;

  case 26: /* Statement: MacStmtIdef Lparen ExpArgs Rparen Semicolon  */
#line 426 "A1.y"
                        {
				(yyval.list) = replace_macro(&mac_stmt_list, (yyvsp[-4].list)->head, (yyvsp[-2].list));
				if((yyval.list)==NULL)
				{
					printf("\n\nError: Macro not found\n");
					exit(1);
				}
				store--;
				if(!store) printNodeList((yyval.list));
			}
#line 1960 "A1.tab.c"
    break;

  case 28: /* Expression: PrmExp And PrmExp  */
#line 439 "A1.y"
                        {
				if(store)
				{
					(yyval.list) = (yyvsp[-2].list);
					concatList((yyval.list), (yyvsp[-1].list));
					concatList((yyval.list), (yyvsp[0].list));
				}
			}
#line 1973 "A1.tab.c"
    break;

  case 29: /* Expression: PrmExp Or PrmExp  */
#line 448 "A1.y"
                        {
				if(store) {
				(yyval.list) = (yyvsp[-2].list);
				concatList((yyval.list), (yyvsp[-1].list));
				concatList((yyval.list), (yyvsp[0].list));}
			}
#line 1984 "A1.tab.c"
    break;

  case 30: /* Expression: PrmExp Noteq PrmExp  */
#line 455 "A1.y"
                        {
				if(store) {
				(yyval.list) = (yyvsp[-2].list);
				concatList((yyval.list), (yyvsp[-1].list));
				concatList((yyval.list), (yyvsp[0].list));}
			}
#line 1995 "A1.tab.c"
    break;

  case 31: /* Expression: PrmExp Lesseq PrmExp  */
#line 462 "A1.y"
                        {
				if(store) {
				(yyval.list) = (yyvsp[-2].list);
				concatList((yyval.list), (yyvsp[-1].list));
				concatList((yyval.list), (yyvsp[0].list));}
			}
#line 2006 "A1.tab.c"
    break;

  case 32: /* Expression: PrmExp Add PrmExp  */
#line 469 "A1.y"
                        {
				if(store) {
				(yyval.list) = (yyvsp[-2].list);
				concatList((yyval.list), (yyvsp[-1].list));
				concatList((yyval.list), (yyvsp[0].list));}
			}
#line 2017 "A1.tab.c"
    break;

  case 33: /* Expression: PrmExp Sub PrmExp  */
#line 476 "A1.y"
                        {
				if(store) {
				(yyval.list) = (yyvsp[-2].list);
				concatList((yyval.list), (yyvsp[-1].list));
				concatList((yyval.list), (yyvsp[0].list));}
			}
#line 2028 "A1.tab.c"
    break;

  case 34: /* Expression: PrmExp Mul PrmExp  */
#line 483 "A1.y"
                        {
				if(store) {
				(yyval.list) = (yyvsp[-2].list);
				concatList((yyval.list), (yyvsp[-1].list));
				concatList((yyval.list), (yyvsp[0].list));}
			}
#line 2039 "A1.tab.c"
    break;

  case 35: /* Expression: PrmExp Div PrmExp  */
#line 490 "A1.y"
                        {
				if(store) {
				(yyval.list) = (yyvsp[-2].list);
				concatList((yyval.list), (yyvsp[-1].list));
				concatList((yyval.list), (yyvsp[0].list));}
			}
#line 2050 "A1.tab.c"
    break;

  case 36: /* Expression: PrmExp Lbracket PrmExp Rbracket  */
#line 497 "A1.y"
                        {
				if(store) {
				(yyval.list) = (yyvsp[-3].list);
				concatList((yyval.list), (yyvsp[-2].list));
				concatList((yyval.list), (yyvsp[-1].list));
				concatList((yyval.list), (yyvsp[0].list));}
			}
#line 2062 "A1.tab.c"
    break;

  case 37: /* Expression: PrmExp Dot Length  */
#line 505 "A1.y"
                        {
				if(store) {
				(yyval.list) = (yyvsp[-2].list);
				concatList((yyval.list), (yyvsp[-1].list));
				concatList((yyval.list), (yyvsp[0].list));}
			}
#line 2073 "A1.tab.c"
    break;

  case 38: /* Expression: PrmExp  */
#line 512 "A1.y"
                        {
				if(store) {
				(yyval.list) = (yyvsp[0].list);}
			}
#line 2082 "A1.tab.c"
    break;

  case 39: /* Expression: PrmExp Dot Idef Lparen CallArgs Rparen  */
#line 517 "A1.y"
                        {
				if(store) {
				(yyval.list) = (yyvsp[-5].list);
				concatList((yyval.list), (yyvsp[-4].list));
				concatList((yyval.list), (yyvsp[-3].list));
				concatList((yyval.list), (yyvsp[-2].list));
				concatList((yyval.list), (yyvsp[-1].list));
				concatList((yyval.list), (yyvsp[0].list));}
			}
#line 2096 "A1.tab.c"
    break;

  case 40: /* Expression: MacExpIdef Lparen ExpArgs Rparen  */
#line 527 "A1.y"
                        {
				(yyval.list) = replace_macro(&mac_exp_list, (yyvsp[-3].list)->head, (yyvsp[-1].list));
				if((yyval.list)==NULL)
				{
					printf("\n\nError: Macro not found\n");
					exit(1);
				}
				store--;
				if(!store) printNodeList((yyval.list));
			}
#line 2111 "A1.tab.c"
    break;

  case 41: /* PrmExp: Integer  */
#line 537 "A1.y"
                {if(store)  (yyval.list) = (yyvsp[0].list);}
#line 2117 "A1.tab.c"
    break;

  case 42: /* PrmExp: True  */
#line 538 "A1.y"
                               {if(store)  (yyval.list) = (yyvsp[0].list);}
#line 2123 "A1.tab.c"
    break;

  case 43: /* PrmExp: False  */
#line 539 "A1.y"
                                {if(store)  (yyval.list) = (yyvsp[0].list);}
#line 2129 "A1.tab.c"
    break;

  case 44: /* PrmExp: Idef  */
#line 540 "A1.y"
                                {if(store)  (yyval.list) = (yyvsp[0].list);}
#line 2135 "A1.tab.c"
    break;

  case 45: /* PrmExp: This  */
#line 541 "A1.y"
                                {if(store)  (yyval.list) = (yyvsp[0].list);}
#line 2141 "A1.tab.c"
    break;

  case 46: /* PrmExp: Not Expression  */
#line 543 "A1.y"
                        {
				if(store) 
				{
				(yyval.list) = (yyvsp[-1].list);
				concatList((yyval.list), (yyvsp[0].list));
				}
			}
#line 2153 "A1.tab.c"
    break;

  case 47: /* PrmExp: New Int Lbracket Expression Rbracket  */
#line 551 "A1.y"
                        {
				if(store) {
				(yyval.list) = (yyvsp[-4].list);
				concatList((yyval.list), (yyvsp[-3].list));
				concatList((yyval.list), (yyvsp[-2].list));
				concatList((yyval.list), (yyvsp[-1].list));
				concatList((yyval.list), (yyvsp[0].list));}
			}
#line 2166 "A1.tab.c"
    break;

  case 48: /* PrmExp: New Idef Lparen Rparen  */
#line 560 "A1.y"
                        {
				if(store) {
				(yyval.list) = (yyvsp[-3].list);
				concatList((yyval.list), (yyvsp[-2].list));
				concatList((yyval.list), (yyvsp[-1].list));
				concatList((yyval.list), (yyvsp[0].list));}
			}
#line 2178 "A1.tab.c"
    break;

  case 49: /* PrmExp: Lparen Expression Rparen  */
#line 568 "A1.y"
                        {
				if(store) {
				(yyval.list) = (yyvsp[-2].list);
				concatList((yyval.list), (yyvsp[-1].list));
				concatList((yyval.list), (yyvsp[0].list));}
			}
#line 2189 "A1.tab.c"
    break;

  case 50: /* ExpArgs: %empty  */
#line 574 "A1.y"
                { (yyval.list) = NULL; }
#line 2195 "A1.tab.c"
    break;

  case 51: /* ExpArgs: ExpArgsEnd  */
#line 575 "A1.y"
                                     { (yyval.list) = (yyvsp[0].list); }
#line 2201 "A1.tab.c"
    break;

  case 52: /* ExpArgsEnd: Expression  */
#line 577 "A1.y"
                        {
				cNode *temp = malloc(sizeof(cNode));
				temp->data = (yyvsp[0].list);
				(yyval.list) = newList(temp);
			}
#line 2211 "A1.tab.c"
    break;

  case 53: /* ExpArgsEnd: Expression COMMA ExpArgsEnd  */
#line 583 "A1.y"
                        {
				cNode *temp = malloc(sizeof(cNode));
				temp->data = (yyvsp[-2].list);
				(yyval.list) = newList(temp);
				concatList((yyval.list), (yyvsp[0].list));
			}
#line 2222 "A1.tab.c"
    break;

  case 54: /* CallArgs: %empty  */
#line 589 "A1.y"
                 { if(store) (yyval.list) = NULL; }
#line 2228 "A1.tab.c"
    break;

  case 55: /* CallArgs: CallArgsEnd  */
#line 590 "A1.y"
                                      { if(store) (yyval.list) = (yyvsp[0].list); }
#line 2234 "A1.tab.c"
    break;

  case 56: /* CallArgsEnd: Expression  */
#line 591 "A1.y"
                        { if(store) {(yyval.list) = (yyvsp[0].list);} }
#line 2240 "A1.tab.c"
    break;

  case 57: /* CallArgsEnd: Expression Comma CallArgsEnd  */
#line 593 "A1.y"
                        {
				if(store)
				{
					(yyval.list) = (yyvsp[-2].list);
					concatList((yyval.list), (yyvsp[-1].list));
					concatList((yyval.list), (yyvsp[0].list));
				}
			}
#line 2253 "A1.tab.c"
    break;

  case 76: /* Class: CLASS  */
#line 621 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("%sclass ", indent); }
#line 2260 "A1.tab.c"
    break;

  case 77: /* Public: PUBLIC  */
#line 623 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("%spublic ", indent);}
#line 2267 "A1.tab.c"
    break;

  case 78: /* Static: STATIC  */
#line 625 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("static ");}
#line 2274 "A1.tab.c"
    break;

  case 79: /* Void: VOID  */
#line 627 "A1.y"
                                {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("void ");}
#line 2281 "A1.tab.c"
    break;

  case 80: /* Main: MAIN  */
#line 629 "A1.y"
                                {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("main ");}
#line 2288 "A1.tab.c"
    break;

  case 81: /* String: STRING  */
#line 631 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("String ");}
#line 2295 "A1.tab.c"
    break;

  case 82: /* Println: PRINTLN  */
#line 633 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("%sSystem.out.println", indent);}
#line 2302 "A1.tab.c"
    break;

  case 83: /* Extends: EXTENDS  */
#line 635 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("extends ");}
#line 2309 "A1.tab.c"
    break;

  case 84: /* Return: RETURN  */
#line 637 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("%sreturn ", indent);}
#line 2316 "A1.tab.c"
    break;

  case 85: /* Int: INT  */
#line 639 "A1.y"
                                {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("%sint ", indent);}
#line 2323 "A1.tab.c"
    break;

  case 86: /* Boolean: BOOLEAN  */
#line 641 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("%sboolean ", indent);}
#line 2330 "A1.tab.c"
    break;

  case 87: /* If: IF  */
#line 643 "A1.y"
                                {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("\n%sif ", indent);}
#line 2337 "A1.tab.c"
    break;

  case 88: /* Else: ELSE  */
#line 645 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("%selse ", indent);}
#line 2344 "A1.tab.c"
    break;

  case 89: /* While: WHILE  */
#line 647 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("%swhile ", indent);}
#line 2351 "A1.tab.c"
    break;

  case 90: /* True: TRUE  */
#line 649 "A1.y"
                                {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("true ");}
#line 2358 "A1.tab.c"
    break;

  case 91: /* False: FALSE  */
#line 651 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("false ");}
#line 2365 "A1.tab.c"
    break;

  case 92: /* This: THIS  */
#line 653 "A1.y"
                                {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("this");}
#line 2372 "A1.tab.c"
    break;

  case 93: /* New: NEW  */
#line 655 "A1.y"
                                {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("new ");}
#line 2379 "A1.tab.c"
    break;

  case 94: /* Length: LENGTH  */
#line 657 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("length");}
#line 2386 "A1.tab.c"
    break;

  case 95: /* Lparen: LPAREN  */
#line 659 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("(");}
#line 2393 "A1.tab.c"
    break;

  case 96: /* Rparen: RPAREN  */
#line 661 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf(")");}
#line 2400 "A1.tab.c"
    break;

  case 97: /* Lbrace: LBRACE  */
#line 663 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
						else {printf("\n%s{\n", indent); strcat(indent,"\t");}}
#line 2407 "A1.tab.c"
    break;

  case 98: /* Rbrace: RBRACE  */
#line 665 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
						else {indent[strlen(indent)-1]='\0'; printf("\n%s}\n", indent);}}
#line 2414 "A1.tab.c"
    break;

  case 99: /* Lbracket: LBRACKET  */
#line 667 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("[");}
#line 2421 "A1.tab.c"
    break;

  case 100: /* Rbracket: RBRACKET  */
#line 669 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("] ");}
#line 2428 "A1.tab.c"
    break;

  case 101: /* Semicolon: SEMICOLON  */
#line 671 "A1.y"
                     {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf(";\n");}
#line 2435 "A1.tab.c"
    break;

  case 102: /* Comma: COMMA  */
#line 673 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf(",");}
#line 2442 "A1.tab.c"
    break;

  case 103: /* And: AND  */
#line 675 "A1.y"
                                {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("&& ");}
#line 2449 "A1.tab.c"
    break;

  case 104: /* Or: OR  */
#line 677 "A1.y"
                                {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("|| ");}
#line 2456 "A1.tab.c"
    break;

  case 105: /* Not: NOT  */
#line 679 "A1.y"
                                {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("!");}
#line 2463 "A1.tab.c"
    break;

  case 106: /* Noteq: NOTEQ  */
#line 681 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("!=");}
#line 2470 "A1.tab.c"
    break;

  case 107: /* Lesseq: LESSEQ  */
#line 683 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("<=");}
#line 2477 "A1.tab.c"
    break;

  case 108: /* Equal: EQUAL  */
#line 685 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("=");}
#line 2484 "A1.tab.c"
    break;

  case 109: /* Add: ADD  */
#line 687 "A1.y"
                                {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("+");}
#line 2491 "A1.tab.c"
    break;

  case 110: /* Sub: SUB  */
#line 689 "A1.y"
                                {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("-");}
#line 2498 "A1.tab.c"
    break;

  case 111: /* Mul: MUL  */
#line 691 "A1.y"
                                {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("*");}
#line 2505 "A1.tab.c"
    break;

  case 112: /* Div: DIV  */
#line 693 "A1.y"
                                {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf("/");}
#line 2512 "A1.tab.c"
    break;

  case 113: /* Dot: DOT  */
#line 695 "A1.y"
                                {if(store) (yyval.list)=newList((yyvsp[0].node));
						else printf(".");}
#line 2519 "A1.tab.c"
    break;

  case 114: /* SpaceIdef: ID  */
#line 697 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
						else 
						{
							Node *n = (Node *)(yyvsp[0].node)->data;
							printf("%s ", n->id);
						}}
#line 2530 "A1.tab.c"
    break;

  case 115: /* Idef: ID  */
#line 703 "A1.y"
                                {if(store) 
						{
							(yyval.list)=newList((yyvsp[0].node));
						}
						else 
						{
							Node *n = (Node *)(yyvsp[0].node)->data;
							printf("%s", n->id);
						}}
#line 2544 "A1.tab.c"
    break;

  case 116: /* IndentIdef: ID  */
#line 712 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
						else 
						{
							Node *n = (Node *)(yyvsp[0].node)->data;
							printf("%s%s", indent, n->id);
						}}
#line 2555 "A1.tab.c"
    break;

  case 117: /* IndentSpaceIdef: ID  */
#line 718 "A1.y"
                    {if(store) (yyval.list)=newList((yyvsp[0].node));
						else 
						{
							Node *n = (Node *)(yyvsp[0].node)->data;
							printf("%s%s ", indent, n->id);
						}}
#line 2566 "A1.tab.c"
    break;

  case 118: /* ArgIdef: ID  */
#line 724 "A1.y"
                        { addNode(&arg_list, (yyvsp[0].node)); }
#line 2572 "A1.tab.c"
    break;

  case 119: /* MacExpIdef: ID  */
#line 725 "A1.y"
                        {
						store++;
						(yyval.list) = newList((yyvsp[0].node));
					}
#line 2581 "A1.tab.c"
    break;

  case 120: /* MacStmtIdef: ID  */
#line 729 "A1.y"
                        {
						store++;
						(yyval.list) = newList((yyvsp[0].node));
					}
#line 2590 "A1.tab.c"
    break;

  case 121: /* Integer: INTEGER  */
#line 733 "A1.y"
                        {if(store) (yyval.list)=newList((yyvsp[0].node));
					else 
					{
						Node *n = (Node *)(yyvsp[0].node)->data;
						printf("%s ", n->id);
					}}
#line 2601 "A1.tab.c"
    break;


#line 2605 "A1.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 739 "A1.y"


void yyerror (const char *s) {
printf ("//Failed to parse input code\n");
}

int main () 
{
	yyparse ();
	return 0;
}

#include "lex.yy.c"
