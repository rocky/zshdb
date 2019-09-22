# -*- shell-script -*-
# "set annotate" debugger command
#
#   Copyright (C) 2010-2011, 2014, 2016, 2019 Rocky Bernstein
#   <rocky@gnu.org>
#
#   This program is free software; you can redistribute it and/or
#   modify it under the terms of the GNU General Public License as
#   published by the Free Software Foundation; either version 2, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#   General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; see the file COPYING.  If not, write to
#   the Free Software Foundation, 59 Temple Place, Suite 330, Boston,
#   MA 02111 USA.

if [[ 0 == ${#funcfiletrace[@]} ]] ; then
    dirname=${0%/*}
    [[ $dirname == $0 ]] && top_dir='../..' || top_dir=${dirname}/../..
    for lib_file in help alias ; do source $top_dir/lib/${lib_file}.sh; done
    typeset -A _Dbg_command_help_set
    typeset -A _Dbg_debugger_set_commands
fi

typeset -A _Dbg_complete_level_2_data
_Dbg_complete_level_2_data[set_annotate]='0 1'

_Dbg_help_add_sub set annotate \
'**set annotate** {**0**|**1**}

Set annotation level. This is a (mostly obsolete) gdb setting, but
it is used in GNU Emacs.

  0 - normal
  1 - fullname (for use when running under GNU Emacs).

See also:
---------

**show annotate**
'

_Dbg_do_set_annotate() {
    if (( $# == 0 )) ; then
        _Dbg_msg "Argument required (an integer to set 'annotate' to.)."
    elif [[ "$1" == [0-9]* ]] ; then
        if (( $1 > 3 || $1 < 0)); then
            _Dbg_msg "Annotation level must be between 0 and 3. Got: ${1}."
        else
            _Dbg_write_journal_eval "_Dbg_set_annotate=$1"
        fi
    else
        _Dbg_errmsg "Integer argument expected; got: $1"
        return -1
    fi
    return 0
}
