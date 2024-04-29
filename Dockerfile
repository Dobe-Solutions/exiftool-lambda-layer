FROM public.ecr.aws/sam/build-nodejs20.x:latest AS builder

RUN dnf update -y && dnf groupinstall -y "Development Tools"

ENV PREFIX_PATH=/opt

ENV PERL_VERSION=5.38.2
ENV EXIFTOOL_VERSION=12.70

# install perl
RUN curl -L https://github.com/Perl/perl5/archive/refs/tags/v${PERL_VERSION}.tar.gz  | tar zx && \
    cd perl5-${PERL_VERSION} && ./Configure -des -Dprefix=${PREFIX_PATH} && make install

# install exiftool
RUN curl -L https://github.com/exiftool/exiftool/archive/refs/tags/${EXIFTOOL_VERSION}.tar.gz  | tar zx && \
    cd exiftool-${EXIFTOOL_VERSION} && ${PREFIX_PATH}/bin/perl Makefile.PL PREFIX=${PREFIX_PATH} && make install

FROM public.ecr.aws/sam/build-nodejs20.x:latest AS packager

ENV PREFIX_PATH=/opt

COPY --from=builder ${PREFIX_PATH}/bin ${PREFIX_PATH}/bin
COPY --from=builder ${PREFIX_PATH}/lib ${PREFIX_PATH}/lib

# test installation before packaging
COPY sample.jpg ${PREFIX_PATH}
RUN ${PREFIX_PATH}/bin/exiftool ${PREFIX_PATH}/sample.jpg

RUN cd ${PREFIX_PATH} && zip -r /tmp/exiftool-lambda-layer.zip bin/ lib/