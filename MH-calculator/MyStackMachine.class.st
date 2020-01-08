"
Stack machine as model for simple stack calculator implementation to be displayed by seaside
"
Class {
	#name : #MyStackMachine,
	#superclass : #Object,
	#instVars : [
		'stack',
		'stackPointer'
	],
	#category : #'MH-calculator'
}

{ #category : #adding }
MyStackMachine >> add [
	self
		assert: [ stack size > 1 ]
		description: 'Not enough operands in stack!'.
	self push: self pull + self pull
]

{ #category : #'tags-styles' }
MyStackMachine >> div [
	self assert: [ stack size > 1 ]
		description: 'Not enough operands in stack!'.
	self assert: [ (stack at:(stack size - 1)) ~= 0 ]
		description: 'Division by zero!'.
		self push: self pull / self pull
]

{ #category : #'as yet unclassified' }
MyStackMachine >> dup [
	self
		assert: [ stack size > 0 ]
		description: 'Not enough operands in stack!'.
	self push: (stack last).
	
	
		
]

{ #category : #'as yet unclassified' }
MyStackMachine >> exchg [
	| tmp1 tmp2 |
	self assert:[stack size > 1] description: 'Not enough operands!'.
	tmp1 := self pull.
	tmp2 := self pull.
	self push: tmp1.
	self push: tmp2.
	
]

{ #category : #initialization }
MyStackMachine >> initialize [
	super initialize.
	stack := OrderedCollection new.
	
]

{ #category : #accessing }
MyStackMachine >> min [
	self
		assert: [ stack size > 1 ]
		description: 'Not enough operands in stack!'.
	self push: self pull - self pull
]

{ #category : #'as yet unclassified' }
MyStackMachine >> mul [
	self
		assert: [ stack size > 1 ]
		description: 'Not enough operands in stack!'.
	self push: self pull * self pull
]

{ #category : #'as yet unclassified' }
MyStackMachine >> neg [
self push: (self pull * -1).
]

{ #category : #'API-remotes' }
MyStackMachine >> pull [
	| temp |
	self assert: [ stack isNotEmpty ] description: 'Stack empty!'.
	temp := stack last.
	stack removeLast.
	
	^ temp
]

{ #category : #adding }
MyStackMachine >> push: aNumber [
	"to push aNumber into stack"

	stack add: aNumber .
	
]

{ #category : #'as yet unclassified' }
MyStackMachine >> rotUp [
	stack := stack reverse.
	
]

{ #category : #accessing }
MyStackMachine >> stack [
	^ stack
]
