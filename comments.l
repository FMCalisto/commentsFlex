%option 8bit stack noyywrap yylineno
%{
  #include <string>
  #include <iostream>
  
  static std::string str;
%}
%x X_TAGG
%%
"/*"          {str=std::string("");yy_push_state(X_TAGG);}
<X_TAGG>"*/"  yy_pop_state();
<X_TAGG>"/*"  {yy_push_state(X_TAGG);} /* comment inside comment */
<X_TAGG>.|\n  str+=yytext;
.|\n          ; /* IGNORE */
%%
int man()
{
  yylex();
  std::cout<<str<<std::endl;
  
  return 0;
}
