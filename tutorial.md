This doc helps resolve:
https://github.com/syl20bnr/spacemacs/issues/773

Emacs works a lot like vim-unite: you can get a incrementally-filtered
list of possible actions. For example, typing `SPC ?` gives you a list
of all mappings (called keybindings in emacs) and you can type 'evil'
to see just the evil ones. Usually when you're presented with a list
of options, you'll get an autocompleting filtered list.

If you get in trouble, just keep hitting Esc to return to normal
mode. If you see `-- EMACS --` at the bottom of emacs, hit `C-z` to
return to evil mode.

# Differences
While cmdline (pressing :) still works like in vim, the emacs filter view does not:

* pressing tab does not autocomplete
** instead you use Right Arrow
* C-w does not erase a word
* C-u does not clear before the cursor

# Lingo

maps/mappings: keybindings. They're always listed with a space between each keystroke.

SPC: the space bar

RET: the enter key (CR)

# Basic orientation
## Using Emacs' help system

Run vimtutor:

    SPC h T

Get keybindings:

    SPC ?

## Running commands

Most vim commands are available. Some will look a little alien (like `:`), but ignore the extra text and keep going (it clears "default" after you start typing).

To open list of commands:

    SPC :

Now you can start typing (with spaces to break up tokens) and it will filter to matching commands.

## Switching buffers

`:ls` is different. Instead of just listing buffers, it creates a new buffer with a list of other buffers called buffer-menu. Press CR to open a buffer and q to quit.

Open (switch) to a buffer with helm:

    SPC b s


## Killing buffers
## Opening files

Helm is good for this, but I don't understand how to use/configure it.

    SPC h

## Saving files

    :w

# Insert completion

# Creating the .spacemacs

Spacemacs will generate a .spacemacs for you:

    SPC : dotspacemacs/install RET

You need to move it to your dotfiles and symlink it yourself.

At any time, you can edit your spacemacs with:

    SPC f e d

# Customising key bindings

If you are not convinced, then here is the snippet to revert back to the default Vim + vim-surround setup (add it to your dotspacemacs/config function or your ~/.spacemacs):

    (evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)



# Creating a first configuration layer
# Basic package config with use-package
