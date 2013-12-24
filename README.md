Sqnappy
=======

Squeak/Pharo binding for [Snappy](https://code.google.com/p/snappy/ "Snappy") compression library.
Sqnappy is using a VM plugin for calling Snappy C API. (It is not a pure Smalltalk implementation).

You can see these directories:

- plugin-build
 + plugin build settings
- plugin-binary
 + pre-built shared libraries (SnappyPlugin.dll, bundle, so, etc)
- repository
 + [Cypress](https://github.com/CampSmalltalk/Cypress) style Smalltalk source tree

For MCZ packages, visit 
<a href="http://smalltalkhub.com/#!/~MasashiUmezawa/Sqnappy">SmalltalkHub Sqnappy site</a>.

## Performance ##
Just a simple code snippet. But it would be helpful for showing Sqnappy's characteristics.

```Smalltalk
"## Test data ##"
originalBytes := Morph allSelectors asString asByteArray.
originalBytes size. "30363 bytes on my image"

"## Compressed size ##"
" GZipWriteStream "
originalBytes asString zipped size. "11036"
" Sqnappy"
(SnappyCore compress: originalBytes) size.  "17461 -- 1.6x bigger"

"## Round-trip time ##"
" GZipWriteStream/GZipReadStream "
[100 timesRepeat: [originalBytes asString zipped unzipped asByteArray]] timeToRun.  "487"
" Sqnappy "
[100 timesRepeat: [SnappyCore uncompress: (SnappyCore compress: originalBytes)]] timeToRun "45 -- 10.8x faster"
```

## Features ##
- Basic compress/uncompress API
- Stream API with [framing format](http://code.google.com/p/snappy/source/browse/trunk/framing_format.txt) support (interoperability was checked with [snzip](https://github.com/kubo/snzip))
- Custom stream format (.sqn - sqnappy)
	- Block size is changeable from 32k to 4M (default is 64k)
	- No CRC32C checking for speed
	- Data size is represented in big-endian

## Usage ##
Basic:
```Smalltalk
"## Compress/Uncompress ##"
compressed := SnappyCore compress: data.
uncompressed := SnappyCore uncompress: compressed.
```

Streaming:
```Smalltalk
"## Streaming (write) ##"
wstrm := SnappyFraming sz writeStreamOn: ByteArray new.
wstrm nextPutAll: #[49 50 51 52 53 10 49 50 51 52 53 10].
wstrm nextPutAll: #[49 50 51 52 53 10 123 49 50 51 52 53 10 0].
compressed := wstrm contents.
wstrm close.
```
```Smalltalk
"## Streaming (read) ##"
rstrm := SnappyFraming sz readStreamOn: compressed.
uncompressed := rstrm contents.
rstrm close.
```
```Smalltalk
"## Streaming (partial read) ##"
rstrm := SnappyFraming sz readStreamOn: compressed.
[rstrm atEnd] whileFalse: [
  uncompressedPart := rstrm upTo: 10.
  Transcript cr; show: uncompressedPart asString
].
rstrm close.
```

Streaming with files: (This snippet is using [FileMan](https://github.com/mumez/FileMan) for simplifying file access).
```Smalltalk
"## Compress 'SqueakV41.sources -> 'SqueakV41.sources.sqn' with Sqnappy format ##"
readStr := ('.' asDirectoryEntry / 'SqueakV41.sources') readStream binary.
writeEnt := '.' asDirectoryEntry / 'SqueakV41.sources.sqn'.
writer := SnappyFraming sqn writeStreamOn: writeEnt writeStream.
writer repeatWrite:[:w | w nextPutAll:(readStr next: w blockSize)] until:[readStr atEnd] finally:[:w | w close. readStr close].

"## Uncompress 'SqueakV41.sources.sqn -> 'SqueakV41.sources' ##"
readEnt := '.' asDirectoryEntry / 'SqueakV41.sources.sqn'.
reader := SnappyFraming sqn readStreamOn: readEnt readStream.
writeStr := ('.' asDirectoryEntry / 'SqueakV41-trip.sources') writeStream.
reader repeatReadUntilEnd:[:r | ] out: writeStr finally:[:r | r close. writeStr close].
```

On my windows laptop (Core-i5 2430M, Samsong SSD 840), Compressed file('SqueakV41.sources.sqn') was written in about **250 msecs**. Uncompressed file('SqueakV41-trip.sources') was written in about **100 msecs**.
Original file size was **26,005,504 bytes**. Compressed file size was **10,612,736 bytes**.

Stream API enables you to handle pretty big data. I've also tested the code above with a big pg_dump file ( **1.3G** - 1,304,485,888 bytes). There were no annoying GCs. Compressed size was 631,627,776 bytes. **9844 msecs** for compress; **6496 msecs** for uncompress.

## Installation ##
1. Copy the [pre-built](https://github.com/mumez/sqnappy/blob/master/plugin-binary/) Snappy.dll (.so, .bundle) to your VM directory
2. Load Sqnappy

```Smalltalk
"Squeak"
Installer squeaksource
    project: 'MetacelloRepository';
    install: 'ConfigurationOfSqnappy'. 
(Smalltalk at: #ConfigurationOfSqnappy) load.

"Pharo"
Gofer new
      url: 'http://smalltalkhub.com/mc/MasashiUmezawa/Sqnappy/main';
      package: 'ConfigurationOfSqnappy';
      load.
(Smalltalk at: #ConfigurationOfSqnappy) load.
```

Open TestRunner and see the results. If tests are red, please make sure step.1 was done properly.
 
Note: Plugin binaries were built for 32 bit Cog VM. For other VM (legacy VM, 64 bit VM, etc), probably you need to recompile plugin source by yourself.

## License ##
[MIT license](http://opensource.org/licenses/MIT)