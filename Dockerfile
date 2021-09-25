FROM --platform=${BUILDPLATFORM} golang:latest AS base
WORKDIR /src
ENV CGO_ENABLED=0
COPY go.* .
RUN go mod download
COPY . .

FROM base AS build
ARG TARGETOS
ARG TARGETARCH
RUN --mount=type=cache,target=/root/.cache/go-build \
GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -o /out/server server/*

FROM base AS unit-test
RUN --mount=type=cache,target=/root/.cache/go-build \
go test -v server/*

FROM golangci/golangci-lint:latest AS lint-base

FROM base AS lint
COPY --from=lint-base /usr/bin/golangci-lint /usr/bin/golangci-lint
RUN --mount=type=cache,target=/root/.cache/go-build \
  --mount=type=cache,target=/root/.cache/golangci-lint \
  golangci-lint run --timeout 10m0s ./...

FROM scratch AS bin-unix
COPY --from=build /out/server /

FROM bin-unix AS bin-linux
FROM bin-unix AS bin-darwin

FROM scratch AS server-windows
COPY --from=build /out/server /server.exe

FROM bin-${TARGETOS} AS bin