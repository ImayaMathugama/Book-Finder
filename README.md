Book Finder (Prolog Mini-Project)

Table of Contents

Introduction
Features
Getting Started
Prerequisites
Installation
Usage
Loading the Program
Querying the Database
Database Structure
Examples
Contributing
License
Contact
Introduction

This is a simple "Book Finder" application implemented in Prolog. It allows users to query a knowledge base of books based on various criteria such as title, author, genre, and publication year. The project demonstrates basic Prolog programming concepts, including facts, rules, and querying.

Features

Add Books: Easily extend the knowledge base with new book entries.
Search by Author: Find all books written by a specific author.
Search by Title (Partial/Exact): Locate books by their title.
Search by Genre: Discover books belonging to a particular genre (e.g., "Fiction", "Science Fiction", "Fantasy").
Search by Publication Year: Find books published in a specific year or range.
Combined Queries: Support for combining multiple search criteria (e.g., "books by Author X in Genre Y").
List All Books: Display a complete list of all books in the database.
Getting Started

Prerequisites

To run this Prolog program, you will need a Prolog interpreter installed on your system. Recommended interpreters include:

SWI-Prolog: (Highly recommended for its features and ease of use)
GNU Prolog (GnuProlog)
Installation

Clone the repository (if applicable):

Bash

git clone https://github.com/your-username/book-finder-prolog.git
cd book-finder-prolog
(If this is just a single .pl file, you can skip this and just download the file directly.)

Ensure you have your Prolog file (book_finder.pl or similar):
Place the main Prolog source file (e.g., book_finder.pl) in a convenient directory on your machine.

Usage

Loading the Program

Open your Prolog interpreter (e.g., SWI-Prolog):
You can usually do this by typing swipl in your terminal.

Load the Prolog source file:
At the Prolog prompt (typically ?-), use the consult/1 predicate to load your file. Make sure you provide the correct path to the file.

Prolog

?- consult('path/to/your/book_finder.pl').
% Or if you are in the same directory:
?- consult('book_finder.pl').
You should see a message indicating that the file has been loaded successfully.

Querying the Database

Once the program is loaded, you can start querying the book database. Here are some common predicates you might have defined:

book(Title, Author, Genre, Year).
find_books_by_author(Author).
find_books_by_genre(Genre).
find_books_published_in_year(Year).
find_books_containing_title(Keyword).
list_all_books.
(Note: Replace the predicate names above with the actual ones defined in your book_finder.pl file.)

Database Structure

The book information is stored as Prolog facts. A typical fact for a book might look like this:

Prolog

book('The Hitchhiker\'s Guide to the Galaxy', 'Douglas Adams', 'Science Fiction', 1979).
book('1984', 'George Orwell', 'Dystopian', 1949).
book('Pride and Prejudice', 'Jane Austen', 'Romance', 1813).
You can extend this with more fields if needed (e.g., isbn, publisher, pages).

Examples

Here are some example queries you can try at the Prolog prompt:

Find all books by Douglas Adams:

Prolog

?- find_books_by_author('Douglas Adams').
Find all Science Fiction books:

Prolog

?- find_books_by_genre('Science Fiction').
Find all books published in 1949:

Prolog

?- find_books_published_in_year(1949).
Find books with 'Galaxy' in the title:

Prolog

?- find_books_containing_title('Galaxy').
Find books by Douglas Adams that are Science Fiction:

Prolog

?- book(Title, 'Douglas Adams', 'Science Fiction', Year).
List all books:

Prolog

?- list_all_books.
Contributing

If you'd like to contribute to this mini-project, feel free to:

Fork the repository.
Create a new branch (git checkout -b feature/new-feature).
Make your changes.
Commit your changes (git commit -am 'Add new feature').
Push to the branch (git push origin feature/new-feature).
Create a new Pull Request.   
License

This project is licensed under the MIT License - see the LICENSE file for details. (If you have a LICENSE file, otherwise you can state "This project is open source and can be used freely for educational purposes.")   

Contact

If you have any questions or suggestions, feel free to reach out:

Your Name/Alias: [Your Name or GitHub Username]
Email: [Your Email Address]
GitHub: [Link to your GitHub Profile]
