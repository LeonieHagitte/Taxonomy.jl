var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = Taxonomy","category":"page"},{"location":"#Taxonomy","page":"Home","title":"Taxonomy","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for Taxonomy.","category":"page"},{"location":"#Index","page":"Home","title":"Index","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"#DOI","page":"Home","title":"DOI","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"DOI\nUsualDOI\nUnusualDOI\nNoDOI\nvalid_doi","category":"page"},{"location":"#Taxonomy.DOI","page":"Home","title":"Taxonomy.DOI","text":"Alias for UsualDOI.\n\n\n\n\n\n","category":"type"},{"location":"#Taxonomy.UsualDOI","page":"Home","title":"Taxonomy.UsualDOI","text":"Construct a validated DOI\n\nMost valid DOIs (not all) can be simply validated via a regular expression.\n\nArguments\n\ndoi::String: a DOI without resolver (e.g. without doi.org), capitalization does not matter\nfallback::String: an optional fallback link where one maybe can find the content in case the doi fails\n\njulia> DOI(\"10.5281/zenodo.6719627\")\nUsualDOI{String, Missing}(\"10.5281/ZENODO.6719627\", missing)\n\njulia> DOI(\"10.5281/zenodo.6719627\", \"https://github.com/StructuralEquationModels/StructuralEquationModels.jl\")\nUsualDOI{String, String}(\"10.5281/ZENODO.6719627\", \"https://github.com/StructuralEquationModels/StructuralEquationModels.jl\")\n\n\n\n\n\n","category":"type"},{"location":"#Taxonomy.UnusualDOI","page":"Home","title":"Taxonomy.UnusualDOI","text":"Construct an unvalidated DOI\n\nYou should prefer an validated UsualDOI but if you have tested the DOI and are sure it links were it supposed to link, go ahead and create an unvalidated doi.\n\njulia> UnusualDOI(\"weird10.5281doi/zenodo.6719627\")\nUnusualDOI{String, Missing}(\"WEIRD10.5281DOI/ZENODO.6719627\", missing)\n\njulia> UnusualDOI(\"weird10.5281doi/zenodo.6719627\", \"https://github.com/StructuralEquationModels/StructuralEquationModels.jl\")\nUnusualDOI{String, String}(\"WEIRD10.5281DOI/ZENODO.6719627\", \"https://github.com/StructuralEquationModels/StructuralEquationModels.jl\")\n\n\n\n\n\n","category":"type"},{"location":"#Taxonomy.NoDOI","page":"Home","title":"Taxonomy.NoDOI","text":"What to do if there is no doi\n\nLast resort if there is no DOI. Than we save other metadata, similar to BibTex.\n\nArguments\n\nurl::String: an link where one maybe can find the content in case the doi fails\nauthor::String: like in BibTex, e.g. \"Peikert, Aaron and Ernst, Maximilian S. and Bode, Clifford\"\ndate::Union{Date, Missing}: optional date\nyear::Union{Int64}: optional if date is supplied\njournal::String\nother::Dict: more BibTexlike metadata\n\nNoDOI(\n    url = \"https://github.com/StructuralEquationModels/StructuralEquationModels.jl\",\n    author = \"Ernst, Maximilian Stefan and Peikert, Aaron\",\n    title = \"StructuralEquationModels.jl: A fast and flexible SEM framework\",\n    date = Date(\"2022-06-24\"), # year is inferred\n    journal = \"No Real Journal\",\n    awesome = \"Yes\", # other metadata\n    software = \"naturally\", # some more metadata\n    citations = 500\n)\nNoDOI(\n    url = \"https://github.com/StructuralEquationModels/StructuralEquationModels.jl\",\n    author = \"Ernst, Maximilian Stefan and Peikert, Aaron\",\n    title = \"StructuralEquationModels.jl: A fast and flexible SEM framework\",\n    year = 2022, # date is omitted\n    journal = \"No Real Journal\"\n)\n\n\n\n\n\n","category":"type"},{"location":"#Taxonomy.valid_doi","page":"Home","title":"Taxonomy.valid_doi","text":"Validate DOI via Regex\n\nRegular expression taken from:\n\nhttps://www.crossref.org/blog/dois-and-matching-regular-expressions/\n\n\n\n\n\n","category":"function"}]
}
