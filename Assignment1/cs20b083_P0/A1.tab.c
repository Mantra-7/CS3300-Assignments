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


#line 151 "A1.tab.c"

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
#line 81 "A1.y"

cNode *node;
cList *list;

#line 253 "A1.tab.c"

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
  YYSYMBOL_MainClass = 53,                 /* MainClass  */
  YYSYMBOL_MacDefStar = 54,                /* MacDefStar  */
  YYSYMBOL_MacDef = 55,                    /* MacDef  */
  YYSYMBOL_MacDefStmt = 56,                /* MacDefStmt  */
  YYSYMBOL_MacDefExp = 57,                 /* MacDefExp  */
  YYSYMBOL_MacIdef = 58,                   /* MacIdef  */
  YYSYMBOL_ArgIdefStar = 59,               /* ArgIdefStar  */
  YYSYMBOL_ArgIdef = 60,                   /* ArgIdef  */
  YYSYMBOL_StatementStar = 61,             /* StatementStar  */
  YYSYMBOL_Statement = 62,                 /* Statement  */
  YYSYMBOL_Expression = 63,                /* Expression  */
  YYSYMBOL_PrmExp = 64,                    /* PrmExp  */
  YYSYMBOL_ExpArgs = 65,                   /* ExpArgs  */
  YYSYMBOL_ExpArgsEnd = 66,                /* ExpArgsEnd  */
  YYSYMBOL_CallArgs = 67,                  /* CallArgs  */
  YYSYMBOL_CallArgsEnd = 68,               /* CallArgsEnd  */
  YYSYMBOL_TypeDecStar = 69,               /* TypeDecStar  */
  YYSYMBOL_TypeDec = 70,                   /* TypeDec  */
  YYSYMBOL_VarDecStar = 71,                /* VarDecStar  */
  YYSYMBOL_VarDec = 72,                    /* VarDec  */
  YYSYMBOL_MethDecStar = 73,               /* MethDecStar  */
  YYSYMBOL_MethDec = 74,                   /* MethDec  */
  YYSYMBOL_MethArgs = 75,                  /* MethArgs  */
  YYSYMBOL_MethArgsEnd = 76,               /* MethArgsEnd  */
  YYSYMBOL_Type = 77,                      /* Type  */
  YYSYMBOL_Class = 78,                     /* Class  */
  YYSYMBOL_Public = 79,                    /* Public  */
  YYSYMBOL_Static = 80,                    /* Static  */
  YYSYMBOL_Void = 81,                      /* Void  */
  YYSYMBOL_Main = 82,                      /* Main  */
  YYSYMBOL_String = 83,                    /* String  */
  YYSYMBOL_Println = 84,                   /* Println  */
  YYSYMBOL_Extends = 85,                   /* Extends  */
  YYSYMBOL_Return = 86,                    /* Return  */
  YYSYMBOL_Int = 87,                       /* Int  */
  YYSYMBOL_Boolean = 88,                   /* Boolean  */
  YYSYMBOL_If = 89,                        /* If  */
  YYSYMBOL_Else = 90,                      /* Else  */
  YYSYMBOL_While = 91,                     /* While  */
  YYSYMBOL_True = 92,                      /* True  */
  YYSYMBOL_False = 93,                     /* False  */
  YYSYMBOL_This = 94,                      /* This  */
  YYSYMBOL_New = 95,                       /* New  */
  YYSYMBOL_Length = 96,                    /* Length  */
  YYSYMBOL_Lparen = 97,                    /* Lparen  */
  YYSYMBOL_Rparen = 98,                    /* Rparen  */
  YYSYMBOL_Lbrace = 99,                    /* Lbrace  */
  YYSYMBOL_Rbrace = 100,                   /* Rbrace  */
  YYSYMBOL_Lbracket = 101,                 /* Lbracket  */
  YYSYMBOL_Rbracket = 102,                 /* Rbracket  */
  YYSYMBOL_Semicolon = 103,                /* Semicolon  */
  YYSYMBOL_Comma = 104,                    /* Comma  */
  YYSYMBOL_And = 105,                      /* And  */
  YYSYMBOL_Or = 106,                       /* Or  */
  YYSYMBOL_Not = 107,                      /* Not  */
  YYSYMBOL_Noteq = 108,                    /* Noteq  */
  YYSYMBOL_Lesseq = 109,                   /* Lesseq  */
  YYSYMBOL_Equal = 110,                    /* Equal  */
  YYSYMBOL_Add = 111,                      /* Add  */
  YYSYMBOL_Sub = 112,                      /* Sub  */
  YYSYMBOL_Mul = 113,                      /* Mul  */
  YYSYMBOL_Div = 114,                      /* Div  */
  YYSYMBOL_Dot = 115,                      /* Dot  */
  YYSYMBOL_Idef = 116,                     /* Idef  */
  YYSYMBOL_Integer = 117                   /* Integer  */
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
#define YYFINAL  23
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   378

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  51
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  67
/* YYNRULES -- Number of rules.  */
#define YYNRULES  117
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  292

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
       0,   100,   100,   102,   104,   105,   107,   108,   110,   114,
     118,   122,   127,   131,   135,   139,   144,   146,   147,   149,
     151,   152,   154,   158,   162,   166,   170,   174,   178,   182,
     189,   193,   197,   201,   205,   209,   213,   217,   221,   225,
     229,   233,   237,   244,   245,   246,   247,   248,   249,   253,
     257,   261,   266,   267,   269,   275,   282,   283,   285,   286,
     291,   292,   293,   294,   295,   296,   297,   298,   299,   300,
     301,   302,   303,   304,   305,   306,   307,   308,   310,   311,
     312,   313,   314,   315,   316,   317,   318,   319,   320,   321,
     322,   323,   324,   325,   326,   327,   328,   329,   330,   331,
     332,   333,   334,   335,   336,   337,   338,   339,   340,   341,
     342,   343,   344,   345,   346,   347,   348,   349
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
  "$accept", "Goal", "MainClass", "MacDefStar", "MacDef", "MacDefStmt",
  "MacDefExp", "MacIdef", "ArgIdefStar", "ArgIdef", "StatementStar",
  "Statement", "Expression", "PrmExp", "ExpArgs", "ExpArgsEnd", "CallArgs",
  "CallArgsEnd", "TypeDecStar", "TypeDec", "VarDecStar", "VarDec",
  "MethDecStar", "MethDec", "MethArgs", "MethArgsEnd", "Type", "Class",
  "Public", "Static", "Void", "Main", "String", "Println", "Extends",
  "Return", "Int", "Boolean", "If", "Else", "While", "True", "False",
  "This", "New", "Length", "Lparen", "Rparen", "Lbrace", "Rbrace",
  "Lbracket", "Rbracket", "Semicolon", "Comma", "And", "Or", "Not",
  "Noteq", "Lesseq", "Equal", "Add", "Sub", "Mul", "Div", "Dot", "Idef",
  "Integer", YY_NULLPTR
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

