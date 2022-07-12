ct = require('cycle-test');

graph = [[1], [2], [0]];
console.log(ct.hasCycle(graph));
// true

graph = [[1, 2], [2], [1]];
console.log(ct.hasCycle(graph));
// false

graph = [[0]];
console.log(ct.hasCycle(graph));
// true

graph = [[1], [3], , [0]];
console.log(ct.hasCycle(graph));
// true

graph = 
[ [ 'lfo_1.sine', 'vca_1.signal' ],
  [ 'lfo_1.sine', 'lfo_2.fm_cv' ],
  [ 'lfo_1.phasor', 'ffmvco_1.feedback_cv' ],
  [ 'lfo_1.pulse', 'ffmvco_1.vco_1_cv' ],
  [ 'vca_1.output', 'comparator_1.A' ],
  [ 'ffmvco_1.master', 'comparator_1.B' ],
  [ 'comparator_1.max', 'lfo_1.sine' ],
  [ 'comparator_1.max', 'outs_1.left' ],
  [ 'comparator_1.min', 'outs_1.right' ] ] 
  console.log(ct.hasCycle(graph));
