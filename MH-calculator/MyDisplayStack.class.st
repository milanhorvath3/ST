Class {
	#name : #MyDisplayStack,
	#superclass : #MyDisplay,
	#category : #'MH-calculator'
}

{ #category : #rendering }
MyDisplayStack >> renderContentOn: html [
	html table
		class: 'keypad';
		with: [ stackMachine stack do: 
					[:ea |
							html tableRow:[ 
							html tableData
							     class: 'stackcell';
								  with: ea] ].
					html tableRow: [ html tableData with:
							 			[ html anchor callback: 
										[self answer ];
										with: 'Close'  ] ].
						 ]

]
