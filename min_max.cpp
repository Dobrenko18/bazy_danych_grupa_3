#include "pch.h"
#include <iostream>
#include <vector>
using namespace std;

void wypisz(vector<int>tab)
{
	for (int i = 0; i < tab.size(); i++)
	{
		cout << tab[i] << ",";
	}
	cout << "\n";
}

void wypisz2(int a)
{
	cout << a << "\n";
}

bool czynalezy(vector<int>tab, int element)
{
	for (int i = 0; i < tab.size(); i++)
	{
		if (tab[i] == element)
		{
			return true;
		}
	}
	return false;
}

bool czyzawiera(vector<int>tab,vector<int>podzbior)
{
	for (int i = 0; i < podzbior.size(); i++)
	{
		if (!czynalezy(tab,podzbior[i]))
		{
			return false;
		}
	}
	return true;
}

int suma(int a, int b)
{
	return a + b;
}

int Min(vector<int>tab)
{
	int wynik = tab[0];
	for (int i = 0; i < tab.size(); i++)
	{
		if (tab[i] < wynik)
		{
			wynik = tab[i];
		}
	}
	return wynik;
}

int Max(vector<int>tab)
{
	int wynik = tab[0];
	for (int i = 0; i < tab.size(); i++)
	{
		if (tab[i] > wynik)
		{
			wynik = tab[i];
		}
	}
	return wynik;
}
vector<int>unikalnosc(vector<int>tab)
{
	vector<int>wynik;
	for (int i = 0; i < tab.size(); i++)
	{
		if (!czynalezy(wynik,tab[i]))
		{
			wynik.push_back(tab[i]);
		}

	}
	return wynik;
}
int main()
{
	int a = 3 + 5;
	int b = suma(a, 10);
	wypisz2(b);

	vector<int>tab = { 1,2,3,4 };
	wypisz(tab);

	cout << "Czy nalezy: ";
	bool wynik = czynalezy(tab, 5);
	if (wynik)
	{
		cout << "tak";
	}
	else
	{
		cout << "nie";
	}

	cout << "\n";
	cout << "Czy zawiera: ";
	vector<int>podzbior = { 1 };

	bool wynik2 = czyzawiera(tab, podzbior);
	if (wynik2)
	{
		cout << "tak";
	}
	else
	{
		cout << "nie";
	}
	cout<<"\n";
	vector<int>wynik3 = unikalnosc(tab);
	wypisz(wynik3);
	cout <<"\n" << Min(tab);
	cout << "\n" << Max(tab);
}
