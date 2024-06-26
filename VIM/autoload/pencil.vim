let g:airline#themes#pencil#palette = {}

function! airline#themes#pencil#refresh()
  """"""""""""""""""""""""""""""""""""""""""""""""
  " Options
  """"""""""""""""""""""""""""""""""""""""""""""""
  let s:background  = get(g:, 'airline_pencil_bg', &background)
  let s:ansi_colors = &t_Co < 16 ? 1 : 0
  let s:tty         = &t_Co == 8

  """"""""""""""""""""""""""""""""""""""""""""""""
  " Colors
  """"""""""""""""""""""""""""""""""""""""""""""""
  " Base colors
  let s:base03  = {'t': s:ansi_colors ?   8 : (s:tty ? '0' : 234), 'g': '#212121'}
  let s:base02  = {'t': s:ansi_colors ? '0' : (s:tty ? '0' : 235), 'g': '#424242'}
  let s:base01  = {'t': s:ansi_colors ?  10 : (s:tty ? '0' : 240), 'g': '#909090'}
  let s:base00  = {'t': s:ansi_colors ?  11 : (s:tty ? '7' : 241), 'g': '#545454'}
  let s:base0   = {'t': s:ansi_colors ?  12 : (s:tty ? '7' : 244), 'g': '#B2B2B2'}
  let s:base1   = {'t': s:ansi_colors ?  14 : (s:tty ? '7' : 245), 'g': '#636363'}
  let s:base2   = {'t': s:ansi_colors ?   7 : (s:tty ? '7' : 254), 'g': '#D9D9D9'}
  let s:base3   = {'t': s:ansi_colors ?  15 : (s:tty ? '7' : 7  ), 'g': '#C6C6C6'}
  let s:darkblue= {'t': s:ansi_colors ?   4 : (s:tty ? '4' : 24 ), 'g': '#005F87'}
  let s:orange  = {'t': s:ansi_colors ?   9 : (s:tty ? '1' : 166), 'g': '#D75F5F'}
  let s:red     = {'t': s:ansi_colors ?   1 : (s:tty ? '1' : 160), 'g': '#C30771'}
  let s:magenta = {'t': s:ansi_colors ?   5 : (s:tty ? '5' : 125), 'g': '#E32791'}
  let s:violet  = {'t': s:ansi_colors ?  13 : (s:tty ? '5' : 61 ), 'g': '#6855DE'}
  let s:blue    = {'t': s:ansi_colors ?   4 : (s:tty ? '4' : 33 ), 'g': '#008EC4'}
  let s:cyan    = {'t': s:ansi_colors ?   6 : (s:tty ? '6' : 37 ), 'g': '#20A5BA'}
  let s:green   = {'t': s:ansi_colors ?   2 : (s:tty ? '2' : 64 ), 'g': '#10A778'}

  """"""""""""""""""""""""""""""""""""""""""""""""
  " Simple mappings
  " NOTE: These are easily tweakable mappings. The actual mappings get
  " the specific gui and terminal colors from the base color dicts.
  """"""""""""""""""""""""""""""""""""""""""""""""
  " Normal mode
  if s:background == 'dark'
    let s:N1 = [s:base3, s:base1, 'bold']
    let s:N2 = [s:base2, (s:tty ? s:base01 : s:base00), '']
    let s:N3 = [s:base01, s:base02, '']
  else
    let s:N1 = [s:base2, s:base00, 'bold']
    let s:N2 = [(s:tty ? s:base01 : s:base2), s:base1, '']
    let s:N3 = [s:base1, s:base2, '']
  endif
  let s:NF = [s:orange, s:N3[1], '']
  let s:NW = [s:base3, s:orange, '']
  if s:background == 'dark'
    let s:NM = [s:base1, s:N3[1], '']
    let s:NMi = [s:base2, s:N3[1], '']
  else
    let s:NM = [s:base01, s:N3[1], '']
    let s:NMi = [s:base02, s:N3[1], '']
  endif

  " Insert mode
  let s:I1 = [s:N1[0], s:darkblue, 'bold']
  let s:I2 = s:N2
  let s:I3 = s:N3
  let s:IF = s:NF
  let s:IM = s:NM

  " Visual mode
  let s:V1 = [s:N1[0], s:magenta, 'bold']
  let s:V2 = s:N2
  let s:V3 = s:N3
  let s:VF = s:NF
  let s:VM = s:NM

  " Replace mode
  let s:R1 = [s:N1[0], s:red, '']
  let s:R2 = s:N2
  let s:R3 = s:N3
  let s:RM = s:NM
  let s:RF = s:NF

  " Inactive, according to VertSplit in pencil
  " (bg dark: base00; bg light: base0)
  if s:background == 'dark'
    let s:IA = [s:base01, s:base02, '']
  else
    let s:IA = [s:base1, s:base2, '']
  endif

  """"""""""""""""""""""""""""""""""""""""""""""""
  " Actual mappings
  " WARNING: Don't modify this section unless necessary.
  """"""""""""""""""""""""""""""""""""""""""""""""
  let s:NFa = [s:NF[0].g, s:NF[1].g, s:NF[0].t, s:NF[1].t, s:NF[2]]
  let s:IFa = [s:IF[0].g, s:IF[1].g, s:IF[0].t, s:IF[1].t, s:IF[2]]
  let s:VFa = [s:VF[0].g, s:VF[1].g, s:VF[0].t, s:VF[1].t, s:VF[2]]
  let s:RFa = [s:RF[0].g, s:RF[1].g, s:RF[0].t, s:RF[1].t, s:RF[2]]

  let g:airline#themes#pencil#palette.accents = {
        \ 'red': s:NFa,
        \ }

  let g:airline#themes#pencil#palette.inactive = airline#themes#generate_color_map(
        \ [s:IA[0].g, s:IA[1].g, s:IA[0].t, s:IA[1].t, s:IA[2]],
        \ [s:IA[0].g, s:IA[1].g, s:IA[0].t, s:IA[1].t, s:IA[2]],
        \ [s:IA[0].g, s:IA[1].g, s:IA[0].t, s:IA[1].t, s:IA[2]])
  let g:airline#themes#pencil#palette.inactive_modified = {
        \ 'airline_c': [s:NMi[0].g, '', s:NMi[0].t, '', s:NMi[2]]}

  let g:airline#themes#pencil#palette.normal = airline#themes#generate_color_map(
        \ [s:N1[0].g, s:N1[1].g, s:N1[0].t, s:N1[1].t, s:N1[2]],
        \ [s:N2[0].g, s:N2[1].g, s:N2[0].t, s:N2[1].t, s:N2[2]],
        \ [s:N3[0].g, s:N3[1].g, s:N3[0].t, s:N3[1].t, s:N3[2]])

  let g:airline#themes#pencil#palette.normal.airline_warning = [
        \ s:NW[0].g, s:NW[1].g, s:NW[0].t, s:NW[1].t, s:NW[2]]

  let g:airline#themes#pencil#palette.normal_modified = {
        \ 'airline_c': [s:NM[0].g, s:NM[1].g,
        \ s:NM[0].t, s:NM[1].t, s:NM[2]]}

  let g:airline#themes#pencil#palette.normal_modified.airline_warning =
        \ g:airline#themes#pencil#palette.normal.airline_warning

  let g:airline#themes#pencil#palette.insert = airline#themes#generate_color_map(
        \ [s:I1[0].g, s:I1[1].g, s:I1[0].t, s:I1[1].t, s:I1[2]],
        \ [s:I2[0].g, s:I2[1].g, s:I2[0].t, s:I2[1].t, s:I2[2]],
        \ [s:I3[0].g, s:I3[1].g, s:I3[0].t, s:I3[1].t, s:I3[2]])

  let g:airline#themes#pencil#palette.insert.airline_warning =
        \ g:airline#themes#pencil#palette.normal.airline_warning

  let g:airline#themes#pencil#palette.insert_modified = {
        \ 'airline_c': [s:IM[0].g, s:IM[1].g,
        \ s:IM[0].t, s:IM[1].t, s:IM[2]]}

  let g:airline#themes#pencil#palette.insert_modified.airline_warning =
        \ g:airline#themes#pencil#palette.normal.airline_warning

  let g:airline#themes#pencil#palette.visual = airline#themes#generate_color_map(
        \ [s:V1[0].g, s:V1[1].g, s:V1[0].t, s:V1[1].t, s:V1[2]],
        \ [s:V2[0].g, s:V2[1].g, s:V2[0].t, s:V2[1].t, s:V2[2]],
        \ [s:V3[0].g, s:V3[1].g, s:V3[0].t, s:V3[1].t, s:V3[2]])

  let g:airline#themes#pencil#palette.visual.airline_warning =
        \ g:airline#themes#pencil#palette.normal.airline_warning

  let g:airline#themes#pencil#palette.visual_modified = {
        \ 'airline_c': [s:VM[0].g, s:VM[1].g,
        \ s:VM[0].t, s:VM[1].t, s:VM[2]]}

  let g:airline#themes#pencil#palette.visual_modified.airline_warning =
        \ g:airline#themes#pencil#palette.normal.airline_warning

  let g:airline#themes#pencil#palette.replace = airline#themes#generate_color_map(
        \ [s:R1[0].g, s:R1[1].g, s:R1[0].t, s:R1[1].t, s:R1[2]],
        \ [s:R2[0].g, s:R2[1].g, s:R2[0].t, s:R2[1].t, s:R2[2]],
        \ [s:R3[0].g, s:R3[1].g, s:R3[0].t, s:R3[1].t, s:R3[2]])

  let g:airline#themes#pencil#palette.replace.airline_warning =
        \ g:airline#themes#pencil#palette.normal.airline_warning

  let g:airline#themes#pencil#palette.replace_modified = {
        \ 'airline_c': [s:RM[0].g, s:RM[1].g,
        \ s:RM[0].t, s:RM[1].t, s:RM[2]]}

  let g:airline#themes#pencil#palette.replace_modified.airline_warning =
        \ g:airline#themes#pencil#palette.normal.airline_warning

  let g:airline#themes#pencil#palette.tabline = {}

  let g:airline#themes#pencil#palette.tabline.airline_tab = [
        \ s:I2[0].g, s:I2[1].g, s:I2[0].t, s:I2[1].t, s:I2[2]]

  let g:airline#themes#pencil#palette.tabline.airline_tabtype = [
        \ s:N2[0].g, s:N2[1].g, s:N2[0].t, s:N2[1].t, s:N2[2]]
endfunction

call airline#themes#pencil#refresh()

