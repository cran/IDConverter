# Generated by roxytest: Do not edit by hand!

# File R/convert_icgc.R: @testexamples

test_that("Function convert_icgc() @ L25", {
  
  
  x <- convert_icgc("SP29019")
  x
  
  
  expect_equal(x, "DO13695")
  expect_error(convert_pcawg("SA170678"))
  expect_error(convert_icgc("SP29019", from = "icgc_specimen_id", to = "icgc_specimen_id"))
})

