Class {
	#name : #MyRPNWidget,
	#superclass : #WAComponent,
	#instVars : [
		'stackMachine'
	],
	#category : #'MH-calculator'
}

{ #category : #initialization }
MyRPNWidget >> setMyStackMachine [
	stackMachine := MyStackMachine new.
	
	
]

{ #category : #initialization }
MyRPNWidget >> setMyStackMachine: aStackMachine [
"to pass the same instance to subclasses"
stackMachine := aStackMachine .

]

{ #category : #hooks }
MyRPNWidget >> style [
	^ 'table.keypad {float: left;}
td.key { 
border: 1px solid grey ;
background: white;
padding: 4px;
text-align: center;
 }
table.stack { float: left; }
td.stackcell { 
border: 2px solid white;
border-left-color: grey;
border-right-color: grey;
border-bottom-color: grey;
padding: 4px;
text-align: right;
 }
td.small { font-size:8pt } '
]
