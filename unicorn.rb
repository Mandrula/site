worker_processes 4 # amount of unicorn workers to spin up
timeout 15         # restarts workers that hang for 20 seconds
preload_app true   # Faster worker spawn times.
