from django.test import TestCase
from .models import Cafe, Coffee


class CafeTestCase(TestCase):
    def create_cafe(self):
        return Cafe(name="Starbucks", is_popular=True)

    def test_cafe(self):
        cafe = self.create_cafe()
        self.assertEqual(cafe.name, "Starbucks")
        self.assertEqual(cafe.is_popular, True)


class CoffeeTestCase(TestCase):
    cafe = CafeTestCase().create_cafe()

    def create_coffee(self):
        return Coffee(
            flavor="Hazelnut",
            store=self.cafe,
            region=1,
            hot=False,
            description="delicious",
        )

    def test_coffee(self):
        coffee = self.create_coffee()
        self.assertEqual(coffee.flavor, "Hazelnut")
        self.assertEqual(coffee.store, self.cafe)
        self.assertEqual(coffee.region, 1)
        self.assertEqual(coffee.hot, False)
        self.assertEqual(coffee.description, "delicious")