#define YYTABLE_NINF (-17)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     349,   -32,   -32,   -32,   -32,   -32,   -32,   -32,   -32,    52,
      57,   349,  -177,  -177,  -177,    22,    22,    22,    22,    22,
      22,    22,    22,  -177,  -177,    57,    14,  -177,  -177,    15,
      25,    15,    15,    15,    25,    15,    15,  -177,    57,    14,
    -177,    36,  -177,    47,  -177,    36,    25,    47,    47,    22,
      25,    47,  -177,    51,  -177,    92,  -177,    15,    34,    36,
      15,    15,   283,    22,    15,  -177,    14,  -177,  -177,    94,
      47,  -177,  -177,  -177,    56,    22,    58,    34,    22,    22,
      22,    34,    63,    34,    25,    47,  -177,  -177,  -177,  -177,
    -177,  -177,    22,    25,   316,  -177,  -177,  -177,    43,   283,
     283,  -177,  -177,   283,    25,    36,    41,  -177,    97,    15,
     283,  -177,  -177,  -177,   283,   283,   283,    58,  -177,  -177,
     283,   283,    58,    36,    15,   283,  -177,  -177,  -177,  -177,
    -177,  -177,  -177,  -177,  -177,  -177,   287,   287,   287,   287,
     287,   287,   287,   287,   287,    37,  -177,    68,    22,    25,
    -177,    25,    22,  -177,  -177,  -177,    58,    92,    14,    28,
      68,  -177,  -177,  -177,   102,    47,    69,    25,  -177,    25,
      25,    25,  -177,    70,    71,  -177,    34,    47,    25,    70,
    -177,  -177,  -177,  -177,  -177,  -177,  -177,  -177,  -177,  -177,
      22,   283,    25,  -177,  -177,   283,    41,  -177,  -177,    71,
      14,    70,  -177,    22,    25,    15,   283,    71,    71,    34,
      34,  -177,    88,  -177,  -177,    58,    25,  -177,  -177,   283,
      70,  -177,    25,    58,  -177,    22,  -177,   116,    36,    47,
    -177,  -177,  -177,   110,  -177,   283,  -177,    22,    47,    25,
    -177,  -177,  -177,  -177,    28,  -177,    68,    34,  -177,  -177,
      34,    71,   283,   283,  -177,    25,    14,    70,    58,  -177,
    -177,    25,  -177,    36,    47,    14,  -177,  -177,  -177,  -177,
      28,    25,   157,    14,    36,   117,    63,    47,   121,  -177,
     283,  -177,    22,    71,   283,    58,    25,  -177,    71,    58,
      58,  -177
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       4,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     4,     7,     6,    16,     0,     0,     0,     0,     0,
       0,     0,     0,     1,    78,    60,     0,     5,    97,     0,
       0,     0,     0,     0,     0,     0,     0,     2,    60,     0,
     116,     0,    19,     0,    98,     0,     0,     0,     0,     0,
       0,     0,    61,     0,    99,     0,   104,     0,    20,     0,
       0,     0,     0,     0,     0,    85,     0,    64,    79,     0,
       0,    84,    89,    91,   116,     0,     0,    20,     0,     0,
       0,    20,     0,    20,     0,     0,    92,    93,    94,    95,
     107,   117,     0,     0,    40,    44,    45,    47,     0,     0,
       0,    46,    43,     0,     0,     0,    67,    80,     0,     0,
      52,   100,     9,    21,     0,     0,     0,     0,   110,   101,
       0,     0,     0,     0,     0,    52,    13,   105,   106,   108,
     109,   111,   112,   113,   114,   115,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    87,     0,     0,     0,
      48,     0,     0,    64,    88,    65,     0,    67,     0,     0,
      76,    75,    77,    81,     0,    17,    54,     0,    53,     0,
       0,     0,    22,     0,     0,    10,    20,    17,     0,     0,
      30,    31,    32,    33,    34,    35,    36,    37,    96,    39,
       0,     0,     0,    51,    14,     0,    67,    62,    68,     0,
       0,     0,    82,     0,     0,     0,     0,     0,     0,     0,
       0,   102,     0,   103,    24,     0,     0,    42,    38,    56,
       0,    50,     0,     0,    66,     0,    74,     0,     0,    17,
      55,    29,    23,    26,    28,     0,    11,     0,    58,     0,
      57,    49,    15,    63,    70,    83,     0,    20,    18,    90,
       0,     0,     0,     0,    41,     0,     0,     0,     0,    27,
      25,     0,    59,     0,    72,     0,     8,    12,    64,    71,
       0,     0,    20,     0,     0,     0,    77,    72,     0,    86,
       0,    73,     0,     0,     0,     0,     0,    69,     0,     0,
       0,     3
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -177,  -177,  -177,   123,  -177,  -177,  -177,    -1,  -141,    79,
     -57,  -176,    64,   226,     7,   -71,  -177,  -116,   100,  -177,
    -126,  -177,  -127,  -177,  -177,  -133,  -124,   137,    93,  -177,
    -177,  -177,  -177,  -122,  -177,  -177,    59,  -177,  -177,  -177,
    -177,  -177,  -177,  -177,  -177,  -177,    -7,   -18,   -22,    33,
     -55,  -150,  -161,   -26,  -177,  -177,  -177,  -177,  -177,   -58,
    -177,  -177,  -177,  -177,  -177,    23,  -177
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
       0,     9,    25,    10,    11,    12,    13,    92,   204,    43,
      76,    77,   166,    94,   167,   168,   239,   240,    37,    38,
     106,   155,   156,   157,   255,   269,   158,    39,   159,   108,
     164,   203,   246,    78,    66,   280,   160,   161,    79,   250,
      80,    95,    96,    97,    98,   189,    99,    45,    81,   112,
     120,   212,   214,   205,   137,   138,   100,   139,   140,   121,
     141,   142,   143,   144,   145,   101,   102
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      15,    16,    17,    18,    19,    20,    21,    22,    29,    30,
      31,    32,    33,    34,    35,    36,    49,    57,    14,    55,
     113,    60,    61,    58,   117,    64,   122,   196,    59,   218,
     198,    67,    63,   233,   234,   200,   216,    83,   224,   136,
     146,   154,    62,    71,   109,    68,   231,   232,    72,    41,
      73,   226,    23,   146,   154,   146,   103,    75,   188,   124,
      24,    65,    53,    28,    40,    42,   123,    44,   110,   223,
     241,   114,   115,   116,   259,   126,    75,    54,    40,    54,
      75,    82,    75,   153,    74,   125,   152,    40,   248,   105,
     260,    40,   191,    40,    54,    56,    68,   -16,   118,   107,
      82,   176,   111,   163,    82,   201,    82,   265,   119,   202,
      46,    47,    48,   119,    50,    51,   211,   206,   213,   215,
     256,   148,   285,   118,   245,   249,    93,   289,   279,   162,
      71,   193,   178,   194,    27,   230,    70,   262,    52,    84,
      85,   192,   272,   104,   281,   195,   273,    26,    69,   207,
     172,   208,   209,   210,   235,   175,   282,   147,     0,     0,
     217,     0,     0,   149,   150,     0,    71,   151,   190,   146,
     154,    72,     0,    73,   221,    75,     0,     0,   169,   170,
     171,   199,   162,   219,   173,   174,   228,     0,   165,   197,
     258,   257,     0,     0,     0,     0,   227,     0,   237,    82,
      54,     0,     0,   177,   242,     0,   247,    74,    75,    75,
       0,     0,   253,     0,     0,   275,     0,     0,   244,   162,
       0,   254,     0,   225,     0,     0,     0,     0,     0,     0,
     252,     0,    82,    82,     0,     0,     0,   263,   270,     0,
       0,   268,     0,   267,     0,     0,    75,     0,   236,    75,
       0,   270,   278,   274,     0,   220,   243,     0,     0,   222,
       0,     0,     0,     0,     0,     0,     0,   162,   288,     0,
      82,    75,     0,    82,     0,   284,     0,     0,     0,   264,
       0,     0,     0,   238,   229,     0,     0,     0,   271,     0,
       0,   266,     0,   162,     0,   276,   277,     0,     0,   251,
      86,    87,    88,    89,    86,    87,    88,    89,     0,     0,
       0,     0,     0,     0,     0,    90,   261,   238,   287,    90,
       0,     0,   290,   291,    28,     0,     0,     0,    28,     0,
       0,     0,    91,    74,     0,     0,    91,    40,     0,     0,
       0,     0,     0,     0,   283,     0,   127,   128,   286,   129,
     130,     0,   131,   132,   133,   134,   135,     0,     0,     0,
       0,   119,   179,   180,   181,   182,   183,   184,   185,   186,
     187,     1,     2,     3,     4,     5,     6,     7,     8
};

