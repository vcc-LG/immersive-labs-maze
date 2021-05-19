# TODO

[ ] - `perform` method is long and would benefit from being refactored into smaller methods which can be tested individually, e.g. direction string choice, correct sorting of solution nodes, main neighbour loop
[ ] - Tests should be broadened to consider edge cases and errors passed up from the parser
[ ] - Is there a more memory efficient approach to initialising and looking up node distances instead of creating `distance_grid`? e.g. Walk over maze and collect valid nodes into `Node` object array, then just look up and update each node object as needed
[ ] - Investigate relative performance of other search methods , e.g. bread-first, depth-first, A*