/* File: Challenge-10.k
 ---------------------------
In this exercise, your job is to get Karel to create a checkerboard pattern of
beepers inside an empty rectangular world.

This problem has a nice decomposition structure along with some interesting
algorithmic issues. As you think about how you will solve the problem,
you should make sure your solution works with checkerboards that are different
in size from the standard 8×8 checkerboard shown in the example. Odd-sized
checkerboards are tricky, and you should make sure that your program generates
the following pattern in a 5×3 world.

Another special case you need to consider is that of a world that is only
one column wide or one row high.
*/


import "turns";

/* MAIN FUNCTION */

function Checkerboard() {
	putBeeper();    			     /*Places beeper at (1,1) */
	checkForWall(); 			     /* runs if grid is only 1 column wide */
	while (frontIsClear()) {
		beepersEast();
		beepersWest();
	}
}





					/********* SUB-FUNCTIONS *********/

/* RUNS WHEN HEADED EAST */
function beepersEast() {
	while (facingEast()) {
		move();
		if (frontIsClear()) {
			move();
			putBeeper();
		}
		upEast();
	}
}





/* RUNS WHEN NEEDING TO GO UP TO NEXT LINE ON EAST SIDE */
function upEast() {
	if (frontIsBlocked()) {
		if (noBeepersPresent()) {
			turnLeft();
			if (frontIsClear()) {
				move();
				turnLeft();
				putBeeper();
			}
		} else {
			turnLeft();
			if (frontIsClear()) {
				move();
				turnLeft();
				move();
				putBeeper();
			}
		}
	}
}





/* RUNS WHEN HEADED WEST */
function beepersWest() {
	while (facingWest()) {
		move();
		if (frontIsClear()) {
			move();
			putBeeper();
		}
		upWest();
	}
}





/* RUNS WHEN NEEDING TO GO UP TO NEXT LINE ON WEST SIDE */
function upWest() {
	if (frontIsBlocked()) {
		if (noBeepersPresent()) {
			turnRight();
			if (frontIsClear()) {
				move();
				turnRight();
				putBeeper();
			}
		} else {
			turnRight();
			if (frontIsClear()) {
				move();
				turnRight();
				move();
				putBeeper();
			}
		}
	}
}





/* RUNS ONLY WHEN GRID IS 1 AVENUE WIDE */
function checkForWall() {
	if (frontIsBlocked()) {
		turnLeft();
		while (frontIsClear()) {
			move();
			if (frontIsClear()) {
				move();
				putBeeper();
			}
		}
	}
}
