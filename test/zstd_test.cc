// Copyright 2020 Luminary Cloud, Inc. All Rights Reserved.

#include "zstd.h"

#include <iostream>
#include <sstream>
#include <vector>
#include <memory>

int main(int argc, char**argv) {
  std::ostringstream want_buf;
  for (int i = 0; i < 1000; i++) {
    want_buf << "data" << i;
  }
  std::string want = want_buf.str();
  std::cout << "Want size: " << want.size() << "\n";
  std::vector<uint8_t> output(want.size()*2, 0);
  size_t output_size = ZSTD_compress(output.data(), output.size(),
                                     want.data(),
                                     want.size(), 6);
  std::cout << "Output size: " << output_size << "\n";
  if (ZSTD_isError(output_size)) {
    std::cout << "error: " << output_size;
    return 1;
  }
  std::vector<char> got(want.size()*2, 0);
  output.resize(output_size);
  auto got_size = ZSTD_decompress(got.data(), got.size(), output.data(), output.size());
  if (got_size != want.size()) {
    std::cout << "wrong size";
    return 1;
  }
  std::cout << "Got size: " << got_size;
  got.resize(got_size);
  if (std::string(&got[0], got_size) != want) {
    std::cout << "wrong output";
  }
  return 0;
}
