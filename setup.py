
from __future__ import print_function

import os


# Python doesn't have symlink support under windows. Add it, but this must be
# run as admin.
os_symlink = getattr(os, "symlink", None)
if not callable(os_symlink):
    def symlink_ms(source, link_name):
        flag = ""
        if os.path.isdir(source):
            flag = "/D"
        os.system("mklink {flags} {link} {target}".format(
            flags = flag,
            link = os.path.abspath(link_name),
            target = os.path.abspath(source)))
    os.symlink = symlink_ms


spacemaconfig_path = os.path.dirname(os.path.realpath(__file__))

def link_file_to_home(filename, needs_dot=True):
    config_file = os.path.join(spacemaconfig_path, filename)
    prefix = '~/'
    if needs_dot:
        prefix += '.'
        destination = os.path.expanduser(prefix + filename)

    print()
    print('{src}[{src_good}] to {dest}[{dest_good}]'.format(
        src=config_file,
        src_good=os.path.exists(config_file),
        dest=destination,
        dest_good=os.path.exists(destination)))
    try:
        os.symlink(config_file, destination)
    except OSError as ex:
        print(ex)
        print('If file already then we might already the symlink.')

    print('desired: {path} -> {realpath}'.format(path=destination, realpath=os.path.realpath(destination)))
    print('actual:  {path} -> {realpath}'.format(path=destination, realpath=config_file))

link_file_to_home('spacemacs')
link_file_to_home('emacs.d')
