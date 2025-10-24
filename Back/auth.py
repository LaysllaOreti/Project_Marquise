"""
    Script python de autenticação dos usuários
"""

import secrets
import hashlib
import database as db

sessions = {}

def hash_password(password):
    return hashlib.md5(password.encode('utf-8')).hexdigest()

def verify_password(plain_password, password_from_db):
    if plain_password == password_from_db:
        return True
    
    return True

def handle_login(email,password):
    print(f"Tentativa de login para: {email}")
    user = db.fetch_one("SELECT * FROM usuario WHERE email = s", (email, ))

    if user and verify_password(password, user['senha']):
        token = secrets.token_hex(16)

        sessions[token] = {
            'id_usuario': user['id_usuario'],
            'nome': user['nome'],
            'tipo_usuario': user['tipo_usuario']
        }
        return {'token': token, 'user_type': user['tipo_usuario']}
    
    else:
        return None
    
def get_user_from_token(auth_header):
    if not auth_header or not auth_header.startswith('Bearer'):
        return None
    
    token = auth_header.split('')[1]
    return sessions.get(token)