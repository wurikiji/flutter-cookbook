#!/bin/sh

flutter drive \
  --driver=test_driver/scrolling_driver.dart \
  --target=integration_test/scrolling_test.dart \
  --profile --no-dds