using StenoGraphs

"""
Factor Taxon. 
Building Block for CFA Taxonomy. Multiple Factors can be combined to a CFA. 

## Arguments

- `n_sample`: Number of observed cases. May be between different taxons from same paper sometime, e.g. multigroup models.
- `n_variables`: Number of variables (possibly observed/manifest).
- `loadings`: Vector of loadings, one for each item. 
- `error_covariances_within`: Vector of covariances within factor.
- `error_covariances_between`: Vector of covariances the factor shares with a different factor. 
- `crossloadings_incoming`: Vector of crossloadings coming from other factors. They should be lower than the loading coming to the item from this factor.  
- `crossloadings_outgoing`: Vector of crossloadings going to other items which have higher loadings from other factors. 

```jldoctest
Factor(n_variables = 2, loadings = [1, 0.4])

# output
Factor(Judgement{Missing}(missing, 1.0, missing), Judgement{Int64}(2, 1.0, missing), Judgement{Vector{Float64}}([1.0, 0.4], 1.0, missing), Judgement{Int64}(0, 1.0, missing), Judgement{Int64}(0, 1.0, missing), Judgement{Int64}(0, 1.0, missing), Judgement{Int64}(0, 1.0, missing))
```
"""
struct Factor <: AbstractCFA
    n_sample::Judgement{ <: Union{ <:Int, Missing}}
    n_variables::Judgement{ <: Union{ <:Int, Missing}}
     loadings::Judgement{ <: Union{ <: AbstractArray{ <: Number}, Missing}}
     error_covariances_within::Judgement{ <: Union{ <: AbstractArray{ <: Number}, <: Int, Missing}}
     error_covariances_between::Judgement{ <: Union{ <: AbstractArray{ <: Number}, <: Int, Missing}}
     crossloadings_incoming::Judgement{ <: Union{ <: AbstractArray{ <: Number}, <: Int, Missing}}
     crossloadings_outgoing::Judgement{ <: Union{ <: AbstractArray{ <: Number}, <: Int, Missing}}
    Factor(n_sample, n_variables, loadings, error_covariances_within, error_covariances_between, crossloadings_incoming, crossloadings_outgoing) =
        new(J(n_sample), J(n_variables), J(loadings), J(error_covariances_within), J(error_covariances_between), J(crossloadings_incoming), J(crossloadings_outgoing))
end

function Factor(;n_sample = missing,
    n_variables,
    loadings, 
    error_covariances_within = 0,
    error_covariances_between = 0, 
    crossloadings_incoming = 0,
    crossloadings_outgoing = 0)
    Factor(n_sample, n_variables, loadings, error_covariances_within, error_covariances_between, crossloadings_incoming, crossloadings_outgoing)
end


"""
CFA Taxon. 
Consists of Factors (measurement model) and a graph from StenoGraphs (structural model). 

## Arguments

- `measurement_model`: Vector of Factors.
- `structural_model`: Graph from StenoGraphs package. Defines the latent relations between the factors of measurement_model.  

```jldoctest
using StenoGraphs
using Taxonomy

factor1 = Factor(n_variables = 2, loadings = [1, 0.4])
factor2 = Factor(n_variables = 2, loadings = [0.7, 0.3])

graph = @StenoGraph begin
    # latent regressions
    fac1 → fac2
end

CFA(measurement_model = [factor1, factor2], 
structural_model = graph )

# output
CFA(Judgement{Missing}(missing, 1.0, missing), Judgement{Vector{Factor}}(Factor[Factor(Judgement{Missing}(missing, 1.0, missing), Judgement{Int64}(2, 1.0, missing), Judgement{Vector{Float64}}([1.0, 0.4], 1.0, missing), Judgement{Int64}(0, 1.0, missing), Judgement{Int64}(0, 1.0, missing), Judgement{Int64}(0, 1.0, missing), Judgement{Int64}(0, 1.0, missing)), Factor(Judgement{Missing}(missing, 1.0, missing), Judgement{Int64}(2, 1.0, missing), Judgement{Vector{Float64}}([0.7, 0.3], 1.0, missing), Judgement{Int64}(0, 1.0, missing), Judgement{Int64}(0, 1.0, missing), Judgement{Int64}(0, 1.0, missing), Judgement{Int64}(0, 1.0, missing))], 1.0, missing), Judgement{Vector{DirectedEdge{SimpleNode{Symbol}, SimpleNode{Symbol}}}}(fac1 → fac2
, 1.0, missing))
```
"""
struct CFA <: AbstractCFA
    n_sample::Judgement{ <: Union{ <:Int, Missing}}
    measurement_model::Judgement{ <: Union{<:AbstractArray{<: Factor}, Missing}}
    structural_model::Judgement{ <: Union{<:AbstractArray{<: StenoGraphs.AbstractEdge}, Missing}}
    CFA(n_sample, measurement_model, structural_model) = 
    new(J(n_sample), J(measurement_model), J(structural_model))
end

function CFA(;n_sample = missing,
    measurement_model,
    structural_model) # hier basic CFA model festlegen
    CFA(n_sample, measurement_model, structural_model)
end

