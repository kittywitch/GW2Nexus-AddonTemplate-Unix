FROM ubuntu:24.04 AS builder
RUN apt-get update && apt-get install -y \
    cmake \
    mingw-w64 \
    && rm -rf /var/lib/apt/lists/*

# Debug Build
FROM builder as build-debug
ARG ADDON_OUTPUT_NAME=clion_demo
WORKDIR /addon
COPY . .
RUN mkdir build-debug
WORKDIR /addon/build-debug
RUN cmake -DCMAKE_BUILD_TYPE:STRING=Debug -DCMAKE_C_COMPILER=/usr/bin/x86_64-w64-mingw32-gcc -DCMAKE_CXX_COMPILER=/usr/bin/x86_64-w64-mingw32-g++ -DADDON_OUTPUT_NAME=${ADDON_OUTPUT_NAME} ..
RUN cmake --build . --config Debug --target all -- -j$(nproc)

# Release Build
FROM builder as build-release
ARG ADDON_OUTPUT_NAME=clion_demo
WORKDIR /addon
COPY . .
RUN mkdir build-release
WORKDIR /addon/build-release
RUN cmake -DCMAKE_C_COMPILER=/usr/bin/x86_64-w64-mingw32-gcc -DCMAKE_CXX_COMPILER=/usr/bin/x86_64-w64-mingw32-g++ -DCMAKE_BUILD_TYPE:STRING=MinSizeRel -DADDON_OUTPUT_NAME=${ADDON_OUTPUT_NAME} ..
RUN cmake --build . --config MinSizeRel --target all -- -j$(nproc)

FROM scratch AS export-stage
ARG ADDON_OUTPUT_NAME=clion_demo
COPY --from=build-debug /addon/build-debug/lib${ADDON_OUTPUT_NAME}.dll ./${ADDON_OUTPUT_NAME}-Debug.dll
COPY --from=build-release /addon/build-release/lib${ADDON_OUTPUT_NAME}.dll ./${ADDON_OUTPUT_NAME}.dll
