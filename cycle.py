
import networkx as nx
import matplotlib.pyplot as plt
import sys

nodes = sys.argv[1].split(',')
# URGENT Need to figure out how to group edge pairs (aka arcs) into 2-tuples.
# the resulting array must look like this: 
# [("a","b"),("b","c"), ("c","a"), ("b","d"), ("d","e"), ("e","a")]
# edges = sys.argv[2].split(',')
edges = [("lfo_1.sine","vca_1.signal"),("lfo_1.sine","lfo_2.fm_cv"),("lfo_1.phasor","ffmvco_1.feedback_cv"),("lfo_1.pulse","ffmvco_1.vco_1_cv"),("vca_1.output","comparator_1.A"),("ffmvco_1.master","comparator_1.B"),("comparator_1.max","lfo_1.sine"),("comparator_1.max","outs_1.left_in"),("comparator_1.min","outs_1.right_in")]
# Create Directed Graph
G=nx.DiGraph()

# Add a list of nodes:
G.add_nodes_from(nodes)

# Add a list of edges:
G.add_edges_from(edges)
#G.add_edges_from([("a","b"),("b","c"), ("c","a"), ("b","d"), ("d","e"), ("e","a")])

#Return a list of cycles described as a list o nodes
print('\n\n',list(nx.simple_cycles(G)))
print('\n\n', 'nodes', nodes, 'edges', edges)