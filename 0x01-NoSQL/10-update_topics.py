#!/usr/bin/env python3
'''Change school topics, task 10
'''


def update_topics(mongo_collection, name, topics):
    '''Changes every topic of a collection's doc based on name,
    '''
    mongo_collection.update_many(
        {'name': name},
        {'$set': {'topics': topics}}
    )
