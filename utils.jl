using Franklin
using FranklinUtils

using FranklinTheorems
Franklin.include_external_config(FranklinTheorems.config_path())

# LaTeX Preamble
Franklin.convert_md(read("./_fkl_libs/preamble.texmd", String); isconfig=true)
