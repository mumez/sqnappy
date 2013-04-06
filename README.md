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

## Future plan ##
Currently, only basic APIs are provided. I'll add stream-style API for handling  bigger data.
