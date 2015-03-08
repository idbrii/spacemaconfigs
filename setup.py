
from __future__ import print_function

import os

spacemaconfig_path = os.path.dirname(os.path.realpath('__file__'))

def link_file_to_home(filename, needs_dot=True):
    config_file = os.path.join(spacemaconfig_path, filename)
    prefix = '~/'
    if needs_dot:
        prefix += '.'
        destination = os.path.expanduser(prefix + filename)

    print()
    print('{src}[{src_good}] to {dest}[{dest_good}]'.format(
        src=config_file,
        src_good=os.path.isfile(config_file),
        dest=destination,
        dest_good=os.path.isfile(destination)))
    try:
        os.symlink(config_file, destination)
    except OSError as ex:
        print(ex)
        print('If file already then we might already the symlink.')

    print('desired: {path} -> {realpath}'.format(path=destination, realpath=os.path.realpath(destination)))
    print('actual:  {path} -> {realpath}'.format(path=destination, realpath=config_file))

link_file_to_home('spacemacs')
link_file_to_home('emacs.d')
