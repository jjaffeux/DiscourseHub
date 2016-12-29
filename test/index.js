// https://webpack.github.io/docs/context.html#require-context
var testsContext = require.context('.', true, /\_test$/)
testsContext.keys().forEach(testsContext)
