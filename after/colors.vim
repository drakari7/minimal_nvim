" Overwrites the color scheme
" Background is 1f1f1f
" temp color #ebdbb2
let background = "#1f1f1f"

hi Normal           guifg=#efefef       guibg=#1f1f1f       gui=none
hi SignColumn       guifg=none          guibg=#1c1c1c       gui=none
hi EndOfBuffer      guifg=#303030       guibg=#1f1f1f       gui=none
hi LineNr           guifg=#e37412       guibg=#1f1f1f       gui=none
hi Visual           guifg=none          guibg=#303030       gui=none
hi Comment                                                  gui=italic
hi helpExample      guifg=#ebdbb2       guibg=#1f1f1f       gui=none
hi Ignore           guifg=#619fff
hi Search           guifg=wheat         guibg=peru
hi IncSearch        guifg=wheat         guibg=peru

" Completion menu options
hi Pmenu            guifg=#efefef       guibg=#363944       gui=none
hi PmenuSbar        guifg=#efefef       guibg=#363944       gui=none
hi PmenuThumb       guifg=#efefef       guibg=#696969       gui=none

" for floating windows
hi NormalFloat      guifg=none          guibg=#363944       gui=none
hi FloatBorder      guifg=#21eda9       guibg=#363944       gui=none


hi CompeDocumentationBorder  guifg=#21eda9      guibg=#1f1f1f       gui=none

" LSP diagnostic colors
hi LspDiagnosticsDefaultError       guifg=#f22222
hi LspDiagnosticsDefaultWarning     guifg=#fcf91c
hi LspDiagnosticsDefaultInformation guifg=#29a3ff
hi LspDiagnosticsDefaultHint        guifg=#29ff7e

" Tree sitter related colors
hi @punctuation.delimiter     guifg=#696969
hi @punctuation.bracket       guifg=#d94311
" hi TSPunctSpecial

" Constants
hi @string             guifg=#b8bb26
hi @string.escape      guifg=#619fff
hi @character          guifg=#63ffb9
hi @boolean            guifg=#63ffb9        gui=italic
hi @number             guifg=#e9875f
hi @float              guifg=#e9875f


" Functions
hi @function.builtin    guifg=#50e1ff        gui=italic
hi @function            guifg=#829fff
hi @function.call       guifg=#829fff
hi @method              guifg=#829fff
hi @method.call         guifg=#829fff
hi @field               guifg=#fa6950
hi @constructor         guifg=#829fff        gui=italic

" Keywords
hi @conditional        guifg=#AF87D7
hi @repeat             guifg=#AF87D7
hi @keyword            guifg=#AF87D7        gui=italic
hi @keyword.operator   guifg=#AF87D7
hi @keyword.return     guifg=#AF87D7
hi @operator           guifg=#de671d
hi @include            guifg=#5ade18
hi @variable.builtin   guifg=#adadad        gui=italic
hi @variable           guifg=#efefef

