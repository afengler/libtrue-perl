use ExtUtils::MakeMaker;

WriteMakefile(
	NAME		=> 'perl_libtrue',
	VERSION_FROM	=> 'libtrue.pm',
	AUTHOR		=> 'Andrew Fengler',
	CCFLAGS		=> '-Wall -std=c99',
	OPTIMIZE	=> '-O3',
	LICENSE		=> 'freebsd',
);

__END__
