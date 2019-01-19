
// Parameters file

// Please change the parameters according to your liking. 
// Check out the image "structure_serializer.jpg" at 'path to folder' to understand
// ther general stucture of the serializer and its parameters.
// SHIFT_LOGFROM is the logarithm to the base 2 of SHIFT_FROM rounded to the next higher integer.
// 			(e.g. SHIFT_FROM = 20 --> SHIFT_LOGFROM = 5)
// TREE_LOGFROM is the logarithm to the base 2 of TREE_FROM.
//			(e.g. TREE_FROM = 4 --> TREE_LOGFROM = 2)
// Make sure that
// 				- SHIFT_FROM > SHIFT_TO
//				- SHIFT_TO is a divider of SHIFT_FROM. 
// 				- SHIFT_TO is a power of 2
//				- SHIFT_TO is equal to TREE_FROM
// 				- SHIFT_TO > 1


// If we have not included file before,
// the symbol parameters_vh is not defined.
`ifndef parameters_vh
`define parameters_vh

// Fill in the constants here:
`define SHIFT_FROM 		32
`define SHIFT_LOGFROM 	5
`define SHIFT_TO 		16

`define TREE_FROM 		16
`define TREE_LOGFROM 	4

`endif 