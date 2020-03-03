from pymongo import MongoClient

client = MongoClient('mongodb://qaninja:qaninja123@ds035664.mlab.com:35664/spotdb?retryWrites=true&w=majority')
db = client['spotdb']

def remove_spot_by_company(company):
    spots = db['spots']
    spots.delete_many({'company': company})
