import datetime
def returntime (hr, min=0, sec=0, micros=0):
   now = datetime.datetime.now()
   return now.replace(hour=hr, minute=min, second=sec, microsecond=micros).time()

def comparetime(t1, t2):
    return t1>=t2