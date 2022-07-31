# Paired with 

# Specialized code for automatic numbering by abuse of the biblabel function
# Given an input of form \fakebiblable{@ Legible Name}, this returns the string "Legible Name"
# Given an input of form \fakebiblabel{goob @ Legible Name}, this runs \biblabel{goob}{Legible Name},
# so that Franklin's referencing system keeps track of `goob` as a name that points to "Legible Name",
# and the function returns the string "goob".
# This @ symbol approach is a hack to allow a single optional input variable to the function.
# The @ symbol was chosen because of its relevance to LaTeX.
# Further, the string "Legible Name" is always parsed by Franklin, which has two notable consequences
# 	1. Other lx_functions like \arabic{counter} can be used the the full name
# 	2. Markdown syntaxing like _italics_ will be parsed into <em>italics<em>, which breaks your references
# So, while Legible Name can reference counters, it should not have any styling.
function lx_fakebiblabel(lxc, _)
	args = Franklin.content(lxc.braces[1]) |> strip |> split

	nvars = length(args)

	if nvars < 2
		error("Bad fakebiblabel input: Less than 2 inputs were given. Input was:\n{{fakebiblablel" * join(args, " ") * "}}")
	end

	if args[1] == "@"
		return fd2html(join(args[2:end], " "), internal=true, nop=true)
	elseif args[2] == "@"
		ref_name = args[1]
		legible_name = fd2html(join(args[3:end], " "), internal=true, nop=true)
		fd2html("\\biblabel{" * ref_name * "}{" * legible_name * "}", internal=true)
		return ref_name
	else
		error("Bad fakebiblabel input: @ was not the second input. Input was:\n{{fakebiblablel" * join(args, " ") * "}}")
	end
end


# Module for the counters. By making this into a module, this hides
# access to the counters dictionary. If you need a new way to interact
# with the system of counters, impliment a new method in this module.
module LxCounters
	
	# Used for latex-style parsing
	using FranklinUtils

	export lx_newcounter, lx_stepcounter, lx_arabic

	# The core dictionary that stores all the things we want to count.
	counters = Dict{String,Int64}()

	# Call \newcounter{name} to create a new counter
	# Returns an empty string.
	function lx_newcounter(lxc, _)
		args, kwargs = lxargs(lxc)

		name = string(args[1])

		delete!(counters, name)
		get!(counters, name, 0)
		return ""
	end

	# Call \stepcounter{name} to incriment the value of a counter by 1.
	# Returns an empty string.
	function lx_stepcounter(lxc, _)
		args, kwargs = lxargs(lxc)

		name = string(args[1])

		counters[name] = counters[name] + 1
		return ""
	end

	# Call \arabic{name} to return the value of a counter, as an arabic number.
	function lx_arabic(lxc, _)
		args, kwargs = lxargs(lxc)

		name = string(args[1])

		return string(counters[name])
	end

	# Call {{arabic name}} to return the value of a counter, as an arabic number.
	# Beware: hfun_functions run after all lx_functions! So, only use this for counters
	# created that will not be updated by later lx_functions.
	function hfun_arabic(lxc, _)
		args, kwargs = lxargs(lxc)

		name = string(args[1])

		return string(counters[name])
	end

end

using .LxCounters


