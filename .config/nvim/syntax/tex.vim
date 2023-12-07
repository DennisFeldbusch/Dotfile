syntax region Statement start='\\verb|' end='|' transparent contains=myStart,myEnd
syntax match myStart '\\verb|\ze\w\+' contained conceal cchar=[
syntax match myEnd '\(\\verb|\w\+\)\@<=\zs|' contained conceal cchar=]
