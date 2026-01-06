
# go install github.com/klauspost/cpuid/v2/cmd/cpuid@v2.3.0
#export GOAMD64=v"$(cpuid --json | jq .X64Level)"
export GOAMD64=v3

export GOPROXY=direct
