Class {
	#name : #MyKeypad,
	#superclass : #MyRPNWidget,
	#instVars : [
		'clearMode',
		'display'
	],
	#category : #'MH-calculator'
}

{ #category : #'as yet unclassified' }
MyKeypad >> ensureStackMachineNotEmpty [
stackMachine stack isEmpty ifTrue: [ stackMachine push:0 ].

]

{ #category : #initialization }
MyKeypad >> initialize [ 
super initialize .
clearMode := false.

]

{ #category : #rendering }
MyKeypad >> renderContentOn: html [
	self ensureStackMachineNotEmpty.
	html table
		class:'keypad';
		with: [ 
			html tableRow: [ 
					self renderStackButton: '&plus;' callback: [ self stackOp: #add ] on: html.
					self renderStackButton: '&ndash;' callback: [ self stackOp: #min ] on: html.  
					self renderStackButton: '&times;' callback: [self stackOp:#mul] on: html.
					self renderStackButton: '&divide;' callback: [self stackOp:#div] on: html.
					self renderStackButton: '&plusmn;' callback: [self stackOp:#neg] on: html ].
			html tableRow: [ 
					self renderStackButton: '1' callback: [self type: '1'] on:html.
					self renderStackButton: '2' callback: [self type: '2'] on:html.
					self renderStackButton: '3' callback: [self type: '3'] on:html.
					self renderStackButton: 'Drop' callback: [self stackPopIfNotEmpty]colSpan: 2 on: html ].
			html tableRow: [ 
					self renderStackButton: '4' callback: [self type: '4'] on:html.
					self renderStackButton: '5' callback: [self type: '5'] on:html.
					self renderStackButton: '6' callback: [self type: '6'] on:html.
					self renderStackButton: 'Exch' callback: [self stackOp: #exchg ]colSpan: 2 on: html].		
			html tableRow: [ 
					self renderStackButton: '7' callback: [self type: '7'] on:html.
					self renderStackButton: '8' callback: [self type: '8'] on:html.
					self renderStackButton: '9' callback: [self type: '9'] on:html ].
			html tableRow: [
					self renderStackButton: '0' callback: [self type: '0'] colSpan: 2 on: html.
					self renderStackButton: 'C' callback: [self stackClearTop] on:html.
					self renderStackButton: 'Enter' callback: [self stackOp: #dup. self setClearMode]colSpan: 2 on: html]
				]	
	
]

{ #category : #helpers }
MyKeypad >> renderStackButton: text callback: aBlock colSpan: anInteger on: html [
html tableData  
	class: 'key';
	colSpan: anInteger ;
	with: 
		[ html anchor 
				callback: aBlock;
				with: [ html html:text ] ]
]

{ #category : #helpers }
MyKeypad >> renderStackButton: text callback: aBlock on: html [
self 
	renderStackButton: text 
	callback: aBlock 
	colSpan: 1
	on: html
	
]

{ #category : #initialization }
MyKeypad >> resetClearMode [
clearMode := false.

]

{ #category : #initialization }
MyKeypad >> setClearMode [
clearMode := true.

]

{ #category : #initialization }
MyKeypad >> setDisplay: aDisplay [
display := aDisplay.

]

{ #category : #'as yet unclassified' }
MyKeypad >> stackClearTop [
	self stackPopIfNotEmpty.
	stackMachine push: 0
]

{ #category : #accessing }
MyKeypad >> stackMachine [ 
^ stackMachine 
]

{ #category : #accessing }
MyKeypad >> stackMachine: aStackMachine [
	stackMachine := aStackMachine
]

{ #category : #'as yet unclassified' }
MyKeypad >> stackOp: op [
[ stackMachine perform: op ] on: AssertionFailure do: [  ].

]

{ #category : #'as yet unclassified' }
MyKeypad >> stackPopIfNotEmpty [
 stackMachine stack isEmpty 
	ifFalse:[stackMachine pull]
	
]

{ #category : #'as yet unclassified' }
MyKeypad >> stackPopTopOrZero [
^ stackMachine stack isEmpty 
	ifTrue: [ 0 ]
	ifFalse: [ stackMachine pull ]
]

{ #category : #'accessing structure variables' }
MyKeypad >> type: aString [
clearMode 
ifFalse: [ stackMachine push: (self stackPopTopOrZero asString, aString) asNumber ]
ifTrue: [ 
	self stackPopTopOrZero.
	stackMachine push: (aString asNumber).
	self resetClearMode ].


]
