" Vim syntax file (ferret.vim)
" Language: Ferret 6.0
" Maintainer: Andrew Wittenberg
" Version: 0.10
" Last Change: 20 November 2006
"
"============================================================
" To install Ferret syntax highlighing for Vim, do the following:
"
" 1) Create a ~/vim directory if it doesn't already exist,
"    and save this file into that directory as "ferret.vim".
"
" 2) Create a ~/vim/mysyntax.vim file if it doesn't already exist,
"    and then add the lines:
"
"    au BufRead,BufNewFile *.jnl set filetype=ferret
"    au! Syntax ferret source ~/vim/ferret.vim
"
" 3) Create a ~/.vimrc file if it doesn't already exist, and then
"    ensure that it contains the lines:
"
"    let mysyntaxfile = "~/vim/mysyntax.vim"
"    syntax on
"============================================================
"
" From then on, whenever you edit a file with a .jnl extension, you
" should automatically get syntax highlighting.  To toggle it off/on
" when you are inside a Vim session, use
"
"    :syntax off
"    :syntax on
"
" To highlight a Ferret script without a .jnl extension, open it
" in Vim and then say
"
"    :set syntax=ferret
"
" The latest version of this file is available from:
"    http://www.gfdl.noaa.gov/~atw/ferret.html
"
" More help is available from the following sites:
"    http://www.fleiner.com/vim/create.html
"    http://www.fifi.org/doc/vim/html/syntax.html
"    http://www.e-rasmussen.dk/reference/vi/usr/44.php
"
" Thanks to R. Fiedler for his initial version of 17 May 2000.
"
"============================================================

" Clear any existing syntax settings
syn clear

" Ignore upper/lower case
syn case ignore

"============================================================
" Ferret statements (characters inside [] are optional)
syn keyword ferretStatement	plot con[tour] sh[ade] vec[tor] wire
syn keyword ferretStatement	exit frame help list load message
syn keyword ferretStatement	poly[gon] sp[awn] stat[istics] user query rep[eat]

" Ferret aliases
syn keyword ferretAlias		let file quit reg[ion] say fill alias unalias
syn keyword ferretAlias		use save pal[ette] label anim[ate] pat[tern] pause
syn keyword ferretAlias		where flow[line] col[umns]

" Ferret functions
syn keyword ferretFunction	abs acos asin atan atan2 cos days1900 exp ignore0
syn keyword ferretFunction	int ln log max min missing mod reshape randu
syn keyword ferretFunction	randn rho_un sin tan theta_fo zaxreplace echo
syn keyword ferretFunction	xsequence ysequence zsequence tsequence
syn keyword ferretFunction	samplei samplej samplek samplel
syn keyword ferretFunction	strcmp strlen upcase strindex strrindex
syn keyword ferretFunction	dncase strcat substring strfloat
syn keyword ferretFunction	ffta fftp sampleij samplet_date samplexy
syn keyword ferretFunction	scat2gridgauss_xy scat2gridgauss_xz scat2gridgauss_yz
syn keyword ferretFunction	scat2gridgauss_xt scat2gridgauss_yt scat2gridgauss_zt
syn keyword ferretFunction	scat2gridlaplace_xy scat2gridlaplace_xz
syn keyword ferretFunction	scat2gridlaplace_yz scat2gridlaplace_xt
syn keyword ferretFunction	scat2gridlaplace_yt scat2gridlaplace_zt
syn keyword ferretFunction	sorti sortj sortk sortl tauto_cor xauto_cor
syn keyword ferretFunction	eof_stat eof_tfunc eof_space
syn keyword ferretFunction	compressi compressj compressk compressl
syn keyword ferretFunction	compressi_by compressj_by compressk_by compressl_by
syn keyword ferretFunction	avet cmprsi_by convolvei convolvej convolvek convolvel
syn keyword ferretFunction	date1900 days1900toymdhms expndi_by expndi_by_z expndi_by_t
syn keyword ferretFunction	factorial fft_amp fft_im fft_inverse fft_phas fft_re
syn keyword ferretFunction	findhi findlo is_element_of lsl_lowpass minutes24
syn keyword ferretFunction	pass_thru percent_good_t samplexz sampleyz
syn keyword ferretFunction	storage subtract
syn keyword ferretFunction	transpose_xt transpose_xy transpose_xz
syn keyword ferretFunction	transpose_yt transpose_yz transpose_zt
syn keyword ferretFunction	writev5d zaxreplace_avg zaxreplace_bin
syn keyword ferretFunction	anint floor ceiling chdir sinh cosh tanh
syn keyword ferretFunction	efsamplei efsamplej efsamplek efsamplel
syn keyword ferretFunction	extrap curv_to_rect_map curv_to_rect rect_to_curv
syn keyword ferretFunction xcat ycat zcat tcat
syn keyword ferretFunction labwid is_element_of_str element_index element_index_str
syn keyword ferretFunction tax_year tax_month tax_day tax_dayfrac tax_jday
syn keyword ferretFunction tax_jday1900 tax_units tax_yearfrac tax_datestring
syn keyword ferretFunction nco nco_attr xreverse yreverse zreverse treverse
syn keyword ferretFunction zaxreplace_lin zaxreplace_rev zaxreplace_zlev
syn keyword ferretFunction dates fill_xy list_good curv_range ave_scat2grid_t


