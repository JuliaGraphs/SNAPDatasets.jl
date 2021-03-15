using LightGraphs, GraphIO
using DataFrames
# using GraphDataFrameBridge
using CSV

function build_btc()
    btc_url = "https://snap.stanford.edu/data/soc-sign-bitcoinotc.csv.gz"
    tmp = tempdir()
    btc_csvgz = joinpath(tmp, basename(btc_url))
    if !isfile(btc_csvgz)
        download(btc_url, btc_csvgz)
    end
    # decompress
    run(`gunzip -d $btc_csvgz`)
    btc_csv = btc_csvgz[1:(length(btc_csvgz) - 3)]
    @assert isfile(btc_csv)
    # fix issue with blank last line of CSV
    # run(`gsed -i '$d' $btc_csv`)
    # setup for reading CSV into graph objects
    h = [:source, :target, :rating, :time]
    t = Dict(
        :source => String,
        :target => String,
        :rating => Float64,
        :time => Float64
    )
    # read as SimpleDiGraph
    lg = loadgraph(btc_csv, "soc-sign-bitcoinotc", GraphIO.EdgeList.EdgeListFormat())
    # read as MetaDiGraph (save edge attributes with graph)
    # edges = CSV.File(btc_csv;
    #                  header = h,
    #                  normalizenames = true,
    #                  types = t) |> DataFrame!
    # mdg = MetaDiGraph(
    #     edges, :source, :target, weight = :rating, edge_attributes = :time
    # )
    # clean up
    rm(btc_csv, force=true, recursive=true)
    rm(btc_csvgz, force=true, recursive=true)
    return lg # Dict(:simple => lg, :meta => mdg)
end

lg = build_btc()

# save simple graph (322KB)
savegraph("soc-sign-bitcoinotc.jlg", lg, LGFormat())

# check simple graph
g = loadgraph("soc-sign-bitcoinotc.jlg")
@assert isequal(lg, g)

# # save metagraph (21MB)
# using MetaGraphs
# MetaGraphs.savegraph("soc-sign-bitcoinotc.jmg", btc_graphs[:meta])
#
# # check metagraph
# g = MetaGraphs.loadgraph("soc-sign-bitcoinotc.jmg", "", MGFormat())
# @assert isequal(btc_graphs[:meta], g)
