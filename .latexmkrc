# Build the template with pdfLaTeX; keep generated files out of the source tree.
$pdf_mode = 1;
$out_dir = 'build';
# Allow a clean build to settle nested includes, contents and citation backlinks.
$max_repeat = 10;
@default_files = ('thesis.tex');
$pdflatex = 'pdflatex -interaction=nonstopmode -halt-on-error %O %S';
$clean_ext .= ' nlo nls brf';
# Optional nomenclature support, for later use with \nomenclature.
add_cus_dep('nlo', 'nls', 0, 'make_nomenclature');
sub make_nomenclature {
    my ($base) = @_;
    return system('makeindex', '-s', 'nomencl.ist', '-o', "$base.nls", "$base.nlo");
}
