#include "pch.h"
#include <iostream>
#include <vector>
#include <map>
using namespace std;

void wypisz(vector <int> tab) {
	for (int i = 0; i < tab.size(); i++) {
		cout << tab[i];
	}


}
void wypisz3(vector<vector<int>>tab) {
	for (int i = 0; i < tab.size(); i++) {
		for (int j = 0; j < tab[i].size(); j++) {

			cout << tab[i][j] << " ";
		}
		cout << "\n";
	}
}
bool czynalezy(vector <int> tab, int element) {
	for (int i = 0; i < tab.size(); i++) {
		if (tab[i] == element) {
			return true;
		}
	}
	return false;
}

bool czyzawiera(vector <int> tab, vector <int> tab2) {
	for (int i = 0; i < tab2.size(); i++) {
		if (!czynalezy(tab, tab2[i])) {
			return false;
		}
	}
	return true;
}

int min(vector <int> tab) {
	int wynik = tab[0];
	for (int i = 0; i < tab.size(); i++) {
		if (wynik < tab[i]) {
			wynik = tab[i];
		}
	}
	return wynik;
}
int max(vector <int> tab) {
	int wynik = tab[0];
	for (int i = 0; i < tab.size(); i++) {
		if (wynik > tab[i]) {
			wynik = tab[i];
		}
	}
	return wynik;
}
vector <int> unikalnosc(vector <int> tab) {
	vector <int> wynik;
	for (int i = 0; i < tab.size(); i++) {
		if (!czynalezy(wynik, tab[i])) {

			wynik.push_back(tab[i]);
		}
	}
	return wynik;

}
vector<vector<int>> czestosc(vector<int>tab) {
	vector <vector<int>> wynik;
	vector <int> u = unikalnosc(tab);
	vector <int> c;
	for (int i = 0; i < u.size(); i++) {
		int licznik = 0;

		for (int j = 0; j < tab.size(); j++) {


			if (u[i] == tab[j]) {
				licznik++;
			}
		}
		c.push_back(licznik);
	}
	wynik.push_back(u);
	wynik.push_back(c);
	return wynik;
}
bool czynalezyklucz(map <int, int> m, int klucz) {
	for (auto item : m) {
		if (item.first == klucz) {
			return true;
		}
	}
	return false;
}
map<int, int> czestosc2(vector <int> tab) {
	map<int, int> wynik;
	for (int i = 0; i < tab.size(); i++) {
		if (!czynalezyklucz(wynik, tab[i])) {
			wynik.insert({ tab[i],1 });
		}
		else {
			wynik[tab[i]]++;
		}
	}

	return wynik;
}
vector <int> podzielnosc(vector <int> tab, int dzielnik, int reszta=0) {
	vector <int> wynik;
	for (int i = 0; i < tab.size(); i++) {
		if (tab[i] % dzielnik == reszta) {

			wynik.push_back(tab[i]);
		}

	}
	return wynik;
}
vector <int> generuj(int n, int max = 50, int min = 0) {
	vector <int> wynik;

	for (int i = 0; i < n; i++) {
		wynik.push_back(rand() % (max - min) + min);
	}

	return wynik;
}
int main()
{

	vector<int> tab{ 1,1,1,1,2,2,3 };


	wypisz3(czestosc(tab));

	cout << min(tab);
	cout << max(tab);

	wypisz(generuj(10, 9, 0));
}

