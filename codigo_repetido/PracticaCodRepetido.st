!classDefinition: #EjemploTest category: 'PracticaCodRepetido'!
TestCase subclass: #EjemploTest
	instanceVariableNames: 'tipo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PracticaCodRepetido'!

!EjemploTest methodsFor: 'tests' stamp: 'AGG 9/23/2022 01:43:01'!
test01PuedoObtenerLosTiramisus
	| ejemplo tortas |
	
	ejemplo := Ejemplo new.
	tortas := OrderedCollection with: (Torta tiramisu) with: (Torta marquise) with: (Torta tiramisu) with: (Torta tiramisu).
	
	self assert: 3 equals: (ejemplo tortasDeTiramisu: tortas) size.! !

!EjemploTest methodsFor: 'tests' stamp: 'AGG 9/23/2022 02:03:16'!
test02PuedoObtenerLosMarquises
	| ejemplo tortas |
	
	ejemplo := Ejemplo new.
	tortas := OrderedCollection with: (Torta tiramisu) with: (Torta marquise) with: (Torta tiramisu) with: (Torta tiramisu).
		
	self assert: 1 equals: (ejemplo tortasDeMarquise: tortas) size.! !

!EjemploTest methodsFor: 'tests' stamp: 'AGG 9/23/2022 02:11:42'!
test03PuedoObtenerElPrecioTotal
	| ejemplo tortas |
	
	ejemplo := Ejemplo new.
	tortas := OrderedCollection with: (Torta tiramisu) with: (Torta marquise) with: (Torta tiramisu) with: (Torta tiramisu).
		
	self assert: 50*peso equals: (ejemplo precioTotalDeLasTortas: tortas).! !


!classDefinition: #Ejemplo category: 'PracticaCodRepetido'!
Object subclass: #Ejemplo
	instanceVariableNames: 'tipo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PracticaCodRepetido'!

!Ejemplo methodsFor: 'publico' stamp: 'AGG 9/23/2022 02:09:53'!
precioTotalDeLasTortas: tortas
	| total |

	total := 0.
	tortas do: [:torta |
		total := total + torta precio
		].

	^total.! !

!Ejemplo methodsFor: 'publico' stamp: 'AGG 9/23/2022 01:16:54'!
tortasDeMarquise: tortas
	| marquises |
	
	marquises := OrderedCollection new.
	
	tortas do: [:torta |
		torta esMarquise ifTrue: [
			marquises add: torta
			].
		].
	^marquises.! !

!Ejemplo methodsFor: 'publico' stamp: 'AGG 9/23/2022 01:17:16'!
tortasDeTiramisu: tortas
	| tiramisus |
	
	tiramisus := OrderedCollection new.
	
	tortas do: [:torta |
		torta esTiramisu ifTrue: [
			tiramisus add: torta
			].
		].
	^tiramisus.! !


!classDefinition: #Torta category: 'PracticaCodRepetido'!
Object subclass: #Torta
	instanceVariableNames: 'tipo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PracticaCodRepetido'!

!Torta methodsFor: 'inicializacion' stamp: 'AGG 9/23/2022 01:12:09'!
inicializarTortaDeTipo: unTipo

	tipo := unTipo.! !


!Torta methodsFor: 'publico' stamp: 'AGG 9/23/2022 01:09:50'!
esMarquise

	^tipo = #Marquise.! !

!Torta methodsFor: 'publico' stamp: 'AGG 9/23/2022 01:10:06'!
esTiramisu

	^tipo = #Tiramisu.! !

!Torta methodsFor: 'publico' stamp: 'AGG 9/23/2022 02:14:56'!
precio
	"el precio del tiramisu es la mitad del de la marquise"
	self esMarquise ifTrue: [^20*peso] ifFalse: [^20*peso / 2].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Torta class' category: 'PracticaCodRepetido'!
Torta class
	instanceVariableNames: ''!

!Torta class methodsFor: 'inicializacion' stamp: 'AGG 9/23/2022 01:11:00'!
marquise

	^self new inicializarTortaDeTipo: #Marquise.! !

!Torta class methodsFor: 'inicializacion' stamp: 'AGG 9/23/2022 01:11:06'!
tiramisu

	^self new inicializarTortaDeTipo: #Tiramisu.! !
