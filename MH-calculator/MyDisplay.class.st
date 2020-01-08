Class {
	#name : #MyDisplay,
	#superclass : #MyRPNWidget,
	#instVars : [
		'showStack'
	],
	#category : #'MH-calculator'
}

{ #category : #initialization }
MyDisplay >> initialize [ 
	super initialize.
	showStack := false
]

{ #category : #rendering }
MyDisplay >> renderContentOn: html [
		html table
		class: 'keypad';
		with: [ 	html tableRow:[ 
							html tableData
							     class: 'stackcell';
								  with: stackMachine stack last].
					html tableRow: [ html tableData with:
							 			[ html anchor callback: 
										[self call: (MyDisplayStack new setMyStackMachine: stackMachine ) ];
										with: 'Open'  ] ].
						 ] 
	
"html table
		class: 'keypad';
		with: [ stackMachine stack do: 
					[:ea |
							html tableRow:[ 
							html tableData
							     class: 'stackcell';
								  with: ea] ].
					html tableRow: [ html tableData with:
							 			[ html anchor callback: 
										[self call: (MyDisplayStack new setMyStackMachine: stackMachine ) ];
										with: 'Open'  ] ].
						 ] "
]

{ #category : #accessing }
MyDisplay >> showStack [
	^ showStack
]

{ #category : #accessing }
MyDisplay >> showStack: anObject [
	showStack := anObject
]

{ #category : #accessing }
MyDisplay >> stackMachine [ 
^ stackMachine 
]

{ #category : #accessing }
MyDisplay >> stackMachine: aStackMachine [
stackMachine := aStackMachine .

]
