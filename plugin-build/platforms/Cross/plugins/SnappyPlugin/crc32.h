/* This header file is derived from https://github.com/kubo/snzip */

#ifndef __CRC32C_H__
#define __CRC32C_H__
#include <stdint.h>

#define MASK_DELTA 0xa282ead8

uint32_t calculate_crc32c(uint32_t crc32c, const unsigned char *buffer, unsigned int length);

static unsigned int masked_crc32c(const char *buf, size_t len)
{
  uint32_t crc = ~calculate_crc32c(~0, (const unsigned char *)buf, len);
  return ((crc >> 15) | (crc << 17)) + MASK_DELTA;
}

#endif /* __CRC32C_H__ */
