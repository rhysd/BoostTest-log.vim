if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax match boost_test_logReport          '^\*\*\*\s\+.*$'
syntax match boost_test_logInfo            '^-\+$'
syntax match boost_test_logTitle           '^Start testing: .*$'
syntax match boost_test_logTitle           '^End testing: .*$'
syntax match boost_test_logFailure         '^\*\*\* \d\+ failures\? detected in test suite ".\+"$' contained containedin=boost_test_logReport
syntax match boost_test_logSuccess         '^\*\*\* No errors detected$' contained containedin=boost_test_logReport
syntax match boost_test_logErrorLine       '^[/._:[:alnum:]]\+ error in ".*":.*$'
syntax match boost_test_logError           'exception .\+ is expected$' contained containedin=boost_test_logErrorLine
syntax match boost_test_logError           'exception thrown by .*$' contained containedin=boost_test_logErrorLine
syntax match boost_test_logError           '\h\w*\.\w\+:\d\+:' contained containedin=boost_test_logErrorLine
syntax match boost_test_logError           '^Assertion failed:'
syntax match boost_test_logError           'signal: SIGABRT'
syntax match boost_test_logError           'signal: SIGSEGV'
syntax match boost_test_logFailure         '^Test Failed\.$'
syntax match boost_test_logSuccess         '^Test Passed\.$'
syntax match boost_test_logTestName        '^\d\+/\d\+ Testing: \zs.\+$'
syntax region boost_test_logBuilderWarning start="\[91m" end="\[0m"

highlight default link boost_test_logTestName       Statement
highlight default link boost_test_logInfo           PreProc
highlight default link boost_test_logFailure        ErrorMsg
highlight default link boost_test_logSuccess        MoreMsg
highlight default link boost_test_logError          Error
highlight default link boost_test_logTitle          Title
highlight default link boost_test_logBuilderWarning ErrorMsg

let b:current_syntax = "boost_test_log"
