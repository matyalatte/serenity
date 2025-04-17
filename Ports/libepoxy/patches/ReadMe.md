# 0001-Remove-an-include-of-err.h.patch
Remove an include of err.h

err.h appears to be BSD-specific, and we don't support it. Luckily, libepoxy compiles just fine even when removing it.

# 0002-Stub-out-a-definition-of-RTLD_NOLOAD.patch
Stub out a definition of RTLD_NOLOAD

SerenityOS's DynamicLoader doesn't support this flag. However, we won't be dynamically loading any tbb extensions for the static library build mold uses, so we can just define it as a no-op as the code paths that use it will never be used.
