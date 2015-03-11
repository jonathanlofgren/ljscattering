function val = guassian4(fun, a, b)

persistent nodes4 weights4 nodes8 weights8;

nodes4 = [
-0.861136311594052
-0.339981043584856
0.339981043584856
0.861136311594052];

weights4 = [
0.347854845137454
0.652145154862546
0.652145154862546
0.347854845137454];

weights8 = [
0.3626837833783620
0.3626837833783620
0.3137066458778873
0.3137066458778873
0.2223810344533745
0.2223810344533745
0.1012285362903763
0.1012285362903763];

nodes8 = [
-0.1834346424956498
0.1834346424956498
-0.5255324099163290
0.5255324099163290
-0.7966664774136267
0.7966664774136267
-0.9602898564975363
0.9602898564975363];

nodes_t = (a+b)/2 + (b-a)/2 .*nodes8;
weights_t = (b-a)/2 .* weights8;

val = sum(weights_t .* fun(nodes_t));

end
