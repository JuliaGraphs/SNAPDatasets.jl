module SNAPDatasets

using LightGraphs

const SNAPDIR = joinpath(@__DIR__,"..","data")

snap_graphs = Dict{Symbol, String}(
	:arxiv_cit_hep_th	=> "arxiv_cit/arxiv-cit-hep-th.jlg",
	:arxiv_cit_hep_ph	=> "arxiv_cit/arxiv-cit-hep-ph.jlg",
	:as_caida		=> "as-caida/as-caida20071105.jlg",
	:ca_astroph		=> "ca-astroph/astro-ph-cc1.jlg",
	:ca_condmat		=> "ca-condmat/ca-condmat-cc1.jlg",
	:ego_twitter_d		=> "ego-twitter/ego-twitter-directed.jlg",
	:ego_twitter_u		=> "ego-twitter/ego-twitter-undirected.jlg",
	:email_enron_full	=> "email-enron/email-enron.jlg",
	:email_enron		=> "email-enron/email-enron-cc1.jlg",
	:facebook_combined	=> "facebook-combined/facebook-combined.jlg",
	:patent_cit_us		=> "patent_cit/patent-cit-us.jlg",
	:soc_slashdot0902_d	=> "soc-slashdot0902/soc-slashdot0902-directed.jlg",
	:soc_slashdot0902_u	=> "soc-slashdot0902/soc-slashdot0902-undirected.jlg"
)


function loadsnap(f)
    k = keys(snap_graphs)
    if f in k
        return loadgraph(joinpath(SNAPDIR,"$(snap_graphs[f])"))
    else
       sk = sort([":$x" for x in k])
       s = join(sk, ", ", ", or ")
       error("graph must be one of $s")
    end
end
loadsnap() = loadsnap(:xxxbadgraphxxx)

export loadsnap
end
