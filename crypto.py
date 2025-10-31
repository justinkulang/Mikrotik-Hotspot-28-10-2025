from cryptography.fernet import Fernet
import os

KEY_FILE = 'secret.key'

def generate_key():
    """Generates a new encryption key and saves it to a file."""
    key = Fernet.generate_key()
    with open(KEY_FILE, 'wb') as key_file:
        key_file.write(key)
    return key

def load_key():
    """Loads the encryption key from a file, generating it if it doesn't exist."""
    if not os.path.exists(KEY_FILE):
        return generate_key()
    with open(KEY_FILE, 'rb') as key_file:
        return key_file.read()

def encrypt_password(password: str, key: bytes) -> str:
    """Encrypts a password using the provided key."""
    if not password:
        return ""
    f = Fernet(key)
    encrypted_password = f.encrypt(password.encode())
    return encrypted_password.decode()

def decrypt_password(encrypted_password: str, key: bytes) -> str:
    """Decrypts a password using the provided key."""
    if not encrypted_password:
        return ""
    f = Fernet(key)
    decrypted_password = f.decrypt(encrypted_password.encode())
    return decrypted_password.decode()
