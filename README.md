# nixvim-config

## Vim tips and notes

### Movement

- `C-d` move half page down
- `C-u` move half page up

### Rename word flow

- `*` select all matches in buffer
- `cgn` change next match
- `.` to repeat action

### Replace

- `:%s/foo/bar/gc` %: in whole buffer, s: replace foo with bar, g: global (several times per line), c: confirm
- `Telescope results -> C-q -> :cdo {{cmd}} -> :wa` refactor via quickfix list and bulk actions

### Macros

- `qw -> {{do stuff}} -> q -> 4@w` q: start/stop macro record, w: in register w, 4@w: repeat 4 times the macro w
- `:reg` show registers

### Misc

- `:%y` yank whole buffer
- `gt` next tab
- `gT` previous tab
