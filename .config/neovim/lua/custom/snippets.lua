local ls = require 'luasnip'
-- local s = ls.snippet
-- local t = ls.text_node
local p = ls.parser.parse_snippet

ls.add_snippets('go', {
  p('errCheck', 'if err != nil {\n\t$0\n}'),
  p('zapInfo', 'zap.L().Sugar().Info("$1", $0)'),
  p('zapInfof', 'zap.L().Sugar().Infof("$1", $0)'),
  p('zapDebug', 'zap.L().Sugar().Debug("$1", $0)'),
  p('zapDebugf', 'zap.L().Sugar().Debugf("$1", $0)'),
  p('zapError', 'zap.L().Sugar().Error("$0", err)'),
  p('zapErrorf', 'zap.L().Sugar().Errorf("$0", err)'),
  p('echoHandler', 'func $1(c echo.Context) error {\n\t$0\n\treturn nil\n}'),
})

ls.add_snippets('templ', {
  p('translate', '{ t("$0", lang) }'),
})
