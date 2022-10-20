# Computational Thinking Abgabe Tom Pillokat Matrikel Nr: 11159658

## __Notes__
- Realise friendship relationship is a graph problem -> Abstraction
- Thought of two Algorithms that i know to traverse a graph, *Depth-First Search* and *Breadth-First Search*
- Evaluate those two algorithms in the context of friendship graphs
  - **DFS**: near endless graph, 4 or 5 hops might already lead to people noone at the party knows
  - **BFS**: many people of the party are probably direct friends with the host, or few hops away, so BFS seems to be the right choice

- Implement **BFS** as an algorithm in text for humans using firefox browser features, things needed for that:

  - set of already visited nodes -> People whos profiles ive visited and checked, wether they are my PoI (Person of interest)

  - a queue to save nodes im gonna visit
use tabs as a queue

  - midde mouse click on a link to open in a new tab

  - right click on newly opened tab -> move tab -> move to end

  - use the color of links as the set of already visited nodes, link is dark blue or light blue -> edge to an already visited node

## __Solution:__

```
use the firefox browser
start on the hosts page
repeat these steps until you are on the page of the target:
    for each unvisited friend link on current page:
        - open in new tab
        - move newly opened tab to the end of the tab list
  - close the current tab
```
## __Evaluate:__

Algorithm runs in O(V + E), because edges are accessed in constant time from the respective vertices (Adjacency list-like),
because when we are on a profile, we immediately see all the edges because of the links.  

### __Disadvantage of using a graph traversal algorithm:__
it traverses the entire graph, this might be slower than a smarter algorithm that factors in certain information you still might remember about the person e.g.
how friends looked they talked to, that might enable better priorisation of visiting nodes -> priority queue
prioritize after certain hobbies you might remember, age range, gender, city of residence or other potential factors,
this is difficult, and might not provide a lot of benefit. Would need some kind of reliable statistics or an AI that knows about friendship probabilities.

### __Advantages:__
it will definitely eventually find the person, since it goes through the entire graph

### __Disadvantages of the actual specific algorithm using browser tools:__
- Might run out of RAM having to open multiple hundreds of tabs, some people have alot of friends, not unrealistic
- way to solve this: change the implementation of the queue to maybe some document where you save links or bookmarks in a folder,
this however means more clicks  

### __Advantages of the actual specific algorithm using browser tools:__
- Uses the browser only
- the link coloring feature is very convenient for the usecase (although it would be even more convenient if some browser had the default behavior of opening links not right-adjacent to the current tab being active, but at the end
of all of the open tabs, this would eliminate the step "move newly opened tab to the end of the tab list") 
- very little, simple steps

## __Reflect:__

### __Principles of Computational Thinking:__
- **Algorithm Design**: because i wrote a step-by-step guide to traverse the entire graph
- **Abstraction**: Abstracted the problem to traversing a Graph
- **Pattern Recognition**: Realise friendship relationship is a graph problem, and from that point on, use a known graph traversal
- **Data Representation**: Use tabs to model a queue and color of links to remember which nodes we have already visited

### __Additional Thoughts__:

I tried the algorithm with my mother, and it worked surprisingly well, after a few clicks, she got the hang of it