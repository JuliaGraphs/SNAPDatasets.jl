# SNAPDatasets

[![Build Status](https://travis-ci.org/JuliaGraphs/SNAPDatasets.jl.svg?branch=master)](https://travis-ci.org/JuliaGraphs/SNAPDatasets.jl)
[![codecov.io](http://codecov.io/github/JuliaGraphs/SNAPDatasets.jl/coverage.svg?branch=master)](http://codecov.io/github/JuliaGraphs/SNAPDatasets.jl?branch=master)


[LightGraphs.jl](https://github.com/JuliaGraphs/LightGraphs.jl)-formatted
graph files taken from the [SNAP Datasets](https://snap.stanford.edu/data/index.html) collection.


Example usage:
```julia
using SNAPDatasets
g = loadsnap(:as_caida)
```
