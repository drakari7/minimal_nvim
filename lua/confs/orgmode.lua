local orgmode = require('orgmode')

orgmode.setup_ts_grammar()

orgmode.setup({
  org_default_notes_file = '~/notes/notes.org',
  org_agenda_files = {'~/notes/agenda/*.org'},

  -- org_capture_templates = {
  --   r = {
  --     description = "Repo",
  --     template = "* [[%x][%(return string.match('%x', '([^/]+)$'))]]%?",
  --     target = "~/notes/notes.org",
  --   }
  -- }
})
