"""Authentication controller implementation."""
import logging

from fastapi import APIRouter

from backend_api.app.models.email_model import EmailModel
from backend_api.app.models.email_password_model import EmailPasswordModel
from backend_api.app.utils import RedisClient, AiohttpClient

router = APIRouter(
    prefix="/authentication"
)
log = logging.getLogger(__name__)


@router.post(
    "/signup_email_password",
    status_code=200,
    # Decorator options:
    # https://fastapi.tiangolo.com/tutorial/path-operation-configuration/
)
async def signup_email_password(request: EmailPasswordModel):
    # Implement endpoint logic here.
    return {"hello": "world"}


@router.get(
    "/test",
    status_code=200,
    # Decorator options:
    # https://fastapi.tiangolo.com/tutorial/path-operation-configuration/
)
async def test():
    await RedisClient.open_redis_client()
    await RedisClient.set("testing", "testingvalue")
    res = await RedisClient.get("testing")
    return str(res)


@router.post(
    "/signin_email_password",
    status_code=200,
    # Decorator options:
    # https://fastapi.tiangolo.com/tutorial/path-operation-configuration/
)
async def signin_email_password(request: EmailPasswordModel):
    # Implement endpoint logic here.
    return {"hello": "world"}


@router.post(
    "/reset_password",
    status_code=200,
    # Decorator options:
    # https://fastapi.tiangolo.com/tutorial/path-operation-configuration/
)
async def reset_password(request: EmailModel):
    # Implement endpoint logic here.
    return {"hello": "world"}
