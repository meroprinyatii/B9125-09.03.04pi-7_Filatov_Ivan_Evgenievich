#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;

struct knot{
	int data;
	knot *next;
};

void AddKnot(knot* &head, int data){
	if (head==nullptr){
		knot* temp=new knot;
		temp->next=nullptr;
		temp->data=data;
		head=temp;
	}
	else {
		knot* p=head;
		while (p->next!=nullptr) p=p->next;
		knot* temp=new knot;
		temp->next=nullptr;
		temp->data=data;
		p->next=temp;
	}
}	

void AddMultipleKnots(knot* &head,int q){
	static bool init=false;
	if (!init){
		srand(time(0));
		init=true;
	}
	for (int i=1;i<=q;i++) AddKnot(head,rand());
}

void WriteList(knot* head){
	if (head!=nullptr){	
		knot* p=head;
		while (p!=nullptr) {
			if (p->next==nullptr) cout<<p->data<<"("<<p<<")";
			else cout<<p->data<<"("<<p<<") -> ";
			p=p->next;
		}
		cout<<endl;
	}
	else cout<<"Head is empty"<<endl;
}

void ClearList(knot* &head){
	if (head!=nullptr){	
		knot* temp=head; 
		while (head!=nullptr) {
		temp=head;
		head=head->next;
		delete temp;
		}
	}
	else cout<<"List is already empty"<<endl;

}

void MinSeek(knot* &head){
	if (head==nullptr){
		cout<<"List is empty"<<endl;
	}
	else{
		knot* temp=head;
		knot* minadd=head;
		int min=head->data;
		while (temp!=nullptr) {
			if (temp->data<min) {
				min=temp->data;
				minadd=temp;
			}
			temp=temp->next;
		}
		cout<<min<<"("<<minadd<<")"<<endl;
	}
}

int main(){
	knot* head=nullptr;
	int iter;
	cout<<"Enter length of the dynlist: "; cin>>iter;
	AddMultipleKnots(head,iter);
	WriteList(head);
	cout<<"Minimum: "; MinSeek(head);
	ClearList(head);
}
