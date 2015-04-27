function val = guassian(fun, a, b, nodes)

persistent nodes2 weights2 nodes4 weights4 nodes8 weights8;

weights2 = [
1
1];

nodes2 = [
-0.5773502691896257
0.5773502691896257];

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

if nodes == 8
    nodes_t = (a+b)/2 + (b-a)/2 .*nodes8;
    weights_t = (b-a)/2 .* weights8;
elseif nodes == 4
    nodes_t = (a+b)/2 + (b-a)/2 .*nodes4;
    weights_t = (b-a)/2 .* weights4;
elseif nodes == 2
    nodes_t = (a+b)/2 + (b-a)/2 .*nodes2;
    weights_t = (b-a)/2 .* weights2;
else
    val = NaN;
end

val = sum(weights_t .* fun(nodes_t));

end

