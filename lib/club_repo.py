from lib.club import Club

class ClubRepository:
    def __init__(self, connection):
        self._connection = connection

    def all(self):
        rows = self._connection.execute("SELECT * FROM clubs")
        clubs = []
        for row in rows:
            club = Club(row["id"], row["club_name"], row["club_address"], row["club_email"], row["account_username"], row["account_password"])
            clubs.append(club)
        return clubs

    def create(self, club):
        result = self._connection.execute(
            "INSERT INTO clubs (club_name, club_address, club_email, account_username, account_password) VALUES (%s, %s, %s, %s, %s) RETURNING id",
            [club.club_name, club.club_address, club.club_email, club.account_username, club.account_password],
        )
        return result[0]['id']