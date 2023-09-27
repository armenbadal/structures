all: weave figures
	xelatex structures.tex
	xelatex structures.tex

weave:
	noweave -delay -x ch01-array-impl.nw > ch01-array-impl.tex
	noweave -delay -x ch02-singly-linked.nw > ch02-singly-linked.tex
	noweave -delay -x ch02-doubly-linked.nw > ch02-doubly-linked.tex
	noweave -delay -x ch03-binary-search-tree.nw > ch03-binary-search-tree.tex
	noweave -delay -x ch03-balancing-bst.nw > ch03-balancing-bst.tex
	#noweave -delay -x ch03-graph-interface.nw > ch03-graph-interface.tex

bib: strucref.bib
	bibtex structures.aux

figures: strucfig.mp
	mpost strucfig.mp

code:
	rm -rf structures/*.*
	notangle -R'Array1D դասը' ch01-array-impl.nw > structures/Array1D.java
	notangle -R'SinglyLinked դասը' ch02-singly-linked.nw > structures/SinglyLinked.java
	notangle -R'SinglyLinkedRecursive դասը' ch02-singly-linked.nw > structures/SinglyLinkedRecursive.java
	notangle -R'SinglyLinkedIterative դասը' ch02-singly-linked.nw > structures/SinglyLinkedIterative.java
	notangle -R'DoublyLinkedList դասը' ch02-doubly-linked.nw > structures/DoublyLinkedList.java
	notangle -R'BinarySearchTree դասը' ch03-binary-search-tree.nw > structures/BinarySearchTree.java
	notangle -R'BalancedBST դասը' ch03-balancing-bst.nw > structures/BalancedBST.java


clean:
	rm *.log
	rm *.eps
	rm structures.toc
	rm structures.aux
	rm strucfig.mpx
	rm ch02-singly-linked.tex
	rm ch02-doubly-linked.tex
	rm ch03-binary-search-tree.tex
	rm ch03-balancing-bst.tex