"============================================================
" Ferret DEFINE commands (characters inside \%[] are optional)
" Consists of DEFINE, followed by one or more whitespace characters,
" followed by one more keyword.
syn match ferretDef	"def\%[ine]\s\+\(reg\%[ion]\|grid\|var\%[iable]\|ax\%[is]\|view\%[port]\|alias\|sym\%[bol]\|att\%[ribute]\)"

" Ferret SET commands
" Some of these consist of two keywords, others three.
syn match ferretSet	"set\s\+\(win\%[dow]\|reg\%[ion]\|view\%[port]\|exp\%[ression]\|list\|data\|mo\%[de]\|mov\%[ie]\|var\%[iable]\|grid\|ax\%[is]\|mem\%[ory]\|att\%[ribute]\)"
syn match ferretSetMode	"set\s\+mo\%[de]\s\+\(dia\%[gnostic]\|ver\%[ify]\|int\%[erpolate]\|ig\%[nore_error]\|stu\%[pid]\|jou\%[rnal]\|lon\%[g_label]\|lat\%[it_label]\|dep\%[th_label]\|cal\%[endar]\|asc\%[ii_font]\|seg\%[ments]\|wait\|desp\%[erate]\|gks\|refr\%[esh]\|meta\%[file]\|ppl\%[list]\|gui\|logo\|lab\%[els]\|gra\%[ticule]\|lin\%[ecolors]\|up\%[case_output]\)"

" Ferret CANCEL commands
" Some of these consist of two keywords, others three.
syn match ferretCancel "can\%[cel]\s\+\(win\%[dows]\|reg\%[ion]\|mem\%[ory]\|exp\%[ression]\|list\|dat\%[a_set]\|mov\%[ie]\|vie\%[wports]\|var\%[iables]\|ax\%[is]\|gri\%[ds]\|alias\|sym\%[bols]\|att\%[ribute]\)"
syn match ferretCancelMode "can\%[cel]\s\+mo\%[de]\s\+\(dia\%[gnostic]\|ver\%[ify]\|int\%[erpolate]\|ig\%[nore_error]\|stu\%[pid]\|jou\%[rnal]\|lon\%[g_label]\|lat\%[it_label]\|dep\%[th_label]\|cal\%[endar]\|asc\%[ii_font]\|seg\%[ments]\|wait\|desp\%[erate]\|gks\|refr\%[esh]\|meta\%[file]\|ppl\%[list]\|gui\|logo\|lab\%[els]\|gra\%[ticule]\|lin\%[ecolors]\|up\%[case_output]\)"

