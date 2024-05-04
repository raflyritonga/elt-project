import subprocess
import time
import os


def wait_for_postgres(host, max_retries=5, delay_seconds=5):
    retries = 0
    while retries < max_retries:
        try:
            result = subprocess.run(
                ["pg_isready", "-h", host], check=True, capture_output=True, text=True)
            if "accepting connections" in result.stdout:
                print("Successfully connected to PostgreSQL!")
                return True
        except subprocess.CalledProcessError as e:
            print(f"Error connecting to PostgreSQL: {e}")
        retries += 1
        print(
            f"Retrying in {delay_seconds} seconds... (Attempt {retries}/{max_retries})")
        time.sleep(delay_seconds)
    print("Max retries reached. Exiting.")
    return False

# Use the function before running the ELT process
if not wait_for_postgres(host="source_postgres"):
    exit(1)
else:
    print("Starting ELT Process...")

    # Configuration for the source PostgreSQL database
    source_config = {
        'dbname': 'source_db',
        'user': 'postgres',
        'password': 'secret',
        # Use the service name from docker-compose as the hostname
        'host': 'source_postgres'
    }

    # Use pg_dump to dump the source database to a SQL file
    dump_command = [
        'pg_dump',
        '-h', source_config['host'],
        '-U', source_config['user'],
        '-d', source_config['dbname'],
        '-f', 'data_dump.sql'
    ]

    subprocess_env= source_config['password']
    subprocess.run(dump_command, env=subprocess_env, check=True)

    destination_config = {
        'dbname': 'destination_db',
        'user': 'postgres',
        'password': 'secret',
        'host': 'destination_postgres'
    }
        
    # Use psql to load the dumped SQL file into the destination database
    load_command = [
        'pgsql',
        '-h', destination_config['host'],
        '-U', destination_config['user'],
        '-d', destination_config['dbname'],
        '-a', '-f', 'data_dump.sql'
    ]

    subprocess_env = destination_config['password']
    subprocess.run(load_command, env=subprocess_env, check=True)

    print("Ending ELT Process...")