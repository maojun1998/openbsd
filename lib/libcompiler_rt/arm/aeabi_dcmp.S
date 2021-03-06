//===-- aeabi_dcmp.S - EABI dcmp* implementation ---------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is dual licensed under the MIT and the University of Illinois Open
// Source Licenses. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "../assembly.h"

// int __aeabi_dcmp{eq,lt,le,ge,gt}(double a, double b) {
//   int result = __{eq,lt,le,ge,gt}df2(a, b);
//   if (result {==,<,<=,>=,>} 0) {
//     return 1;
//   } else {
//     return 0;
//   }
// }

#define DEFINE_AEABI_DCMP(cond)                            \
        .syntax unified                          SEPARATOR \
        .p2align 2                               SEPARATOR \
DEFINE_COMPILERRT_FUNCTION(__aeabi_dcmp ## cond)           \
        push      { r4, lr }                     SEPARATOR \
        bl        SYMBOL_NAME(__ ## cond ## df2) SEPARATOR \
        cmp       r0, #0                         SEPARATOR \
        b ## cond 1f                             SEPARATOR \
        mov       r0, #0                         SEPARATOR \
        pop       { r4, pc }                     SEPARATOR \
1:                                               SEPARATOR \
        mov       r0, #1                         SEPARATOR \
        pop       { r4, pc }                     SEPARATOR \
END_COMPILERRT_FUNCTION(__aeabi_dcmp ## cond)

DEFINE_AEABI_DCMP(eq)
DEFINE_AEABI_DCMP(lt)
DEFINE_AEABI_DCMP(le)
DEFINE_AEABI_DCMP(ge)
DEFINE_AEABI_DCMP(gt)

NO_EXEC_STACK_DIRECTIVE

