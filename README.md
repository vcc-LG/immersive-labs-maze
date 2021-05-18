# Immersive Labs Code Test

Below is a coding test for you to complete. Give yourself no more than 2 hours
and email us back your solution.

Try to think about the decisions you made when building/designing the solution
and we hope to have an interesting discussion with you in person!

Imagine that:
1. The code will be put into production next week
2. The sun may explode if the code malfunctions
3. Someone other than you must maintain it
4. Some requirements are likely to change (e.g. the way the solution is output)

## The Test

Here we have a partially complete maze program. So far it knows how to parse a
maze file and a few other simple things.

Your job is to write a maze solver that will output the solution to a given
maze. The maze will be passed in as a text file where walls are represented by
`#` symbols and passages are represented by spaces.  The start of the maze is
marked with an `s` and the finish is marked with an `e`. There are some
examples in the `mazes` directory.


The solution must be output in terms of movements:
* "D" means move down
* "R" means move right
* "L" means move left
* "U" means move up

Example:

Consider this maze from `./mazes/1.maze`:

```
    #######s#
    # #     #
    # ##### #
    #   #   #
    ### # ###
    #     ###
    #e#######
```

If we run the maze solver then we can expect this output:

```
./bin/solver.rb ./mazes/1.maze

> D D D L L D D L L L L D

```
