Class {
	#name : #MyStackMachineTest,
	#superclass : #TestCase,
	#instVars : [
		'machine'
	],
	#category : #'MH-calculator-tests'
}

{ #category : #tests }
MyStackMachineTest >> testAdd [ 
	machine := MyStackMachine new.
	machine
		push: 3;
		push: 4;
		add.
	self assert: machine stack size equals: 1.
	self assert: machine stack first equals: 7
]

{ #category : #tests }
MyStackMachineTest >> testDiv [
	machine := MyStackMachine new.
	machine 
		push: 3;
		push: 4;
		div.
	self assert: machine stack size equals: 1.
	self assert: machine stack first equals: 4 / 3
]

{ #category : #tests }
MyStackMachineTest >> testDup [
	machine := MyStackMachine new.
	machine
		push: 3;
		push: 4;
		dup.
	self assert: machine stack size equals: 3;
	assert: machine stack first equals: 3;
	assert: machine stack second equals: 4;
	assert: machine stack third equals: 4.
	
	
]

{ #category : #tests }
MyStackMachineTest >> testExchg [
	machine := MyStackMachine new.
	machine
		push: 3;
		push: 4;
		exchg.
	self assert: machine stack size equals: 2.
	self assert: machine stack first equals: 4.
	self assert: machine stack last equals: 3.
]

{ #category : #tests }
MyStackMachineTest >> testMin [
	machine := MyStackMachine new.
	machine
		push: 5;
		push: 3;
		min.
	self assert: machine stack size equals: 1.
	self assert: machine stack first equals: -2
]

{ #category : #tests }
MyStackMachineTest >> testMul [
machine := MyStackMachine new.
	machine
		push: 3;
		push: 4;
		mul.
	self assert: machine stack size equals: 1.
	self assert: machine stack first equals: 12
]

{ #category : #tests }
MyStackMachineTest >> testNeg [
machine := MyStackMachine new.
	machine
		push: 3;
		push: 4;
		neg.
	self assert: machine stack size equals: 2.
	self assert: machine stack last equals: -4.
	
]

{ #category : #tests }
MyStackMachineTest >> testRotUp [
	machine := MyStackMachine new.
	machine
		push: 3;
		push: 4;
		push: 1;
		rotUp.
	self
		assert: machine stack size equals: 3;
		assert: machine stack first equals: 1;
		assert: machine stack second equals: 4;
		assert: machine stack last equals: 3
]
