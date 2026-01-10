# Use the Bash type builtin to avoid spawning another process.
# Both which & POSIX's command suck because they may get stuck on aliases
alias which='type -P'
