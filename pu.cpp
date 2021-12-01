#include <iostream>
#include <vector>
using namespace std;

int suma(int a, int b)
{
	return a + b;
}

void wypisz(int a)
{
	cout << a << "\n";
}

void wypisz2(vector<int>tab)
{
	for (int i = 0; i < tab.size(); i++)
	{
		cout << tab[i] << ", ";
	}
	cout << "\n";
}

void wypisz3(vector<vector<int>>zliczone)
{
	for (int i = 0; i < zliczone.size(); i++)
	{
		for (int j = 0; j < zliczone[i].size(); j++)
		{
			cout << zliczone[i][j] << " ";
		}
		cout << "\n";

	}
}

bool czynalezy(vector<int>tab, int element)
{
	for (int i = 0; i < tab.size(); i++)
	{
		if (tab[i]==element)
		{
			return true;
		}
	}

	return false;
}

bool czyzawiera(vector<int>tab, vector<int>podzbior)
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

int min(vector<int>tab)
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

int max(vector<int>tab)
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
		if (!czynalezy(wynik, tab[i]))
		{
			wynik.push_back(tab[i]);
		}
	}
	return wynik;
}

vector<vector<int>>czestosc(vector<int>tab)
{
	vector<vector<int>>wynik;
	vector<int>u = unikalnosc(tab);
	vector<int>c;

	for (int i = 0; i < u.size(); i++)
	{
		int licznik = 0;
		for (int j = 0; j < tab.size(); j++)
		{
			if (u[i] == tab[j])
			{
				licznik++;
			}
		}
		c.push_back(licznik);
	}
	wynik.push_back(u);
	wynik.push_back(c);

	return wynik;
}

int main()
{
	int a = 5 + 3;
	int b = suma(a, 5);
	wypisz(b);

	vector<int>tab = { 1, 0, 4, 9, 5, 4, 7, 1, 4 };
	vector<int>podzbior = { 0, 4, 9, 5, };

	wypisz(min(tab));
	wypisz(max(tab));

	wypisz2(unikalnosc(tab));

	wypisz3(czestosc(tab));

	bool wynik = czynalezy(tab, 10);
	if (wynik)
	{
		cout << "tak";
	}
	else
	{
		cout << "nie";
	}

	cout << "\n";


	bool wynik2 = czyzawiera(tab, podzbior);
	if (wynik2)
	{
		cout << "tak";
	}
	else
	{
		cout << "nie";
	}


}
