====
Gogs
====

A saltstack formula to install and configure gogs on Ubuntu.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``gogs``
--------

Install Gogs without any nginx proxy setup from the binary distribution and start it up.

.. note:: You must generate and set ``gogs:config:security:secret_key``.


``gogs.nginx``
--------------

Add nginx proxy to support the local running gogs setup. Proxy automatically from https to your local running instance.
