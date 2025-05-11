% --- Book Finder Expert System ---
% COU4201 Group Project (2024/2025)

:- dynamic book/5.

% === FANTASY ===
book('The Hobbit', 'J.R.R. Tolkien', fantasy, adventure, 1937).
book('The Name of the Wind', 'Patrick Rothfuss', fantasy, adventure, 2007).
book('The Way of Kings', 'Brandon Sanderson', fantasy, adventure, 2010).
book('Mistborn: The Final Empire', 'Brandon Sanderson', fantasy, adventure, 2006).
book('Eragon', 'Christopher Paolini', fantasy, dragon, 2002).
book('Harry Potter and the Sorcerer\'s Stone', 'J.K. Rowling', fantasy, magic, 1997).
book('Stardust', 'Neil Gaiman', fantasy, fairy_tale, 1999).
book('Percy Jackson and the Olympians: The Lightning Thief', 'Rick Riordan', fantasy, myth, 2005).
book('A Game of Thrones', 'George R.R. Martin', fantasy, epic, 1996).
book('The Golden Compass', 'Philip Pullman', fantasy, alternate_world, 1995).

% === FICTION ===
book('1984', 'George Orwell', fiction, dystopian, 1949).
book('To Kill a Mockingbird', 'Harper Lee', fiction, drama, 1960).
book('The Great Gatsby', 'F. Scott Fitzgerald', fiction, classic, 1925).
book('The Catcher in the Rye', 'J.D. Salinger', fiction, coming_of_age, 1951).
book('Of Mice and Men', 'John Steinbeck', fiction, tragedy, 1937).
book('The Road', 'Cormac McCarthy', fiction, post_apocalyptic, 2006).
book('Life of Pi', 'Yann Martel', fiction, philosophical, 2001).
book('The Alchemist', 'Paulo Coelho', fiction, allegory, 1988).
book('Beloved', 'Toni Morrison', fiction, historical, 1987).

% === ROMANCE ===
book('Pride and Prejudice', 'Jane Austen', romance, classic, 1813).
book('Jane Eyre', 'Charlotte Brontë', romance, gothic, 1847).
book('Gone with the Wind', 'Margaret Mitchell', romance, historical, 1936).
book('The Notebook', 'Nicholas Sparks', romance, contemporary, 1996).
book('Me Before You', 'Jojo Moyes', romance, contemporary, 2012).
book('The Time Traveler\'s Wife', 'Audrey Niffenegger', romance, science_fiction, 2003).
book('Twilight', 'Stephenie Meyer', romance, fantasy, 2005).
book('Fifty Shades of Grey', 'E.L. James', romance, erotic, 2011).

% === MYSTERY ===
book('The Da Vinci Code', 'Dan Brown', mystery, thriller, 2003).
book('The Girl with the Dragon Tattoo', 'Stieg Larsson', mystery, crime, 2005).
book('The Murder of Roger Ackroyd', 'Agatha Christie', mystery, detective, 1926).
book('Gone Girl', 'Gillian Flynn', mystery, psychological_thriller, 2012).
book('The Silent Patient', 'Alex Michaelides', mystery, psychological_thriller, 2019).
book('The Woman in White', 'Wilkie Collins', mystery, gothic, 1859).
book('In the Woods', 'Tana French', mystery, police_procedural, 2007).

% === SCIENCE FICTION ===
book('Dune', 'Frank Herbert', science_fiction, epic, 1965).
book('The Martian', 'Andy Weir', science_fiction, hard_sf, 2011).
book('Fahrenheit 451', 'Ray Bradbury', science_fiction, dystopian, 1953).
book('Ready Player One', 'Ernest Cline', science_fiction, adventure, 2011).

% --- Entry Point ---
% start/0 

start :-
    write('=== Welcome to the AI Book Finder ==='), nl, nl,
    write('1. Search for a book'), nl,
    write('2. Add a new book'), nl,
    write('Enter your choice (1 or 2): '), read(Choice),
    select_choice(Choice),
    nl, write('Thank you for using the AI Book Finder!'), nl.

% --- Select Main Menu Choice ---
select_choice(1) :-
    ask_preferences(Category, Genre, MinYear, MaxYear),
    find_books(Category, Genre, MinYear, MaxYear).
select_choice(2) :-
    add_book.
select_choice(_) :-
    nl, write('Invalid choice. Please restart and enter 1 or 2.').

% --- Ask user preferences ---
ask_preferences(Category, Genre, MinYear, MaxYear) :-
    nl, write('Enter a category (fantasy, fiction, romance, mystery, science_fiction): '), nl,read(Category),nl,
    write('Enter a genre'),nl, write('(adventure, magic, dystopian,epic,crime, detective, myth,science_fiction,fantasy,gothic, drama, classic,psychological_thriller,thriller,contemporary,historical or type "none" to skip): '), nl,read(Genre),
    write('Enter minimum release year: '), read(MinYear),
    write('Enter maximum release year: '), read(MaxYear).

% --- Find and display matching books ---
find_books(Category, Genre, MinYear, MaxYear) :-
    nl, write('Searching for matching books...'), nl,
    findall(
        [Title, Author, Category, BookGenre, Year],
        (
            book(Title, Author, Category, BookGenre, Year),
            (Genre == none ; Genre == BookGenre),
            Year >= MinYear,
            Year =< MaxYear
        ),
        Matches
    ),
    display_results(Matches).

% --- Display Results ---
display_results([]) :-
    nl, write('Sorry, no matching books found.').

display_results(Matches) :-
    nl, write('--- Matching Books ---'), nl,
    display_all(Matches).

display_all([]).
display_all([[Title, Author, Category, BookGenre, Year] | T]) :-
    nl, write('Title: '), write(Title),
    nl, write('Author: '), write(Author),
    nl, write('Category: '), write(Category),
    nl, write('Genre: '), write(BookGenre),
    nl, write('Year: '), write(Year),
    nl, write('------------------------------'),
    display_all(T).

% --- Add New Book and Save to File ---
add_book :-
    nl, write('Enter book title: '), read(Title),
    write('Enter author name: '), read(Author),
    write('Enter category: '), read(Category),
    write('Enter genre: '), read(Genre),
    write('Enter release year: '), read(Year),
    assertz(book(Title, Author, Category, Genre, Year)),
    open('books_added.txt', append, Stream),
    format(Stream, 'book(~q, ~q, ~q, ~q, ~d).~n', [Title, Author, Category, Genre, Year]),
    close(Stream),
    write('Book added successfully and saved to books_added.txt!').