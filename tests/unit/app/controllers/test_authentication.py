import pytest
from fastapi.testclient import TestClient
from backend_api.app.asgi import get_app


@pytest.fixture
def client():
    # This is an example fixture for generated test sake.
    # By default there should be a 'app' fixture just like this under:
    # tests/unit/app/conftest.py
    app = get_app()
    with TestClient(app) as client:
        yield client


def test_signup_email_password(client):
    response = client.post("/authentication/signup_email_password")
    assert response.status_code == 200
    assert response.json() == {"hello": "world"}


def test_signin_email_password(client):
    response = client.post("/authentication/signin_email_password")
    assert response.status_code == 200
    assert response.json() == {"hello": "world"}


def test_reset_password(client):
    response = client.post("/authentication/reset_password")
    assert response.status_code == 200
    assert response.json() == {"hello": "world"}

