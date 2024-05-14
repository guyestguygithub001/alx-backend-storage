#!/usr/bin/env python3
'''Inserts doc in Python. for Task 9.
'''


def insert_school(mongo_collection, **kwargs):
    '''Insert new doc into collection
    '''
    result = mongo_collection.insert_one(kwargs)
    return result.inserted_id
