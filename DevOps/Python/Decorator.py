import time

def timing_decorator(func):
    def wrapper(*args, **kwargs):
        start_time = time.time()
        result = func(*args, **kwargs)
        end_time = time.time()
        print(f"Function {func.__name__} took {end_time - start_time:.4f} seconds")
        return result
    return wrapper

@timing_decorator
def long_running_function():
    time.sleep(2)
    print("Function completed")

long_running_function()

# Output:
# Function completed
# Function long_running_function took 2.0004 seconds