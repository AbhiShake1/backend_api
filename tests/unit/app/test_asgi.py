import mock
from backend_api.config import settings
from backend_api.app.router import root_api_router
from backend_api.app.asgi import (
    get_application,
    on_startup,
    on_shutdown,
)
from backend_api.app.exceptions import (
    HTTPException,
    http_exception_handler,
)


@mock.patch("backend_api.app.asgi.FastAPI")
def test_get_app(mock_fastapi):
    mock_app = get_application()
    # check init kwargs
    mock_fastapi.assert_called_once_with(
        title=settings.PROJECT_NAME,
        debug=settings.DEBUG,
        version=settings.VERSION,
        docs_url=settings.DOCS_URL,
        on_startup=[on_startup],
        on_shutdown=[on_shutdown],
    )

    mock_app.include_router.assert_called_once_with(root_api_router)
    mock_app.add_exception_handler.assert_called_once_with(
        HTTPException, http_exception_handler
    )


def test_app_config(app):
    assert app.app.title == settings.PROJECT_NAME
    assert app.app.version == settings.VERSION
