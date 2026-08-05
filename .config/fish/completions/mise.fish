# Source mise's completions at first use rather than checking in the generated
# script: older generated copies pass the usage spec to `usage complete-word` as
# a single argument (-s), and the spec has outgrown MAX_ARG_STRLEN (32 pages =
# 128K), so they die with "exceeds the OS argument length limit". Regenerating
# here also keeps this in step with whatever mise version is installed.
type -q mise; and mise completion fish | source
