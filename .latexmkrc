add_cus_dep('glo', 'gls', 0, 'makeglossaries');
add_cus_dep('acn', 'acr', 0, 'makeglossaries');

sub exportpdf {
    system "./export_to_pdf.ps1";
}

sub makeglossaries {
    system "makeglossaries $_[0]";
    if ( -z "$_[0].glo" ) {
        open GLS, ">$_[0].gls";
        close GLS;
    }
    return 0;
}

exportpdf()