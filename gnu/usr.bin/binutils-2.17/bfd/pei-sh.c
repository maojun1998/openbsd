/* BFD back-end for SH PE IMAGE COFF files.
   Copyright 1995, 2000, 2001, 2002 Free Software Foundation, Inc.

This file is part of BFD, the Binary File Descriptor library.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA 02110-1301, USA.  */

#include "bfd.h"
#include "sysdep.h"

#define TARGET_SHL_SYM shlpei_vec
#define TARGET_SHL_NAME "pei-shl"
#define IMAGE_BASE NT_IMAGE_BASE
#define COFF_IMAGE_WITH_PE
#define COFF_WITH_PE
#define PCRELOFFSET TRUE
#define TARGET_UNDERSCORE '_'
#define COFF_LONG_SECTION_NAMES

#include "coff-sh.c"

