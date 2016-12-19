#! /usr/bin/env bash
#
# Author: Micha Rosenbaum
#
# TODO (lol): filter, stats
#   todofilter:
#     Only show items for a single project or context.
#   todostats:
#     Count items for a project or a context.

# todotoday prints all items, that are “due:today”. Items, that are already
# finished, will also be shown. It removes all dates in the form of
# “(due:)?2016-12-17” for better readability.
todotoday()
{
  TODAY=$(date +%F)
  command grep "due:$TODAY" ~/todo.txt | sed 's/\(due:\)\{,1\}[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\} //g' -
}

# todoto is a shortcut for todotoday, to use if you’re super funny ;-)
# alias todoto=todotoday

# todocalendar parses ~/todo.txt to fit the format of the `calendar` cli
# utility (see `man calendar`). This only dates items, that have a due date
# set. For better readability, all dates are removed before printing.
#
# TODO: This doesn’t handle already done items. They are shown just as well.
todocalendar ()
{
  FILENAME=/tmp/todotxt-calendar-${USER}-$(date +%s)
  echo "LANG=utf-8" >> $FILENAME
  awk 'match($0, /due:[0-9]{4}-[0-9]{2}-[0-9]{2}/) {
    # Start at the found match, but cut of “due:2016-” (offset of 9). Use the
    # substring “12-17” (length of 5). Prepend with a tab, followed by the
    # whole line.
    print substr($0, RSTART+9, 5) "\t" $0
  }' ~/todo.txt | sed 's/\(due:\)\{,1\}[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\} //g' - >> $FILENAME
  command calendar -f $FILENAME -B 1
  command rm $FILENAME
}

# todocal is a shortcut for todocalendar
alias todocal=todocalendar

# __todo_cnt_ps1 shows count of todo items in your ~/todo.txt that are
# due:today. Entries marked as done (line starts with “x”) are ignored.
# Nothing is printed if no entries are due:today.
#
# Usage: Add '$(__todo_cnt_ps1)' to $PS1 in your ~/.bashrc.
#
#     # Example for a prompt like “~/Documents (3 todo)$ ”
#     PS1='\w\$(__todo_cnt_ps1)\$ '
__todo_cnt_ps1 ()
{
  TODAY=$(date +%F)
  CNT=$(command grep "due:$TODAY" ~/todo.txt | grep -c '^[^x]' -)
  if [ "$CNT" -gt "0" ]; then
    echo " ($CNT todo)"
  fi
}

# __done_cnt_ps1 shows count of done items in your ~/todo.txt that are
# finished today. Nothing is printed if no entries have been finished today.
#
# Usage: Add '$(__done_cnt_ps1)' to $PS1 in your ~/.bashrc.
#
#     # Example for a prompt like “~/Documents (3 done)$ ”
#     PS1='\w\$(__done_cnt_ps1)\$ '
__done_cnt_ps1 ()
{
  TODAY=$(date +%F)
  CNT=$(command grep -c "x $TODAY" ~/todo.txt)
  if [ "$CNT" -gt "0" ]; then
    echo " ($CNT done)"
  fi
}

# eof todotxt.sh
