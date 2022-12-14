"""This project was generated with fastapi-mvc."""
import logging

from backend_api.wsgi import ApplicationLoader
from backend_api.version import __version__

# initialize logging
log = logging.getLogger(__name__)
log.addHandler(logging.NullHandler())

__all__ = ("ApplicationLoader", "__version__")
