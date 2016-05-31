""" 
    Sample Model File

    A Model should be in charge of communicating with the Database. 
    Define specific model method that query the database for information.
    Then call upon these model method in your controller.

    Create a model using this template.
"""
from system.core.model import Model

class Quote(Model):
    def __init__(self):
        super(Quote, self).__init__()

    def get_non_fav_quotes(self, user_id):
        query = "SELECT users.name, quotes.* FROM users JOIN quotes ON users.id=quotes.user_id WHERE quotes.id NOT IN (SELECT quotes.id FROM users JOIN favorites ON users.id=favorites.user_id JOIN quotes ON favorites.quote_id=quotes.id WHERE users.id=:user_id)"
        data = {'user_id': user_id}
        quotes = self.db.query_db(query, data)
        return quotes

    def get_fav_quotes(self, user_id):

        query = "SELECT users.name as user, users2.name as posted_by, quotes.* FROM users JOIN favorites ON users.id=favorites.user_id JOIN quotes ON favorites.quote_id=quotes.id JOIN users as users2 ON users2.id=quotes.user_id WHERE users.id=:user_id"
        data = {'user_id': user_id} 
        fav_quotes = self.db.query_db(query, data)
        return fav_quotes

    def insert_quote(self, data):

        print "in insert_quote"
        query = "INSERT into quotes (message, quoted_by, created_at, user_id) VALUES (:message, :quoted_by, NOW(), :user_id)"
        data = {'message': data['message'],
                'quoted_by': data['quoted_by'],
                'user_id': data['user_id']}
        print("before submitting the insert query")
        return self.db.query_db(query, data)

    def put_in_fav(self, data):

        query = "INSERT into favorites (quote_id, user_id) VALUES (:quote_id, :user_id)"
        data = {'quote_id': data['quote_id'], 'user_id': data['user_id']}
        return self.db.query_db(query, data)

    def del_from_fav(self, data):

        # query = "DELETE * FROM favorites WHERE (quote_id, user_id) IN (:quote_id, :user_id)"
        query = "DELETE FROM favorites WHERE quote_id=:quote_id AND user_id=:user_id"
        data = {'user_id': data['user_id'], 'quote_id': data['quote_id']}
        return self.db.query_db(query, data)

    """
    Below is an example of a model method that queries the database for all users in a fictitious application
    
    Every model has access to the "self.db.query_db" method which allows you to interact with the database

    def get_users(self):
        query = "SELECT * from users"
        return self.db.query_db(query)

    def get_user(self):
        query = "SELECT * from users where id = :id"
        data = {'id': 1}
        return self.db.get_one(query, data)

    def add_message(self):
        sql = "INSERT into messages (message, created_at, users_id) values(:message, NOW(), :users_id)"
        data = {'message': 'awesome bro', 'users_id': 1}
        self.db.query_db(sql, data)
        return True
    
    def grab_messages(self):
        query = "SELECT * from messages where users_id = :user_id"
        data = {'user_id':1}
        return self.db.query_db(query, data)

    """