# buildroot

## Dependencies on Ubuntu

```
sudo apt install -y sed make binutils build-essential \
  gcc g++ bash patch gzip bzip2 perl tar cpio unzip rsync file bc \
  wget \
  libncurses5-dev \
  git cvs rsync subversion \
  asciidoc \
  ccache
```

## Building

```
pushd /tmp
wget "https://buildroot.org/downloads/buildroot-2020.11.tar.gz"
tar xzf buildroot-2020.11.tar.gz
popd
./config.sh
make
```

