API
===

This part of the documentation lists the full API reference of all classes and functions.

WSGI
----

.. autoclass:: backend_api.wsgi.ApplicationLoader
   :members:
   :show-inheritance:

Config
------

.. automodule:: backend_api.config

.. autoclass:: backend_api.config.application.Application
   :members:
   :show-inheritance:

.. autoclass:: backend_api.config.redis.Redis
   :members:
   :show-inheritance:

.. automodule:: backend_api.config.gunicorn

CLI
---

.. automodule:: backend_api.cli

.. autofunction:: backend_api.cli.cli.cli

.. autofunction:: backend_api.cli.utils.validate_directory

.. autofunction:: backend_api.cli.serve.serve

App
---

.. automodule:: backend_api.app

.. autofunction:: backend_api.app.asgi.on_startup

.. autofunction:: backend_api.app.asgi.on_shutdown

.. autofunction:: backend_api.app.asgi.get_application

.. automodule:: backend_api.app.router

Controllers
~~~~~~~~~~~

.. automodule:: backend_api.app.controllers

.. autofunction:: backend_api.app.controllers.ready.readiness_check

Models
~~~~~~

.. automodule:: backend_api.app.models

Views
~~~~~

.. automodule:: backend_api.app.views

.. autoclass:: backend_api.app.views.error.ErrorModel
   :members:
   :show-inheritance:

.. autoclass:: backend_api.app.views.error.ErrorResponse
   :members:
   :show-inheritance:

Exceptions
~~~~~~~~~~

.. automodule:: backend_api.app.exceptions

.. autoclass:: backend_api.app.exceptions.http.HTTPException
   :members:
   :show-inheritance:

.. autofunction:: backend_api.app.exceptions.http.http_exception_handler

Utils
~~~~~

.. automodule:: backend_api.app.utils

.. autoclass:: backend_api.app.utils.aiohttp_client.AiohttpClient
   :members:
   :show-inheritance:

.. autoclass:: backend_api.app.utils.redis.RedisClient
   :members:
   :show-inheritance:
