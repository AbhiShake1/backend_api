from pydantic import BaseModel


class EmailPasswordModel(BaseModel):
    email: str
    password: str
