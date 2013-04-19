/*
 *  SnappyPlugin.h
 *  SnappyPlugin 
 *
 */

#ifndef __Snappy_PLUGIN_H__
#define __Snappy_PLUGIN_H__

#include <snappy-c.h> /* Snappy C API */
#include "crc32.h"

unsigned int masked_crc32c(const char *buf, size_t len);

#endif /* #ifndef __Snappy_PLUGIN_H__ */
