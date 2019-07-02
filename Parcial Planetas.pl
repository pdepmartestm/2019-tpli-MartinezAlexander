% -- PARCIAL PLANETAS

% -- Base de conocimiento

% planeta(NombrePlaneta,DueñoPlaneta,CantidadDePoblacionPlaneta)
planeta(mercurio,zeus,10).
planeta(marte,thor,456312156).
planeta(tierra,dios,13545643256).
planeta(venus,atenea,0).

% habitante(NombreHabitante,PlanetaDondeVive,ListaDeTrabajos)
habitante(pedro,mercurio,[carpintero,herrero]).
habitante(juan,mercurio,[panadero,repostero]).
habitante(mercedes,mercurio,[doctor,rebelde]).
habitante(raul,mercurio,[granjero,apicultor]).
habitante(ciro,mercurio,[granjero]).
habitante(kratos,marte,[monje]).
habitante(cirr,marte,[rebelde]).
habitante(brisa,marte,[granjero,pastor]).

% -- Primerta parte

% -- Punto 1
esEmperador(Emperador):-
    planeta(_,Emperador,_).

esPlanetaDe(Planeta,Duenio):-
    planeta(Planeta,Duenio,_).

tieneAlgunHabitanteRebelde(Planeta,Rebelde):-
    habitante(Rebelde,Planeta,Trabajos),
    member(rebelde,Trabajos).

crisisPlanetaria(Emperador):-
    esEmperador(Emperador),
    forall(esPlanetaDe(Planeta,Emperador),tieneAlgunHabitanteRebelde(Planeta,_)).

% -- Punto 2
esVago(Habitante):-
    habitante(Habitante,_,Trabajos),
    length(Trabajos,CantidadDeTrabajos),
    CantidadDeTrabajos<2.

deberiaDestruir(Emperador,Planeta):-
    esEmperador(Emperador),
    esPlanetaDe(Planeta,Emperador),
    forall(habitante(Habitante,Planeta,_), esVago(Habitante)).

% -- Punto 3
esMonje(Habitante):-
    habitante(Habitante,_,Trabajos),
    member(monje,Trabajos).

consumoDeComida(Planeta,Consumo):-
    planeta(Planeta,_,CantidadDePoblacionPlaneta),
    forall(habitante(Habitante,Planeta,_),not(esMonje(Habitante))),
    Consumo is CantidadDePoblacionPlaneta*2.
consumoDeComida(Planeta,Consumo):-
    planeta(Planeta,_,Consumo),
    habitante(Habitante,Planeta,_),
    esMonje(Habitante).

% -- Punto 4
esGranjero(Habitante):-
    habitante(Habitante,_,Trabajos),
    member(granjero,Trabajos).

produccionDeComida(Planeta,Produccion):-
    planeta(Planeta,_,_),
    findall(Granjero,(habitante(Granjero,Planeta,_),esGranjero(Granjero)),ListaDeGranjeros),
    length(ListaDeGranjeros,CantidadDeGranjeros),
    Produccion is CantidadDeGranjeros*10.

% -- Punto 5
planetaConPerdida(Planeta):-
    planeta(Planeta,_,_),
    consumoDeComida(Planeta,Consumo),
    produccionDeComida(Planeta,Produccion),
    Consumo>Produccion.

% -- Punto 6
consumoTotalDeSusPlanetas(Emperador,ConsumoTotal):-
    esEmperador(Emperador),
    findall(Consumo,(esPlanetaDe(Planeta,Emperador),consumoDeComida(Planeta,Consumo)),ListaDeConsumos),
    length(ListaDeConsumos,ConsumoTotal).

produccionTotalDeSusPlanetas(Emperador,ProduccionTotal):-
    esEmperador(Emperador),
    findall(Produccion,(esPlanetaDe(Planeta,Emperador),produccionDeComida(Planeta,Produccion)),ListaDeProducciones),
    length(ListaDeProducciones,ProduccionTotal).

estaAlHorno(Emperador):-
    esEmperador(Emperador),
    produccionTotalDeSusPlanetas(Emperador,ProduccionTotal),
    consumoTotalDeSusPlanetas(Emperador,ConsumoTotal),
    ConsumoTotal>(ProduccionTotal*2).

% -- Segunda Parte
