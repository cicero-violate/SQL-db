using SQLite

# Connect to the database (it creates the file if it does not exist)
db = SQLite.DB("user_data.db")

# Create a table if it doesn't exist
SQLite.execute(db, """
    CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        age INTEGER
    );
""")

# Function to insert or update user data
function modify_user_data()
    println("Enter your choice:\n1. Insert new user\n2. Update existing user")
    choice = readline()

    if choice == "1"
        println("Enter name:")
        name = readline()
        println("Enter age:")
        age = parse(Int, readline())  # Converts string to integer

        # Insert data into the database
        SQLite.execute(db, "INSERT INTO users (name, age) VALUES (?, ?);", name, age)
        println("User added successfully!")
    elseif choice == "2"
        println("Enter user ID:")
        user_id = parse(Int, readline())
        println("Enter new age:")
        new_age = parse(Int, readline())

        # Update data in the database
        SQLite.execute(db, "UPDATE users SET age = ? WHERE id = ?;", new_age, user_id)
        println("User updated successfully!")
    else
        println("Invalid choice!")
    end
end

# Continuously ask for user input
while true
    modify_user_data()
end
