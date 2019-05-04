

all: weave
	xelatex structures.tex
	xelatex structures.tex

weave:
	noweave -delay -x ch01-singly-linked.nw > ch01-singly-linked.tex
	noweave -delay -x ch01-doubly-linked.nw > ch01-doubly-linked.tex
	noweave -delay -x ch02-binary-search-tree.nw > ch02-binary-search-tree.tex
	noweave -delay -x ch02-balancing-bst.nw > ch02-balancing-bst.tex
	#noweave -delay -x ch03-graph-interface.nw > ch03-graph-interface.tex

bib:
	bibtex structures.aux

figures:
	mpost strucfig.mp

code:
	rm -rf structures/*.*
	notangle -R'SinglyLinked դասը' ch01-singly-linked.nw > structures/SinglyLinked.java
	notangle -R'SinglyLinkedRecursive դասը' ch01-singly-linked.nw > structures/SinglyLinkedRecursive.java
	notangle -R'SinglyLinkedIterative դասը' ch01-singly-linked.nw > structures/SinglyLinkedIterative.java
	notangle -R'DoublyLinkedList դասը' ch01-doubly-linked.nw > structures/DoublyLinkedList.java
	notangle -R'BinarySearchTree դասը' ch02-binary-search-tree.nw > structures/BinarySearchTree.java
	notangle -R'BalancedBST դասը' ch02-balancing-bst.nw > structures/BalancedBST.java


compile:
	javac structures/BinarySearchTree.java

clean:
	rm -f *.eps

