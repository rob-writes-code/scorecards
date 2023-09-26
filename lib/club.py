from dataclasses import dataclass

@dataclass
class Club:
    id: int
    club_name: str
    club_address: str
    club_email: str
    account_username: str
    account_password: str

    def __repr__(self):
        return f'#{self.id} {self.club_name}'
