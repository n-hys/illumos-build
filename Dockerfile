FROM opensuse/leap:latest

RUN  zypper --non-interactive --no-gpg-checks install --auto-agree-with-licenses \
    git-core gcc gcc-c++ make bison flex perl-XML-Parser libopenssl-devel  \
    liblz4-devel bzip2 patch zlib-devel ncurses-devel ksh ed mkisofs dtc \
    autoconf u-boot-tools libtirpc-devel libbsd-devel tar gzip xz

