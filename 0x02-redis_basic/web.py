#!/usr/bin/env python3
"""
This module provides tools for caching requests and tracking their frequency.
"""
import redis
import requests
from functools import wraps
from typing import Callable

# Creating a Redis instance at the module level.
redis_store = redis.Redis()

def data_cacher(method: Callable) -> Callable:
    """
    A decorator that caches the result of data retrieval operations.
    """
    @wraps(method)
    def invoker(url) -> str:
        """
        A wrapper function that caches the output of the decorated function.
        """
        # Increment the count for the given URL
        redis_store.incr(f'count:{url}')
        # Try to get the result from the cache
        result = redis_store.get(f'result:{url}')
        if result:
            # If the result is in the cache, return it
            return result.decode('utf-8')
        # If the result is not in the cache, call the decorated function
        result = method(url)
        # Reset the count for the URL and cache the result
        redis_store.set(f'count:{url}', 0)
        redis_store.setex(f'result:{url}', 10, result)
        return result
    return invoker

@data_cacher
def get_page(url: str) -> str:
    """
    Fetches the content of a URL, caches the response, and tracks the request frequency.
    """
    return requests.get(url).text
