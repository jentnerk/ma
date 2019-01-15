
// Parameters file

// Please change the parameters according to your liking. 
// Check out the image "structure_serializer.jpg" at 'path to folder' to understand
// ther general stucture of the serializer and its parameters.

// TREE_LOGFROM is the logarithm to the base 2 of TREE_FROM.
//			(e.g. TREE_FROM = 4 --> TREE_LOGFROM = 2)
// Make sure that
//				- TREE_FROM is a power of 2
//				- TREE_TO is a power of 2 (normally TREE_TO = 1)


// If we have not included file before,
// the symbol parameters_vh is not defined.
`ifndef parameters_vh
`define parameters_vh

`define TREE_FROM 		4
`define TREE_LOGFROM 	2

`endif 