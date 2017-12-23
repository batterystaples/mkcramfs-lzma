all:
	gcc -o mkcramfs-lzma lzma-rg/SRC/Common/NewHandler.cpp lzma-rg/SRC/7zip/Compress/LZMA/LZMADecoder.cpp lzma-rg/SRC/7zip/Compress/LZ/LZOutWindow.cpp lzma-rg/SRC/Common/Alloc.cpp lzma-rg/SRC/7zip/Common/InBuffer.cpp lzma-rg/SRC/7zip/Compress/LZMA/LZMAEncoder.cpp lzma-rg/SRC/7zip/Compress/LZ/LZInWindow.cpp lzma-rg/SRC/7zip/Common/OutBuffer.cpp lzma-rg/SRC/7zip/Compress/RangeCoder/RangeCoderBit.cpp lzma-rg/SRC/Common/CRC.cpp lzma-rg/SRC/7zip/Common/FileStreams.cpp lzma-rg/SRC/Common/C_FileIO.cpp lzma-rg/SRC/7zip/lzma_encode.cpp mkcramfs.c -lz -lstdc++

clean:
	rm -f mkcramfs-lzma
