using Graphs: SimpleGraph, nv, ne
using SNAPDatasets
using Test

@testset "SNAP Datasets" begin
  as_caida = loadsnap(:as_caida)
  @test as_caida isa SimpleGraph{Int64}
  @test nv(as_caida) == 26475
  @test ne(as_caida) == 53381
  @test_throws ErrorException loadsnap()
  @test_throws ErrorException loadsnap(:badsnapxxxxx)
end
