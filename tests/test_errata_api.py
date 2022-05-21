from src.errata_api import errata
import os
errata_r = errata(os.getenv('SUPPORT_URL'), os.getenv('TOKEN'))

def test_errata_request():
    assert errata_r.request() == 200