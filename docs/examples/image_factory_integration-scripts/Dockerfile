FROM 469620122115.dkr.ecr.us-east-2.amazonaws.com/core-shd-ci-us-east-2-ecr-platform-terraform:0.15.23 as base
ARG BUILDKIT_INLINE_CACHE

FROM base as builder
ARG BUILDKIT_INLINE_CACHE
# Put your build stuff here

FROM base as runtime
ARG BUILDKIT_INLINE_CACHE
COPY VERSION /VERSION
# Put your runtime stuff here