" Ferret SHOW command
" Some of these consist of two keywords, others three.
syn match ferretShow "sho\%[w]\s\+\(win\%[dows]\|reg\%[ion]\|ax\%[is]\|exp\%[ression]\|list\|dat\%[a_sets]\|mo\%[de]\|mov\%[ie]\|var\%[iables]\|com\%[mands]\|mem\%[ory]\|grid\%[s]\|vie\%[wports]\|tr\%[ansform]\|alias\|sym\%[bols]\|fun\%[ctions]\|que\%[ries]\)"
syn match ferretShowMode "sho\%[w]\s\+mo\%[de]\s\+\(dia\%[gnostic]\|ver\%[ify]\|int\%[erpolate]\|ig\%[nore_error]\|stu\%[pid]\|jou\%[rnal]\|lon\%[g_label]\|lat\%[it_label]\|dep\%[th_label]\|cal\%[endar]\|asc\%[ii_font]\|seg\%[ments]\|wait\|desp\%[erate]\|gks\|refr\%[esh]\|meta\%[file]\|ppl\%[list]\|gui\|logo\|lab\%[els]\|gra\%[ticule]\|lin\%[ecolors]\|up\%[case_output]\)"

" PlotPlus commands
" Each of these consists of at most two keywords.
"syn match ferretPPL "ppl\%[us]"
syn match ferretPPL "ppl\%[us]\s\+\(auto\|autolab\|axatic\|axlabp\|axlen\|axlint\|axlsze\|axnmtc\|axnsig\|axset\|axtype\|baud\|box\|clsplt\|conpre\|conpst\|conset\|contour\|cross\|datpt\|debug\|dec\|delete\|dfltfnt\|dir\|echo\|english\|enter\|evar\|exit\|format\|get\|grid\|help\|hlabs\|hlp\|inc\|labset\|labs\|lev\|limits\|line\|linfit\|list\|listsym\|llabs\|markh\|metric\|multplt\|nlines\|origin\|pen\|plot\|plotv\|plotuv\|pltnme\|pltype\|rd\|reset\|return\|rlabs\|rotate\|rwd\|save\|set\|show\|size\|skp\|smooth\|spawn\|taxis\|teknme\|tics\|time\|title\|tktype\|transxy\|txlabp\|txlint\|txlsze\|txnmtc\|txtype\|vars\|veckey\|vecset\|vector\|velvct\|view\|vpoint\|while\|window\|xaxis\|xfor\|xlab\|yaxis\|yfor\|ylab\|aline\|color\|fill\|shade\|shakey\|shaset\)"

"============================================================
syn keyword ferretConditional	if then elif else endif
syn keyword ferretBoolean	not and or
syn match ferretEscaped		"\\." contains=ferretCancelMode
syn match ferretParen		"[()]"
syn match ferretComment		"\!.*" contains=ferretTodo

" Handy comments to highlight parts of a Ferret script that need work
syn keyword ferretTodo		TODO FIXME contained

"============================================================
" Qualifiers consist of a slash, followed by one or more word characters.
" If you want these lit, uncomment the "hi link" below.  But NOTE that
" this will match additional things (like division), as these are currently
" designed just to PREVENT highlighting of the qualifiers.
" In fact, this is just why the ferretFunction group is contained here,
" to get around the matched division.
syn match ferretQual "/\w\+" contains=ferretFunction

syn match ferretSymbol "\(\$[1-9]\?[0-9]\|(\$\w\+)\|(\$ppl\$\w\+)\)"

