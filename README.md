Sqnappy
=======

[Snappy](https://code.google.com/p/snappy/ "Snappy") bindings for Squeak/Pharo.
Sqnappy is using a VM plugin for calling Snappy C API. (It is not a pure Smalltalk implementation).

You can see these directories:

- plugin-build
 + plugin build settings
- plugin-binary
 + pre-build shared libraries (SnappyPlugin.dll, bundle, so, etc)
- repository
 + [Cypress](https://github.com/CampSmalltalk/Cypress) style Smalltalk source tree

For MCZ packages, visit [SmalltalkHub Sqnappy site](http://smalltalkhub.com/#!/~MasashiUmezawa/Sqnappy).

## Performance ##
Just a simple code snippet. But it would be helpful for showing Sqnappy's characteristics.

<pre>
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
</pre>

## Features ##
- Basic compress/uncompress API
- Stream API with framing format support (checked with [snzip](https://github.com/kubo/snzip))
- Custom stream format (.sqn - sqnappy)
	- Block size is changeable from 32k to 4M (default is 64k)
	- No CRC32C checking for speed
	- Data size is represented in big-endian

## Usage ##
Basic:
<pre>
"## Compress/Uncompress ##"
compressed := SnappyCore compress: data.
uncompressed := SnappyCore uncompress: compressed.
</pre>

Streaming:
<pre>
"## Streaming (write) ##"
wstrm := SnappyFraming sz writeStreamOn: ByteArray new.
wstrm nextPutAll: #[49 50 51 52 53 10 49 50 51 52 53 10].
wstrm nextPutAll: #[49 50 51 52 53 10 123 49 50 51 52 53 10 0].
compressed := wstrm contents.
wstrm close.
</pre>
<pre>
"## Streaming (read) ##"
rstrm := SnappyFraming sz readStreamOn: compressed.
uncompressed := rstrm contents.
rstrm close.
</pre>
<pre>
"## Streaming (partial read) ##"
rstrm := SnappyFraming sz readStreamOn: compressed.
[rstrm atEnd] whileFalse: [
  uncompressedPart := rstrm upTo: 10.
  Transcript cr; show: uncompressedPart asString
].
rstrm close.
</pre>

Streaming with files: (This snippet is using [FileMan](https://github.com/mumez/FileMan) for simplifying file access).
<pre>
" ## Compress 'alice29.txt -> 'alice29.txt.sqn' with Sqnappy format ##"
readStr := ('.' asDirectoryEntry / 'alice29.txt') readStream binary.
writeEnt := '.' asDirectoryEntry / 'alice29.txt.sqn'.
writer := SnappyFraming sqn writeStreamOn: writeEnt writeStream.
writer repeatWrite: [:w | w nextPut: readStr next] until: [readStr atEnd] onFinished: [:w | w close. readStr close].

" ## Uncompress 'alice29.txt.sqn -> 'alice29-trip.txt' ##"
readEnt := '.' asDirectoryEntry / 'alice29.txt.sqn'.
reader := SnappyFraming sqn readStreamOn: ent readStream.
writeStr := ('.' asDirectoryEntry / 'alice29-trip.txt') writeStream.
reader repeatRead: [:r | ] outStream: writeStr onFinished: [:r | r close. writeStr close]
</pre>

## License ##
[MIT license](http://opensource.org/licenses/MIT)