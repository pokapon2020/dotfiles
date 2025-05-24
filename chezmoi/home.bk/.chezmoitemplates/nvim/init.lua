local opt = vim.opt

opt.ff = unix
opt.number = true
opt.list = true
opt.smartindent = true
opt.visualbell = true

opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4

-- 1. 内部処理コードの設定
opt.encoding = 'utf-8'
-- 2. 空のファイルの文字コードの設定。
opt.fileencoding = 'utf-8'
-- 3. 先頭付近にデフォルトの文字コードを入れ、その他ありそうな文字コードを列挙します。
opt.fileencodings = 'ucs-bom,utf-8,iso-2022-jp,cp932,euc-jp,default,latin'
-- 4. Ambiguous Width Characters の設定。
opt.ambiwidth = 'double'
-- 5. Menuの言語の設定
-- opt.langmenu = none
-- ファイルフォーマット
opt.fileformats = 'unix,dos,mac'
