%option 8bit stack noyywrap yylineno
%{
  #include <stdio.h>
  int c = 0, w = 0, l = 0;
%}
word [^ \t \n] +
col \n
%%
{word}  {w++, c+=yyleng;};
{eol}   {c++; l++;}
.       {c++;}
%%
int main()
{
  yylex();
  printf("%d %d %d \n", l, w, c);
}
