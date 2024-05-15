#!/usr/bin/env python3
"""
This is the main file for executing the program.
"""
import redis

# Importing the Cache class from the 'exercise' module
Cache = __import__('exercise').Cache

# Creating an instance of the Cache class
cache = Cache()

# The following commented lines are for storing a byte string in the cache and printing its key
# data = b"hello"
# key = cache.store(data)
# print(key)

# The following commented lines are for creating a local Redis instance and printing the value associated with the key
# local_redis = redis.Redis()
# print(local_redis.get(key))

# Storing the byte string 'first' in the cache
cache.store(b"first")
# Printing the number of times the 'store' method has been called
print(cache.get(cache.store.__qualname__))

# Storing the byte strings 'second' and 'third' in the cache
cache.store(b"second")
cache.store(b"third")
# Printing the updated number of times the 'store' method has been called
print(cache.get(cache.store.__qualname__))
