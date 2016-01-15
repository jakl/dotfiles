for file in ~/.bashrc.d/*; do source $file; done

PERL_MB_OPT="--install_base \"/Users/jakl/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/jakl/perl5"; export PERL_MM_OPT;
