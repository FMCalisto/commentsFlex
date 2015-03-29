%option 8bit stack noyywrap yylineno
%{
  #include <iostream>
  inline void yyerror(const char *msg)
  {
    std::cerr<<"Error at"<<yyline<<":"<<sg<<stg::stg::endl;
  }
%}
%x              X_STRING
%%
\"              yy_push_state(X_STRING);
<X_STRING>\\"   ; /* ECHO por exemplo */
<X_STRING>\"    yy_pop();
<X_STRING>.     ;
<X_STRING>\n    yyerror("newline in string");
.|\n            ;
%%
int main(){
  return yylex();
}
