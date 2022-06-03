food(apple).
food(broccoli).
food(carrot).
food(lettuce).
food(rice).

color(sky, blue).
color(dirt, brown).
color(grass, green).
color(broccoli, green).
color(lettuce, green).
color(apple, red).
color(carrot, orange).
color(rice, white).

likes(bob, carrot).
likes(bob, apple).
likes(joe, lettuce).
likes(mary, broccoli).
likes(mary, tomato).
likes(bob, mary).
likes(mary, joe).
likes(joe, baseball).
likes(mary, baseball).
likes(jim, baseball).

% Get the foods which are green color

green(X) :- food(X), color(X,green).

% Get two foods of the same color
getTwoSameColorFood(X,Y,Z) :- food(X),food(Y), X\==Y, color(X,Z), color(Y,Z).


% Negation example
% What foods are not green color

notGreen(X) :- food(X), \+color(X,green).