#define PERL_NO_GET_CONTEXT // we'll define thread context if necessary (faster)
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <stdbool.h>

MODULE = perl_libtrue	PACKAGE = perl_libtrue

PROTOTYPES: ENABLE

#include "true.h"

bool get_true()
