Class {
	#name : #MyCalculator,
	#superclass : #MyRPNWidget,
	#instVars : [
		'keypad',
		'display'
	],
	#category : #'MH-calculator'
}

{ #category : #testing }
MyCalculator class >> canBeRoot [
^ true

]

{ #category : #'tools registry' }
MyCalculator class >> register [
	WAAdmin register: self asApplicationAt: 'calculator'
]

{ #category : #hooks }
MyCalculator >> children [
		^ {keypad.
	display}
]

{ #category : #accessing }
MyCalculator >> display [
	^ display
]

{ #category : #accessing }
MyCalculator >> display: anObject [
	display := anObject
]

{ #category : #initialization }
MyCalculator >> initialize [
	super initialize.
	self setMyStackMachine.
	keypad := MyKeypad new.
	display := MyDisplay new.
	keypad setDisplay: display .
	keypad stackMachine: stackMachine.
	display stackMachine: stackMachine.
	
]

{ #category : #accessing }
MyCalculator >> keypad [
	^ keypad
]

{ #category : #rendering }
MyCalculator >> renderContentOn: html [
	html text: 'Primitive RPN calculator '.

	html horizontalRule.
	html div id: 'keypad'; with: keypad.
	html div id:'display'; with: display.
	
]

{ #category : #accessing }
MyCalculator >> stackMachine [ 
^ stackMachine 
]

{ #category : #hooks }
MyCalculator >> states [
^ { stackMachine stack }
]
