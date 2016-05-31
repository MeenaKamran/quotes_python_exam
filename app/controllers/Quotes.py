"""
    Sample Controller File

    A Controller should be in charge of responding to a request.
    Load models to interact with the database and load views to render them to the client.

    Create a controller using this template
"""
from system.core.controller import *

class Quotes(Controller):
    def __init__(self, action):
        super(Quotes, self).__init__(action)
        """
            This is an example of loading a model.
            Every controller has access to the load_model method.
        """
        
        self.load_model('Quote')
        self.db = self._app.db

        """
        
        This is an example of a controller method that will load a view for the client 

        """
   
    def index(self):
        """
        A loaded model is accessible through the models attribute 
        self.models['WelcomeModel'].get_users()
        
        self.models['WelcomeModel'].add_message()
        # messages = self.models['WelcomeModel'].grab_messages()
        # user = self.models['WelcomeModel'].get_user()
        # to pass information on to a view it's the same as it was with Flask
        
        # return self.load_view('index.html', messages=messages, user=user)
        """

        quotes = self.models['Quote'].get_non_fav_quotes(session['id'])
        fav_quotes = self.models['Quote'].get_fav_quotes(session['id'])
        return self.load_view('quotes_index.html', quotes=quotes, fav_quotes=fav_quotes)

    def add_quote(self):
        
        print "in add_quote"
        print request.form['message']
        print request.form['quoter']
        data_info = {
                    'user_id': session['id'],
                    'message': request.form['message'],
                    'quoted_by': request.form['quoter']
        }
        self.models['Quote'].insert_quote(data_info)
        print "query submitted"
        return redirect('/quotes')

    def add_to_fav(self, quote_id):

        data_info = {
                    'user_id': session['id'],
                    'quote_id': quote_id
                    }
        self.models['Quote'].put_in_fav(data_info)
        return redirect('/quotes')

    def remove_from_fav(self, quote_id):

        data_info = {
                    'user_id': session['id'],
                    'quote_id': quote_id
        }
        # fav_id = self.models['Quote'].get_fav_id(data_info)
        self.models['Quote'].del_from_fav(data_info)
        return redirect('/quotes')


