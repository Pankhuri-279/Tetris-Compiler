%{
#include <math.h>
#include <stdlib.h>
#include <stdio.h>

#include "extetrickstype.h"

void yyerror(char*);

%}

%%
Section1	{ fprintf(stderr,"%d.",1); return SECTION1; }
Section2	{ fprintf(stderr,"%d.",2); return SECTION2; }
Section3	{ fprintf(stderr,"%d.",3); return SECTION3; }
if	{ yylval = NewSymbol(yytext, IF); fprintf(stderr,"%d.",4); return IF; } 
then	{ yylval = NewSymbol(yytext, THEN);fprintf(stderr,"%d.",5); return THEN; }
else	{ yylval = NewSymbol(yytext, ELSE);fprintf(stderr,"%d.",6); return ELSE; }
end	{ yylval = NewSymbol(yytext, END); fprintf(stderr,"%d.",7); return END; }
while	{ fprintf(stderr,"%d.",8); return WHILE; }
call	{ fprintf(stderr,"%d.",9); return CALL; }
with	{ fprintf(stderr,"%d.",10); return WITH; }
or	{ fprintf(stderr,"%d.",11); return OR; }
and	{ fprintf(stderr,"%d.",12); return AND; }
not	{ fprintf(stderr,"%d.",13); return NOT; }
neg	{	fprintf(stderr,"%d.",14); return NEG; }
play	{ fprintf(stderr,"%d.",15); return PLAY; }
[A-Za-z][A-Za-z0-9_]* { yylval = NewSymbol(yytext, ID); fprintf(stderr,"%d.",16); return ID; }
[0-9][0-9]*		  { yylval = NewSymbol(yytext,NUM); fprintf(stderr,"%d.",17); return NUM; }
[0-9][0-9]*\.[0-9]+	  { yylval = NewSymbol(yytext,NUM); fprintf(stderr,"%d.",17); return NUM; }
#[\n\r]			{ fprintf(stderr,"%d.",18); return NEWLINE; }
[ \t\n\r]*			  { fprintf(stderr,"%d.",19); /* Do nothing, drop them. */ }
.                         { fprintf(stderr,"%d.",20); return *yytext; }
%%

#ifdef STANDALONE_LEXER
int main(void)
	{
	while(yylex()!='q');
	}
#endif

