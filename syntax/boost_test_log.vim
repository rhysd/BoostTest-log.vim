if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax match boost_test_logReport  '^\*\*\*\s\+.*$'
syntax match boost_test_logInfo    '^-\+$'
syntax match boost_test_logTitle   '^Start testing: .*$'
syntax match boost_test_logTitle   '^End testing: .*$'
syntax match boost_test_logFailure '^\*\*\* \d\+ failures\? detected in test suite ".\+"$' contained containedin=boost_test_logReport
syntax match boost_test_logSuccess '^\*\*\* No errors detected$' contained containedin=boost_test_logReport
syntax match boost_test_logError   'exception .\+ is expected$'
syntax match boost_test_logError   '^Assertion failed:'
syntax match boost_test_logFailure '^Test Failed\.$'
syntax match boost_test_logSuccess '^Test Passed\.$'
syntax match boost_test_logReport  '^\d\+/\d\+ Testing: \zs.\+$'

highlight default link boost_test_logReport  Statement
highlight default link boost_test_logInfo    PreProc
highlight default link boost_test_logFailure ErrorMsg
highlight default link boost_test_logSuccess MoreMsg
highlight default link boost_test_logError   Error
highlight default link boost_test_logTitle   Title

let b:current_syntax = "boost_test_log"
