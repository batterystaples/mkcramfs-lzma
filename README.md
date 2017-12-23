Certain routers with OpenRG use a special filesystem in their firmware images, which has been dubbed "cramfs-lzma". It is the same as regular cramfs, but uses
LZMA to compress files, instead of gzip.

This tool is based upon a tool contained in a GPL tarball from here:
https://sourceforge.net/projects/officialactiontecfirmware/files/mi424wr/vI/actiontec_opensrc_mi424wr-rev-i_fw-40-21-10-2.tar.gz/download

Modifications have been made so that it will compile on modern systems - this has been tested on GCC 6 and GCC 7 on Debian x86_64 systems.

This program is still being tested - it seems to have some problems processing
files over the block size. However, it is also possible that it works correctly
and I am only thinking that there are errors due to testing with uncramfs-lzma,
which also has (link!) problems processing files greater than the block size.
Given that both programs were produced from a very similar source, I find it
more likely that mkcramfs-lzma and uncramfs-lzma share a similar bug, but it
will be hard to debug mkcramfs-lzma until uncramfs-lzma is fixed.

It's worth noting that the (link!) Audiocodes MP264 is able to read archives created by
mkcramfs-lzma, even in some cases where uncramfs-lzma can't, but I have no easy
way of knowing if it is reading them correctly.

To compile this tool, you will need the header files for zlib and libstdc++-7.
To install these on Debian systems, run the command:
$ sudo apt-get install zlib1g-dev libstdc++-7-dev
You will also need a compiler and build tools, if you don't have these already.
You can obtain these with the command:
$ sudo apt-get install build-essential

Once you have installed the packages, building is as simple as executing the
command:
$ make

You will see some warnings, but as far as I am aware, these do not impact the
functionality of the program.

After this command has finished executing, the program (called "mkcramfs-lzma") will be in your build directory. The router on which I am testing requires a block size of 65536, which requires the option "-b 65536", though I am not aware if this is the same on all routers which use this format.

So, the command to create a cramfs-lzma image "fs.cramfs" from a directory "fs" is:
$ ./mkcramfs-lzma -b 65536 fs fs.cramfs
