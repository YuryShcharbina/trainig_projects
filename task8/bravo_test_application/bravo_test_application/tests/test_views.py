from django.test import TestCase
from bravo_test_application.bravo_test_application.apps.hello.models import Testdata


class ViewsTestCase(TestCase):
    def test_load(self):
        response = self.client.get('23.23.23.23:8000')
        self.assertEqual(response.status_code, 200)
