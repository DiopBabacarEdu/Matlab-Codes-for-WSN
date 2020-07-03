# Disjoint Cover Sets to solve Target Coverage Problem
## Problem
Let's consider a finite number of targets points in a topology,
and a finite number of sensors deployed around targets, with sensing ranges represented 
as circles with radius $R such that each target's coordinates lying within the area of one circle 
is said to be covered by that sensor.
How to schedule activiies of sensors in the topology so as to maximize network lifetime,
while monitoring all targets?

## Solution
The idea of the proposed solution here resides in organizing sensors into a maximum number of cover sets,
such that each cover set satisfies the coverage of all targets, and activate cover sets in a round robin fashion.
One after another. 
While being active, all sensors from the set are in active mode. All other sensors belonginng to other sets (inactive at that time),
remains in low energy consumption mode, until they got powered, which means there sets are activated.


An interesting algorithm is presented in these files below to help understand the code.
Documentation is also given !!