static const yytype_int16 yycheck[] =
{
       1,     2,     3,     4,     5,     6,     7,     8,    15,    16,
      17,    18,    19,    20,    21,    22,    34,    43,    50,    41,
      77,    47,    48,    45,    81,    51,    83,   153,    46,   179,
     157,    53,    50,   209,   210,   159,   177,    59,   199,    94,
      12,    13,    49,     9,    70,     4,   207,   208,    14,    26,
      16,   201,     0,    12,    13,    12,    63,    58,    21,    85,
       3,    10,    39,    41,    50,    50,    84,    42,    75,   196,
     220,    78,    79,    80,   250,    93,    77,    43,    50,    43,
      81,    58,    83,   105,    50,    92,   104,    50,   229,    66,
     251,    50,   147,    50,    43,    48,     4,    41,    35,     5,
      77,   123,    44,     6,    81,   160,    83,   257,    45,     7,
      31,    32,    33,    45,    35,    36,    46,    48,    47,   176,
     244,    98,   283,    35,     8,    15,    62,   288,    11,   106,
       9,   149,   125,   151,    11,   206,    57,   253,    38,    60,
      61,   148,   268,    64,   277,   152,   270,    10,    55,   167,
     117,   169,   170,   171,   212,   122,   278,    98,    -1,    -1,
     178,    -1,    -1,    99,   100,    -1,     9,   103,   145,    12,
      13,    14,    -1,    16,   192,   176,    -1,    -1,   114,   115,
     116,   158,   159,   190,   120,   121,   204,    -1,   109,   156,
     247,   246,    -1,    -1,    -1,    -1,   203,    -1,   216,   176,
      43,    -1,    -1,   124,   222,    -1,   228,    50,   209,   210,
      -1,    -1,   238,    -1,    -1,   272,    -1,    -1,   225,   196,
      -1,   239,    -1,   200,    -1,    -1,    -1,    -1,    -1,    -1,
     237,    -1,   209,   210,    -1,    -1,    -1,   255,   264,    -1,
      -1,   263,    -1,   261,    -1,    -1,   247,    -1,   215,   250,
      -1,   277,   274,   271,    -1,   191,   223,    -1,    -1,   195,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   244,   286,    -1,
     247,   272,    -1,   250,    -1,   282,    -1,    -1,    -1,   256,
      -1,    -1,    -1,   219,   205,    -1,    -1,    -1,   265,    -1,
      -1,   258,    -1,   270,    -1,   272,   273,    -1,    -1,   235,
      17,    18,    19,    20,    17,    18,    19,    20,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    32,   252,   253,   285,    32,
      -1,    -1,   289,   290,    41,    -1,    -1,    -1,    41,    -1,
      -1,    -1,    49,    50,    -1,    -1,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,   280,    -1,    30,    31,   284,    33,
      34,    -1,    36,    37,    38,    39,    40,    -1,    -1,    -1,
      -1,    45,   136,   137,   138,   139,   140,   141,   142,   143,
     144,    22,    23,    24,    25,    26,    27,    28,    29
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,    22,    23,    24,    25,    26,    27,    28,    29,    52,
      54,    55,    56,    57,    50,    58,    58,    58,    58,    58,
      58,    58,    58,     0,     3,    53,    78,    54,    41,    97,
      97,    97,    97,    97,    97,    97,    97,    69,    70,    78,
      50,   116,    50,    60,    42,    98,    60,    60,    60,    98,
      60,    60,    69,   116,    43,    99,    48,   104,    99,    98,
     104,   104,    97,    98,   104,    10,    85,    99,     4,    79,
      60,     9,    14,    16,    50,    58,    61,    62,    84,    89,
      91,    99,   116,    99,    60,    60,    17,    18,    19,    20,
      32,    49,    58,    63,    64,    92,    93,    94,    95,    97,
     107,   116,   117,    97,    60,   116,    71,     5,    80,   104,
      97,    44,   100,    61,    97,    97,    97,    61,    35,    45,
     101,   110,    61,    98,   104,    97,    98,    30,    31,    33,
      34,    36,    37,    38,    39,    40,   101,   105,   106,   108,
     109,   111,   112,   113,   114,   115,    12,    87,   116,    63,
      63,    63,    98,    99,    13,    72,    73,    74,    77,    79,
      87,    88,   116,     6,    81,    60,    63,    65,    66,    63,
      63,    63,   100,    63,    63,   100,    99,    60,    65,    64,
      64,    64,    64,    64,    64,    64,    64,    64,    21,    96,
     116,   101,    97,    98,    98,    97,    71,   100,    73,   116,
      77,   101,     7,    82,    59,   104,    48,    98,    98,    98,
      98,    46,   102,    47,   103,    61,    59,    98,   102,    97,
      63,    98,    63,    73,   103,   116,   102,    97,    98,    60,
      66,   103,   103,    62,    62,   110,   100,    98,    63,    67,
      68,   102,    98,   100,    97,     8,    83,    99,    59,    15,
      90,    63,    97,   104,    98,    75,    77,   101,    61,    62,
     103,    63,    68,    98,   116,   102,   100,    98,    99,    76,
     104,   116,    71,    77,    98,    61,   116,   116,    99,    11,
      86,    76,    84,    63,    97,   103,    63,   100,    98,   103,
     100,   100
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    51,    52,    53,    54,    54,    55,    55,    56,    56,
      56,    56,    57,    57,    57,    57,    58,    59,    59,    60,
      61,    61,    62,    62,    62,    62,    62,    62,    62,    62,
      63,    63,    63,    63,    63,    63,    63,    63,    63,    63,
      63,    63,    63,    64,    64,    64,    64,    64,    64,    64,
      64,    64,    65,    65,    66,    66,    67,    67,    68,    68,
      69,    69,    70,    70,    71,    71,    72,    73,    73,    74,
      75,    75,    76,    76,    77,    77,    77,    77,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    95,    96,    97,    98,    99,
     100,   101,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     3,    21,     0,     2,     1,     1,    13,     7,
       8,    10,    13,     7,     8,    10,     1,     0,     3,     1,
       0,     2,     3,     5,     4,     7,     5,     7,     5,     5,
       3,     3,     3,     3,     3,     3,     3,     3,     4,     3,
       1,     6,     4,     1,     1,     1,     1,     1,     2,     5,
       4,     3,     0,     1,     1,     3,     0,     1,     1,     3,
       0,     2,     6,     8,     0,     2,     3,     0,     2,    13,
       0,     3,     0,     4,     3,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1
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
  case 2: /* Goal: MacDefStar MainClass TypeDecStar  */
#line 100 "A1.y"
                                       {printNodeList(code);}
#line 1562 "A1.tab.c"
    break;

  case 8: /* MacDefStmt: DEFSTMT MacIdef Lparen ArgIdef Comma ArgIdef Comma ArgIdef ArgIdefStar Rparen Lbrace StatementStar Rbrace  */
#line 111 "A1.y"
                        {
				processMacroStmt((yyvsp[-11].list), (yyvsp[-1].list));
			}
#line 1570 "A1.tab.c"
    break;

  case 9: /* MacDefStmt: DEFSTMT0 MacIdef Lparen Rparen Lbrace StatementStar Rbrace  */
#line 115 "A1.y"
                        {
				processMacroStmt((yyvsp[-5].list), (yyvsp[-1].list));
			}
#line 1578 "A1.tab.c"
    break;

  case 10: /* MacDefStmt: DEFSTMT1 MacIdef Lparen ArgIdef Rparen Lbrace StatementStar Rbrace  */
#line 119 "A1.y"
                        {
				processMacroStmt((yyvsp[-6].list), (yyvsp[-1].list));
			}
#line 1586 "A1.tab.c"
    break;

  case 11: /* MacDefStmt: DEFSTMT2 MacIdef Lparen ArgIdef Comma ArgIdef Rparen Lbrace StatementStar Rbrace  */
#line 123 "A1.y"
                        {
				processMacroStmt((yyvsp[-8].list), (yyvsp[-1].list));
			}
#line 1594 "A1.tab.c"
    break;

  case 12: /* MacDefExp: DEFEXP MacIdef Lparen ArgIdef Comma ArgIdef Comma ArgIdef ArgIdefStar Rparen Lparen Expression Rparen  */
#line 128 "A1.y"
                        {
				processMacroExp((yyvsp[-11].list), (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
			}
#line 1602 "A1.tab.c"
    break;

  case 13: /* MacDefExp: DEFEXP0 MacIdef Lparen Rparen Lparen Expression Rparen  */
#line 132 "A1.y"
                        {
				processMacroExp((yyvsp[-5].list), (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
			}
#line 1610 "A1.tab.c"
    break;

  case 14: /* MacDefExp: DEFEXP1 MacIdef Lparen ArgIdef Rparen Lparen Expression Rparen  */
#line 136 "A1.y"
                        {
				processMacroExp((yyvsp[-6].list), (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
			}
#line 1618 "A1.tab.c"
    break;

  case 15: /* MacDefExp: DEFEXP2 MacIdef Lparen ArgIdef Comma ArgIdef Rparen Lparen Expression Rparen  */
#line 140 "A1.y"
                        {
				processMacroExp((yyvsp[-8].list), (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
			}
#line 1626 "A1.tab.c"
    break;

  case 16: /* MacIdef: ID  */
#line 144 "A1.y"
            { store++; (yyval.list) = newList((yyvsp[0].node)); }
#line 1632 "A1.tab.c"
    break;

  case 19: /* ArgIdef: ID  */
#line 149 "A1.y"
            { addNode(&arg_list, (yyvsp[0].node)); }
#line 1638 "A1.tab.c"
    break;

  case 20: /* StatementStar: %empty  */
#line 151 "A1.y"
                      { if(store) (yyval.list) = NULL; }
#line 1644 "A1.tab.c"
    break;

  case 21: /* StatementStar: Statement StatementStar  */
#line 152 "A1.y"
                                                  { if(store) (yyval.list) = concatList(2, (yyvsp[-1].list), (yyvsp[0].list)); }
#line 1650 "A1.tab.c"
    break;

  case 22: /* Statement: Lbrace StatementStar Rbrace  */
#line 155 "A1.y"
                        {
				if(store) (yyval.list) = concatList(3, (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
			}
#line 1658 "A1.tab.c"
    break;

  case 23: /* Statement: Println Lparen Expression Rparen Semicolon  */
#line 159 "A1.y"
                        {
				if(store) (yyval.list) = concatList(5, (yyvsp[-4].list), (yyvsp[-3].list), (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
			}
#line 1666 "A1.tab.c"
    break;

  case 24: /* Statement: Idef Equal Expression Semicolon  */
#line 163 "A1.y"
                        {
				if(store) (yyval.list) = concatList(4, (yyvsp[-3].list), (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
			}
#line 1674 "A1.tab.c"
    break;

  case 25: /* Statement: Idef Lbracket Expression Rbracket Equal Expression Semicolon  */
#line 167 "A1.y"
                        {
				if(store) (yyval.list) = concatList(7, (yyvsp[-6].list), (yyvsp[-5].list), (yyvsp[-4].list), (yyvsp[-3].list), (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
			}
#line 1682 "A1.tab.c"
    break;

  case 26: /* Statement: If Lparen Expression Rparen Statement  */
#line 171 "A1.y"
                        {
				if(store) (yyval.list) = concatList(5, (yyvsp[-4].list), (yyvsp[-3].list), (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
			}
#line 1690 "A1.tab.c"
    break;

  case 27: /* Statement: If Lparen Expression Rparen Statement Else Statement  */
#line 175 "A1.y"
                        {
				if(store) (yyval.list) = concatList(7, (yyvsp[-6].list), (yyvsp[-5].list), (yyvsp[-4].list), (yyvsp[-3].list), (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
			}
#line 1698 "A1.tab.c"
    break;

  case 28: /* Statement: While Lparen Expression Rparen Statement  */
#line 179 "A1.y"
                        {
				if(store) (yyval.list) = concatList(5, (yyvsp[-4].list), (yyvsp[-3].list), (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
			}
#line 1706 "A1.tab.c"
    break;

  case 29: /* Statement: MacIdef Lparen ExpArgs Rparen Semicolon  */
#line 183 "A1.y"
                        {
				(yyval.list) = replaceMacro(&mac_stmt_list, (yyvsp[-4].list)->head, (yyvsp[-2].list));
				store--;
				if(!store) code = concatList(2, code, (yyval.list));
			}
#line 1716 "A1.tab.c"
    break;

  case 30: /* Expression: PrmExp And PrmExp  */
#line 190 "A1.y"
                        {
				if(store) (yyval.list) = concatList(3, (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
			}
#line 1724 "A1.tab.c"
    break;

  case 31: /* Expression: PrmExp Or PrmExp  */
#line 194 "A1.y"
                        {
				if(store) (yyval.list) = concatList(3, (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
			}
#line 1732 "A1.tab.c"
    break;

  case 32: /* Expression: PrmExp Noteq PrmExp  */
#line 198 "A1.y"
                        {
				if(store) (yyval.list) = concatList(3, (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
			}
#line 1740 "A1.tab.c"
    break;

  case 33: /* Expression: PrmExp Lesseq PrmExp  */
#line 202 "A1.y"
                        {
				if(store) (yyval.list) = concatList(3, (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
			}
#line 1748 "A1.tab.c"
    break;

  case 34: /* Expression: PrmExp Add PrmExp  */
#line 206 "A1.y"
                        {
				if(store) (yyval.list) = concatList(3, (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
			}
#line 1756 "A1.tab.c"
    break;

  case 35: /* Expression: PrmExp Sub PrmExp  */
#line 210 "A1.y"
                        {
				if(store) (yyval.list) = concatList(3, (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
			}
#line 1764 "A1.tab.c"
    break;

  case 36: /* Expression: PrmExp Mul PrmExp  */
#line 214 "A1.y"
                        {
				if(store) (yyval.list) = concatList(3, (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
			}
#line 1772 "A1.tab.c"
    break;

  case 37: /* Expression: PrmExp Div PrmExp  */
#line 218 "A1.y"
                        {
				if(store) (yyval.list) = concatList(3, (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
			}
#line 1780 "A1.tab.c"
    break;

  case 38: /* Expression: PrmExp Lbracket PrmExp Rbracket  */
#line 222 "A1.y"
                        {
				if(store) (yyval.list) = concatList(4, (yyvsp[-3].list), (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
			}
#line 1788 "A1.tab.c"
    break;

  case 39: /* Expression: PrmExp Dot Length  */
#line 226 "A1.y"
                        {
				if(store) (yyval.list) = concatList(3, (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
			}
#line 1796 "A1.tab.c"
    break;

  case 40: /* Expression: PrmExp  */
#line 230 "A1.y"
                        {
				if(store) (yyval.list) = (yyvsp[0].list);
			}
#line 1804 "A1.tab.c"
    break;

  case 41: /* Expression: PrmExp Dot Idef Lparen CallArgs Rparen  */
#line 234 "A1.y"
                        {
				if(store) (yyval.list) = concatList(6, (yyvsp[-5].list), (yyvsp[-4].list), (yyvsp[-3].list), (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
			}
#line 1812 "A1.tab.c"
    break;

  case 42: /* Expression: MacIdef Lparen ExpArgs Rparen  */
#line 238 "A1.y"
                        {
				(yyval.list) = replaceMacro(&mac_exp_list, (yyvsp[-3].list)->head, (yyvsp[-1].list));
				store--;
				if(!store) code = concatList(2, code, (yyval.list));
			}
#line 1822 "A1.tab.c"
    break;

  case 43: /* PrmExp: Integer  */
#line 244 "A1.y"
                {if(store) (yyval.list) = (yyvsp[0].list);}
#line 1828 "A1.tab.c"
    break;

  case 44: /* PrmExp: True  */
#line 245 "A1.y"
                       {if(store) (yyval.list) = (yyvsp[0].list);}
#line 1834 "A1.tab.c"
    break;

  case 45: /* PrmExp: False  */
#line 246 "A1.y"
                        {if(store) (yyval.list) = (yyvsp[0].list);}
#line 1840 "A1.tab.c"
    break;

  case 46: /* PrmExp: Idef  */
#line 247 "A1.y"
                        {if(store) (yyval.list) = (yyvsp[0].list);}
#line 1846 "A1.tab.c"
    break;

  case 47: /* PrmExp: This  */
#line 248 "A1.y"
                        {if(store) (yyval.list) = (yyvsp[0].list);}
#line 1852 "A1.tab.c"
    break;

  case 48: /* PrmExp: Not Expression  */
#line 250 "A1.y"
                {
			if(store) (yyval.list) = concatList(2, (yyvsp[-1].list), (yyvsp[0].list));
		}
#line 1860 "A1.tab.c"
    break;

  case 49: /* PrmExp: New Int Lbracket Expression Rbracket  */
#line 254 "A1.y"
                {
			if(store) (yyval.list) = concatList(5, (yyvsp[-4].list), (yyvsp[-3].list), (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
		}
#line 1868 "A1.tab.c"
    break;

  case 50: /* PrmExp: New Idef Lparen Rparen  */
#line 258 "A1.y"
                {
			if(store) (yyval.list) = concatList(4, (yyvsp[-3].list), (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
		}
#line 1876 "A1.tab.c"
    break;

  case 51: /* PrmExp: Lparen Expression Rparen  */
#line 262 "A1.y"
                {
			if(store) (yyval.list) = concatList(3, (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
		}
#line 1884 "A1.tab.c"
    break;

  case 52: /* ExpArgs: %empty  */
#line 266 "A1.y"
                { (yyval.list) = NULL; }
#line 1890 "A1.tab.c"
    break;

  case 53: /* ExpArgs: ExpArgsEnd  */
#line 267 "A1.y"
                                     { (yyval.list) = (yyvsp[0].list); }
#line 1896 "A1.tab.c"
    break;

  case 54: /* ExpArgsEnd: Expression  */
#line 270 "A1.y"
                        {
				cNode *temp = malloc(sizeof(cNode));
				temp->data = (yyvsp[0].list);
				(yyval.list) = newList(temp);
			}
#line 1906 "A1.tab.c"
    break;

  case 55: /* ExpArgsEnd: Expression COMMA ExpArgsEnd  */
#line 276 "A1.y"
                        {
				cNode *temp = malloc(sizeof(cNode));
				temp->data = (yyvsp[-2].list);
				(yyval.list) = concatList(2, newList(temp), (yyvsp[0].list));
			}
#line 1916 "A1.tab.c"
    break;

  case 56: /* CallArgs: %empty  */
#line 282 "A1.y"
                 { if(store) (yyval.list) = NULL; }
#line 1922 "A1.tab.c"
    break;

  case 57: /* CallArgs: CallArgsEnd  */
#line 283 "A1.y"
                                      { if(store) (yyval.list) = (yyvsp[0].list); }
#line 1928 "A1.tab.c"
    break;

  case 58: /* CallArgsEnd: Expression  */
#line 285 "A1.y"
                        { if(store) (yyval.list) = (yyvsp[0].list); }
#line 1934 "A1.tab.c"
    break;

  case 59: /* CallArgsEnd: Expression Comma CallArgsEnd  */
#line 287 "A1.y"
                        {
				if(store) (yyval.list) = concatList(3, (yyvsp[-2].list), (yyvsp[-1].list), (yyvsp[0].list));
			}
#line 1942 "A1.tab.c"
    break;

  case 78: /* Class: CLASS  */
#line 310 "A1.y"
                        {processTerminal((yyval.list), (yyvsp[0].node));}
#line 1948 "A1.tab.c"
    break;

  case 79: /* Public: PUBLIC  */
#line 311 "A1.y"
                        {processTerminal((yyval.list), (yyvsp[0].node));}
#line 1954 "A1.tab.c"
    break;

  case 80: /* Static: STATIC  */
#line 312 "A1.y"
                        {processTerminal((yyval.list), (yyvsp[0].node));}
#line 1960 "A1.tab.c"
    break;

  case 81: /* Void: VOID  */
#line 313 "A1.y"
                                {processTerminal((yyval.list), (yyvsp[0].node));}
#line 1966 "A1.tab.c"
    break;

  case 82: /* Main: MAIN  */
#line 314 "A1.y"
                                {processTerminal((yyval.list), (yyvsp[0].node));}
#line 1972 "A1.tab.c"
    break;

  case 83: /* String: STRING  */
#line 315 "A1.y"
                        {processTerminal((yyval.list), (yyvsp[0].node));}
#line 1978 "A1.tab.c"
    break;

  case 84: /* Println: PRINTLN  */
#line 316 "A1.y"
                        {processTerminal((yyval.list), (yyvsp[0].node));}
#line 1984 "A1.tab.c"
    break;

  case 85: /* Extends: EXTENDS  */
#line 317 "A1.y"
                        {processTerminal((yyval.list), (yyvsp[0].node));}
#line 1990 "A1.tab.c"
    break;

  case 86: /* Return: RETURN  */
#line 318 "A1.y"
                        {processTerminal((yyval.list), (yyvsp[0].node));}
#line 1996 "A1.tab.c"
    break;

  case 87: /* Int: INT  */
#line 319 "A1.y"
                                {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2002 "A1.tab.c"
    break;

  case 88: /* Boolean: BOOLEAN  */
#line 320 "A1.y"
                        {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2008 "A1.tab.c"
    break;

  case 89: /* If: IF  */
#line 321 "A1.y"
                                {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2014 "A1.tab.c"
    break;

  case 90: /* Else: ELSE  */
#line 322 "A1.y"
                        {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2020 "A1.tab.c"
    break;

  case 91: /* While: WHILE  */
#line 323 "A1.y"
                        {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2026 "A1.tab.c"
    break;

  case 92: /* True: TRUE  */
#line 324 "A1.y"
                                {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2032 "A1.tab.c"
    break;

  case 93: /* False: FALSE  */
#line 325 "A1.y"
                        {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2038 "A1.tab.c"
    break;

  case 94: /* This: THIS  */
#line 326 "A1.y"
                                {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2044 "A1.tab.c"
    break;

  case 95: /* New: NEW  */
#line 327 "A1.y"
                                {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2050 "A1.tab.c"
    break;

  case 96: /* Length: LENGTH  */
#line 328 "A1.y"
                        {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2056 "A1.tab.c"
    break;

  case 97: /* Lparen: LPAREN  */
#line 329 "A1.y"
                        {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2062 "A1.tab.c"
    break;

  case 98: /* Rparen: RPAREN  */
#line 330 "A1.y"
                        {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2068 "A1.tab.c"
    break;

  case 99: /* Lbrace: LBRACE  */
#line 331 "A1.y"
                        {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2074 "A1.tab.c"
    break;

  case 100: /* Rbrace: RBRACE  */
#line 332 "A1.y"
                        {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2080 "A1.tab.c"
    break;

  case 101: /* Lbracket: LBRACKET  */
#line 333 "A1.y"
                        {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2086 "A1.tab.c"
    break;

  case 102: /* Rbracket: RBRACKET  */
#line 334 "A1.y"
                        {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2092 "A1.tab.c"
    break;

  case 103: /* Semicolon: SEMICOLON  */
#line 335 "A1.y"
                     {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2098 "A1.tab.c"
    break;

  case 104: /* Comma: COMMA  */
#line 336 "A1.y"
                        {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2104 "A1.tab.c"
    break;

  case 105: /* And: AND  */
#line 337 "A1.y"
                                {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2110 "A1.tab.c"
    break;

  case 106: /* Or: OR  */
#line 338 "A1.y"
                                {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2116 "A1.tab.c"
    break;

  case 107: /* Not: NOT  */
#line 339 "A1.y"
                                {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2122 "A1.tab.c"
    break;

  case 108: /* Noteq: NOTEQ  */
#line 340 "A1.y"
                        {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2128 "A1.tab.c"
    break;

  case 109: /* Lesseq: LESSEQ  */
#line 341 "A1.y"
                        {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2134 "A1.tab.c"
    break;

  case 110: /* Equal: EQUAL  */
#line 342 "A1.y"
                        {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2140 "A1.tab.c"
    break;

  case 111: /* Add: ADD  */
#line 343 "A1.y"
                                {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2146 "A1.tab.c"
    break;

  case 112: /* Sub: SUB  */
#line 344 "A1.y"
                                {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2152 "A1.tab.c"
    break;

  case 113: /* Mul: MUL  */
#line 345 "A1.y"
                                {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2158 "A1.tab.c"
    break;

  case 114: /* Div: DIV  */
#line 346 "A1.y"
                                {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2164 "A1.tab.c"
    break;

  case 115: /* Dot: DOT  */
#line 347 "A1.y"
                                {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2170 "A1.tab.c"
    break;

  case 116: /* Idef: ID  */
#line 348 "A1.y"
                                {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2176 "A1.tab.c"
    break;

  case 117: /* Integer: INTEGER  */
#line 349 "A1.y"
                        {processTerminal((yyval.list), (yyvsp[0].node));}
#line 2182 "A1.tab.c"
    break;


#line 2186 "A1.tab.c"

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

#line 350 "A1.y"


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
