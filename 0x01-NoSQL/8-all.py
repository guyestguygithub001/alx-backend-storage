#!/usr/bin/env python3
''' module to task 8.
'''


def list_all(mongo_collection):
    '''List each and every documents in collection.
    '''
    return [doc for doc in mongo_collection.find()]
