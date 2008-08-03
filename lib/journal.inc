# -*- shell-script -*-
# Things related to the file journal
#
#   Copyright (C) 2008 Rocky Bernstein rocky@gnu.org
#
#   zshdb is free software; you can redistribute it and/or modify it under
#   the terms of the GNU General Public License as published by the Free
#   Software Foundation; either version 2, or (at your option) any later
#   version.
#
#   zshdb is distributed in the hope that it will be useful, but WITHOUT ANY
#   WARRANTY; without even the implied warranty of MERCHANTABILITY or
#   FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
#   for more details.
#   
#   You should have received a copy of the GNU General Public License along
#   with zshdb; see the file COPYING.  If not, write to the Free Software
#   Foundation, 59 Temple Place, Suite 330, Boston, MA 02111 USA.

# append a command into journal file and then run the command.
_Dbg_write_journal_eval() {
  _Dbg_write_journal "$@" 
  eval $@
}

# append a command into journal file and then run the command.
_Dbg_write_journal_var() {
  typeset var_name=$1
  typeset val
  typeset val_cmd="$val=\${$var_name}"
  eval $val_cmd
  _Dbg_write_journal "${var_name}=${val}" 
}

_Dbg_write_journal_avar() {
  typeset decl_str=$(declare -p $1)
  typeset -a decl_a
  decl_a=($decl_str)
  typeset -a decl_a2
  decl_a2=${decl_a[@]:2}
  _Dbg_write_journal ${decl_a2[@]}
}

# Append a command into journal file. But we only need to do
# if we are in a subshell.
_Dbg_write_journal() {
#   if (( $BASH_SUBSHELL != 0 )) ; then
#     echo "$@" >> ${_Dbg_journal} 2>/dev/null
#   fi
  # return $?
}

# Remove all journal files.
_Dbg_erase_journals() {
  rm ${_Dbg_journal} 2>/dev/null
}

# read in or "source" in journal file which will set variables.
_Dbg_source_journal() {

  if [ -r $_Dbg_journal ] ; then 
    . $_Dbg_journal
    ## (( BASH_SUBSHELL == 0 )) && _Dbg_erase_journals
  fi
}