using SNAPDatasets
using Base.Test

@testset "SNAP Datasets" begin
  @test @inferred "$(loadsnap(:as_caida))" == "{26475, 53381} undirected simple Int64 graph"
  @test_throws ErrorException loadsnap()
  @test_throws ErrorException loadsnap(:badsnapxxxxx)
end
