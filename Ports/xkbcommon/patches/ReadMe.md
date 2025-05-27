# Patches for xkbcommon on SerenityOS

## `0001-Define-CLOCK_PROCESS_CPUTIME_ID.patch`

Define CLOCK_PROCESS_CPUTIME_ID in `bench.c`. There is no need to test if it works or not, since we don't care the result of benchmark.