" Match GO and script name, taking care to include
" possible symbols and immediate mode expressions.
syn match ferretGo "go\s\+\(\w\|[.@#$%\^*~\-+,"/]\|\$[1-9]\|(\$\w\+)\|`[^`]*`\)\+" contains=ferretSymbol,ferretImmediate

"============================================================
" Immediate mode region is delimited by backquotes, where
" neither backquote may be preceded by a backslash.
syn region ferretImmediate	start="\\\@<!`" end="\\\@<!`" contains=ferretFunction,ferretBoolean,ferretTransform

"============================================================
" A string is delimited by quotes.
syn region ferretString		start=+"+ skip=+\\"+ end=+"+ contains=ferretTag,ferretSymbol,ferretImmediate,ferretBlank
" Blank string, indicates default argument for scripts.
syn match ferretBlank +"\zs \ze"+

" String tags: examples are <NL>, @P1, @C007, @AS, @MA07.
" Only highlight these inside of a ferretString.
syn match ferretTag	"<NL>\|@p\d\|@c\d\{3}" contained
syn match ferretTag	"@\([sdtcia]r\|[acs]s\|[sciga]g\|[tcig]i\|[ac]c\)" contained
syn match ferretTag	"@\(zo\|m[apu]\|el\|we\|[lsi]m\|iz\|ca\)\d\d" contained

"============================================================
" Transformations are delimited by brackets; highlight the brackets
" using a different group from the transformation itself.
syn region ferretTransBlock	matchgroup=ferretBracket start=+\[+ end=+\]+ contains=ferretTransBlock,ferretRegrid,ferretTransSpec,ferretTransform,ferretSymbol,ferretImmediate

" Only highlight these inside of a ferretTransBlock
syn match ferretRegrid "\(g[ijklxyzt]\{1,4}\|g\)=" contained
syn match ferretTransSpec "[dijklxyzt]=" contained
syn match ferretTransform "@\(asn\|ave\|cda\|cdb\|cia\|cib\|ddb\|ddc\|ddf\|din\|evnt\|fav\|evnt\|fav\|fln\|fnr\|iin\|itp\|lin\|loc\|max\|min\|modmin\|modmax\|modngd\|modsum\|modvar\|mod\|nbd\|ngd\|nrst\|rsum\|sbn\|sbx\|shf\|shn\|spz\|sum\|swl\|var\|weq\|xact\)" contained

"============================================================
" If you want these lit, uncomment them and the "hi link" below
"syn keyword ferretCompare	eq ne gt ge lt le
"syn match ferretDelimiter	"[/;]"
"syn match ferretArithmeticOperator	"\.\=[-+*/\^]"
" Standard numbers
"syn match ferretNumber		"\<\d\+[ij]\=\>"
" floating point number, with dot, optional exponent
"syn match ferretFloat		"\<\d\+\.\d*\([edED][-+]\=\d\+\)\=[ij]\=\>"
" floating point number, starting with a dot, optional exponent
"syn match ferretFloat		"\.\d\+\([edED][-+]\=\d\+\)\=[ij]\=\>"
" floating point number, without dot, with exponent
"syn match ferretFloat		"\<\d\+[edED][-+]\=\d\+[ij]\=\>"

"============================================================
if !exists("did_ferret_syntax_inits")
  let did_ferret_syntax_inits = 1
  " Link to the default methods for highlighting.  Can be overridden later.
  " For a light-colored background, these are typically as follows:
  " Comment=blue String=red Function=indigo Statement=yellow
  " Type=green Special=magenta Todo=black-on-yellow
  hi link ferretComment			Comment
  hi link ferretString			String
  hi link ferretFunction		Function
  hi link ferretStatement		Statement
  hi link ferretSymbol			Type
  hi link ferretTag				Special
  hi link ferretImmediate		Special
  hi link ferretTodo				Todo
  hi ferretBlank term=reverse ctermbg=magenta

  hi link ferretAlias			ferretStatement
  hi link ferretBoolean			ferretStatement
  hi link ferretCancel			ferretStatement
  hi link ferretCancelMode		ferretStatement
  hi link ferretConditional	ferretStatement
  hi link ferretDef			ferretStatement
  hi link ferretPPL			ferretStatement
  hi link ferretSet			ferretStatement
  hi link ferretSetMode		ferretStatement
  hi link ferretShow			ferretStatement
  hi link ferretShowMode		ferretStatement

  hi link ferretBracket			ferretFunction
  hi link ferretGo			ferretFunction
  hi link ferretParen			ferretFunction
  hi link ferretRegrid			ferretFunction
  hi link ferretTransform		ferretFunction
  hi link ferretTransSpec		ferretFunction

"  hi link ferretQual			ferretStatement
"  hi link ferretCompare			ferretStatement
"  hi link ferretTransBlock		ferretFunction
"  hi link ferretDelimiter		Special
"  hi link ferretNumber			Number
"  hi link ferretFloat			Float
"  hi link ferretOperator		Operator
"  hi link ferretArithmeticOperator	ferretOperator
"  hi link ferretRelationalOperator	ferretOperator
"  hi link ferretLogicalOperator	ferretOperator
endif

let b:current_syntax = "ferret"
