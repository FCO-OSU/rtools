# R Tools

### Various functions for text, mathematical, geospatial data wrangling.

This repo is intended to accommodate functions utilised by (or of potential value to) more than one application, encouraging code modularity and reuse.

### Design principles

Some thoughts on maintaining backwards compatibility.

1. The overarching aim should be to keep functions simple, readable and focused on a single purpose.
1. A minimal number of inputs is preferred. If additional inputs are added later these should preferably be given default values (to preserve the function's behaviour as prior to addition) such that calls omitting the input will not cause function to crash.
1. Any edits to existing functions should be tested rigorously to ensure backwards compatibility.
1. Inputs should preferably be simple specific-datatype values or vectors (e.g. not specifically-structured data.frames).
