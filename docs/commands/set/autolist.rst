.. index:: set; autolist
.. _set_autolist:

List Statements on Debugger Entry (`set auto list`)
---------------------------------------------------

**set autolist** [ **on** | **off** ]

Run the :ref:`list <list>` command every time you stop in the
debugger.

With this, you will get output like:

::

    -> 1 from subprocess import Popen, PIPE
    (trepan2) next
    (/users/fbicknel/Projects/disk_setup/sqlplus.py:2): <module>
    ** 2 import os
      1     from subprocess import Popen, PIPE
      2  -> import os
      3     import re
      4
      5     class SqlPlusExecutor(object):
      6         def __init__(self, connection_string='/ as sysdba', sid=None):
      7             self.__connection_string = connection_string
      8             self.session = None
      9             self.stdout = None
     10             self.stderr = None
    (trepan2) next
    (/users/fbicknel/Projects/disk_setup/sqlplus.py:3): <module>
    ** 3 import re
      1     from subprocess import Popen, PIPE
      2     import os
      3  -> import re
      4
      5     class SqlPlusExecutor(object):
      6         def __init__(self, connection_string='/ as sysdba', sid=None):
      7             self.__connection_string = connection_string
      8             self.session = None
      9             self.stdout = None
     10             self.stderr = None
    (trepan2)

.. seealso::

   :ref:`show autolist <show_autolist>`
