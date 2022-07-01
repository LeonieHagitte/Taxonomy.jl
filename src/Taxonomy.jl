module Taxonomy
    export AbstractDOI
    include("abstracttypes.jl")

    import Dates
    import Dates: Date
    export Date
    export DOI, UsualDOI, UnusualDOI, NoDOI, url
    include("metadata/doi.jl")
    
    import HTTP
    import JSON
    export MetaData, MinimalMeta, IncompleteMeta, ExtensiveMeta, year, author, journal, apa, json
    include("metadata/meta.jl")

    include("taxons/cfa.jl")
end


