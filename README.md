# SNAPDatasets

[![Build Status](https://github.com/JuliaGraphs/SNAPDatasets.jl/workflows/CI/badge.svg)](https://github.com/JuliaGraphs/SNAPDatasets.jl/actions?query=workflow%3ACI+branch%3Amaster)
[![codecov.io](http://codecov.io/github/JuliaGraphs/SNAPDatasets.jl/coverage.svg?branch=master)](http://codecov.io/github/JuliaGraphs/SNAPDatasets.jl?branch=master)

[Graphs.jl](https://github.com/JuliaGraphs/Graphs.jl)-formatted
graph files taken from the [SNAP Datasets](https://snap.stanford.edu/data/index.html) collection.

Example usage:
```julia
using SNAPDatasets
g = loadsnap(:as_caida)
```
