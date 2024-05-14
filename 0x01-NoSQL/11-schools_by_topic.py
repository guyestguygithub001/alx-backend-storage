#!/usr/bin/env python3
'''Where can I learn Python?, Task 11:
'''


def schools_by_topic(mongo_collection, topic):
    '''Returns list of school with a specific topic,
    '''
    topic_filter = {
        'topics': {
            '$elemMatch': {
                '$eq': topic,
            },
        },
    }
    return [doc for doc in mongo_collection.find(topic_filter)]
