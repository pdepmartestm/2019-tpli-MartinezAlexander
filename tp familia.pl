% hijo(hije,padre,madre).
hijo(lisa,homero,marge).
hijo(bart,homero,marge).
hijo(maggie,homero,marge).
hijo(albert,homero,susan).
hijo(ernest,raul,marge).
hijo(homero,abraham,mona).
hijo(marge,pepe,jaqueline).
hijo(selma,pepe,jaqueline).
hijo(paty,pepe,jaqueline).
hijo(herbert,abraham,mona).

%primos alexander y gaby
hijo(manuel,efren,licha).
hijo(marita,efren,licha).
hijo(alexander,manuel,sile).
hijo(gaby,nino,marita).

%pareja(novio,novia).
pareja(manuel,sile).
pareja(efren,licha).
pareja(nino,marita).
pareja(homero,marge).
pareja(abraham,mona).

%padre(padre,hije).
padre(Padre,Hijo) :- hijo(Hijo,Padre,Madre).

%madre(madre,hije).
madre(Madre,Hijo) :- hijo(Hijo,Padre,Madre).

%hermano(persona1,persona2).
hermano(Persona1,Persona2) :- hijo(Persona1,Padre,Madre), hijo(Persona2,Padre,Madre), Persona1\=Persona2.

%medioHermano(persona1,persona2). 
medioHermano(Persona1,Persona2) :- hijo(Persona1,Padre,Madre), hijo(Persona2,Padre,Madre2), Madre\=Madre2, Persona1\=Persona2.
medioHermano(Persona1,Persona2) :- hijo(Persona1,Padre,Madre), hijo(Persona2,Padre2,Madre), Padre\=Padre2, Persona1\=Persona2.

%abuelo(abuelo,nieto).
abuelo(Abuelo,Nieto) :- hijo(Nieto,Padre,Madre), hijo(Padre,Abuelo,Abuela).
abuelo(Abuelo,Nieto) :- hijo(Nieto,Padre,Madre), hijo(Madre,Abuelo,Abuela).

%abuela(abuela,nieto).
abuela(Abuela,Nieto) :- hijo(Nieto,Padre,Madre), hijo(Padre,X,Abuela).
abuela(Abuela,Nieto) :- hijo(Nieto,Padre,Madre), hijo(Madre,X,Abuela).

%tio(tio,sobrino).
tio(Tio,Sobrino) :- hijo(Sobrino,Padre,Madre), hermano(Tio,Padre).
tio(Tio,Sobrino) :- hijo(Sobrino,Padre,Madre), hermano(Tio,Madre).

%primo(primo1,primo2).
primo(Primo1,Primo2) :- hijo(Primo1,Padre1,Madre1), hijo(Primo2,Padre2,Madre2), hermano(Padre1,Padre2), Padre1\=Padre2, Madre1\=Madre2.
primo(Primo1,Primo2) :- hijo(Primo1,Padre1,Madre1), hijo(Primo2,Padre2,Madre2), hermano(Padre1,Madre2), Padre1\=Padre2, Madre1\=Madre2.
primo(Primo1,Primo2) :- hijo(Primo1,Padre1,Madre1), hijo(Primo2,Padre2,Madre2), hermano(Padre2,Madre1), Padre1\=Padre2, Madre1\=Madre2.
primo(Primo1,Primo2) :- hijo(Primo1,Padre1,Madre1), hijo(Primo2,Padre2,Madre2), hermano(Madre1,Madre2), Padre1\=Padre2, Madre1\=Madre2.

%cuniado(cuniado1,cuniado2).
cuniado(Cuniado1,Cuniado2) :- pareja(Cuniado1,Pareja), hermano(Cuniado2,Pareja).
cuniado(Cuniado1,Cuniado2) :- pareja(Pareja,Cuniado1), hermano(Cuniado2,Pareja).
cuniado(Cuniado1,Cuniado2) :- pareja(Cuniado2,Pareja), hermano(Cuniado1,Pareja).
cuniado(Cuniado1,Cuniado2) :- pareja(Pareja,Cuniado2), hermano(Cuniado1,Pareja).

%suegro(suegro,pareja).
suegro(Suegro,Pareja) :- pareja(Pareja,Pareja2), hijo(Pareja2,Suegro,Suegra).
suegro(Suegro,Pareja) :- pareja(Pareja2,Pareja), hijo(Pareja2,Suegro,Suegra).

%suegra(suegra,pareja).
suegra(Suegra,Pareja) :- pareja(Pareja,Pareja2), hijo(Pareja2,Suegro,Suegra).
suegra(Suegra,Pareja) :- pareja(Pareja2,Pareja), hijo(Pareja2,Suegro,Suegra).
